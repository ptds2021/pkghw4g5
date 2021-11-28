
#'@title Finding area using a Monte-Carlo approach
#'
#'@author Marie Bellier, Massimo Finini, Meri Likoska, Vania Rodrigues Telo Ramos, Xavier Renger
#'
#'@param B number of points
#'@param seed for random number
#'
#'@return Return the estimated area and the coordinates of the points
#'
#'@examples
#'estimate_area(50)
#'
#'@importFrom stats runif
#'
#'@export

estimate_area <- function(B = 5000, seed = 10) {
  # Controls
  if (B%%1 != 0 | B <= 0) {
    stop("Argument B is not valid. You must use a positive integer.")
  }
  if (seed%%1 != 0 | seed <= 0) {
    stop("Argument seed is not valid. You must use a positive integer.")
  }
  if (!is.numeric(B)) {
    stop("Argument B is not valid. It must be a number.")
  }
  if (!is.numeric(seed)) {
    stop("Argument seed is not valid. It must be a number.")
  }

  # set a seed
  set.seed(seed)

  # simulate B points
  points <- data.frame(
    x = runif(n = B, min = 0, max = 1),
    y = runif(n = B, min = 0, max = 1),
    inside = rep(NA, B)
  )

  # Define our targeted area S
  for (i in 1:B){
    if(points[i,1]^2 + points[i,2]^2 > 0.5^2 &&
       (points[i,1] - 0.5)^2 + (points[i,2] - 0.5)^2 < 0.5^2 &&
       points[i,2] > points[i,1] - 0.5){
      points$inside[i] = TRUE
    }
    else{
      points$inside[i] = FALSE
    }
  }

  # Define estimated_area
  estimated_area = sum(points$inside)/B

  # Create a structure
  rval <- structure(
    list(
      estimated_area = estimated_area,
      points = points),
    class = "area"
  )

  # Return rval
  return(rval)

}



#'@title Plotting area using the estimate_area() results
#'
#'@author Marie Bellier, Massimo Finini, Meri Likoska, Vania Rodrigues Telo Ramos, Xavier Renger
#'
#'@param x is area
#'
#'@return A plot showing the estimated area
#'
#'@examples
#'
#'x <- estimate_area(B = 5000, seed = 10)
#'plot_area(x)
#'
#'@importFrom grDevices hcl
#'@importFrom graphics grid lines rect
#'
#'@export
#'
plot_area <- function(x) {

  points <- x[["points"]]

  # Define D1, D2 and D3 for the contour lines on the graph
  x_d1 <- seq(from = 0, to = 0.5, by = 0.00001)
  y_d1 <- sqrt(0.5^2 - x_d1^2)
  x_d2 <- seq(from = 0, to = 1, by = 0.00001)
  y_d2 <- sqrt(0.5^2 - (x_d2-0.5)^2) + 0.5
  x_d3 <- seq(from = 0.5, to = 1, by = 0.00001)
  y_d3 <- x_d3 - 0.5

  # Plot points
  B <- nrow(points)
  graph <- plot(NA, xlim = c(0,1), ylim = c(0,1), xlab = "x", ylab = "y",
                main = "Plot of S shape", col.main = "darkblue",
                sub = "Using a Monte-Carlo approach", col.sub = "darkblue")
  lines(x_d1,y_d1, col="darkblue")
  lines(x_d2,y_d2, col="darkblue")
  lines(x_d3,y_d3, col="darkblue")
  rect(0, 0, 1, 1, border = "darkblue", lty = "dotted")
  grid()
  cols = hcl(h = seq(15, 375, length = 3), c = 70, alpha = 0.2)[1:2]

  for (i in 1:B){
    points(points[i,1], points[i,2], pch = 20, col = cols[1 + points[i, 3]])}
  graph
}

