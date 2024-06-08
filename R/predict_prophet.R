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
  library(prophet)
  train_data <- data.frame(ds = 1:90, y = stock_prices[1:90])
  m <- prophet(train_data)
  future <- make_future_dataframe(m, periods = 10)
  forecast <- predict(m, future)
  predicted_values <- tail(forecast$yhat, 10)
  return(as.numeric(predicted_values))
}
