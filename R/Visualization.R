#Histogram of the mass
#'@title meteroites.hist
#'@description
#'\code{meteroites.hist} is a function for plotting a histogram of the meteroits depending on the mass.
#'@usage
#'meteroites.hist(l)
#'@param
#'l defines the x limit of the included mass in the histogram. The limit starts from 0.
#'@examples
#'\dontrun{meteroites.hist(10000)}
#'@return a histogram with the included mass between 0 and 10000.
#'@export
meteroites.hist <- function(l){
  ggplot() +
    geom_histogram(data = meteroitesData, aes(x = meteroitesData$mass), fill = "blue", colour = "white", show.legend = TRUE, na.rm = TRUE) +
    xlim(c(0,l)) +
    labs(x = "Mass", y = "Count")
}

#Plot of the classes
#'@title meteroites.plotClass
#'@description
#'\code{meteroites.plotClass} is a function for plotting a graph of the different classes of meteroites.
#'The x-axis contains the different classes. The y-axis contains the number of meteroites in each class.
#'@usage
#'meteroites.plotClass()
#'@section
#'WARNING: Before using this function, \code{\link{clusterComputation()}} must be executed.
#'@param
#'No additional argument must be used.
#'@seealso
#'\link{clusterComputation}
#'@export
meteroites.plotClass <- function(){
  ggplot()+
    geom_col(data= classDF, aes(x = classDF$classMeteorites, y = classDF$classResultVector), fill = "blue", colour = "white") +
    labs(x = "Classes", y = "Numbers")
}

#Plot location
#'@title meteroites.world
#'@description
#'\code{meteroites.world} is a function for plotting a world map with the location of each meteroites from the meteroitesData data frame.
#'@usage
#'meteroites.world()
#'@param
#'No additional argument must be used.
#'@export
meteroites.world <- function(){
  world <- map_data("world")
  ggplot()+
    geom_polygon(data = world, mapping = aes(x = world$long, y = world$lat, group = group), fill = "lightgrey", colour = "white") +
    geom_point(data = meteroitesData, aes(x = meteroitesData$reclong, y = meteroitesData$reclat), colour = "Blue", alpha = 0.5) +
    labs(x = "Long", y = "Lat") +
    guides()+
    theme(legend.position = "bottom")

}
#'@title meteroites.heatMap
#'@description
#'\code{meteroites.heatMap} is a function for plotting a heatmap of the relationship between the types of meteroites in the meteroitesData file and the class of meteroites .
#'@usage
#'meteroites.heatMap()
#'@param
#'No additional argument must be used.
#'@seealso
#'\link{distance}
#'@export
meteroites.heatMap <- function(){
  heatmap(distanceMatrix, scale = "none", col = rainbow(256))
}


