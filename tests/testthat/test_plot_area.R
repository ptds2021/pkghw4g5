test_that("plot_area input",{
  expect_error(plot_area("text"))
  expect_error(plot_area(1))
})
test_that("plot_area output",{
  expect_type(plot_area(estimate_area()), "NULL")
})


