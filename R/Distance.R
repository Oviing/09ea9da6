#'@title distance
#'@description
#'The distance function computes the string distances between main and subtypes of meteroites.
#'For measuring the distance between to strings the Jaro-Winker distance is used.
#'A value of 1 means there is no similarity between two strings.
#'A value of 0 means the similarity between two strings is 100%.
#'This means that a low value indicates a possible similarity, but this does not mean that two objects are from the same main type.
#'@usage
#'distance()
#'@return
#'Returns a matrix with the string distances between main and subtypes of meteroites.
#'@export

distance <- function(){
  # takes the meteroites Data
  mData <- meteroitesapi()

  #Vector with the main types of meteroites
  classMeteorites <- c("CM", "CO", "CI", "CR",
                       "CV", "Diagonite", "EH", "EL",
                       "Eucrite", "Acapulcoite", "Achondrite", "Angrite",
                       "Aubrite", "H", "Iron", "L", "Martian", "Mesosiderite")

  # Vector with the types of registered meteroites from the downloaded data
  vectorClass <- c(mData$recclass)

  # Computation of the distance matrix between main and subtypes
  distanceMatrix <- stringdist::stringdistmatrix(classMeteorites, vectorClass, method = "jw", useNames = TRUE)

  # Return the distance matrix
  return(distanceMatrix)
}
