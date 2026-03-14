---
id: VC-0056
title: Fix broken bar charts in Typst survey result files
status: In Review
assignee: []
created_date: '2026-03-14 18:44'
updated_date: '2026-03-14 18:46'
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

## Final Summary

<!-- SECTION:FINAL_SUMMARY:BEGIN -->
Fixed all 16 broken bar chart calls across two Typst files. Removed invalid parameters (direction: ttb, bar-width, y-max) and replaced with correct cetz-plot 0.1.1 API. Charts with 5 or fewer items use chart.columnchart (vertical, size: (auto, 6)); charts with 6+ items use chart.barchart (horizontal, size: (10, auto)). Compilation passes cleanly.
<!-- SECTION:FINAL_SUMMARY:END -->
