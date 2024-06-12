library(prophet)

#' Prognozowanie cen akcji za pomocą Prophet
#'
#' Ta funkcja wykorzystuje model Prophet do przewidywania przyszłych cen akcji na podstawie danych historycznych.
#'
#' @param stock_prices Wektor liczbowy zawierający ceny akcji, z których pierwsze 90 elementów jest używane do treningu modelu, a ostatnie 10 do testowania.
#' @return Wektor liczbowy zawierający przewidywane ceny akcji dla ostatnich 10 dni.
#' @examples
#' stock_prices <- c(1.78, 1.7, 1.69, 1.34, 1.05, 1.03, 1, 0.93, 0.94, 1)
#' predict_prophet(stock_prices)
#' @import prophet
predict_prophet <- function(stock_prices) {
  
  # Przygotowanie danych treningowych (pierwsze 90 elementów)
  train_data <- data.frame(ds = 1:90, y = stock_prices[1:90])
  
  # Dopasowanie modelu Prophet
  m <- prophet(train_data)
  
  # Przygotowanie danych do prognozowania (następne 10 dni)
  future <- make_future_dataframe(m, periods = 10)
  
  # Prognozowanie przyszłych wartości
  forecast <- predict(m, future)
  
  # Konwersja wyników predykcji do formatu liczbowego
  predicted_values <- tail(forecast$yhat, 10)
  predicted_prices <- as.numeric(predicted_values)
  
  return(predicted_prices)
}
