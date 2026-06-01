const fs = require('fs');
const path = require('path');
const https = require('https');

const root = path.join(__dirname, '..');
const assetsDir = path.join(root, 'assets');
const meowlBase64 = fs.readFileSync(path.join(assetsDir, 'generated', 'meowl-sprite-184.png')).toString('base64');
const meowlingBase64 = fs.readFileSync(path.join(assetsDir, 'generated', 'meowling-sprite-136.png')).toString('base64');

function mockContributions() {
  const weeks = [];
  const now = new Date();
  const start = new Date(now.getTime() - 364 * 24 * 60 * 60 * 1000);
  start.setDate(start.getDate() - start.getDay());

  let total = 0;
  let date = new Date(start);
  for (let w = 0; w < 53; w += 1) {
    const contributionDays = [];
    for (let d = 0; d < 7; d += 1) {
      const wave = Math.sin(w * 0.52 + d * 1.2);
      const cluster = (w % 9 === 2 && d > 0 && d < 5) || (w % 13 === 6 && d > 1) || (w % 17 === 10 && d < 4);
      const contributionCount = cluster || wave > 0.72 ? Math.max(1, Math.round(Math.abs(wave) * 5)) : 0;
      const level = contributionCount === 0 ? 0 : contributionCount < 2 ? 1 : contributionCount < 4 ? 2 : contributionCount < 5 ? 3 : 4;
      total += contributionCount;
      contributionDays.push({
        date: date.toISOString().slice(0, 10),
        contributionCount,
        level,
        weekday: d,
      });
      date.setDate(date.getDate() + 1);
    }
    weeks.push({ contributionDays });
  }
  return { weeks, total };
}

function fetchContributions(owner, token) {
  return new Promise((resolve) => {
    if (!token) return resolve(mockContributions());
    const body = JSON.stringify({
      query: `
        query($login: String!) {
          user(login: $login) {
            contributionsCollection {
              contributionCalendar {
                totalContributions
                weeks {
                  contributionDays {
                    contributionCount
                    level
                    weekday
                    date
                  }
                }
              }
            }
          }
        }
      `,
      variables: { login: owner },
    });

    const req = https.request({
      hostname: 'api.github.com',
      path: '/graphql',
      method: 'POST',
      headers: {
        Authorization: `Bearer ${token}`,
        'User-Agent': 'Sendudu-Meowl-Contribution-Generator',
        'Content-Type': 'application/json',
        'Content-Length': Buffer.byteLength(body),
      },
    }, (res) => {
      let data = '';
      res.on('data', (chunk) => { data += chunk; });
      res.on('end', () => {
        try {
          const json = JSON.parse(data);
          const calendar = json.data.user.contributionsCollection.contributionCalendar;
          resolve({ weeks: calendar.weeks, total: calendar.totalContributions });
        } catch {
          resolve(mockContributions());
        }
      });
    });
    req.on('error', () => resolve(mockContributions()));
    req.write(body);
    req.end();
  });
}

const cell = 16;
const gridX = 70;
const gridY = 135;

function cellPoint(target, offsetX = 0, offsetY = -4) {
  return {
    x: gridX + target.w * cell + offsetX,
    y: gridY + target.d * cell + offsetY,
  };
}

function buildRoute(targets) {
  const points = [];
  const start = cellPoint(targets[0]);
  points.push({ ...start, state: 'walk', targetIndex: 0 });

  for (let i = 1; i < targets.length; i += 1) {
    const prev = cellPoint(targets[i - 1]);
    const next = cellPoint(targets[i]);
    if (prev.x !== next.x) points.push({ x: next.x, y: prev.y, state: 'walk', targetIndex: i });
    if (prev.y !== next.y) points.push({ x: next.x, y: next.y, state: 'happy', targetIndex: i });
    else points.push({ x: next.x, y: next.y, state: 'happy', targetIndex: i });
  }
  return points;
}

function keyframes(name, route, delaySteps = 0, follower = false, origin = null) {
  const shifted = route.map((point, idx) => {
    if (origin && idx < origin.collectStep) return origin;
    if (origin && idx >= origin.collectStep) return route[Math.max(origin.collectStep, idx - delaySteps)] || point;
    return route[Math.max(0, idx - delaySteps)] || point;
  });
  let css = `@keyframes ${name} {\n`;
  const last = shifted.length - 1;
  shifted.forEach((point, idx) => {
    const pct = ((idx / last) * 100).toFixed(2);
    css += `  ${pct}% { transform: translate(${point.x}px, ${point.y}px);`;
    if (follower && origin && idx < origin.collectStep) css += ' opacity: 1;';
    else if (follower && idx < delaySteps + 1) css += ' opacity: 0;';
    else css += ' opacity: 1;';
    css += ' }\n';
  });
  css += '}\n';
  return css;
}

function visibilityKeyframes(name, collectStep, totalSteps, visibleBefore) {
  const pct = ((collectStep / (totalSteps - 1)) * 100).toFixed(2);
  if (visibleBefore) {
    return `@keyframes ${name} { 0%, ${pct}% { opacity: 1; } ${(Number(pct) + 0.01).toFixed(2)}%, 100% { opacity: 0; } }\n`;
  }
  return `@keyframes ${name} { 0%, ${pct}% { opacity: 0; } ${(Number(pct) + 0.01).toFixed(2)}%, 100% { opacity: 1; } }\n`;
}

function spriteFrames(size, frames) {
  return frames.map((frame) => {
    const idx = frame - 1;
    const x = -(idx % 4) * size;
    const y = -Math.floor(idx / 4) * size;
    return `translate(${x}px, ${y}px)`;
  }).join(';');
}

function generateSVG(weeks, total) {
  const active = [];
  weeks.forEach((week, w) => {
    week.contributionDays.forEach((day) => {
      if (day.contributionCount > 0) active.push({ w, d: day.weekday, count: day.contributionCount, level: day.level, date: day.date });
    });
  });
  const targets = active.length
    ? active.sort((a, b) => new Date(a.date) - new Date(b.date))
    : [{ w: 5, d: 2 }, { w: 14, d: 5 }, { w: 25, d: 1 }, { w: 38, d: 4 }, { w: 47, d: 2 }];
  const route = buildRoute(targets);
  const duration = Math.max(34, route.length * 0.32);
  const motherWalk = spriteFrames(46, [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]);
  const kittenIdle = spriteFrames(34, [1, 2, 3, 4]);
  const kittenWalk = spriteFrames(34, [5, 6, 7, 8, 9, 10, 11, 12]);

  let css = keyframes('meowl-route', route);
  targets.forEach((target, idx) => {
    const collectStep = Math.max(0, route.findIndex((point) => point.targetIndex === idx && point.state === 'happy'));
    const origin = { ...cellPoint(target, 0, -1), collectStep };
    const delay = Math.min(9, idx + 2);
    css += keyframes(`kitten-route-${idx}`, route, delay, true, origin);
    css += visibilityKeyframes(`kitten-idle-${idx}`, collectStep, route.length, true);
    css += visibilityKeyframes(`kitten-walk-${idx}`, collectStep, route.length, false);
  });

  const grid = weeks.map((week, w) => week.contributionDays.map((day) => {
    const colors = ['#142035', '#153E63', '#116C91', '#19A7CE', '#7DEBFF'];
    return `<rect x="${gridX + w * cell}" y="${gridY + day.weekday * cell}" width="14" height="14" rx="3" fill="${colors[day.contributionCount ? Math.min(day.level || 1, 4) : 0]}"/>`;
  }).join('')).join('');

  const kittenSprites = targets.map((target, idx) => {
    const p = cellPoint(target, 1, -1);
    return `
    <g class="kitten kitten-${idx}">
      <svg class="kitten-idle kitten-idle-${idx}" x="${p.x}" y="${p.y}" width="15" height="15" viewBox="0 0 15 15" overflow="hidden">
        <use href="#meowling-sheet">
          <animate attributeName="transform" dur="0.8s" repeatCount="indefinite" calcMode="discrete" values="${kittenIdle}"/>
        </use>
      </svg>
      <svg class="kitten-walk kitten-walk-${idx}" width="15" height="15" viewBox="0 0 15 15" overflow="hidden">
        <use href="#meowling-sheet">
          <animate attributeName="transform" dur="0.8s" repeatCount="indefinite" calcMode="discrete" values="${kittenWalk}"/>
        </use>
      </svg>
    </g>`;
  }).join('');

  return `<svg width="1000" height="285" viewBox="0 48 1000 230" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" aria-labelledby="title desc">
  <title id="title">Meowl contribution rescue route</title>
  <desc id="desc">Meowl mother walks across contribution cells to collect meowling kittens.</desc>
  <defs>
    <linearGradient id="bg" x1="0" y1="0" x2="1000" y2="285"><stop offset="0" stop-color="#071020"/><stop offset="0.58" stop-color="#001A55"/><stop offset="1" stop-color="#015FCC"/></linearGradient>
    <pattern id="screen" width="36" height="36" patternUnits="userSpaceOnUse"><path d="M36 0H0V36" stroke="#FFFFFF" stroke-opacity="0.08"/></pattern>
    <image id="meowl-sheet" width="72" height="72" href="data:image/png;base64,${meowlBase64}"/>
    <image id="meowling-sheet" width="60" height="60" href="data:image/png;base64,${meowlingBase64}"/>
  </defs>
  <style>
    ${css}
    .mother { animation: meowl-route ${duration}s linear infinite; }
    ${targets.map((_, idx) => `.kitten-walk-${idx} { animation: kitten-route-${idx} ${duration}s linear infinite, kitten-walk-${idx} ${duration}s step-end infinite; }\n.kitten-idle-${idx} { animation: kitten-idle-${idx} ${duration}s step-end infinite; }`).join('\n')}
    image { image-rendering: pixelated; image-rendering: crisp-edges; }
  </style>
  <rect x="0" y="0" width="1000" height="285" fill="url(#bg)"/>
  <rect x="0" y="0" width="1000" height="285" fill="url(#screen)"/>
  <text x="60" y="86" fill="#FFFFFF" font-family="Arial Black, Impact, sans-serif" font-size="28" font-style="italic">MEOWL CONTRIBUTION ROUTE</text>
  <text x="62" y="112" fill="#BDEFFF" font-family="Consolas, monospace" font-size="16">${total} contributions // meowling rescue train</text>
  <g>${grid}</g>
  ${kittenSprites}
  <svg class="mother" width="18" height="18" viewBox="0 0 18 18" overflow="hidden">
      <use href="#meowl-sheet">
        <animate attributeName="transform" dur="1.05s" repeatCount="indefinite" calcMode="discrete" values="${motherWalk}"/>
      </use>
  </svg>
</svg>`;
}

async function main() {
  const repo = process.env.GITHUB_REPOSITORY || 'Sendudu2311/Sendudu2311';
  const owner = repo.split('/')[0];
  const { weeks, total } = await fetchContributions(owner, process.env.GITHUB_TOKEN);
  fs.writeFileSync(path.join(assetsDir, 'meowl-contribution-train.svg'), generateSVG(weeks, total));
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
