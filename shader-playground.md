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
        <option value="gradient">Animated Gradient</option>
        <option value="sunset">Sunset Horizon</option>
        <option value="waves">Plasma Waves</option>
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
    gradient: `// Animated gradient
precision highp float;

uniform vec2 iResolution;
uniform float iTime;

void main() {
  vec2 uv = gl_FragCoord.xy / iResolution.xy;
  uv = uv * 2.0 - 1.0;
  uv.x *= iResolution.x / iResolution.y;
  vec3 color = 0.5 + 0.5 * cos(iTime + vec3(0.0, 2.0, 4.0) + uv.xyx * 3.0);
  gl_FragColor = vec4(color, 1.0);
}
`,
    sunset: `// Sunset horizon
precision highp float;

uniform vec2 iResolution;
uniform float iTime;

float smoothSun(vec2 uv, float t) {
  vec2 sunPos = vec2(0.0, -0.1 + 0.3 * sin(t * 0.4));
  float d = length(uv - sunPos);
  return smoothstep(0.25, 0.12, d);
}

void main() {
  vec2 uv = gl_FragCoord.xy / iResolution.xy;
  uv = uv * 2.0 - 1.0;
  uv.x *= iResolution.x / iResolution.y;

  float horizon = smoothstep(-0.1, 0.1, uv.y);
  vec3 sky = mix(vec3(0.05, 0.08, 0.18), vec3(0.95, 0.5, 0.2), smoothstep(-0.5, 0.6, uv.y));
  vec3 ocean = mix(vec3(0.04, 0.12, 0.25), vec3(0.1, 0.2, 0.35), smoothstep(-1.0, 0.2, uv.y));
  float sun = smoothSun(uv, iTime);
  vec3 color = mix(ocean, sky, horizon);
  color += vec3(1.0, 0.65, 0.35) * sun;
  color += vec3(0.6, 0.3, 0.1) * sun * smoothstep(0.0, -0.4, uv.y);
  gl_FragColor = vec4(color, 1.0);
}
`,
    waves: `// Plasma waves
precision highp float;

uniform vec2 iResolution;
uniform float iTime;

float plasma(vec2 uv) {
  float p = sin(uv.x * 8.0 + iTime * 2.0);
  p += sin(uv.y * 6.5 - iTime * 1.5);
  p += sin((uv.x + uv.y) * 4.0 + iTime * 1.2);
  return p / 3.0;
}

void main() {
  vec2 uv = gl_FragCoord.xy / iResolution.xy;
  uv = uv * 2.0 - 1.0;
  float p = plasma(uv);
  vec3 color = vec3(0.4 + 0.3 * cos(6.2831 * p + 0.0),
                   0.4 + 0.3 * cos(6.2831 * p + 2.0),
                   0.4 + 0.3 * cos(6.2831 * p + 4.0));
  gl_FragColor = vec4(color, 1.0);
}
`
  };

  const defaultFragment = exampleShaders.gradient;

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
