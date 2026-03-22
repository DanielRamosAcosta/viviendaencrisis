declare module "rough-viz" {
  interface ChartOpts {
    element: string;
    [key: string]: unknown;
  }

  export class Bar {
    constructor(opts: ChartOpts);
  }
  export class BarH {
    constructor(opts: ChartOpts);
  }
  export class Donut {
    constructor(opts: ChartOpts);
  }
  export class Line {
    constructor(opts: ChartOpts);
  }
  export class Pie {
    constructor(opts: ChartOpts);
  }
  export class Scatter {
    constructor(opts: ChartOpts);
  }
  export class StackedBar {
    constructor(opts: ChartOpts);
  }
}
