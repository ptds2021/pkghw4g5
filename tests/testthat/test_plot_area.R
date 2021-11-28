library(testthat)
test_that("plot_area input",{
  #checking that when the input is text, it does not work
  expect_error(plot_area("text"))
  #checking that when the input numeric, it does not work
  expect_error(plot_area(1))
})
test_that("plot_area output",{
  #checking that the ouput is of type NULL and not something else
  expect_type(plot_area(estimate_area()), "NULL")
})


