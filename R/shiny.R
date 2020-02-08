#run the shiny app
#'@title
#'meteroitesGUI
#'@description
#'A function to run the meteroites2 shiny application. It allows to analyse and visualize the meteroites data.
#'The shiny application contains the \code{\link{clusterComputation}}, \code{\link{meteroites.plotClass}},
#'\code{\link{meteroites.heatMap}}, \code{\link{meteroites.world}} and \code{\link{meteroites.hist}} function.
#'@usage
#'meteroitesGUI()
#'@export
meteroitesGUI <- function(){
  dir <- system.file("shiny/meteroitesGUI", package = "meteroites2")
  shiny::runApp(dir, display.mode = "normal", launch.browser = T)
}
