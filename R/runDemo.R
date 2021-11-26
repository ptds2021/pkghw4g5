#'@title Application Demo
#'@authors Marie Bellier, Massimo Finini, Meri Likoska, Vania Rodrigues Telo Ramos, Xavier Renger
#'@param ... Nothing
#'@return launch the shiny application
#'@example runDemo()
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

