#Cluster analysis of the meteroites
#'@title distance
#'@description
#'The distance function computes the string distances between main and subtypes of meteroites.
#'For measuring the distance between to strings the Jaro-Winker distance is used.
#'A value of 1 means there is no similarity between two strings.
#'Vice versa a value of 0 means the similarity between two strings is 100%
#'\code{classMeteroites} contains the general classes of different types of meteroites.
#'\code{vectorClass} is a vector containing charackters, sliced out of the meteroitesData file.
#'\code{distanceMatrix} a matrix ccrated by the stringdistmatrix function.
#'\code{distanceMatrixDF} a data frame created from the distanceMatrix variable.
#'@usage
#'distance()
#'@param
#'No additional arguments are used
#'@export
#1. builds a vector with the general classes of different types of meteroites
distance <- function(){
  mData <- meteroitesapi()
  classMeteorites <- c("CM", "CO", "CI", "CR",
                       "CV", "Diagonite", "EH", "EL",
                       "Eucrite", "Acapulcoite", "Achondrite", "Angrite",
                       "Aubrite", "H", "Iron", "L", "Martian", "Mesosiderite", "Others")
  vectorClass <- c(mData$recclass)
  #The aim is to compare how similar the classes of different meteroites are. To compare the similarity between classes the string distance will be measured
  #3. builds a distanz matrix between the different distances of the general classes in classMeteroites and the registered meteroites classes in the meteroitesDatas set saved in classVector
  #To measure the distance between the strings, the Jaro-Winker distance is used
  #If the distance is 1 no similarity exists. is the distance 0 the similarity is 100%
  distanceMatrix <- stringdistmatrix(classMeteorites, vectorClass, method = "jw", useNames = TRUE)
  #4. converts the distancematrix into a data frame
  distanceMatrixDF <- as.data.frame(distanceMatrix)
  return(distanceMatrixDF)
}

#use parallel computation for the execution of the algorithm

#'@title clusterComputation
#'@description
#'The \code{clusterComputation} function cluster the different subtypes of meteroites together.
#'To speed up the code the function is using parallel computation.
#'In the beginning the function defines an goal character vector with all main types of meteroites.
#'Then it creates an data frame with all string distances between subtype and main type of meteroite.
#'The function first counts the number of columns of the string distance data frame to determine the number of repetitions.
#'It then determine the number of cores in the computer and builds a cluster on each core with respect to one free core.
#'The function uses \code{\link{[parallel]parSapply}} to parallel the computation.
#'The function returns the \code{classDF} data frame with the classes and the number of meteroites in each category and stops automatically the cluster.
#'@usage
#'clusterComputation()
#'@param
#'No additional arguments are needed
#'@seealso
#'\code{\link[parallel]{parSapply()}},
#'\code{\link{distance()}}
#'@export

clusterComputation <- function(){
  classMeteorites <- c("CM", "CO", "CI", "CR", "CV",
                       "Diagonite", "EH", "EL","Eucrite", "Acapulcoite",
                       "Achondrite", "Angrite", "Aubrite", "H",
                       "Iron", "L", "Martian", "Mesosiderite", "Others")
  resultDistance <- distance()
  cluster <- function(numberOfColumns){
    binaryVector <- c(seq(0, 0 , length.out = length(classMeteorites)))
    clusterColumn <- data.frame(resultDistance[, numberOfColumns])
    i <- 1
    while (length(classMeteorites) > i) {
      if (clusterColumn[i,1] != min(clusterColumn[,1])){
      } else{
        binaryVector[i] <- binaryVector[i] + 1
      }
      i <- i + 1
    }
    return(binaryVector)
  }

  numberOfColumns <- c(1: ncol(resultDistance))
  cores <- detectCores()
  buildCluster <- makeCluster(cores - 1)
  clusterExport(buildCluster, "distance")
  classResult <- parSapply(buildCluster, numberOfColumns, cluster)
  classResultVector <- rowSums(classResult)
  classDF <- data.frame(classMeteorites, classResultVector)

  stopCluster(buildCluster)

  return(classDF)

}




