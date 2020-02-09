#Histogram of the mass
#'@title meteroites.hist
#'@description
#'\code{meteroites.hist} is a function for plotting a histogram of the meteroits depending on the mass.
#'@usage
#'meteroites.hist(l)
#'@param l defines the x limit of the included mass in the histogram. The limit starts from 0.
#'@examples
#'\dontrun{meteroites.hist(10000)}
#'@return a histogram with the included mass between 0 and 10000.
#'@export
meteroites.hist <- function(l){
  a <- meteroitesapi()
  ggplot2::ggplot() +
    ggplot2::geom_histogram(data = a, ggplot2::aes(x = a$mass), fill = "blue", colour = "white", show.legend = TRUE, na.rm = TRUE) +
    ggplot2::xlim(c(0,l)) +
    ggplot2::labs(x = "Mass", y = "Count") +
    ggplot2::theme_minimal()
}

#Plot of the classes
#'@title meteroites.plotClass
#'@description
#'\code{meteroites.plotClass} is a function for plotting a graph of the different classes of meteroites.
#'The x-axis contains the different classes. The y-axis contains the number of meteroites in each class.
#'@usage
#'meteroites.plotClass()
#'@seealso
#'\link{clusterComputation}
#'@export
meteroites.plotClass <- function(){
  a <- clusterComputation()
  ggplot2::ggplot()+
    ggplot2::geom_col(data= a, ggplot2::aes(x = a$classMeteorites, y = a$numbers), fill = "blue", colour = "white") +
    ggplot2::labs(x = "Classes", y = "Numbers") +
    ggplot2::theme_minimal()
}

#Plot location
#'@title meteroites.world
#'@description
#'\code{meteroites.world} is a function for plotting a world map with the location of each meteroites from the meteroitesData data frame.
#'@usage
#'meteroites.world()
#'@export
meteroites.world <- function(){
  world <- ggplot2::map_data("world")
  a <- meteroitesapi()
  ggplot2::ggplot()+
    ggplot2::geom_polygon(data = world, mapping = ggplot2::aes(x = world$long, y = world$lat, group = group), fill = "lightgrey", colour = "white") +
    ggplot2::geom_point(data = a, ggplot2::aes(x = a$reclong, y = a$reclat), colour = "Blue", alpha = 0.5, na.rm = TRUE) +
    ggplot2::labs(x = "Long", y = "Lat") +
    ggplot2::theme_minimal()

}
#'@title meteroites.heatMap
#'@description
#'\code{meteroites.heatMap} is a function for plotting a heatmap of the relationship between the types of meteroites in the meteroitesData file and the class of meteroites .
#'@usage
#'meteroites.heatMap()
#'@seealso
#'\link{distance}
#'@export
meteroites.heatMap <- function(){
  a <- as.matrix(distance())
  stats::heatmap(a, scale = "none", col = grDevices::rainbow(256))

}


