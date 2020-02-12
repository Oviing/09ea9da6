#'@title clusterComputation
#'@description
#'The \code{clusterComputation} function cluster the different subtypes of meteroites to the related main types together.
#'The function contains a vector with all the main types of meteroites.
#'The matrix from the \code{\link{distance}} function will be sliced into single columns.
#'In each column the index position of the smalles value will be calculated.
#'For each minimal value in an empty vector with the same length as the vector for the main types +1 value is added.
#'The function returns a data frame made out of the main type of meteroites and the empty vector with the added values at the index position with the smalles value.
#'The function uses \code{sapply} to loop the computation.
#'@usage
#'clusterComputation()
#'@return
#'Returns a data frame with the classes and the number of meteroites in each class.
#'@seealso
#'\code{\link[base]{sapply}},
#'\code{\link{distance}}
#'@export

clusterComputation <- function(){

  # Vector with the main types of meteroites
  classMeteorites <- c("CM", "CO", "CI", "CR", "CV",
                       "Diagonite", "EH", "EL","Eucrite", "Acapulcoite",
                       "Achondrite", "Angrite", "Aubrite", "H",
                       "Iron", "L", "Martian", "Mesosiderite")

  # matrix with the string distances
  resultDistance <- distance()

  # Algorithm to slice the data frame into a column and find the smalles value and put the index position into an empty vector
  binaryVector <- c(seq(0, 0 , length.out = length(classMeteorites)))
  findcol <- function(numberOfColumns){
    i <- resultDistance[, numberOfColumns]
    u <- which.min(i)
    binaryVector[u] <- binaryVector[u] + 1
    return(binaryVector)
  }

  # Counts how often the loop has to be excecuted
  numberOfColumns <- c(1: ncol(resultDistance))

  # runs the loop for computation
  classResult <- sapply(numberOfColumns, findcol)

  # sum up the rows to one single column
  numbers <- rowSums(classResult)

  # creates a dat frame with main types and the number of meteroites in each class
  classDF <- data.frame(classMeteorites, numbers)

  return(classDF)

}




