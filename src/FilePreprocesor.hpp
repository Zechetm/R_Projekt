#ifndef FILE_PREPROCESOR_HPP
#define FILE_PREPROCESOR_HPP
#include <vector>
#include <fstream>
#include <string>
#include <algorithm>
#include <map>
#include <sstream>
#include <iomanip>

namespace FP {

	class FilePreprocesor {
	public:
		static std::vector<std::string> Init(const std::string&, const int&);
		static void FigureData(const std::vector<std::string>&,const std::vector<std::string>&, std::vector<std::string>*, std::vector<std::vector<float>>*);
		static int FindNth(const std::string&, const short int&);
		static bool ValidColNames(const std::vector<std::string>&);
	};

}
#endif