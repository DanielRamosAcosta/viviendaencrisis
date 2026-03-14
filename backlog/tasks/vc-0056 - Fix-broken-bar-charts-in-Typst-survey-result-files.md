---
id: VC-0056
title: Fix broken bar charts in Typst survey result files
status: In Progress
assignee: []
created_date: '2026-03-14 18:44'
labels:
  - bug
  - docs
dependencies: []
priority: high
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
Fix all bar charts in two Typst files that use invalid cetz-plot parameters (direction, bar-width, y-max). Replace barchart calls with correct columnchart/barchart API from cetz-plot 0.1.1.
<!-- SECTION:DESCRIPTION:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 All test suite is passing
<!-- DOD:END -->
