---
layout: default
title: Writing
permalink: /blog/
---

<!-- Font Awesome and custom styles -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.0/css/all.css">
<link rel="stylesheet" href="{{ '/static/css/custom.css' | relative_url }}">

<!-- JavaScript to inject social links into sidebar -->
<script>
document.addEventListener('DOMContentLoaded', function() {
  const emailParagraph = document.querySelector('header p');
  if (emailParagraph) {
    emailParagraph.style.display = 'none';
  }

  const existingLinks = document.querySelector('.sidebar-social-links');
  if (!existingLinks) {
    const socialLinksHTML = `
      <div class="sidebar-social-links">
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

    const profileImage = document.querySelector('header img');
    if (profileImage) {
      profileImage.insertAdjacentHTML('afterend', socialLinksHTML);
    }
  }
});
</script>

<p align="center">
  <a href="{{ '/' | relative_url }}">Home</a> |
  <a href="{{ '/' | relative_url }}#papers">Selected Papers</a> |
  <a href="{{ '/' | relative_url }}#mentoring">Mentoring</a> |
  <a href="{{ '/' | relative_url }}#projects">Projects</a> |
  <span class="nav-current">Blog</span>
</p>

<h2>Writing & Reflections</h2>

<p>
  I plan to use this space for longer-form notes.
  Posts will show up below as I publish them.
</p>

{% if site.posts and site.posts != empty %}
<ul class="blog-list">
  {% for post in site.posts %}
  <li>
    <span class="blog-post-date">{{ post.date | date: "%b %d, %Y" }}</span>
    <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
    {% if post.excerpt %}
    <p class="blog-post-excerpt">{{ post.excerpt | strip_html | truncate: 180 }}</p>
    {% endif %}
  </li>
  {% endfor %}
</ul>
{% else %}
<div class="blog-empty">
  <p>No posts yet — check back soon!</p>
  <p>
    To add one, create a Markdown file in the <code>_posts</code> directory named like
    <code>YYYY-MM-DD-title.md</code> with front matter:
  </p>
  <pre><code>---
layout: post
title: "My First Post"
---</code></pre>
</div>
{% endif %}
