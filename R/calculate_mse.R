#' Obliczanie średniego błędu kwadratowego (MSE)
#'
#' Ta funkcja oblicza średni błąd kwadratowy między rzeczywistymi a przewidywanymi wartościami.
#'
#' @param actual Wektor rzeczywistych wartości.
#' @param predicted Wektor przewidywanych wartości.
#' @return Średni błąd kwadratowy (MSE).
calculate_mse <- function(actual, predicted) {
  mse <- sum((actual - predicted)^2) / length(actual)
  return(mse)
}
