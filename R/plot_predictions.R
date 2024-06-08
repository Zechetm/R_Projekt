#' Wykresowanie rzeczywistych i przewidywanych cen akcji
#'
#' Ta funkcja tworzy wykres rzeczywistych i przewidywanych cen akcji, wykorzystując różne modele predykcji. Na wykresie przedstawione są rzeczywiste ceny akcji, przewidywane ceny akcji przez wybrany model oraz regresję liniową. Dodatkowo obliczane i wyświetlane są błędy dla wybranego modelu i regresji liniowej.
#'
#' @param model Model predykcji do użycia. Dostępne opcje to: "knn", "arima", "prophet", "lm", "ma".
#' @param stock_prices Wektor liczbowy zawierający ceny akcji. Wektor powinien zawierać co najmniej 100 elementów, z czego pierwsze 90 elementów jest używane do treningu modelu, a ostatnie 10 do testowania.
#' @return Funkcja nie zwraca żadnej wartości. Generuje wykres rzeczywistych i przewidywanych cen akcji oraz wyświetla błędy.
#' @examples
#' stock_prices <- c(1.78, 1.7, 1.69, 1.34, 1.05, 1.03, 1, 0.93, 0.94, 1,
#'                   0.92, 0.92, 0.91, 0.88, 0.9, 0.86, 0.9, 0.98, 0.85, 0.84,
#'                   0.74, 0.74, 0.78, 0.78, 0.78, 0.79, 0.81, 0.79, 0.79, 0.84,
#'                   0.83, 0.82, 0.77, 0.75, 0.74, 0.81, 0.82, 0.77, 0.68, 0.7,
#'                   0.7, 0.75, 0.77, 0.67, 0.74, 0.74, 0.74, 0.76, 0.75, 0.75,
#'                   0.75, 0.7, 0.69, 0.74, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75,
#'                   0.75, 0.75, 0.75, 0.76, 0.76, 0.76, 0.76, 0.71, 0.71, 0.71,
#'                   0.77, 0.77, 0.73, 0.76, 0.76, 0.76, 0.79, 0.8, 0.72, 0.75,
#'                   0.75, 0.7, 0.75, 0.75, 0.72, 0.72, 0.75, 0.72, 0.72, 0.72,
#'                   0.67, 0.66, 0.66, 0.63, 0.68, 0.68, 0.61, 0.58, 0.64, 0.65,
#'                   0.56, 0.46, 0.4, 0.57, 0.5, 0.45, 0.46, 0.46, 0.46, 0.46,
#'                   0.46, 0.58, 0.58, 0.48, 0.48)
#' plot_predictions("knn", stock_prices)
#' plot_predictions("arima", stock_prices)
#' plot_predictions("prophet", stock_prices)
#' plot_predictions("lm", stock_prices)
#' plot_predictions("ma", stock_prices)
#' @import ggplot2
plot_predictions <- function(model, stock_prices) {
  source("predict_knn.R")
  source("predict_arima.R")
  source("predict_prophet.R")
  source("predict_lm.R")
  source("predict_ma.R")
  
  train_data <- stock_prices[1:90]
  test_data <- stock_prices[91:100]
  
  if (model == "knn") {
    predicted_prices <- predict_knn(stock_prices)
  } else if (model == "arima") {
    predicted_prices <- predict_arima(stock_prices)
  } else if (model == "prophet") {
    predicted_prices <- predict_prophet(stock_prices)
  } else if (model == "lm") {
    predicted_prices <- predict_lm(stock_prices)
  } else if (model == "ma") {
    predicted_prices <- predict_ma(stock_prices)
  } else {
    stop("Model not supported")
  }
  
  # Dane do regresji liniowej
  fit_indices <- 90:110
  fit <- lm(stock_prices[fit_indices] ~ fit_indices)
  
  # Generowanie indeksów dla przewidywań (91-100)
  predicted_indices <- 91:100
  
  # Rysowanie wykresu
  plot(stock_prices, type = "o", col = "blue", xlim = c(1, 110), ylim = c(0.3, 2), xlab = "Dni", ylab = "Cena Akcji", main = "Rzeczywiste vs Przewidywane Ceny Akcji")
  rect(90, par("usr")[3], 110, par("usr")[4], col = "gray90", border = NA)
  lines(stock_prices, type = "o", col = "blue")
  lines(predicted_indices, predicted_prices, col = "red", type = "o")
  abline(fit, col = "darkgray") # Linia regresji liniowej
  axis(1, at = seq(1, 110, by = 5), labels = seq(1, 110, by = 5), cex.axis = 0.8)
  
  # Obliczanie błędów
  predicted_prices_regression <- predict(fit, newdata = data.frame(fit_indices = 91:100))
  
  mse_model <- sum((stock_prices[91:100] - predicted_prices)^2) / 10
  mse_regression <- sum((stock_prices[91:100] - predicted_prices_regression)^2) / 10
  
  # Normalizacja błędów
  mse_model_normalized <- mse_model / max(mse_model, mse_regression)
  mse_regression_normalized <- mse_regression / max(mse_model, mse_regression)
  
  # Wyświetlanie błędów na wykresie
  text(55, 1.8, paste("Błąd modelu:", round(mse_model_normalized, 2)), col = "red", pos = 4)
  text(55, 1.7, paste("Błąd regresji:", round(mse_regression_normalized, 2)), col = "darkgray", pos = 4)
  
  # Legenda
  legend("topright", legend=c("Rzeczywiste", "Przewidywane", "Regresja liniowa"), col=c("blue", "red", "darkgray"), lty=1, cex=0.8)
}
