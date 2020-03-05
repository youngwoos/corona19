getdata <- function(data) {
  library(dplyr)
  library(lubridate)


  # 01_patient ----------------------------------------------------------------
  if (data == "patient") {
    patient <-
      read.csv(
        "https://github.com/jihoo-kim/Coronavirus-Dataset/raw/master/patient.csv",
        stringsAsFactors = F,
        na.strings = ""
      )

    # modify column type
    patient <- patient %>%
      as_tibble() %>%
      mutate_at(c("confirmed_date", "released_date", "deceased_date"),
                as_date)

    return(patient)
  }


  # 02_route ----------------------------------------------------------------
  else if (data == "route") {
    route <-
      read.csv(
        "https://github.com/jihoo-kim/Coronavirus-Dataset/raw/master/route.csv",
        stringsAsFactors = F,
        na.strings = ""
      )

    # modify colum type
    route <- route %>%
      as_tibble() %>%
      mutate_at("date", as_date)

    return(route)
  }

  # 03_state --------------------------------------------------------------------
  else if (data == "state") {
    state <-
      read.csv(
        "https://github.com/jihoo-kim/Coronavirus-Dataset/raw/master/time.csv",
        stringsAsFactors = F,
        na.strings = ""
      )

    # modify column type
    state <- state %>%
      as_tibble() %>%
      mutate_at("date", as_date)

    return(state)
  }
  stop(paste0("Object '", data, "' not found. Check dataset name."))
}
