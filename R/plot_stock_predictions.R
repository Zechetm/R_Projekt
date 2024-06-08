#' Rysowanie wykresu rzeczywistych i przewidywanych cen akcji
#'
#' Ta funkcja tworzy wykres rzeczywistych i przewidywanych cen akcji oraz wyświetla błędy dla wybranego modelu i regresji liniowej.
#'
#' @param stock_prices Wektor rzeczywistych cen akcji.
#' @param predicted_prices Wektor przewidywanych cen akcji przez wybrany model.
#' @param predicted_prices_regression Wektor przewidywanych cen akcji przez regresję liniową.
#' @param mse_model_normalized Znormalizowany średni błąd kwadratowy (MSE) dla wybranego modelu.
#' @param mse_regression_normalized Znormalizowany średni błąd kwadratowy (MSE) dla regresji liniowej.
plot_stock_predictions <- function(stock_prices, predicted_prices, predicted_prices_regression, mse_model_normalized, mse_regression_normalized) {
  fit_indices <- 90:110
  predicted_indices <- 91:100
  
  plot(stock_prices, type = "o", col = "blue", xlim = c(1, 110), ylim = c(0.3, 2), xlab = "Dni", ylab = "Cena Akcji", main = "Rzeczywiste vs Przewidywane Ceny Akcji")
  rect(90, par("usr")[3], 110, par("usr")[4], col = "gray90", border = NA)
  lines(stock_prices, type = "o", col = "blue")
  lines(predicted_indices, predicted_prices, col = "red", type = "o")
  lines(predicted_indices, predicted_prices_regression, col = "darkgray", type = "o")
  abline(lm(stock_prices[fit_indices] ~ fit_indices), col = "darkgray") # Linia regresji liniowej
  axis(1, at = seq(1, 110, by = 5), labels = seq(1, 110, by = 5), cex.axis = 0.8)
  
  # Wyświetlanie błędów na wykresie
  text(55, 1.8, paste("Błąd modelu:", round(mse_model_normalized, 2)), col = "red", pos = 4)
  text(55, 1.7, paste("Błąd regresji:", round(mse_regression_normalized, 2)), col = "darkgray", pos = 4)
  
  # Legenda
  legend("topright", legend=c("Rzeczywiste", "Przewidywane", "Regresja liniowa"), col=c("blue", "red", "darkgray"), lty=1, cex=0.8)
}
