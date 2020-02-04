#'@export
server <- function(input, output) {

  output$Histogram <- renderPlot({
    mass_size <- input$mass_size + 1000
    meteroites.hist(mass_size)
  })

  output$World <- renderPlot({
    meteroites.world()
  })

  output$Classes <- renderPlot({
    meteroites.plotClass()
  })

  output$Heatmap <- renderPlot({
    meteroites.heatMap()
  })

  output$Class <- renderTable(
    clusterComputation()
  )

}
