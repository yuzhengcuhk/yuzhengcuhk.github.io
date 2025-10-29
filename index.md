---
layout: default
title: Yash Patel
---

<p align="center">
  <span class="nav-current">Home</span> | <a href="#papers">Selected Papers</a> | <a href="#mentoring">Mentoring</a> | <a href="#projects">Projects</a> | <a href="{{ '/blog/' | relative_url }}">Blog</a>
</p>

Hi! I'm an incoming research engineer at <a href="https://harmonic.fun/">Harmonic</a> with significant coding experience in <b>C++, Python/PyTorch, OpenGL/GLSL, OpenCL, and Unity</b> and research experience in <b>uncertainty quantification, robust/convex optimization, rare-event detection, control theory, and PDE surrogate modeling</b>. I am most excited about using ML for accelerating scientific discovery. 

<div class="timeline-section">
  <div class="timeline">
    <div class="timeline-item">
      <div class="timeline-logo">
        <img src="{{ '/static/images/timeline/harmonic.png' | relative_url }}" alt="Harmonic logo" loading="lazy">
      </div>
      <div class="timeline-content">
        <div class="timeline-heading">
          <span class="timeline-organization">Harmonic</span>
          <span class="timeline-duration"><strong>Jan 2026 – Present</strong></span>
        </div>
        <p class="timeline-role">Research Engineer</p>
      </div>
    </div>
    <div class="timeline-item">
      <div class="timeline-logo">
        <img src="{{ '/static/images/timeline/university-of-michigan.png' | relative_url }}" alt="University of Michigan logo" loading="lazy">
      </div>
      <div class="timeline-content">
        <div class="timeline-heading">
          <span class="timeline-organization">University of Michigan</span>
          <span class="timeline-duration"><strong>Sep 2021 – Dec 2025</strong></span>
        </div>
        <p class="timeline-role">PhD in Statistics &middot; <a class="timeline-mentor" href="https://ambujtewari.github.io/" target="_blank" rel="noopener">Ambuj Tewari</a></p>
        <p class="timeline-description">
          My research focuses during my PhD were on <a href="#uq_methods">principled uncertainty quantification</a>, <a href="#robust_decision_making">robust decision-making</a>, and <a href="#ai_for_science">AI for Science</a>. Given the importance of uncertainty in evaluating scientific hypotheses, my initial work primarily centered around one core question:

          <i>
          How can we design principled uncertainty estimates for black-box models and use such uncertainty optimally for decision-making?
          </i>
        </p>
        <div class="timeline-subitems">
          <div class="timeline-subitem">
            <div class="timeline-subitem-logo">
              <img src="{{ '/static/images/timeline/anthropic.png' | relative_url }}" alt="Anthropic logo" loading="lazy">
            </div>
            <div class="timeline-subitem-content">
              <div class="timeline-subitem-heading">
                <span class="timeline-subitem-organization">Anthropic</span>
                <span class="timeline-subitem-duration">Nov 2025 – Present</span>
              </div>
              <p class="timeline-subitem-role">AI Safety Fellow</p>
            </div>
          </div>
          <div class="timeline-subitem">
            <div class="timeline-subitem-logo">
              <img src="{{ '/static/images/timeline/waymo.png' | relative_url }}" alt="Waymo logo" loading="lazy">
            </div>
            <div class="timeline-subitem-content">
              <div class="timeline-subitem-heading">
                <span class="timeline-subitem-organization">Waymo</span>
                <span class="timeline-subitem-duration">Jun 2025 – Sep 2025</span>
              </div>
              <p class="timeline-subitem-role">Data Science PhD Intern, Simulations &middot; <a class="timeline-mentor" href="https://amansinha.com/" target="_blank" rel="noopener">Aman Sinha</a></p>
              <p class="timeline-subitem-note">
                Implemented an ADMM-based distributed convex optimization algorithm in C++ for importance sampling of rare events to achieve a 20x speedup in the simulations pipeline.
              </p>
            </div>
          </div>
          <div class="timeline-subitem">
            <div class="timeline-subitem-logo">
              <img src="{{ '/static/images/timeline/bose.png' | relative_url }}" alt="Bose logo" loading="lazy">
            </div>
            <div class="timeline-subitem-content">
              <div class="timeline-subitem-heading">
                <span class="timeline-subitem-organization">Bose</span>
                <span class="timeline-subitem-duration">Jan 2025 – Jun 2025</span>
              </div>
              <p class="timeline-subitem-role">Machine Learning Research Co-op &middot; <a class="timeline-mentor" href="https://scholar.google.com/citations?user=wkPH71QAAAAJ&hl=en" target="_blank" rel="noopener">Russell Izadi</a>, <a class="timeline-mentor" href="https://zangsir.github.io/" target="_blank" rel="noopener">Shuo Zhang</a></p>
              <p class="timeline-subitem-note">
                Implemented SAC and PPO methods for adaptive-FIR noise cancellation (PyTorch). Developed novel transformer-based approach for Wiener filter adaptation that outperforms FxLMS (10% dB reduction). Performed linear system identification and analyzed transfer functions to assess ML filtering.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="timeline-item">
      <div class="timeline-logo">
        <img src="{{ '/static/images/timeline/meta.png' | relative_url }}" alt="Meta logo" loading="lazy">
      </div>
      <div class="timeline-content">
        <div class="timeline-heading">
          <span class="timeline-organization">Meta</span>
          <span class="timeline-duration"><strong>Jul 2018 – Sep 2021</strong></span>
        </div>
        <p class="timeline-role">Senior Software Engineer (IC5) &middot; <a class="timeline-mentor" href="https://scholar.google.com/citations?user=hGJS1NkAAAAJ&hl=en" target="_blank" rel="noopener">Albert Parra Pozo</a></p>
        <p class="timeline-description">
          At Facebook, I worked on a number of projects, generally in 3D rendering and reconstruction. Some highlights:
          <ul class="timeline-description-list">
            <li>Designed and implemented novel real-time (72 FPS) novel dynamic object reconstruction algorithm for 300k+ vertex meshes in Unity HLSL/C# based on linear-blend skinning (LBS)</li>
            <li>Implemented real-time (72 FPS) point cloud, dense mesh, and TSDFs (KinectFusion) scene reconstruction & rendering on HMDs & lenticular displays with C++/OpenGL/GLES/OpenCL.</li>
            <li>Implemented deep learning model (PyTorch) and optimized via Qualcomm SNPE & QAT to run at 30 FPS on Qualcomm SoC for Portal platforms. Added translation support for quantized nodes in PyTorch-JIT to Caffe2.</li>
            <li>Added distributed rendering with Docker, RabbitMQ, and Kubernetes to <a href="https://github.com/facebook/facebook360_dep">Manifold</a> camera (<a href="https://github.com/facebook/facebook360_dep/tree/main" target="_blank" rel="noopener">code</a>). Reduced depth estimation time by 30%.</li>
          </ul>
        </p>
      </div>
    </div>
    <div class="timeline-item">
      <div class="timeline-logo">
        <img src="{{ '/static/images/timeline/princeton.png' | relative_url }}" alt="Princeton University / Hyperloop logo" loading="lazy">
      </div>
      <div class="timeline-content">
        <div class="timeline-heading">
          <span class="timeline-organization">Princeton University</span>
          <span class="timeline-duration"><strong>Sep 2014 – May 2018</strong></span>
        </div>
        <p class="timeline-role">A.B. in Mathematics &middot; <a class="timeline-mentor" href="https://www.cs.princeton.edu/~smattw/" target="_blank" rel="noopener">Matt Weinberg</a><br>
        Certificates in Applications of Computing, Statistics &amp; ML</p>
        <p class="timeline-description">
          My interests over undergrad meandered through many areas. Some highlights:
          <ul class="timeline-description-list">
            <li>HyperLoop Pod Design [<a href="http://yashpatel5400.github.io/files/hyperloop.pdf">Project Report</a>]</li> 
            <i>Princeton University Project Founder & Lead, 2015-2017</i><br> 
            <i>2x Top 30 Team, International SpaceX HyperLoop Pod Design Competition</i><br>

            <li>Deanonymizing Bitcoin Transactions: An Investigative Study On Large-scale Graph Clustering [<a href="http://yashpatel5400.github.io/files/deanonymization.pdf">Project Report</a>]</li>
            <i>Princeton University Senior Thesis, 2018</i><br> 

            <li>Tesla Autopilot Analysis [<a href="http://yashpatel5400.github.io/files/tesla.pdf">Project Report</a>] </li>
            <li>Neural Branch Predictor [<a href="https://yashpatel5400.github.io/neuropath/">Website</a>] [<a href="https://github.com/yashpatel5400/neuropath/">Code</a>] </li>            
          </ul>
        </p>
        <div class="timeline-subitems">
          <div class="timeline-subitem">
            <div class="timeline-subitem-logo">
              <img src="{{ '/static/images/timeline/polymarket.png' | relative_url }}" alt="Polymarket logo" loading="lazy">
            </div>
            <div class="timeline-subitem-content">
              <div class="timeline-subitem-heading">
                <span class="timeline-subitem-organization">Polymarket</span>
                <span class="timeline-subitem-duration">Jan 2018 – Jun 2018</span>
              </div>
              <p class="timeline-subitem-role">Early-Stage Developer &middot; <a class="timeline-mentor" href="https://en.wikipedia.org/wiki/Shayne_Coplan" target="_blank" rel="noopener">Shayne Coplan</a></p>
              <p class="timeline-subitem-note">
                Worked on core pre-ICO development, integrating Bancor protocol liquidity and exchanges with the primary TokenDAO in Solidity (Truffle.js, testrpc, geth).
              </p>
            </div>
          </div>
          <div class="timeline-subitem">
            <div class="timeline-subitem-logo">
              <img src="{{ '/static/images/timeline/amazon.png' | relative_url }}" alt="Amazon logo" loading="lazy">
            </div>
            <div class="timeline-subitem-content">
              <div class="timeline-subitem-heading">
                <span class="timeline-subitem-organization">Amazon</span>
                <span class="timeline-subitem-duration">Jun 2017 – Aug 2017</span>
              </div>
              <p class="timeline-subitem-role">Software Engineering Intern</p>
              <p class="timeline-subitem-note">
                Built Java Spring MVC debugging service for Kiva Picking Optimization team. Deployed globally via AWS (EC2, S3, SNS).
              </p>
            </div>
          </div>
          <div class="timeline-subitem">
            <div class="timeline-subitem-logo">
              <img src="{{ '/static/images/timeline/openloop.png' | relative_url }}" alt="OpenLoop coalition logo" loading="lazy">
            </div>
            <div class="timeline-subitem-content">
              <div class="timeline-subitem-heading">
                <span class="timeline-subitem-organization">OpenLoop</span>
                <span class="timeline-subitem-duration">Jan 2015 – May 2016</span>
              </div>
              <p class="timeline-subitem-role">Co-founder & Princeton University Lead</p>
              <p class="timeline-subitem-note">
                Co-founded a coalition of six top universities (<a href="https://www.linkedin.com/company/openloop/about/" target="_blank" rel="noopener">OpenLoop</a>), raised &gt;$150,000, and built an 18&nbsp;ft functional pod selected as one of 30 teams in the International SpaceX HyperLoop Pod Design Competition (<a href="{{ '/static/images/openloop.png' | relative_url }}" target="_blank" rel="noopener">Pod</a>).
              </p>
            </div>
          </div>
          <div class="timeline-subitem">
            <div class="timeline-subitem-logo">
              <img src="{{ '/static/images/timeline/columbia.png' | relative_url }}" alt="Columbia University logo" loading="lazy">
            </div>
            <div class="timeline-subitem-content">
              <div class="timeline-subitem-heading">
                <span class="timeline-subitem-organization">Columbia University</span>
                <span class="timeline-subitem-duration">May 2015 – Aug 2015</span>
              </div>
              <p class="timeline-subitem-role">Research Intern &middot; <a class="timeline-mentor" href="https://abdulforsenate.com/" target="_blank" rel="noopener">Abdulrahmen El-Sayed</a></p>
              <p class="timeline-subitem-note">
                Developed and simulated agent-based models of self-efficacy dynamics for sexual minority populations enrolled in exercise coach programs (<a href="https://github.com/yashpatel5400/SexualEqualityABM" target="_blank" rel="noopener">code</a>).
              </p>
            </div>
          </div>
          <div class="timeline-subitem">
            <div class="timeline-subitem-logo">
              <img src="{{ '/static/images/timeline/pppl.png' | relative_url }}" alt="Princeton Plasma Physics Lab logo" loading="lazy">
            </div>
            <div class="timeline-subitem-content">
              <div class="timeline-subitem-heading">
                <span class="timeline-subitem-organization">Princeton Plasma Physics Lab</span>
                <span class="timeline-subitem-duration">Jun 2013 – Mar 2014</span>
              </div>
              <p class="timeline-subitem-role">Research Intern &middot; <a class="timeline-mentor" href="https://www.princeton.edu/~idodin/" target="_blank" rel="noopener">Ilya Dodin</a></p>
              <p class="timeline-subitem-note">
                Developed FDTD numerical simulations in C++/Python of the Vlasov equation (<a href="https://arxiv.org/abs/1006.3717" target="_blank" rel="noopener">reference</a>) to study plasma evolution (<a href="https://yashpatel5400.github.io/files/cos.mp4" target="_blank" rel="noopener">video</a>).
              </p>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>

<h2 align="center" id="papers">
  Selected Papers
</h2>

* * *

My work has largely focused on developing methods with end-to-end statistical guarantees to create <b>reliable machine learning systems</b> and layering robust decision-making on top of such uncertainty estimates, especially for scientific applications. My projects largely split into three headings: <b>uncertainty quantification methodology</b>, <b>robust decision-making</b>, and <b>AI for Science</b>.

<h3 align="left" id="uq_methods">
  Uncertainty Quantification Methodology
</h3>

<b><u>Conformal Prediction for Ensembles: Improving Efficiency via Score-Based Aggregation</u></b><br>
<i>Neural Information Processing Systems (NeurIPS), 2025</i><br>
Rivera, E.O.\*, <b>Patel, Y.*</b> (\* equal contribution), Tewari, A.<br>
[<a href="https://arxiv.org/abs/2405.16246">Paper</a>] [<a href="https://github.com/yashpatel5400/fusioncp">GitHub</a>] <br>

<b><u>Variational Inference with Coverage Guarantees in Simulation-Based Inference</u></b><br>
<i>International Conference on Machine Learning (ICML), 2024</i><br>
<b>Patel, Y.</b>, McNamara, D., Loper, J., Regier, J., Tewari, A.<br>
[<a href="https://proceedings.mlr.press/v235/patel24a.html">Paper</a>] [<a href="https://github.com/yashpatel5400/canvi">GitHub</a>] <br>

<h3 align="left" id="robust_decision_making">
  Robust Decision-Making
</h3>

<b><u>Conformal Contextual Robust Optimization</u></b><br>
<i>International Conference on Artificial Intelligence and Statistics (AISTATS), 2024 (<b>Oral</b>)</i><br>
<b>Patel, Y.</b>, Rayan, S., Tewari, A.<br>
[<a href="https://proceedings.mlr.press/v238/patel24a.html">Paper</a>] [<a href="https://github.com/yashpatel5400/csi">GitHub</a>] <br>

<b><u>Conformal Robust Control of Linear Systems</u></b><br>
<i>In Submission</i><br>
<b>Patel, Y.</b>, Rayan, S., Tewari, A.<br>
[<a href="https://arxiv.org/abs/2405.16250">Paper</a>] [<a href="https://github.com/yashpatel5400/crc">GitHub</a>] <br>

<b><u>Non-Parameteric Conformal Distributionally Robust Optimization</u></b><br>
<i>ICML Workshop on Structured Probabilistic Inference & Generative Modeling, 2024</i><br>
<b>Patel, Y.</b>, Cao, G., Tewari, A.<br>
[<a href="https://openreview.net/pdf?id=WavglEUVTR">Workshop Paper</a>] <br>

<h3 align="left" id="ai_for_science">
  AI for Science
</h3>

<b><u>Continuum Transformers Perform In-Context Learning by Operator Gradient Descent</u></b><br>
<i>Neural Information Processing Systems (NeurIPS), 2025</i><br>
<i>ICLR AI for Accelerated Materials Design Workshop, 2025</i><br>
<b>Patel, Y.*</b>, Mishra, A.\* (\* equal contribution), Tewari, A.<br>
[<a href="https://arxiv.org/pdf/2505.17838">Paper</a>] [<a href="https://github.com/yashpatel5400/opicl">GitHub</a>] <br>

<b><u>Operator Learning for Schrödinger Equation: Unitarity, Error Bounds, and Time Generalization</u></b><br>
<i>In Submission</i><br>
<b>Patel, Y.*</b>, Subedi, U.\* (\* equal contribution), Tewari, A.<br>
[<a href="https://arxiv.org/abs/2505.18288">Paper</a>] [<a href="https://github.com/yashpatel5400/schrodinger_op">GitHub</a>] <br>

<b><u>A Greedy PDE Router for Blending Neural Operators and Classical Methods</u></b><br>
<i>In Submission</i><br>
Rayan, S., <b>Patel, Y.</b>, Tewari, A.<br>
[<a href="https://arxiv.org/abs/2509.24814">Paper</a>] [<a href="https://github.com/srayan00/greedy-hybrid-pde">GitHub</a>] <br>

<b><u>Diffusion Models for Probabilistic Deconvolution of Galaxy Images</u></b><br>
<i>ICML Machine Learning for Astrophysics Workshop, 2023</i><br>
Li, Y., Xue, Z., <b>Patel, Y.</b>, Regier, J.<br>
[<a href="https://ml4astro.github.io/icml2023/assets/37.pdf">Workshop Paper</a>] [<a href="https://github.com/yashpatel5400/galgen">GitHub</a>] <br>

<b><u>RL Boltzmann Generators for Conformer Generation in Data-Sparse Environments</u></b><br>
<i>NeurIPS Machine Learning in Structural Biology (MLSB) Workshop, 2022</i><br>
<b>Patel, Y.</b>, Tewari, A.<br>
[<a href="https://www.mlsb.io/papers_2022/RL_Boltzmann_Generators_for_Conformer_Generation_in_Data_Sparse_Environments.pdf">Workshop Paper</a>] [<a href="https://github.com/yashpatel5400/clean_idp_rl">GitHub</a>] <br>

<b><u>Scalable Bayesian Inference for Finding Strong Gravitational Lenses</u></b><br>
<i>NeurIPS Machine Learning and the Physical Sciences Workshop, 2022</i><br>
<b>Patel, Y.</b>, Regier, J.<br>
[<a href="https://ml4physicalsciences.github.io/2022/files/NeurIPS_ML4PS_2022_155.pdf">Workshop Paper</a>] [<a href="https://github.com/prob-ml/bliss">GitHub</a>] <br>

<h3 align="left" id="ai_for_science">
  Patents
</h3>

<b><u>Holographic Calling for Artificial Reality</u></b><br>
<i>US Patent App. 17/360,693</i><br>
AP Pozo, J Virskus, G Venkatesh, K Li, SC Chen, A Kumar, R Ranjan, BK Cabral, SA Johnson, W Ye, MA Snower, <b>Y Patel</b>.<br>
[<a href="https://patents.google.com/patent/US20220413433A1/en">Patent</a>] <br>

---

<h2 align="center" id="mentoring">
  Mentoring
</h2>

During my PhD, I have also had the opportunity to mentor the following fantastic undergraduate and master's students on their theses and research projects.

<b>[Guyang (Kevin) Cao](https://www.linkedin.com/in/guyang-kevin-cao-410b28205/)</b> (<b><u>Next step:</u></b> Ph.D. in Computer Science at University of Wisconsin-Madison)<br>
<i>[Honors Thesis](https://www.ambujtewari.com/theses/Kevin_Cao_Undergraduate_Thesis_2024.pdf), 2023-24</i><br> 
<i>Undergraduate Research Program in Statistics, 2023</i><br> 
[Non-parametric Conformal Distributionally Robust Optimization](https://openreview.net/pdf?id=WavglEUVTR)<br>

<b>[Zhiwei Xue](https://www.linkedin.com/in/zhiwei-xue-280b84256/)</b> (<b><u>Next step:</u></b> Ph.D. in Computer Science at National University of Singapore)<br>
<i>Undergraduate Research Program in Statistics, 2023</i><br> 
[Diffusion Models for Probabilistic Deconvolution of Galaxy Images](https://arxiv.org/pdf/2307.11122)<br>

<b>[Yuhang Li](https://www.linkedin.com/in/yuhang-li-/)</b> (<b><u>Next step:</u></b> Master's in Computer Science at University of Illinois, Urbana-Champaigna)<br>
<i>Undergraduate Research Program in Statistics, 2023</i><br> 
[Diffusion Models for Probabilistic Deconvolution of Galaxy Images](https://arxiv.org/pdf/2307.11122)<br>

<b>[Zhong Zheng](https://www.linkedin.com/in/zhongzheng1999/)</b> (<b><u>Next step:</u></b> Master's in Computational Data Science at Carnegie Mellon University)<br>
<i>Undergraduate Research Program in Statistics, 2023</i><br> 
Atomic Maps Reconstruction for Cryo-EM Data with Continuous Heterogeneity<br>

* * *

<h2 align="center" id="projects">
  Highlighted Projects
</h2>

Outside of my formal research projects, I still enjoy spinning up miscellaneous coding projects. Here are some highlights.

<b><u>Intertect: Learn Computer Architecture</u></b> <br>
[<a href="https://yashpatel5400.github.io/intertect/">Website</a>] [<a href="https://github.com/yashpatel5400/intertect">GitHub</a>] <br>

<b><u>Multiple Importance Sampling in Light Transport</u></b> <br>
<i>University of Michigan Project, 2021</i><br> 
[<a href="http://yashpatel5400.github.io/files/light_transport_mis.pdf">Project Report</a>] [<a href="https://github.com/yashpatel5400/raytrace-montecarlo">GitHub</a>] <br>

<b><u>Chainlink Price Aggregation for Agoric</u></b> <br>
<i>Gitcoin Bounty Project, 2021</i><br> 
[<a href="https://github.com/yashpatel5400/agoric-sdk/commit/99fe4a4da207372cd70a6ec291dc36002974484f">GitHub</a>] <br>

* * *

<h2 align="center" id="projects">
  Miscellaneous
</h2>

Outside of research and programming, I really enjoy [reading](https://www.goodreads.com/user/show/83094203-yash-patel), <a href="{{ '/blog/' | relative_url }}">writing</a>, and lifting! Here are my current numbers (and slightly outdated videos):

<div class="lifting-stats">
  <div class="lift-card">
    <a class="lift-link" href="https://drive.google.com/file/d/1MW1FPgOHLkocXe7WWg0xKQ-sfgv1J--M/view?usp=drive_link" target="_blank" rel="noopener">
      <div class="lift-circle">
        <img src="{{ '/static/images/timeline/bench.png' | relative_url }}" alt="Bench press icon">
        <span class="lift-number">230</span>
      </div>
      <div class="lift-label">Bench</div>
    </a>
  </div>
  <div class="lift-card">
    <a class="lift-link" href="https://drive.google.com/file/d/12F486JD9CegwHDFYiVF3EKkUhkD06clw/view?usp=drive_link" target="_blank" rel="noopener">
      <div class="lift-circle">
        <img src="{{ '/static/images/timeline/squat.png' | relative_url }}" alt="Squat icon">
        <span class="lift-number">330</span>
      </div>
      <div class="lift-label">Squat</div>
    </a>
  </div>
  <div class="lift-card">
    <a class="lift-link" href="https://drive.google.com/file/d/1SmRCJTjZZL7kgcg5ELpkQqovh_yXwEI2/view?usp=drive_link" target="_blank" rel="noopener">
      <div class="lift-circle">
        <img src="{{ '/static/images/timeline/deadlift.png' | relative_url }}" alt="Deadlift icon">
        <span class="lift-number">515</span>
      </div>
      <div class="lift-label">Deadlift</div>
    </a>
  </div>
</div>
