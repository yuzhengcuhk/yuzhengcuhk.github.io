---
layout: default
title: Writing
permalink: /blog/
---

<p align="center">
  <a href="{{ '/' | relative_url }}">Home</a> |
  <a href="{{ '/' | relative_url }}#papers">Selected Papers</a> |
  <a href="{{ '/' | relative_url }}#mentoring">Mentoring</a> |
  <a href="{{ '/' | relative_url }}#projects">Projects</a> |
  <span class="nav-current">Blog</span>
</p>

<h2>{{ page.page_heading | default: "Writing" }}</h2>

{% assign sorted_posts = site.posts | sort: 'date' | reverse %}
{% assign posts_by_year = sorted_posts | group_by_exp: "post", "post.date | date: '%Y'" %}
{% if posts_by_year and posts_by_year != empty %}
  <ul class="blog-archive">
    {% assign sorted_posts = site.posts | sort: 'date' | reverse %}
    {% for post in sorted_posts %}
    <li>
      <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
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
