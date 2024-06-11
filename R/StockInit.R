library(roxygen2)
#'Funkcja wczytuje do programu dane giełdowe z podanego pliku
#' @param path(string), cols(lista stringów), range( x ostatnich dni)
#' @example 
#' df <- StockInit("C:/Users/xyz/Desktop/file.txt", c("High", "Low"), 65) 
#' @export
StockInit<-function(path, cols, range_=90){
 if(!(is.character(path)) || !(is.vector(cols)) || !(is.numeric(range_))){
   print("Invalid arguments")
    return (NULL)
  }
  return (InitDF(path, cols, range_))
}
