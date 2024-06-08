library(forecast)
#' Prognozowanie cen akcji za pomocą ARIMA
#'
#' Ta funkcja wykorzystuje model ARIMA do przewidywania przyszłych cen akcji na podstawie danych historycznych.
#'
#' @param stock_prices Wektor liczbowy zawierający ceny akcji, z których pierwsze 90 elementów jest używane do treningu modelu, a ostatnie 10 do testowania.
#' @return Wektor liczbowy zawierający przewidywane ceny akcji dla ostatnich 10 dni.
#' @examples
#' stock_prices <- c(1.78, 1.7, 1.69, 1.34, 1.05, 1.03, 1, 0.93, 0.94, 1)
#' predict_arima(stock_prices)
#' @import forecast
predict_arima <- function(stock_prices) {
  train_data <- ts(stock_prices[1:90])
  arima_model <- auto.arima(train_data)
  forecasted_values <- forecast(arima_model, h=10)$mean
  return(as.numeric(forecasted_values))
}
