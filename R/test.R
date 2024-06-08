library(class)
library(ggplot2)

# Zdefiniowane ceny akcji
stock_prices <- c(1.78, 1.7, 1.69, 1.34, 1.05, 1.03, 1, 0.93, 0.94, 1, 0.92, 0.92, 0.91, 0.88, 0.9, 0.86, 0.9, 0.98, 0.85, 0.84, 0.74, 0.74, 0.78, 0.78, 0.78, 0.79, 0.81, 0.79, 0.79, 0.84, 0.83, 0.82, 0.77, 0.75, 0.74, 0.81, 0.82, 0.77, 0.68, 0.7, 0.7, 0.75, 0.77, 0.67, 0.74, 0.74, 0.74, 0.76, 0.75, 0.75, 0.75, 0.7, 0.69, 0.74, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.76, 0.76, 0.76, 0.76, 0.71, 0.71, 0.71, 0.77, 0.77, 0.73, 0.76, 0.76, 0.76, 0.79, 0.8, 0.72, 0.75, 0.75, 0.7, 0.75, 0.75, 0.72, 0.72, 0.75, 0.72, 0.72, 0.72, 0.67, 0.66, 0.66, 0.63, 0.68, 0.68, 0.61, 0.58, 0.64, 0.65, 0.56, 0.46, 0.4, 0.57, 0.5, 0.45, 0.46, 0.46, 0.46, 0.46, 0.46, 0.58, 0.58, 0.48, 0.48)


predict_knn <- function(stock_prices) {
  train_data <- stock_prices[1:90]
  test_data <- stock_prices[91:100]
  
  # Przygotowanie danych dla prognozy
  test_sample <- matrix(rep(tail(train_data, 10), 2), ncol = 1, byrow = TRUE)
  
  # Stosowanie algorytmu KNN do predykcji
  predicted_values <- knn(train = matrix(train_data, ncol = 1), test = test_sample, cl = as.factor(train_data), k = 5)
  
  # Generowanie indeksów dla przewidywań (90-110)
  predicted_indices <- 91:110
  
  # Dane do regresji liniowej
  fit_indices <- 90:110
  fit <- lm(stock_prices[fit_indices] ~ fit_indices)
  
  # Rysowanie wykresu
  plot(stock_prices, type = "o", col = "blue", xlim = c(1, 110), ylim = c(0.3, 2), xlab = "Dni", ymg = "Cena Akcji", main = "Rzeczywiste vs Przewidywane Ceny Akcji")
  rect(90, par("usr")[3], 110, par("usr")[4], col = "gray90", border = NA)
  lines(stock_prices, type = "o", col = "blue")
  lines(predicted_indices, as.numeric(attributes(predicted_values)$levels[predicted_values]), col = "red", type = "o")
  abline(fit, col = "darkgray") # Linia regresji liniowej
  axis(1, at = seq(1, 110, by = 5), labels = seq(1, 110, by = 5))
  
  # Legenda
  legend("topright", legend=c("Rzeczywiste", "Przewidywane", "Regresja liniowa"), col=c("blue", "red", "darkgray"), lty=1, cex=0.8)
}

predict_knn(stock_prices)

