library(roxygen2)
library(forecast)
#' Prognozowanie cen akcji za pomocą SARIMA
#'
#' Ta funkcja wykorzystuje model SARIMA do przewidywania przyszłych cen akcji na podstawie danych historycznych.
#'
#' @param (stock_prices, prange) Wektor liczbowy zawierający ceny akcji, z których pierwsze n elementów jest używane do treningu modelu, a ostatnie 10 do testowania
#' oraz wybrany zasięg
#' @return Wektor liczbowy zawierający przewidywane ceny akcji dla ostatnich 10 dni.
#' @examples
#' stock_prices <- c(1.78, 1.7, 1.69, 1.34, 1.05, 1.03, 1, 0.93, 0.94, 1)
#' predict_sarima(stock_prices)
#' @import forecast
predict_sarima<-function(stock_prices, freq_, p_range=90){
  if(p_range < 0){
    print("Error: Given range cannot be less than 0")
    return (NULL)
  }
  else if(p_range>length(stock_prices)){
    print("Warning: Given range is greater than length of stock_prices. Choosing max. range instead")
    p_range=length(stock_prices)
  }
  # Przygotowanie danych treningowych
  train_data <- ts(stock_prices[1:p_range], frequency = freq_)
  # Dopasowanie modelu
  sarima_model  <- auto.arima(train_data, seasonal=T)
  # Prognozowanie przyszłych wartości (następne 10 dni)
  forcasted <- forecast(sarima_model, h=10)$mean
  return(as.numeric(forcasted))
}

