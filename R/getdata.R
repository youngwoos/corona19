#' @export
#' @importFrom utils read.csv
#' @importFrom dplyr mutate_at %>%
#' @importFrom tibble as_tibble
#' @importFrom lubridate as_date

getdata <- function(data) {

  # 01_patient ----------------------------------------------------------------
  if (data == "patient") {
    patient <-
      utils::read.csv (
        "https://github.com/jihoo-kim/Coronavirus-Dataset/raw/master/patient.csv",
        stringsAsFactors = F,
        na.strings = ""
      )

    # modify column type
    patient <- patient %>%
      tibble::as_tibble() %>%
      dplyr::mutate_at(c("confirmed_date", "released_date", "deceased_date"),
                lubridate::as_date)

    return(patient)
  }


  # 02_route ----------------------------------------------------------------
  else if (data == "route") {
    route <-
      utils::read.csv (
        "https://github.com/jihoo-kim/Coronavirus-Dataset/raw/master/route.csv",
        stringsAsFactors = F,
        na.strings = ""
      )

    # modify colum type
    route <- route %>%
      tibble::as_tibble() %>%
      dplyr::mutate_at("date", lubridate::as_date)

    return(route)
  }

  # 03_state --------------------------------------------------------------------
  else if (data == "state") {
    state <-
      utils::read.csv (
        "https://github.com/jihoo-kim/Coronavirus-Dataset/raw/master/time.csv",
        stringsAsFactors = F,
        na.strings = ""
      )

    # modify column type
    state <- state %>%
      tibble::as_tibble() %>%
      dplyr::mutate_at("date", lubridate::as_date)

    return(state)
  }
  stop(paste0("Object '", data, "' not found. Check dataset name."))
}
