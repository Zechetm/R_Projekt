library(roxygen2)
library(forecast)
#' Prognozowanie cen akcji za pomocą SARIMA
#'
#' Ta funkcja wykorzystuje model SARIMA do przewidywania przyszłych cen akcji na podstawie danych historycznych.
#'
#' @param stock_prices Wektor liczbowy zawierający ceny akcji, z których pierwsze 90 elementów jest używane do treningu modelu, a ostatnie 10 do testowania.
#' @return Wektor liczbowy zawierający przewidywane ceny akcji dla ostatnich 10 dni.
#' @examples
#' stock_prices <- c(1.78, 1.7, 1.69, 1.34, 1.05, 1.03, 1, 0.93, 0.94, 1)
#' predict_sarima(stock_prices)
#' @import forecast
predict_sarima<-function(stock_prices, freq_){
  train_data <- ts(stock_prices[1:90], frequency = freq_)
  sarima_model  <- auto.arima(train_data, seasonal=T)
  forcasted <- forecast(sarima_model, h=10)$mean
  return(as.numeric(forcasted))
}

