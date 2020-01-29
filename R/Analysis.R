#Analysis of the meteroitesData file
#These functions analyze the mean, min and max mass of the meteroites in the meteroitesData file
#The result will be printed in the console window

#'@title meteroites.mean
#'@description
#'\code{meteroites.mean} is a function for finding the mean of the mass of the meteroites.
#'Prints an output in the consol.
#'@usage
#'\code{meteroites.mean()}
#'@param
#'No additional argument is used
#'@export
meteroites.mean <- function(){
  meteroitesMean <- mean(meteroitesData$mass, na.rm = TRUE)
  sprintf("The average meteroite weights %f gram", meteroitesMean)
}

#'@title meteroites.min
#'@description
#'\code{meteroites.min} is a function for finding the minimum of the mass of the meteroites.
#'Prints an output in the console.
#'@usage
#'\code{meteroites.min()}
#'@param
#'No additional argument is used
#'@export
meteroites.min <- function(){
  meteroitesMin <- min(meteroitesData$mass, na.rm = TRUE)
  sprintf("The smallest meteroite weights %f gram", meteroitesMin)
}

#'@title meteroites.max
#'@description
#'\code{meteroites.max} is a function for finding the maximum of the mass of the meteroites.
#'Prints an output in the console.
#'@usage
#'\code{meteroites.max()}
#'@param
#'No additional argument is used
#'@export
meteroites.max <- function(){
  meteroitesMax <- max(meteroitesData$mass, na.rm = TRUE)
  sprintf("The biggest meteroite weights %f gram", meteroitesMax)
}
