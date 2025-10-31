---
layout: default
title: Shader Playground
permalink: /shader-playground/
---

<p align="center">
  <a href="{{ '/' | relative_url }}">Home</a> |
  <a href="{{ '/' | relative_url }}#papers">Selected Papers</a> |
  <a href="{{ '/' | relative_url }}#mentoring">Mentoring</a> |
  <a href="{{ '/' | relative_url }}#projects">Projects</a> |
  <a href="{{ '/blog/' | relative_url }}">Blog</a>
</p>

<div class="shader-playground">
  <div class="shader-stage">
<canvas id="shader-canvas"></canvas>
<div class="shader-error" id="shader-error"></div>
</div>
<div class="shader-editor-wrapper">
  <div class="shader-editor-container">
    <div class="shader-editor-toolbar">
      <label for="shader-select">Load example:</label>
      <select id="shader-select">
        <option value="sdf_orb">Planet</option>
        <option value="neon_field">Neon Distance Field</option>
        <option value="fluid_mix">Fluid Mixing</option>
      </select>
      <div class="shader-editor-actions">
        <button id="run-shader">Run Shader</button>
        <button id="reset-shader">Reset</button>
      </div>
    </div>
    <div id="shader-editor"></div>
  </div>
</div>
</div>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/codemirror.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/theme/monokai.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/codemirror.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/mode/clike/clike.min.js"></script>
<style>
.shader-playground {
  margin: 2rem 0 4rem;
}

.shader-editor-wrapper {
  display: grid;
  grid-template-columns: minmax(0, 1fr);
  gap: 1.25rem;
}

@media (max-width: 992px) {
  .shader-editor-wrapper {
    grid-template-columns: 1fr;
  }
}

.shader-editor-toolbar {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  margin-bottom: 0.5rem;
  color: #94a3b8;
  font-size: 0.9rem;
}

.shader-editor-actions {
  display: flex;
  gap: 0.5rem;
  margin-left: auto;
}

.shader-editor-actions button {
  background: linear-gradient(135deg, #3b82f6, #2563eb);
  border: none;
  color: white;
  padding: 0.32rem 0.85rem;
  border-radius: 6px;
  cursor: pointer;
  font-size: 0.85rem;
  transition: transform 0.15s ease, box-shadow 0.15s ease;
}

.shader-editor-actions button:hover {
  transform: translateY(-1px);
  box-shadow: 0 8px 18px rgba(37, 99, 235, 0.35);
}

.shader-editor-actions button:active {
  transform: translateY(0);
  box-shadow: none;
}

.shader-editor-toolbar label {
  text-transform: uppercase;
  letter-spacing: 0.08em;
  font-weight: 600;
  color: #cbd5f5;
}

.shader-editor-toolbar select {
  background: rgba(15, 23, 42, 0.85);
  border: 1px solid rgba(59, 130, 246, 0.35);
  color: #e2e8f0;
  padding: 0.35rem 0.6rem;
  border-radius: 6px;
  font-family: "Source Code Pro", monospace;
  font-size: 0.9rem;
}

.shader-editor-toolbar select:focus {
  outline: none;
  border-color: rgba(59, 130, 246, 0.6);
}

.shader-stage {
  position: relative;
  background: #0f172a;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 20px 45px rgba(15, 23, 42, 0.35);
  margin: 0 0 0.4rem 0;
}

#shader-canvas {
  width: 100%;
  height: 360px;
  display: block;
  background: radial-gradient(circle at center, #1f2937 0%, #0f172a 60%, #020617 100%);
}

.shader-error {
  display: none;
  padding: 0.6rem 1rem;
  color: #fca5a5;
  font-family: 'Source Code Pro', monospace;
  font-size: 0.85rem;
  white-space: pre-wrap;
}

.shader-error.is-visible {
  display: block;
}

.shader-editor-container {
  background: #0f172a;
  border-radius: 12px;
  padding: 0.75rem;
  box-shadow: 0 16px 32px rgba(15, 23, 42, 0.25);
  color: #e2e8f0;
  font-family: 'Source Code Pro', monospace;
}

.shader-editor-container .CodeMirror {
  height: 360px;
  font-family: 'Source Code Pro', monospace;
  font-size: 0.95rem;
  border-radius: 8px;
}

@media (max-width: 768px) {
  #shader-canvas,
  .shader-editor-container .CodeMirror {
    height: 260px;
  }
}
</style>
<script>
document.addEventListener('DOMContentLoaded', function() {
(function() {
    const exampleShaders = {
    sdf_orb: `// Planet with moon
precision highp float;

uniform vec2 iResolution;
uniform float iTime;

const int MAX_STEPS = 120;
const float MAX_DIST = 20.0;
const float SURF_DIST = 0.001;

mat2 rotate(float a) {
  float s = sin(a), c = cos(a);
  return mat2(c, -s, s, c);
}

float hash(float n) {
  return fract(sin(n) * 43758.5453);
}

float noise(vec3 x) {
  vec3 p = floor(x);
  vec3 f = fract(x);
  f = f * f * (3.0 - 2.0 * f);

  float n = p.x + p.y * 57.0 + 113.0 * p.z;
  float res = mix(
    mix(mix(hash(n + 0.0), hash(n + 1.0), f.x),
        mix(hash(n + 57.0), hash(n + 58.0), f.x), f.y),
    mix(mix(hash(n + 113.0), hash(n + 114.0), f.x),
        mix(hash(n + 170.0), hash(n + 171.0), f.x), f.y),
    f.z);
  return res;
}

float fbm(vec3 p) {
  float v = 0.0;
  float a = 0.5;
  vec3 shift = vec3(100.0);
  for (int i = 0; i < 5; ++i) {
    v += a * noise(p);
    p = p * 2.1 + shift;
    a *= 0.5;
  }
  return v;
}

float sdSphere(vec3 p, float r) {
  return length(p) - r;
}

float moonMap(vec3 p, vec3 center) {
  vec3 pos = p - center;
  float r = 0.35;
  float crater = fbm(pos * 6.0 + vec3(2.0, 5.0, -3.0));
  return sdSphere(pos, r + crater * 0.05);
}

float map(vec3 p) {
  vec3 q = p;
  vec3 center = vec3(0.0, 0.0, 2.5);
  vec3 planetPos = q - center;

  float baseRadius = 1.25;
  vec3 samplePos = planetPos * 1.4 + vec3(0.0, iTime * 0.08, 0.0);
  float terrain = fbm(samplePos);
  float ridge = fbm(samplePos * 2.7 + 4.0) * fbm(samplePos * 4.1 - 3.2);

  float continent = fbm(planetPos * 0.52 + vec3(3.1, -2.3, 1.9));
  float continentDetail = fbm(planetPos * 1.05 + vec3(-4.2, 5.1, 3.7));
  float landMix = smoothstep(0.08, 0.45, continent * 0.7 + continentDetail * 0.3 - 0.05);
  float islands = smoothstep(0.6, 0.8, fbm(planetPos * 3.3 + vec3(8.5, -6.0, 2.2)));
  landMix = clamp(landMix + islands * 0.25, 0.0, 1.0);

  float elevation = mix(-0.08, 0.24, landMix) + terrain * 0.06 + ridge * 0.04;

  float sphere = sdSphere(planetPos, baseRadius + elevation);
  float moonOrbitRadius = 2.2;
  float moonAngle = iTime * 0.25;
  vec3 moonCenter = center + vec3(moonOrbitRadius * cos(moonAngle), 0.6 * sin(moonAngle * 0.8), moonOrbitRadius * sin(moonAngle));
  float moon = moonMap(q, moonCenter);

  return min(sphere, moon);
}

vec3 calcNormal(vec3 p) {
  vec2 e = vec2(0.001, 0.0);
  return normalize(vec3(
    map(p + e.xyy) - map(p - e.xyy),
    map(p + e.yxy) - map(p - e.yxy),
    map(p + e.yyx) - map(p - e.yyx)
  ));
}

float raymarch(vec3 ro, vec3 rd) {
  float dO = 0.0;
  for (int i = 0; i < MAX_STEPS; ++i) {
    vec3 p = ro + rd * dO;
    float dS = map(p);
    if (dS < SURF_DIST || dO > MAX_DIST) break;
    dO += dS;
  }
  return dO;
}

vec3 shade(vec3 p, vec3 rd, bool isMoon, vec3 moonCenter) {
  vec3 center = vec3(0.0, 0.0, 2.5);
  vec3 sunDir = normalize(vec3(-1.0, 0.35, 0.1));

  if (isMoon) {
    vec3 moonPos = p - moonCenter;
    vec3 moonNormal = normalize(moonPos);
    float moonDiff = clamp(dot(moonNormal, sunDir), 0.0, 1.0);
    float moonSpec = pow(clamp(dot(moonNormal, normalize(sunDir - rd)), 0.0, 1.0), 24.0);
    float moonAlbedo = 0.6 + 0.4 * fbm(moonPos * 4.0 + vec3(2.0, 4.0, -1.0));
    vec3 base = vec3(0.55, 0.56, 0.6) * moonAlbedo;
    vec3 rim = vec3(0.68, 0.7, 0.75) * pow(1.0 - clamp(dot(moonNormal, -rd), 0.0, 1.0), 2.0);
    vec3 ambient = vec3(0.08) * (0.6 + 0.4 * moonDiff);
    return base * (0.5 + 0.6 * moonDiff) + vec3(moonSpec) * 0.35 + rim + ambient;
  }

  vec3 n = calcNormal(p);
  vec3 planetPos = p - center;

  vec3 samplePos = planetPos * 1.4 + vec3(0.0, iTime * 0.08, 0.0);
  vec3 rotatingPos = planetPos * 1.2 + vec3(iTime * 0.15, 0.0, 0.0);
  float terrain = fbm(samplePos);
  float ridge = fbm(samplePos * 2.7 + 4.0) * fbm(samplePos * 3.6 - 2.1);
  float mask = terrain * 0.7 + ridge * 0.6;

  float continent = fbm(planetPos * 0.52 + vec3(3.1, -2.3, 1.9));
  float continentDetail = fbm(planetPos * 1.05 + vec3(-4.2, 5.1, 3.7));
  float landMix = smoothstep(0.08, 0.45, continent * 0.7 + continentDetail * 0.3 - 0.05);
  float islands = smoothstep(0.6, 0.8, fbm(planetPos * 3.3 + vec3(8.5, -6.0, 2.2)));
  landMix = clamp(landMix + islands * 0.25, 0.0, 1.0);

  float lat = dot(normalize(planetPos), vec3(0.0, 1.0, 0.0));

  vec3 lightPos = vec3(2.0, 2.5, 0.5);
  vec3 l = sunDir;
  float diff = clamp(dot(n, l), 0.0, 1.0);
  vec3 h = normalize(l - rd);
  float spec = pow(clamp(dot(n, h), 0.0, 1.0), 48.0);
  float fresnel = pow(1.0 - clamp(dot(n, -rd), 0.0, 1.0), 2.5);

  vec3 oceanDeep = vec3(0.02, 0.15, 0.45);
  vec3 oceanShallow = vec3(0.08, 0.38, 0.75);
  vec3 landLow = vec3(0.02, 0.38, 0.1);
  vec3 landHigh = vec3(0.46, 0.34, 0.1);
  vec3 snowColor = vec3(0.96, 0.97, 0.98);

  float shore = smoothstep(0.35, 0.55, landMix) * (1.0 - smoothstep(0.62, 0.78, landMix));
  vec3 coast = mix(oceanShallow, landLow, clamp(mask + 0.4, 0.0, 1.0));

  vec3 landColor = mix(landLow, landHigh, clamp(mask + 0.35 * ridge, 0.0, 1.0));
  float snowMask = smoothstep(0.48, 0.78, abs(lat) + mask * 0.2);

  vec3 surfaceColor = mix(oceanDeep, landColor, landMix);
  surfaceColor = mix(surfaceColor, snowColor, snowMask);
  surfaceColor = mix(surfaceColor, coast, shore);

  vec3 base = surfaceColor * (0.4 + 0.75 * diff);
  base = mix(base, base + vec3(0.18, 0.2, 0.22), landMix * 0.35);
  vec3 rim = mix(vec3(0.35, 0.65, 1.05), vec3(0.75, 0.9, 1.1), snowMask) * fresnel;
  vec3 specular = vec3(spec) * 0.6;

  float cloudPattern = fbm(rotatingPos * 2.6 + vec3(0.0, 30.0, 0.0));
  float cloudMask = smoothstep(0.55, 0.75, cloudPattern);
  vec3 clouds = mix(vec3(0.92, 0.95, 0.99), vec3(1.0), diff * 0.6);
  base = mix(base, clouds, cloudMask * 0.7);

  vec3 oceanFresnel = vec3(0.35, 0.6, 0.9) * pow(1.0 - clamp(dot(n, -rd), 0.0, 1.0), 1.5);
  base += oceanFresnel * (1.0 - smoothstep(0.12, 0.42, mask));

  vec3 ambient = vec3(0.08) + vec3(0.05, 0.07, 0.1) * (0.6 + 0.4 * diff);
  return base + specular + rim + ambient;
}

void main() {
  vec2 uv = (gl_FragCoord.xy - 0.5 * iResolution.xy) / iResolution.y;
  vec3 ro = vec3(0.0, 0.0, -3.5);
  vec3 rd = normalize(vec3(uv, 1.6));

  float d = raymarch(ro, rd);
  vec3 color = vec3(0.02);
  if (d < MAX_DIST) {
    vec3 p = ro + rd * d;
    vec3 center = vec3(0.0, 0.0, 2.5);
    float moonOrbitRadius = 2.2;
    float moonAngle = iTime * 0.25;
    vec3 moonCenter = center + vec3(moonOrbitRadius * cos(moonAngle), 0.6 * sin(moonAngle * 0.8), moonOrbitRadius * sin(moonAngle));
    bool hitMoon = length(p - moonCenter) < 0.38;
    color = shade(p, rd, hitMoon, moonCenter);
    if (!hitMoon) {
      vec3 toMoon = normalize(moonCenter - p);
      float halo = 0.12 / max(0.05, length(cross(rd, toMoon)));
      color += vec3(0.2, 0.25, 0.35) * halo;
    }
  }
  color = mix(vec3(0.09, 0.12, 0.16), color, exp(-0.35 * d));
  color = min(color * 1.35, vec3(1.0));
  gl_FragColor = vec4(color, 1.0);
}
`,
    neon_field: `// Neon distance field flow
precision highp float;

uniform vec2 iResolution;
uniform float iTime;

float hash21(vec2 p) {
  p = fract(p * vec2(443.8975, 441.423));
  p += dot(p, p + 19.19);
  return fract(p.x * p.y);
}

float sdBox(vec3 p, vec3 b) {
  vec3 q = abs(p) - b;
  return length(max(q, 0.0)) + min(max(q.x, max(q.y, q.z)), 0.0);
}

float map(vec3 p) {
  vec3 q = p;
  q.xz += 0.4 * sin(vec2(q.y, q.x) + iTime * 0.7);
  float cell = floor(q.z + 5.0);
  float rnd = hash21(vec2(cell, floor(q.y + 4.0)));
  float glow = 0.25 + 0.75 * rnd;
  vec3 c = vec3(0.5 * sin(iTime + cell) , 0.5 * cos(iTime + rnd * 6.0), 0.0);
  float box = sdBox(q - vec3(c.xy, cell * 0.4), vec3(0.25, 0.25, glow));
  float plane = q.y + 1.2;
  return min(box, plane);
}

vec3 calcNormal(vec3 p) {
  vec2 e = vec2(0.001, 0.0);
  return normalize(vec3(
    map(p + e.xyy) - map(p - e.xyy),
    map(p + e.yxy) - map(p - e.yxy),
    map(p + e.yyx) - map(p - e.yyx)
  ));
}

float march(vec3 ro, vec3 rd) {
  float dist = 0.0;
  for (int i = 0; i < 100; ++i) {
    vec3 p = ro + rd * dist;
    float d = map(p);
    dist += d;
    if (d < 0.001 || dist > 25.0) break;
  }
  return dist;
}

vec3 palette(float t) {
  vec3 a = vec3(0.2, 0.25, 0.4);
  vec3 b = vec3(0.3, 0.2, 0.45);
  vec3 c = vec3(0.8, 0.5, 0.9);
  vec3 d = vec3(0.0, 0.33, 0.67);
  return a + b * cos(6.28318 * (c * t + d));
}

void main() {
  vec2 uv = (gl_FragCoord.xy - 0.5 * iResolution.xy) / iResolution.y;
  vec3 ro = vec3(0.0, 0.3, -3.5);
  vec3 rd = normalize(vec3(uv, 1.6));
  rd.xy *= mat2(cos(iTime * 0.1), -sin(iTime * 0.1), sin(iTime * 0.1), cos(iTime * 0.1));

  float dist = march(ro, rd);
  vec3 color = vec3(0.0);

  if (dist < 25.0) {
    vec3 p = ro + rd * dist;
    vec3 n = calcNormal(p);
    float fresnel = pow(1.0 - clamp(dot(n, -rd), 0.0, 1.0), 2.5);
    color = palette(p.z + iTime * 0.5) * (0.6 + 0.4 * fresnel);
  }

  float glow = 0.0;
  vec3 samplePos = ro;
  for (float t = 0.0; t < 1.0; t += 0.05) {
    float d = map(samplePos);
    glow += 0.01 / (0.001 + d * d);
    samplePos += rd * 0.3;
  }

  color += vec3(0.15, 0.3, 0.6) * glow;
  color = pow(color, vec3(0.92));
  gl_FragColor = vec4(color, 1.0);
}
`,
    fluid_mix: `// Two-fluid mixing using procedural velocity field
precision highp float;

uniform vec2 iResolution;
uniform float iTime;

float hash21(vec2 p) {
  p = fract(p * vec2(123.34, 345.45));
  p += dot(p, p + 34.345);
  return fract(p.x * p.y);
}

float noise(vec2 p) {
  vec2 i = floor(p);
  vec2 f = fract(p);
  f = f * f * (3.0 - 2.0 * f);
  float a = hash21(i);
  float b = hash21(i + vec2(1.0, 0.0));
  float c = hash21(i + vec2(0.0, 1.0));
  float d = hash21(i + vec2(1.0, 1.0));
  return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}

vec2 velocityField(vec2 p, float t) {
  vec2 v = vec2(0.0);
  vec2 c1 = vec2(0.35 * sin(t * 0.6), 0.25 * cos(t * 0.4));
  vec2 r1 = p - c1;
  v += vec2(-r1.y, r1.x) * (1.8 / (0.08 + dot(r1, r1)));

  vec2 c2 = vec2(0.4 * cos(t * 0.37 + 2.1), 0.3 * sin(t * 0.5 + 1.3));
  vec2 r2 = p - c2;
  v += vec2(-r2.y, r2.x) * (-1.3 / (0.08 + dot(r2, r2)));

  vec2 c3 = vec2(0.25 * sin(t * 0.9 - 3.2), 0.35 * cos(t * 0.7 - 2.7));
  vec2 r3 = p - c3;
  v += vec2(-r3.y, r3.x) * (1.1 / (0.08 + dot(r3, r3)));

  v += 0.25 * vec2(sin(p.y * 3.4 + t * 0.8), -cos(p.x * 2.9 - t * 0.6));
  v += 0.15 * vec2(sin(p.x * 6.2 - t * 1.1), cos(p.y * 5.8 + t * 0.9));
  return v * 0.18;
}

vec2 rk4(vec2 pos, float time, float dt) {
  vec2 k1 = velocityField(pos, time);
  vec2 k2 = velocityField(pos - 0.5 * dt * k1, time - 0.5 * dt);
  vec2 k3 = velocityField(pos - 0.5 * dt * k2, time - 0.5 * dt);
  vec2 k4 = velocityField(pos - dt * k3, time - dt);
  return pos - dt * (k1 + 2.0 * k2 + 2.0 * k3 + k4) / 6.0;
}

vec2 backtrace(vec2 pos, float time) {
  float step = 0.18;
  vec2 current = pos;
  float t = time;
  for (int i = 0; i < 12; ++i) {
    current = rk4(current, t, step);
    t -= step;
  }
  return current;
}

vec3 initialColor(vec2 pos) {
  float stripe = 0.5 + 0.5 * sin(pos.y * 6.283);
  float block = smoothstep(-0.15, 0.15, pos.x);
  float droplets = smoothstep(0.55, 0.85, noise(pos * 3.5));
  float mixFactor = clamp(block + stripe * 0.6 + droplets * 0.3, 0.0, 1.0);
  vec3 fluidA = vec3(0.1, 0.36, 0.95);
  vec3 fluidB = vec3(0.98, 0.35, 0.22);
  return mix(fluidA, fluidB, mixFactor);
}

void main() {
  vec2 uv = (gl_FragCoord.xy - 0.5 * iResolution.xy) / iResolution.y;
  float time = iTime * 0.45;
  vec2 traced = backtrace(uv, time);
  vec3 col = initialColor(traced);

  float vort = length(velocityField(uv, time)) * 2.2;
  float foam = smoothstep(0.4, 0.95, vort);
  vec3 highlight = vec3(1.0) * foam * 0.35;
  vec3 lightDir = normalize(vec3(-0.5, 0.6, 0.35));
  vec2 grad = vec2(noise(uv * 6.0 + time), noise(uv * 6.0 - time));
  float diff = clamp(dot(normalize(vec3(grad, 0.35)), lightDir), 0.0, 1.0);
  col += vec3(0.15, 0.18, 0.22) * diff;
  col += highlight;

  col = pow(col, vec3(0.92));
  gl_FragColor = vec4(col, 1.0);
}
`
  };

  const defaultFragment = exampleShaders.sdf_orb;

  const VertexShader = `attribute vec2 position;
void main() {
  gl_Position = vec4(position, 0.0, 1.0);
}`;

  const canvas = document.getElementById('shader-canvas');
  const gl = canvas.getContext('webgl');
  const errorBox = document.getElementById('shader-error');

  if (!gl) {
    errorBox.textContent = 'WebGL not supported in this browser.';
    errorBox.classList.add('is-visible');
    return;
  }

  function resizeCanvas() {
    const displayWidth = canvas.clientWidth;
    const displayHeight = canvas.clientHeight;
    if (canvas.width !== displayWidth || canvas.height !== displayHeight) {
      canvas.width = displayWidth;
      canvas.height = displayHeight;
    }
    gl.viewport(0, 0, canvas.width, canvas.height);
  }
  window.addEventListener('resize', resizeCanvas);
  resizeCanvas();

  const buffer = gl.createBuffer();
  gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
  gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
    -1, -1,
     1, -1,
    -1,  1,
    -1,  1,
     1, -1,
     1,  1
  ]), gl.STATIC_DRAW);

  let program = null;
  let uniformLocations = {};
  let startTime = performance.now();
  let mouse = [0, 0];

  canvas.addEventListener('mousemove', (e) => {
    const rect = canvas.getBoundingClientRect();
    mouse[0] = e.clientX - rect.left;
    mouse[1] = rect.height - (e.clientY - rect.top);
  });

  const editor = CodeMirror(document.getElementById('shader-editor'), {
    value: defaultFragment,
    mode: 'x-shader/x-fragment',
    theme: 'monokai',
    lineNumbers: true,
    indentUnit: 2,
    tabSize: 2,
    autofocus: true
  });
  editor.setSize('100%', 360);

  const select = document.getElementById('shader-select');
  select.addEventListener('change', () => {
    const key = select.value;
    if (exampleShaders[key]) {
      editor.setValue(exampleShaders[key]);
      buildAndRun();
    }
  });


  function compileShader(type, source) {
    const shader = gl.createShader(type);
    gl.shaderSource(shader, source);
    gl.compileShader(shader);
    if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
      const log = gl.getShaderInfoLog(shader);
      gl.deleteShader(shader);
      throw new Error(log || 'Shader compile error');
    }
    return shader;
  }

  function createProgram(fragmentSource) {
    const vert = compileShader(gl.VERTEX_SHADER, VertexShader);
    const frag = compileShader(gl.FRAGMENT_SHADER, fragmentSource);
    const prog = gl.createProgram();
    gl.attachShader(prog, vert);
    gl.attachShader(prog, frag);
    gl.linkProgram(prog);
    if (!gl.getProgramParameter(prog, gl.LINK_STATUS)) {
      const log = gl.getProgramInfoLog(prog);
      gl.deleteProgram(prog);
      throw new Error(log || 'Program link error');
    }
    gl.deleteShader(vert);
    gl.deleteShader(frag);
    return prog;
  }

  function useProgram(prog) {
    program = prog;
    gl.useProgram(program);
    const position = gl.getAttribLocation(program, 'position');
    gl.enableVertexAttribArray(position);
    gl.vertexAttribPointer(position, 2, gl.FLOAT, false, 0, 0);
    uniformLocations = {
      iResolution: gl.getUniformLocation(program, 'iResolution'),
      iTime: gl.getUniformLocation(program, 'iTime')
    };
  }

  function render() {
    if (!program) return;
    resizeCanvas();
    const current = (performance.now() - startTime) * 0.001;
    gl.clearColor(0.0, 0.0, 0.0, 1.0);
    gl.clear(gl.COLOR_BUFFER_BIT);
    if (uniformLocations.iResolution != null) {
      gl.uniform2f(uniformLocations.iResolution, canvas.width, canvas.height);
    }
    if (uniformLocations.iTime != null) {
      gl.uniform1f(uniformLocations.iTime, current);
    }
    if (uniformLocations.iMouse) {
      gl.uniform2f(uniformLocations.iMouse, mouse[0], mouse[1]);
    }
    gl.drawArrays(gl.TRIANGLES, 0, 6);
    requestAnimationFrame(render);
  }

  function buildAndRun() {
    const src = editor.getValue();
    try {
      const prog = createProgram(src);
      useProgram(prog);
      startTime = performance.now();
      errorBox.textContent = '';
      errorBox.classList.remove('is-visible');
    } catch (err) {
      errorBox.textContent = err.message;
      errorBox.classList.add('is-visible');
      return;
    }
  }

  document.getElementById('run-shader').addEventListener('click', () => {
    buildAndRun();
  });

  document.getElementById('reset-shader').addEventListener('click', () => {
    editor.setValue(defaultFragment);
    startTime = performance.now();
    buildAndRun();
  });

  // Initial compile
  buildAndRun();
  render();
})();
});
</script>
