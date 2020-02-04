#API
#'@title meteroitesapi
#'@description
#'meteroitesapi is a function to downlaod the meteroites data from the NASA SODA API.
#'It returns a data frame with the variable name "meteroitesData" in the global enviroment.
#'IMPORTANT: The meteroitesapi function should be executed before other functions to download the data for further computation.
#'@usage
#'meteroitesapi()
#'@param
#'No arguments are needed to execute the function
#'@export
meteroitesapi <- function(){
  weburl <- "https://data.nasa.gov/resource/gh4g-9sfh.csv"
  access <- httr::GET(weburl)
  meteroitesData <- readr::read_csv(httr::content(access, as = "text", type = "csv"))
  check <- httr::status_code(access)
  if(check!=200){
    print("Please refresh the page or check your internet connection")
  }

  return(meteroitesData)

}

