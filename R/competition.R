#'@title competition
#'@description
#'A function to demonstarte the advantage of parallel computing on big data sets.
#'For a better demonstrating the distance function result is coppied several times into a data frame to increase the data volume.
#'@usage
#'competition()
#'@export
competition <- function(){
  u <- distance()
  resultDistance <- data.frame(u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u)
  print("Craeted Data")
  parallelComp <- function(){
    t0 <- proc.time()
    classMeteorites <- c("CM", "CO", "CI", "CR", "CV",
                         "Diagonite", "EH", "EL","Eucrite", "Acapulcoite",
                         "Achondrite", "Angrite", "Aubrite", "H",
                         "Iron", "L", "Martian", "Mesosiderite", "Others")

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
    t1 <- proc.time()
    tt <- t1 - t0
    return(tt)
  }

  singleComp <- function(){
    t0 <- proc.time()
    classMeteorites <- c("CM", "CO", "CI", "CR", "CV",
                         "Diagonite", "EH", "EL","Eucrite", "Acapulcoite",
                         "Achondrite", "Angrite", "Aubrite", "H",
                         "Iron", "L", "Martian", "Mesosiderite", "Others")
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
    classResult <- sapply(numberOfColumns, cluster)
    classResultVector <- rowSums(classResult)
    classDF <- data.frame(classMeteorites, classResultVector)

    t1 <- proc.time()
    tt <- t1 - t0
    return(tt)
  }

  print("Use parallel computing")
  resultPar <- parallelComp()
  print("result parallel computing:")
  print(resultPar)

  print("Use single core computing")
  resultSin <- singleComp()
  print("result single core computing:")
  print(resultSin)
}
