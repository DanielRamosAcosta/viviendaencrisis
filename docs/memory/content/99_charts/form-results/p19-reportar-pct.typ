#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "_helpers.typ": *

#{
  let rows = load-rows()
  let n = rows.len()
  let raw = count-single(rows, 19)
  let raw = shorten-labels(raw, (
    "Depende de las garantías": "Depende de las garantías",
  ))
  let data = raw.map(item => (item.at(0), calc.round(item.at(1) / n * 100, digits: 1)))

  [
    #figure(
      {
        cetz.canvas({
          chart.piechart(
            radius: 3,
            slice-style: sem-3,
            label-key: 0,
            value-key: 1,
            data,
          )
        })
      },
      caption: [Disposición a reportar pisos turísticos ilegales de forma anónima (P19). N = 40.],
    ) <fig:disposicion-reportar>
  ]
}
