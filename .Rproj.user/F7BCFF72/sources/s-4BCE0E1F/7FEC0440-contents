library(testthat)
test_that("estimate_area input",{
  #checking that seed is not character adn that it does not work when it is
  expect_error(estimate_area(B = 1000, seed = "text"))
  #checking that B is not negative and that it does not work when it is
  expect_error(estimate_area(B = -1))
  #checking that B is not character and that it does not work when it is
  expect_error(estimate_area(B = "text"))
})
test_that("estimate_area output",{
  #checking that output of estimated area is a double
  expect_type(estimate_area(B = 1000)$estimated_area, "double")
  #checking that output of points is a list
  expect_type(estimate_area(B = 1000)$points, "list")
  #checking that general output of the function is a list
  expect_type(estimate_area(B = 1000), "list")

})
