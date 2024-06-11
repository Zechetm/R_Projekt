#include "FilePreprocesor.hpp"


std::vector<std::string> FP::FilePreprocesor::Init(const std::string& path, const int& range) {
	
	std::fstream file(path);
	if (!(file.is_open())) {
		return {  };

	}
	std::string* line = new std::string;
	std::vector<std::string>lines;
	std::getline(file, *line);

	while (std::getline(file, *line)) {
		lines.push_back(*line);
	}
	delete line;
	std::reverse(lines.begin(), lines.end());
	if (lines.size() > range)
		lines.erase(lines.begin() + range, lines.end());
	return lines;
}


int FP::FilePreprocesor::FindNth(const std::string& text, const short int& n) {
	short int c = {};
	for (int j = 0; j < text.length(); j++) {
		if (text[j] == ',') c++;
		if (c == n) return j;
	}
	return -1;
}

void FP::FilePreprocesor::FigureData(const std::vector<std::string>& columns,const std::vector<std::string>& lines, std::vector<std::string>* date_,
	std::vector<std::vector<float>>* data_) {

	short int index_low;
	short int index_high;
	std::map<std::string, int> ref{
		{"Open", 4},
		{"High", 5},
		{"Low", 6},
		{"Close", 7},
		{"Volume", 9}
	};
	std::vector<float> data_buffor;

	for (std::string line_ : lines) {
		try {
			index_low = FP::FilePreprocesor::FindNth(line_,2);
			if (index_low == -1)
				throw index_low;
		}
		catch (int f) {
			return;

		}
		index_high = index_low + 1;
		while (line_[index_high] != ',') index_high++;
		
		date_->push_back(line_.substr(index_low + 1, index_high - index_low - 1));

		for (std::string cols : columns) {

			try {
				index_low = FP::FilePreprocesor::FindNth(line_,ref[cols]);
				if (index_low == -1)
					throw index_low;
			}
			catch (int ind) {
				return;
			}
			index_high = index_low + 1;
			while (line_[index_high] != ',') index_high++;

			data_buffor.push_back(std::stof(line_.substr(index_low + 1, index_high - index_low - 1)));

		}
		data_->push_back(data_buffor);
		data_buffor.clear();
	}

}

bool FP::FilePreprocesor::ValidColNames(const std::vector<std::string>& vec) {
  std::map<std::string, int> reference;
  reference["Open"] = 4;
  reference["High"] = 5;
  reference["Low"] = 6;
  reference["Close"] = 7;
  reference["Volume"] = 9;
  for (std::string test : vec) {
    if (reference.find(test) == reference.end()) {
      return false;
    }
  }
  return true;
}
