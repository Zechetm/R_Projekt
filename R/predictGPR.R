library(roxygen2)
library(kernlab)
#'Prognozowanie za pomocą regresji procesu gausowskiego (wersja wielomianowa)
#' @param 
#' stock_prices(dane z df), deg(stopien wielomianu)
#' @return Wektor liczbowy zawierający przewidywane ceny akcji dla ostatnich 10 dni.
#' @examples
#' stock_prices <- c(1.78, 1.7, 1.69, 1.34, 1.05, 1.03, 1, 0.93, 0.94, 1)
#' predicted<-GPR(stock_prices, deg=5)
GPR<-function(stock_prices, deg){
  X_train <- matrix(1:length(stock_prices), ncol=1)
  X_test <- matrix((length(stock_prices)+1):(length(stock_prices)+10), ncol = 1)
  model_ <- gausspr(X_train,stock_prices,kernel=polydot(degree = deg))
  return (as.numeric(predict(model_,X_test)))
}
