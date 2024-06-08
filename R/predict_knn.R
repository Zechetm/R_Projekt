#' Prognozowanie cen akcji za pomocą K-Nearest Neighbors (KNN)
#'
#' Ta funkcja wykorzystuje algorytm K-Nearest Neighbors (KNN) do przewidywania przyszłych cen akcji na podstawie danych historycznych.
#'
#' @param stock_prices Wektor liczbowy zawierający ceny akcji, z których pierwsze 90 elementów jest używane do treningu modelu, a ostatnie 10 do testowania.
#' @return Wektor liczbowy zawierający przewidywane ceny akcji dla ostatnich 10 dni.
#' @examples
#' stock_prices <- c(1.78, 1.7, 1.69, 1.34, 1.05, 1.03, 1, 0.93, 0.94, 1)
#' predict_knn(stock_prices)
#' @import class
predict_knn <- function(stock_prices) {
  library(class)
  train_data <- stock_prices[1:90]
  test_sample <- matrix(rep(tail(train_data, 10), 2), ncol = 1, byrow = TRUE)
  predicted_values <- knn(train = matrix(train_data, ncol = 1), test = test_sample, cl = as.factor(train_data), k = 5)
  return(as.numeric(attributes(predicted_values)$levels[predicted_values][1:10]))
}
