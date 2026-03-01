#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1"

#{
  let raw_data = csv("../../data/alquiler-vs-salarios.csv")
  let rows = raw_data.slice(1)

  // Filtrar valores de enero (puntos anuales)
  let yearly = rows.filter(r => r.at(0).ends-with("-01"))

  // Rango 2015–2025
  let filtered = yearly.filter(r => {
    let year = int(r.at(0).slice(0, 4))
    year >= 2015 and year <= 2025
  })

  // Base: enero de 2015
  let base_rent = float(filtered.at(0).at(1))
  let base_salary = float(filtered.at(0).at(2))

  let rent_series = filtered.map(r => {
    let year = int(r.at(0).slice(0, 4))
    let pct = (float(r.at(1)) / base_rent - 1.0) * 100.0
    (year, pct)
  })

  let salary_series = filtered.map(r => {
    let year = int(r.at(0).slice(0, 4))
    let pct = (float(r.at(2)) / base_salary - 1.0) * 100.0
    (year, pct)
  })

  [
    #figure(
      cetz.canvas({
        import cetz-plot: plot

        plot.plot(
          size: (14, 7),
          x-tick-step: 1,
          y-tick-step: 10,
          x-label: [Año],
          y-label: [Variación respecto a enero de 2015 (\%)],
          y-min: -5,
          y-max: 100,
          legend: "inner-north-west",
          {
            plot.add(
              rent_series,
              label: [Precio alquiler (€/m²)],
              style: (stroke: rgb("#c0392b") + 2pt),
            )
            plot.add(
              salary_series,
              label: [Coste salarial ordinario],
              style: (stroke: rgb("#2980b9") + 2pt),
            )
            plot.add-hline(0, style: (stroke: luma(180) + 0.5pt))
          }
        )
      }),
      caption: [Evolución del precio del alquiler frente al coste salarial ordinario (2015--2025), con base enero de 2015 = 0\%. Fuentes: Idealista (alquiler) e INE --- Encuesta Trimestral de Coste Laboral (salarios).],
    ) <fig:alquiler-vs-salarios>
  ]
}
