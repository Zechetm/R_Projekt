#' Normalizacja średniego błędu kwadratowego (MSE)
#'
#' Ta funkcja normalizuje średni błąd kwadratowy (MSE) między dwoma zestawami przewidywań.
#'
#' @param actual Wektor rzeczywistych wartości.
#' @param predicted Wektor przewidywanych wartości.
#' @param other_predicted Wektor przewidywanych wartości dla porównania.
#' @return Znormalizowany średni błąd kwadratowy (MSE).
normalize_mse <- function(actual, predicted, other_predicted) {
  mse <- calculate_mse(actual, predicted)
  other_mse <- calculate_mse(actual, other_predicted)
  normalized_mse <- mse / max(mse, other_mse)
  return(normalized_mse)
}
