library(testthat)

source("R/predict_sarima.R")
source("R/predictGPR.R")
source("R/predict_prophet.R")
source("R/predict_ma.R")
source("R/predict_lm.R")
source("R/predict_knn.R")
source("R/predict_arima.R")


sample_stock<-c(0.2070, 0.2025, 0.2030, 0.2100, 0.1954, 0.1956, 0.1950, 0.1922, 0.1900, 0.1924, 0.1960, 0.1950, 0.1972, 0.1940, 0.1830, 0.1750, 0.1790, 0.1616, 0.1650, 0.1650, 
                    0.1620, 0.1740, 0.1800, 0.1815, 0.1815, 0.1830, 0.1820, 0.1960, 0.2000, 0.2020, 0.2030, 0.2100, 0.2110, 0.2050, 0.2140, 0.2160, 0.2120, 0.2130, 0.2150, 0.2200, 
                    0.2220, 0.2170, 0.2260, 0.2300, 0.2290, 0.2240, 0.2220, 0.2240, 0.2390, 0.2460, 0.2440, 0.2480, 0.2510, 0.2630, 0.2640, 0.2600, 0.2510, 0.2510, 0.2540, 0.2540, 
                    0.2590, 0.2590, 0.2640, 0.2700, 0.2470, 0.2380, 0.2370, 0.2370, 0.2300, 0.2460, 0.2620, 0.2720, 0.2770, 0.2770, 0.2770, 0.2800, 0.2910, 0.3040, 0.3050, 0.3080, 
                    0.3080, 0.3090, 0.3100, 0.3100, 0.3070, 0.2960, 0.3080, 0.2990, 0.3280, 0.3380)

test_that("SARIMA TEST", {
  expect_equal(predict_sarima(sample_stock,freq_=3), 
               c(0.3527191, 0.3527191, 0.3527191, 0.3527191, 0.3527191, 0.3527191, 0.3527191, 0.3527191, 0.3527191, 0.3527191),
               tolerance = 0.02)
})


test_that("GPR TEST", {
  expect_equal(GPR(sample_stock, 3),
               c( 0.3169425, 0.3186163, 0.3202453, 0.3218279, 0.3233624, 0.3248470, 0.3262800, 0.3276598, 0.3289846, 0.3302528),
               tolerance = 0.01)
})

test_that("predict_ma działa poprawnie", {
  expect_equal(predict_ma(sample_stock),
               c(0.3080, 0.3080, 0.3080, 0.3080, 0.3080, 0.3080, 0.3080, 0.3080, 0.3080, 0.3080),
               tolerance = 0.02)
})

test_that("predict_lm działa poprawnie", {
  expect_equal(predict_lm(sample_stock),
               c(0.2957, 0.2968, 0.2979, 0.2990, 0.3001, 0.3012, 0.3023, 0.3034, 0.3045, 0.3056),
               tolerance = 0.02)
})

test_that("predict_knn działa poprawnie", {
  expect_equal(predict_knn(sample_stock),
               c(0.3080, 0.3070, 0.3080, 0.3080, 0.3080, 0.3080, 0.3080, 0.3080, 0.3080, 0.3080),
               tolerance = 0.02)
})

test_that("predict_arima działa poprawnie", {
  expect_equal(predict_arima(sample_stock),
               c(0.3125, 0.3126, 0.3127, 0.3128, 0.3129, 0.3130, 0.3131, 0.3132, 0.3133, 0.3134),
              tolerance = 0.04)
})