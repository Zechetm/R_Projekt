#ifndef FILE_PREPROCESOR_HPP
#define FILE_PREPROCESOR_HPP
#include <vector>
#include <fstream>
#include <string>
#include <algorithm>
#include <map>
#include <ctime>
#include <sstream>
#include <iomanip>

namespace FP {

	class FilePreprocesor {
	public:
		static std::vector<std::string> Init(const std::string&, const int&);
		static void FigureData(const std::vector<std::string>&,const std::vector<std::string>&, std::vector<std::string>*, std::vector<std::vector<float>>*);
		static int FindNth(const std::string&, const short int&);
	};


	class Fit {
	public:
		static bool EqualDates(const std::tm& d1, const std::tm& d2);
		static std::tm toDate(const std::string&);
		static std::string toString(const std::tm&);
	
	};



	//W.I.P.
	class MeanFit: protected Fit {
	public:
		static void FitByMean(std::vector<std::string>*, std::vector<std::vector<float>>*);
	};
}
#endif