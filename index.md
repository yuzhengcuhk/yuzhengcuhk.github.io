---
layout: default
title: Yash Patel
---

<!-- Font Awesome for social icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Alternative Font Awesome CDN -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.0/css/all.css">

<!-- Custom CSS for social links styling -->
<link rel="stylesheet" href="/css/custom.css">

<!-- JavaScript to inject social links into sidebar -->
<script>
document.addEventListener('DOMContentLoaded', function() {
  // Hide the email text
  const emailParagraph = document.querySelector('header p');
  if (emailParagraph) {
    emailParagraph.style.display = 'none';
  }
  
  // Create social links HTML
  const socialLinksHTML = `
    <div class="sidebar-social-links">
      <h3><u>Profiles</u></h3>
      <ul>
        <li>
          <a href="mailto:yppatel@umich.edu">
            <i class="fa-solid fa-envelope"></i>
            <span>Email</span>
          </a>
        </li>
        <li>
          <a href="https://github.com/yashpatel5400">
            <i class="fa-brands fa-github"></i>
            <span>GitHub</span>
          </a>
        </li>
        <li>
          <a href="https://www.linkedin.com/in/yash-patel-297b87a1/">
            <i class="fa-brands fa-linkedin"></i>
            <span>LinkedIn</span>
          </a>
        </li>
        <li>
          <a href="https://x.com/YashPat90148435">
            <i class="fa-brands fa-twitter"></i>
            <span>X (Twitter)</span>
          </a>
        </li>
        <li>
          <a href="https://scholar.google.com/citations?user=_BQwMtgAAAAJ&hl=en">
            <i class="fa-solid fa-graduation-cap"></i>
            <span>Google Scholar</span>
          </a>
        </li>
        <li>
          <a href="/files/CV.pdf">
            <i class="fa-solid fa-file-lines"></i>
            <span>CV</span>
          </a>
        </li>
      </ul>
    </div>
  `;
  
  // Insert social links after the profile image
  const profileImage = document.querySelector('header img');
  if (profileImage) {
    profileImage.insertAdjacentHTML('afterend', socialLinksHTML);
  }
  
  // Debug: Check if Font Awesome is loaded
  console.log('Font Awesome loaded:', typeof FontAwesome !== 'undefined');
  
  // Debug: Check if icons are visible
  setTimeout(() => {
    const icons = document.querySelectorAll('.sidebar-social-links i');
    console.log('Found icons:', icons.length);
    icons.forEach((icon, index) => {
      console.log(`Icon ${index}:`, icon.className, icon.offsetWidth, icon.offsetHeight);
    });
  }, 1000);
});
</script>



<p align="center">
  <a href="#papers">Selected Papers</a> | <a href="#mentoring">Mentoring</a> | <a href="#projects">Projects</a> | <a href="https://scholar.google.com/citations?user=_BQwMtgAAAAJ&hl=en">Google Scholar</a> | <a href="https://github.com/yashpatel5400">GitHub</a>
</p>



Hi! I'm a 5th year PhD student in Statistics at the University of Michigan, where I focus on <b>uncertainty quantification</b>, <b>robust decision-making</b>, and <b>AI for Science</b>, advised by [Ambuj Tewari](https://ambujtewari.github.io/). I have significant prior experience with <b>C++, Python/PyTorch, OpenGL/GLSL, OpenCL, and Unity</b>. My research interest centers around one core question:

<i>
How can we design principled uncertainty estimates for black-box models and use such uncertainty optimally for decision-making?
</i>

During my PhD, I have interned at [Waymo](https://waymo.com/) under [Aman Sinha](https://amansinha.com/) on <b>distributed convex optimization</b> for optimal importance sampling of rare events and at [Bose](https://www.bose.com/home) under [Shuo Zhang](https://zangsir.github.io/about/) and [Russell Izadi](https://russellizadi.github.io/) on <b>reinforcement learning</b> for adaptive noise cancellation. 

Prior to my PhD, I was a <b>senior software engineer (IC5) at Meta</b> from 2018-2021, where I worked on computer vision and graphics for realtime dense [3D reconstruction](https://bkcabralwebsite.appspot.com/An-Integrated-6DoF-Video-Camera-and-System-Design.pdf) (point clouds/KinectFusion) and dynamic real-time disocclusion on meshes. I also implemented, trained, and optimized (with layer fusion, SNPE, and QAT quantization) an end-to-end deep learning-based feature for Portal to run at realtime on the Snapdragon SoC. 

Before working at Meta, I graduated as a <b>math major from Princeton</b> in 2018 with certificates in CS and Statistics/ML, where my senior thesis focused on adversarial behaviors on blockchain networks and was advised by [Matt Weinberg](https://www.cs.princeton.edu/~smattw/). See my full resume [here](http://yashpatel5400.github.io/files/CV.pdf).

<h2 align="center" id="papers">
  Selected Papers
</h2>

* * *

My work has largely focused on developing methods with end-to-end statistical guarantees to create <b>reliable machine learning systems</b> and layering robust decision-making on top of such uncertainty estimates, especially for scientific applications. My projects largely split into three headings: <b>uncertainty quantification methodology</b>, <b>robust decision-making</b>, and <b>AI for Science</b>.

<h3 align="left" id="uq_methods">
  Uncertainty Quantification Methodology
</h3>

<b><u>Conformal Prediction for Ensembles: Improving Efficiency via Score-Based Aggregation</u></b><br>
<i>NeurIPS 2025</i><br>
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

Outside of my formal research projects, I have worked on a wide spread of projects, spanning <b>multi-armed bandits</b>, <b>computational fluid dynamics</b>, and <b>importance sampling for rendering</b>. Here are some highlights.

<b><u>Multiple Importance Sampling in Light Transport</u></b> <br>
<i>University of Michigan Project, 2021</i><br> 
[<a href="http://yashpatel5400.github.io/files/light_transport_mis.pdf">Project Report</a>] [<a href="https://github.com/yashpatel5400/raytrace-montecarlo">GitHub</a>] <br>

<b><u>HyperLoop Pod Design</u></b> <br>
<i>Princeton University Project Founder & Lead, 2015-2017</i><br> 
<i>2x Top 30 Team, International SpaceX HyperLoop Pod Design Competition</i><br>
[<a href="http://yashpatel5400.github.io/files/hyperloop.pdf">Project Report</a>] <br>

<b><u>Tesla Autopilot Analysis</u></b> <br>
<i>Princeton University Project, 2016</i><br> 
[<a href="http://yashpatel5400.github.io/files/tesla.pdf">Project Report</a>] <br>

<b><u>Deanonymizing Bitcoin Transactions: An Investigative Study On Large-scale Graph Clustering</u></b><br>
<i>Princeton University Senior Thesis, 2018</i><br> 
[<a href="http://yashpatel5400.github.io/files/deanonymization.pdf">Project Report</a>] <br>

* * *

<h2 align="center" id="projects">
  Miscellaneous
</h2>

Outside of research, I really enjoy lifting and [reading](https://www.goodreads.com/user/show/83094203-yash-patel). If you want to contact me, please reach out at yppatel [at] umich.edu!
