#API
#'@title meteroitesapi
#'@description
#'meteroitesapi is a function to downlaod the meteroites data from the NASA SODA API.
#'It returns a data frame.
#'@usage
#'meteroitesapi()
#'@export
meteroitesapi <- function(){
  weburl <- "https://data.nasa.gov/resource/gh4g-9sfh.csv"
  access <- httr::GET(weburl)
  meteroitesData <- readr::read_csv(httr::content(access, as = "text", type = "csv", encoding = "UTF-8"))
  check <- httr::status_code(access)
  if(check!=200){
    print("Please refresh the page or check your internet connection")
  }

  return(meteroitesData)

}

