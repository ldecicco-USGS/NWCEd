#' Get an NWIS site that matches the HUC in question.
#'
#' Given a HUC, this function checks if an NWIS site is available.
#'
#' @param huc The watershed of interest.
#' @return The NWIS site ID. NULL if none found.
#' @author David Blodgett \email{dblodgett@usgs.gov}
#' @importFrom jsonlite fromJSON
#' @export
#' @examples
#' data<-getNWISSite(huc="031601030306")
#'
getNWISSite<-function(huc) {
  # Note that this file is available here: http://cida.usgs.gov/nwc/json/watershed_gages.json
  lookup<-fromJSON(txt=readLines(system.file('extdata','watershed_gages.json',package='NWCEd')))
  returnval<-NULL
  for(l in 1:nrow(lookup)) {
    if (grepl(huc, lookup$hucId[l])) {
      if(nchar(huc)==12) {
        returnval<-lookup$gageId[l]
      }
    }
  }
  return(returnval)
}
