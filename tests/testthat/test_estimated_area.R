test_that("estimate_area input",{
  expect_error(estimate_area(B = 1000, seed = "text"))
  expect_error(estimate_area(B = -1))
  expect_error(estimate_area(B = "text"))
})
test_that("estimate_area output",{
  expect_type(estimate_area(B = 1000)$estimated_area, "double")
  expect_type(estimate_area(B = 1000)$points, "list")
  expect_type(estimate_area(B = 1000), "list")

})
