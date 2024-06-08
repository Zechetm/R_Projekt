#' Prognozowanie cen akcji za pomocą regresji liniowej
#'
#' Ta funkcja wykorzystuje model regresji liniowej do przewidywania przyszłych cen akcji na podstawie danych historycznych.
#'
#' @param stock_prices Wektor liczbowy zawierający ceny akcji, z których pierwsze 90 elementów jest używane do treningu modelu, a ostatnie 10 do testowania.
#' @return Wektor liczbowy zawierający przewidywane ceny akcji dla ostatnich 10 dni.
#' @examples
#' stock_prices <- c(1.78, 1.7, 1.69, 1.34, 1.05, 1.03, 1, 0.93, 0.94, 1)
#' predict_lm(stock_prices)
predict_lm <- function(stock_prices) {
  train_data <- data.frame(x = 1:90, y = stock_prices[1:90])
  lm_model <- lm(y ~ x, data = train_data)
  future_data <- data.frame(x = 91:100)
  predicted_values <- predict(lm_model, newdata = future_data)
  return(as.numeric(predicted_values))
}
