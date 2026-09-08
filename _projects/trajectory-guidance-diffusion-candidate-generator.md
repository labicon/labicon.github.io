---
layout: active_project
title: Trajectory Guidance using Diffusion as a Candidate Generator
project_id: 1
active_project: true
status: Active
faculty_lead: Negar Mehr
student_lead: Ethan
contributors:
  - Hamsa
  - Bhargav
research_area: Learning for Control
last_confirmed: 2026-08-28
---

This project focuses on using a diffusion model as a candidate generator to produce many different possible solutions. Then, with a learned model, we can evaluate those possible solutions to select the best option. This will also give us something to use to guide the diffusion model post-denoising, meaning that we will be able to use off-the-shelf diffusion models and provide safer trajectories without retraining the diffusion model itself. We also hope to extend this approach to the multi-agent setting.
