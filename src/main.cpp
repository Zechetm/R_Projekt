#include <iostream>
#include "Series.hpp"
#include "FilePreprocesor.hpp"
#include <fstream>
#include <Rcpp.h>

Series InitSeries(const std::string& path, const std::vector<std::string>& columns, const int& range) {
	//init check
	if (range <= 0) {
		std::cerr << "Invalid range (" << range << ")" << std::endl;
		return Series();
	}
	if (columns.size() == 0){
		std::cerr << "Columns vector is empty" << std::endl;
		return Series();

	}


	//check for valid column names
	if (!(FP::FilePreprocesor::ValidColNames(columns))) {
	  std::cerr<< "Invalid column argument. Try: Open, High, Low, Close, Volume" << std::endl;
	  return Series();
	}


	//IF VECTOR EMPTY PRINT ERROR
	std::vector<std::string>lines = FP::FilePreprocesor::Init(path,range); 
	if (lines.empty()) {
		std::cerr << "INVALID PATH TO FILE OR FILE IS EMPTY" << std::endl;
		return Series();
	}
	
	std::vector<std::string> date;
	std::vector<std::vector<float>> table;
	

	FP::FilePreprocesor::FigureData(columns, lines, &date, &table);
	if (date.empty() || table.empty()) {
		std::cerr << "Undefined behavior: empty frame in FP::FilePreprocesor::FigureData";
		return Series();
	}
	Series f;
	f.InsertDate(date);
	f.InsertTable(table);
	
	return f;
}


Series Init(const std::string& path, const std::string& method, const std::vector<std::string>& column,
		const int& range = 90) {

		Series init_series = InitSeries(path, column, range);

		if (init_series.empty()) {
			std::cerr << "undefined behavior" << std::endl;
		
		}
		return Series();
}
// [[Rcpp::export]]
void ProjectVersion() {
  std::cout << "Version: 1.3" << std::endl;
}


using namespace Rcpp;
// [[Rcpp::export]]
DataFrame InitDF(const std::string& path,const std::vector<std::string>& columns, const int& range) {
  
  Series cSeries = InitSeries(path,columns,range);
  if(cSeries.empty()){
    return DataFrame();
  }
  List Rcolumns;
  std::vector<std::string> F=cSeries.getAllDate();

  Rcolumns["Date"] = F;
  
  std::vector<float> buf;
  for(int i = 0; i<columns.size(); i++){
    for(int j = 0; j<cSeries.size(); j++)
      buf.push_back(cSeries.getData(j)[i]);
    Rcolumns[columns[i]] = buf;
    
    buf.clear();
  }

  DataFrame df(Rcolumns);
  return df;

}