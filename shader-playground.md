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
  <span class="nav-current">Shader Playground</span> |
  <a href="{{ '/blog/' | relative_url }}">Blog</a>
</p>

<div class="shader-playground">
  <div class="shader-stage">
<canvas id="shader-canvas"></canvas>
<div class="shader-toolbar">
<button id="run-shader">Run Shader</button>
<button id="reset-shader">Reset</button>
<span id="shader-status">Ready</span>
</div>
<div class="shader-error" id="shader-error"></div>
</div>
<div class="shader-editor-container">
<div id="shader-editor"></div>
</div>
</div>
<link crossorigin="anonymous" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/codemirror.min.css" integrity="sha512-vz+RDUtbkHmhFAbq/fYexvjq2vSjg8bf4X0wsW2Ki2+hYgq9UfFN4RjPjFXjVz7qyx5JXAINslVwUCMNndZzZA==" referrerpolicy="no-referrer" rel="stylesheet"/>
<link crossorigin="anonymous" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/theme/monokai.min.css" integrity="sha512-Bl5LDpVzXLLOwDyuhPE/DRx39Bliiyg5ijpX+ytQVJIvT4T+3YtXuvJrEGTQImXuQleYdra7nZBrn1VLrq+p9g==" referrerpolicy="no-referrer" rel="stylesheet"/>
<script crossorigin="anonymous" integrity="sha512-4oY9dpcxODg86T02qRDYhXA8Y8Z8dkD3Ok+x+oVDoTeTsJc+xGgpT1FSToO8O/D6fGiV/1wC/5OFwb1yg/5mEA==" referrerpolicy="no-referrer" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/codemirror.min.js"></script>
<script crossorigin="anonymous" integrity="sha512-0SOXWkYGOQiqtFeEASnt9AZ9X1WxTh7KM9p0NyA4iOzpWhEiYmQAwytjCsspN7GTSo7chIMlR8oP2iXlAOowxw==" referrerpolicy="no-referrer" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.65.16/mode/clike/clike.min.js"></script>
<style>
.shader-playground {
  max-width: 1200px;
  margin: 2rem auto 4rem;
}

.shader-stage {
  position: relative;
  background: #0f172a;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 20px 45px rgba(15, 23, 42, 0.35);
  margin-bottom: 1.5rem;
}

#shader-canvas {
  width: 100%;
  height: 420px;
  display: block;
  background: radial-gradient(circle at center, #1f2937 0%, #0f172a 60%, #020617 100%);
}

.shader-toolbar {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 0.75rem 1rem;
  background: rgba(15, 23, 42, 0.9);
  color: #e2e8f0;
  font-size: 0.95rem;
}

.shader-toolbar button {
  background: linear-gradient(135deg, #3b82f6, #2563eb);
  border: none;
  color: white;
  padding: 0.4rem 0.9rem;
  border-radius: 6px;
  cursor: pointer;
  font-size: 0.9rem;
  transition: transform 0.15s ease, box-shadow 0.15s ease;
}

.shader-toolbar button:hover {
  transform: translateY(-1px);
  box-shadow: 0 8px 18px rgba(37, 99, 235, 0.35);
}

.shader-toolbar button:active {
  transform: translateY(0);
  box-shadow: none;
}

#shader-status {
  margin-left: auto;
  font-style: italic;
  opacity: 0.8;
}

.shader-error {
  min-height: 24px;
  padding: 0.5rem 1rem 0.9rem;
  color: #fca5a5;
  font-family: 'Source Code Pro', monospace;
  font-size: 0.85rem;
  white-space: pre-wrap;
}

.shader-editor-container {
  background: #0f172a;
  border-radius: 12px;
  padding: 0.75rem;
  box-shadow: 0 16px 32px rgba(15, 23, 42, 0.25);
}

.shader-editor-container .CodeMirror {
  height: 420px;
  font-family: 'Source Code Pro', monospace;
  font-size: 0.95rem;
  border-radius: 8px;
}

@media (max-width: 992px) {
  .shader-editor-container .CodeMirror {
    height: 360px;
  }
}

@media (max-width: 768px) {
  #shader-canvas,
  .shader-editor-container .CodeMirror {
    height: 320px;
  }
}
</style>
<script>
(function() {
  const defaultFragment = `// Fragment shader (GLSL)
precision highp float;

uniform vec2 iResolution;
uniform float iTime;

void main() {
  vec2 uv = gl_FragCoord.xy / iResolution.xy;
  uv = uv * 2.0 - 1.0;
  uv.x *= iResolution.x / iResolution.y;

  vec3 color = 0.5 + 0.5 * cos(iTime + vec3(0.0, 2.0, 4.0) + uv.xyx * 3.0);
  gl_FragColor = vec4(color, 1.0);
}`;

  const VertexShader = `attribute vec2 position;
void main() {
  gl_Position = vec4(position, 0.0, 1.0);
}`;

  const canvas = document.getElementById('shader-canvas');
  const gl = canvas.getContext('webgl');
  const statusLabel = document.getElementById('shader-status');
  const errorBox = document.getElementById('shader-error');

  if (!gl) {
    errorBox.textContent = 'WebGL not supported in this browser.';
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
  editor.setSize('100%', 420);

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
      statusLabel.textContent = 'Running';
    } catch (err) {
      errorBox.textContent = err.message;
      statusLabel.textContent = 'Error';
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
</script>
