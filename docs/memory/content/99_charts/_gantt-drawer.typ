#import "@preview/gantty:0.5.1" as gantty
#import gantty: (
  drawers.default-drawer,
  milestones.default-milestones-drawer,
  sidebar.default-sidebar-drawer,
  dividers.default-dividers-drawer,
  task.default-tasks-drawer,
  dependencies.default-dependencies-drawer,
)
#import gantty.header: default-headers-drawer
#import gantty.field: default-field-drawer

#let no-today-drawer = (
  sidebar: default-sidebar-drawer,
  field: default-field-drawer,
  headers: default-headers-drawer,
  dividers: default-dividers-drawer,
  tasks: default-tasks-drawer,
  dependencies: default-dependencies-drawer,
  milestones: default-milestones-drawer.with(today-content: none),
)
