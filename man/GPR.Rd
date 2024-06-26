% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predictGPR.R
\name{GPR}
\alias{GPR}
\title{Prognozowanie za pomocą regresji procesu gausowskiego (wersja wielomianowa)}
\usage{
GPR(stock_prices, deg)
}
\arguments{
\item{stock_prices(dane}{z df), deg(stopien wielomianu)}
}
\value{
Wektor liczbowy zawierający przewidywane ceny akcji dla ostatnich 10 dni.
}
\description{
Prognozowanie za pomocą regresji procesu gausowskiego (wersja wielomianowa)
}
\examples{
stock_prices <- c(1.78, 1.7, 1.69, 1.34, 1.05, 1.03, 1, 0.93, 0.94, 1)
predicted<-GPR(stock_prices, deg=5)
}
