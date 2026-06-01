$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$assets = Join-Path $root "assets"

$signals = @'
<svg width="1000" height="520" viewBox="0 0 1000 520" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" aria-labelledby="title desc">
  <title id="title">Sendudu2311 GitHub signals panel</title>
  <desc id="desc">Persona 3 Reload inspired static GitHub signal dashboard.</desc>
  <defs>
    <linearGradient id="bg" x1="0" y1="0" x2="1000" y2="520" gradientUnits="userSpaceOnUse">
      <stop offset="0" stop-color="#00113F"/><stop offset="0.55" stop-color="#015FCC"/><stop offset="1" stop-color="#19D9FF"/>
    </linearGradient>
    <filter id="shadow" x="-10%" y="-10%" width="120%" height="130%">
      <feDropShadow dx="8" dy="10" stdDeviation="0" flood-color="#00113F" flood-opacity="0.78"/>
      <feDropShadow dx="0" dy="14" stdDeviation="12" flood-color="#00113F" flood-opacity="0.3"/>
    </filter>
    <pattern id="grid" width="36" height="36" patternUnits="userSpaceOnUse">
      <path d="M36 0H0V36" stroke="#FFFFFF" stroke-opacity="0.1"/>
    </pattern>
  </defs>
  <rect width="1000" height="520" fill="url(#bg)"/>
  <rect width="1000" height="520" fill="url(#grid)"/>
  <path d="M-60 90C126 28 280 46 430 92C604 145 740 83 894 43C1006 14 1084 33 1120 55V0H-60V90Z" fill="#FFFFFF" fill-opacity="0.2"/>
  <text x="54" y="78" fill="#FFFFFF" font-family="Arial Black, Impact, sans-serif" font-size="38" font-style="italic">LIVE GITHUB SIGNALS</text>
  <text x="57" y="110" fill="#BDEFFF" font-family="Consolas, monospace" font-size="18">static P3R command dashboard // profile telemetry</text>
  <path d="M730 35L955 35L920 94L694 94L730 35Z" fill="#001A55"/>
  <text x="744" y="79" fill="#FFFFFF" font-family="Arial Black, Impact, sans-serif" font-size="37" font-style="italic">02</text>
  <text x="815" y="78" fill="#19D9FF" font-family="Arial Black, Impact, sans-serif" font-size="20" font-style="italic">STATUS</text>
  <circle cx="904" cy="53" r="5" fill="#FFFFFF"/><circle cx="924" cy="53" r="5" fill="#19D9FF"/><circle cx="944" cy="53" r="5" fill="#FFFFFF"/>
  <g filter="url(#shadow)">
    <path d="M64 150L456 124L430 236L38 262L64 150Z" fill="#FFFFFF"/><path d="M80 164L430 141L413 222L64 245L80 164Z" fill="#001A55"/>
    <path d="M550 130L934 104L908 216L524 242L550 130Z" fill="#FFFFFF"/><path d="M566 144L908 121L891 202L550 225L566 144Z" fill="#001A55"/>
    <path d="M95 304L477 278L449 418L67 444L95 304Z" fill="#FFFFFF"/><path d="M112 322L449 299L429 400L92 423L112 322Z" fill="#001A55"/>
    <path d="M560 290L932 264L904 404L532 430L560 290Z" fill="#FFFFFF"/><path d="M577 308L904 285L884 386L557 409L577 308Z" fill="#001A55"/>
  </g>
  <text x="103" y="190" fill="#FFFFFF" font-family="Arial Black, Impact, sans-serif" font-size="22">SENDUDU'S STATS</text>
  <text x="105" y="221" fill="#BDEFFF" font-family="Consolas, monospace" font-size="17">Stars earned</text><text x="355" y="221" fill="#FFFFFF" font-family="Arial Black" font-size="19">1</text>
  <text x="105" y="248" fill="#BDEFFF" font-family="Consolas, monospace" font-size="17">Commits tracked</text><text x="337" y="248" fill="#FFFFFF" font-family="Arial Black" font-size="19">512</text>
  <text x="105" y="275" fill="#BDEFFF" font-family="Consolas, monospace" font-size="17">Pull requests</text><text x="349" y="275" fill="#FFFFFF" font-family="Arial Black" font-size="19">41</text>
  <text x="594" y="175" fill="#FFFFFF" font-family="Arial Black, Impact, sans-serif" font-size="56">483</text>
  <text x="592" y="205" fill="#BDEFFF" font-family="Consolas, monospace" font-size="16">total contributions</text>
  <path d="M740 140V206" stroke="#FFFFFF" stroke-opacity="0.55" stroke-width="3"/>
  <text x="780" y="175" fill="#FFFFFF" font-family="Arial Black, Impact, sans-serif" font-size="56">C+</text>
  <text x="779" y="205" fill="#BDEFFF" font-family="Consolas, monospace" font-size="16">current grade</text>
  <text x="126" y="354" fill="#FFFFFF" font-family="Arial Black, Impact, sans-serif" font-size="28">TECH FREQUENCY</text>
  <rect x="126" y="377" width="280" height="12" rx="6" fill="#FFFFFF" fill-opacity="0.22"/>
  <rect x="126" y="377" width="142" height="12" rx="6" fill="#19D9FF"/><rect x="268" y="377" width="105" height="12" fill="#7EA6FF"/><rect x="373" y="377" width="28" height="12" fill="#FFE866"/>
  <text x="126" y="417" fill="#BDEFFF" font-family="Consolas, monospace" font-size="18">Dart 48.8%  // TypeScript 36.0%</text>
  <text x="605" y="337" fill="#FFFFFF" font-family="Arial Black, Impact, sans-serif" font-size="28">COMMIT RHYTHM</text>
  <g fill="#19D9FF">
    <rect x="608" y="370" width="16" height="34"/><rect x="636" y="348" width="16" height="56"/><rect x="664" y="320" width="16" height="84"/><rect x="692" y="334" width="16" height="70"/><rect x="720" y="296" width="16" height="108"/><rect x="748" y="312" width="16" height="92"/><rect x="776" y="282" width="16" height="122"/><rect x="804" y="356" width="16" height="48"/><rect x="832" y="340" width="16" height="64"/>
  </g>
  <path d="M596 404H872" stroke="#FFFFFF" stroke-opacity="0.4"/><path d="M596 300V404" stroke="#FFFFFF" stroke-opacity="0.4"/>
  <path d="M42 486H958" stroke="#FFFFFF" stroke-width="4"/><path d="M42 492H958" stroke="#FF2A8A" stroke-width="2"/>
</svg>
'@

Set-Content -LiteralPath (Join-Path $assets "sendudu-live-signals.svg") -Value $signals -NoNewline

$motherSize = 46
$kidSize = 34
$motherSheet = $motherSize * 4
$kidSheet = $kidSize * 4

Add-Type -AssemblyName System.Drawing
function Resize-SpriteSheet($source, $target, $size) {
    $src = [System.Drawing.Image]::FromFile($source)
    $bmp = New-Object System.Drawing.Bitmap $size, $size
    $graphics = [System.Drawing.Graphics]::FromImage($bmp)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::NearestNeighbor
    $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::Half
    $graphics.DrawImage($src, 0, 0, $size, $size)
    $graphics.Dispose()
    $bg = $bmp.GetPixel(0, 0)
    for ($x = 0; $x -lt $bmp.Width; $x++) {
        for ($y = 0; $y -lt $bmp.Height; $y++) {
            $c = $bmp.GetPixel($x, $y)
            $diff = [Math]::Abs($c.R - $bg.R) + [Math]::Abs($c.G - $bg.G) + [Math]::Abs($c.B - $bg.B)
            if ($diff -lt 45) {
                $bmp.SetPixel($x, $y, [System.Drawing.Color]::FromArgb(0, $c.R, $c.G, $c.B))
            }
        }
    }
    $bmp.Save($target, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
    $src.Dispose()
}

$generated = Join-Path $assets "generated"
New-Item -ItemType Directory -Force -Path $generated | Out-Null
$meowlSmall = Join-Path $generated "meowl-sprite-184.png"
$meowlingSmall = Join-Path $generated "meowling-sprite-136.png"
Resize-SpriteSheet (Join-Path $assets "meowl\meowl.png") $meowlSmall $motherSheet
Resize-SpriteSheet (Join-Path $assets "meowling\meowling.png") $meowlingSmall $kidSheet

$meowl = "data:image/png;base64," + [Convert]::ToBase64String([IO.File]::ReadAllBytes($meowlSmall))
$meowling = "data:image/png;base64," + [Convert]::ToBase64String([IO.File]::ReadAllBytes($meowlingSmall))
$motherFrames = "translate(0 -46);translate(-46 -46);translate(-92 -46);translate(-138 -46);translate(0 -92);translate(-46 -92);translate(-92 -92);translate(-138 -92);translate(0 -138);translate(-46 -138);translate(-92 -138);translate(-138 -138);translate(0 -46);translate(-46 -46);translate(-92 -46);translate(-138 -46);translate(0 -138);translate(-46 -138);translate(-92 -138);translate(-138 -138)"
$kidFrames = "translate(0 -34);translate(-34 -34);translate(-68 -34);translate(-102 -34);translate(0 -68);translate(-34 -68);translate(-68 -68);translate(-102 -68)"

$contribution = @"
<svg width="1000" height="360" viewBox="0 0 1000 360" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" aria-labelledby="title desc">
  <title id="title">Meowl contribution rescue train</title>
  <desc id="desc">Meowl mother collects meowling kittens across a contribution grid and they follow her as a train.</desc>
  <defs>
    <linearGradient id="bg" x1="0" y1="0" x2="1000" y2="360"><stop offset="0" stop-color="#071020"/><stop offset="0.6" stop-color="#001A55"/><stop offset="1" stop-color="#015FCC"/></linearGradient>
    <pattern id="grid" width="18" height="18" patternUnits="userSpaceOnUse"><rect width="13" height="13" rx="3" fill="#FFFFFF" fill-opacity="0.08"/></pattern>
  </defs>
  <rect width="1000" height="360" fill="url(#bg)"/>
  <path d="M38 28H962" stroke="#FFFFFF" stroke-width="3"/><path d="M38 32H962" stroke="#FF2A8A" stroke-width="2"/>
  <text x="60" y="92" fill="#FFFFFF" font-family="Arial Black, Impact, sans-serif" font-size="30" font-style="italic">MEOWL CONTRIBUTION TRAIN</text>
  <text x="62" y="122" fill="#BDEFFF" font-family="Consolas, monospace" font-size="17">483 commits rescued in the last 365 days // custom static showcase</text>
  <rect x="60" y="150" width="880" height="126" fill="url(#grid)"/>
  <g fill="#19D9FF" opacity="0.4">
    <rect x="78" y="186" width="13" height="13" rx="3"/><rect x="96" y="204" width="13" height="13" rx="3"/><rect x="114" y="168" width="13" height="13" rx="3"/><rect x="132" y="222" width="13" height="13" rx="3"/><rect x="150" y="186" width="13" height="13" rx="3"/>
    <rect x="204" y="168" width="13" height="13" rx="3"/><rect x="222" y="168" width="13" height="13" rx="3"/><rect x="420" y="186" width="13" height="13" rx="3"/><rect x="438" y="204" width="13" height="13" rx="3"/><rect x="456" y="222" width="13" height="13" rx="3"/>
    <rect x="474" y="204" width="13" height="13" rx="3"/><rect x="492" y="186" width="13" height="13" rx="3"/><rect x="690" y="168" width="13" height="13" rx="3"/><rect x="708" y="186" width="13" height="13" rx="3"/><rect x="726" y="204" width="13" height="13" rx="3"/><rect x="744" y="222" width="13" height="13" rx="3"/>
  </g>
  <g fill="#FFB347"><circle cx="286" cy="245" r="7"/><circle cx="472" cy="245" r="7"/><circle cx="662" cy="245" r="7"/><circle cx="806" cy="245" r="7"/></g>
  <g><animateTransform attributeName="transform" type="translate" dur="14s" repeatCount="indefinite" values="86 262;160 262;234 262;308 262;382 262;456 262;530 262;604 262;678 262;752 262;826 262"/><clipPath id="mother-clip"><rect width="$motherSize" height="$motherSize"/></clipPath><g clip-path="url(#mother-clip)"><image width="$motherSheet" height="$motherSheet" href="$meowl" image-rendering="pixelated"><animate attributeName="transform" dur="1s" repeatCount="indefinite" calcMode="discrete" values="$motherFrames"/></image></g></g>
  <g><animateTransform attributeName="transform" type="translate" dur="14s" repeatCount="indefinite" values="110 262;138 262;212 262;286 262;360 262;434 262;508 262;582 262;656 262;730 262;804 262"/><clipPath id="kid1-clip"><rect width="$kidSize" height="$kidSize"/></clipPath><g clip-path="url(#kid1-clip)"><image width="$kidSheet" height="$kidSheet" href="$meowling" image-rendering="pixelated"><animate attributeName="transform" dur="1s" repeatCount="indefinite" calcMode="discrete" values="$kidFrames"/></image></g></g>
  <g><animateTransform attributeName="transform" type="translate" dur="14s" repeatCount="indefinite" values="282 262;282 262;282 262;286 262;334 262;408 262;482 262;556 262;630 262;704 262;778 262"/><clipPath id="kid2-clip"><rect width="$kidSize" height="$kidSize"/></clipPath><g clip-path="url(#kid2-clip)"><image width="$kidSheet" height="$kidSheet" href="$meowling" image-rendering="pixelated"><animate attributeName="transform" dur="1s" repeatCount="indefinite" calcMode="discrete" values="$kidFrames"/></image></g></g>
  <g><animateTransform attributeName="transform" type="translate" dur="14s" repeatCount="indefinite" values="468 262;468 262;468 262;468 262;468 262;482 262;530 262;604 262;678 262;752 262;826 262"/><clipPath id="kid3-clip"><rect width="$kidSize" height="$kidSize"/></clipPath><g clip-path="url(#kid3-clip)"><image width="$kidSheet" height="$kidSheet" href="$meowling" image-rendering="pixelated"><animate attributeName="transform" dur="1s" repeatCount="indefinite" calcMode="discrete" values="$kidFrames"/></image></g></g>
  <g><animateTransform attributeName="transform" type="translate" dur="14s" repeatCount="indefinite" values="658 262;658 262;658 262;658 262;658 262;658 262;658 262;660 262;704 262;778 262;852 262"/><clipPath id="kid4-clip"><rect width="$kidSize" height="$kidSize"/></clipPath><g clip-path="url(#kid4-clip)"><image width="$kidSheet" height="$kidSheet" href="$meowling" image-rendering="pixelated"><animate attributeName="transform" dur="1s" repeatCount="indefinite" calcMode="discrete" values="$kidFrames"/></image></g></g>
  <g fill="#FFFFFF" font-family="Consolas, monospace" font-size="14" opacity="0.9"><text x="62" y="313">idle 1-4</text><text x="176" y="313">walk 5-12</text><text x="304" y="313">happy 13-16 at rescue points</text></g>
</svg>
"@

Set-Content -LiteralPath (Join-Path $assets "meowl-contribution-train.svg") -Value $contribution -NoNewline
