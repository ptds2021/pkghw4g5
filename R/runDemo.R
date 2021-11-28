#'@title Application Demo
#'
#'@author Marie Bellier, Massimo Finini, Meri Likoska, Vania Rodrigues Telo Ramos, Xavier Renger
#'
#'@return Launch the shiny application to give you the ability to play with the numbers
#'
#'@export

runDemo <- function() {
  appDir <- system.file("shiny-examples", "area", package = "pkghw4g5")
  if (appDir == "") {
    stop(
      "Could not find example directory. Try re-installing pkghw4g5.",
      call. = FALSE
    )
  }

  shiny::runApp(appDir, display.mode = "normal")

}

