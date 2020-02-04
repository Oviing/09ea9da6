#run the shiny app
#'@title
#'meteroitesGUI
#'@description
#'A function to run the shiny App
#'@usage
#'meteroitesGUI()
#'@export
meteroitesGUI <- function(){
  dir <- system.file("shiny/meteroitesGUI", package = "meteroites2")
  shiny::runApp(dir, display.mode = "normal", launch.browser = T)
}
