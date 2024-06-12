
# StockInit R Package

## Przegląd
**StockInit** to biblioteka R umożliwiająca przewidywanie przyszłych cen akcji za pomocą różnych modeli predykcyjnych. Pakiet zawiera funkcje do wczytywania danych giełdowych, obliczania średniego błędu kwadratowego (MSE), normalizacji MSE oraz wykreślania rzeczywistych i przewidywanych cen akcji.

Każdy model predykcyjny porównujemy ze zwykłą regresją liniową po czym wyliczamy czy model pokonuje regresje na konkretnych danych.

## Instalacja
Aby zainstalować pakiet StockInit, musisz mieć zainstalowane R oraz devtools. Możesz zainstalować pakiet bezpośrednio z GitHub:


### Zainstaluj devtools
install.packages("devtools")

### Zainstaluj bibliotekę z githuba GitHub
devtools::install_github("Zechetm/R_Projekt")

## Dane
Dane polecamy brać ze strony https://stooq.pl/db/ Do analizy będziemy wykorzystywać tylko ceny zamknięcia akcji.

## Zależności
StockInit zależy od następujących pakietów R:

 - Rcpp (>= 1.0.12)
 - roxygen2
 - ggplot2
 - forecast
 - class
 - zoo
 - prophet
 - kernlab
 - testthat

Te pakiety zostaną zainstalowane automatycznie podczas instalacji StockInit.

# Funkcje

## Inicjalizacja danych:

**StockInit(path, cols, range_):** Funkcja wczytuje do programu dane giełdowe z podanego pliku.

## Obliczenia i normalizacja MSE:

 - **calculate_mse(actual, predicted):** Oblicza średni błąd kwadratowy (MSE) między rzeczywistymi a przewidywanymi wartościami.
 - **normalize_mse(actual, predicted, other_predicted):** Normalizuje średni błąd kwadratowy (MSE) między dwoma zestawami przewidywań.

## Modele predykcyjne:

 - **predict_arima(stock_prices):** Model autoregresji ze średnią ruchomą, skuteczny w danych z trendami i sezonowością.
 - **predict_knn(stock_prices):** Model bazujący na najbliższych sąsiadach, dobry do problemów, gdzie wzorce są dobrze rozdzielone.
 - **predict_prophet(stock_prices):** Model opracowany przez Facebooka, idealny do danych z wyraźnymi sezonowościami.
 - **predict_lm(stock_prices):** Podstawowy model predykcyjny, używany jako punkt odniesienia.
 - **predict_ma(stock_prices):** Prosta metoda śledzenia trendów.
 - **predict_sarima(stock_prices, freq_):** Rozszerzenie ARIMA do obsługi sezonowości.
 - **GPR(stock_prices, deg):** Model probabilistyczny, stosowany kiedy zależności są złożone i niełatwe do ujęcia w standardowych modelach liniowych.

## Wykresy:

 - **plot_predictions(model, stock_prices):** Wykresowanie rzeczywistych i
   przewidywanych cen akcji.
 - **plot_stock_predictions(stock_prices, predicted_prices, predicted_prices_regression, mse_model_normalized,
   mse_regression_normalized):**  Rysowanie wykresu rzeczywistych i przewidywanych cen akcji oraz wyświetlanie błędów dla wybranego modelu i regresji liniowej.

## Licencja
StockInit jest licencjonowany na licencji GPL (>= 2)

## Autorzy
Aleksander Walis
Adam Dowgird