#' Prognozowanie cen akcji za pomocą średniej ruchomej
#'
#' Ta funkcja wykorzystuje średnią ruchomą do przewidywania przyszłych cen akcji na podstawie danych historycznych.
#'
#' @param stock_prices Wektor liczbowy zawierający ceny akcji, z których pierwsze 90 elementów jest używane do treningu modelu, a ostatnie 10 do testowania.
#' @return Wektor liczbowy zawierający przewidywane ceny akcji dla ostatnich 10 dni.
#' @examples
#' stock_prices <- c(1.78, 1.7, 1.69, 1.34, 1.05, 1.03, 1, 0.93, 0.94, 1)
#' predict_ma(stock_prices)
#' @import zoo
predict_ma <- function(stock_prices) {
  library(zoo)
  train_data <- ts(stock_prices[1:90])
  ma_model <- rollmean(train_data, k = 5, align = "right")
  forecasted_values <- rep(tail(ma_model, 1), 10)
  return(as.numeric(forecasted_values))
}
