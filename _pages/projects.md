---
layout: default
permalink: /projects/
title: projects
description: Current research projects from the Berkeley Intelligent Control Lab.
nav: true
nav_order: 4
---

<div class="projects active-projects">
  <header class="post-header">
    <h1 class="post-title">Active projects</h1>
    <p class="post-description">Current research led by members of the Berkeley Intelligent Control Lab.</p>
  </header>

  {% assign active_projects = site.projects | where: "active_project", true | sort: "project_id" %}
  <div class="row row-cols-1 row-cols-md-2 active-project-grid">
    {% for project in active_projects %}
      <div class="col mb-4">
        <a class="active-project-link" href="{{ project.url | relative_url }}">
          <article class="card hoverable h-100 active-project-card">
            <div class="card-body">
              <p class="project-area">{{ project.research_area }}</p>
              <h2 class="card-title">{{ project.title }}</h2>
              <p class="card-text">{{ project.content | strip_html | normalize_whitespace | truncatewords: 38 }}</p>
              <p class="project-lead"><strong>Student lead:</strong> {{ project.student_lead }}</p>
            </div>
          </article>
        </a>
      </div>
    {% endfor %}
  </div>
</div>
