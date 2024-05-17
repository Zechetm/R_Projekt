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

bool FP::Fit::EqualDates(const std::tm& d1, const std::tm& d2) {
	return (d1.tm_year == d2.tm_year && d1.tm_mon == d2.tm_mon && d1.tm_mday == d2.tm_mday);
}


std::tm FP::Fit::toDate(const std::string& blank) {
	std::stringstream _stream(blank);
	std::tm data = {};
	//dmy
	_stream >> std::get_time(&data, "%Y%m%d");
	return data;
}



std::string FP::Fit::toString(const std::tm& d) {
	std::stringstream ss;
	ss << std::put_time(&d, "%y%m%d");
	return ss.str();
}


void FP::MeanFit::FitByMean(std::vector<std::string>* date, std::vector<std::vector<float>>* data) {
	return;
	std::tm buffor = {};
	std::tm point1 = {};
	std::tm point2 = {};
	std::vector<float> hold;

	
	for (int i = 1; i < date->size() - 2; i++) {

		point2 = FP::Fit::toDate((*date)[i]);
		point1 = FP::Fit::toDate((*date)[i+1]);
		

		buffor = point1;
		buffor.tm_mday++;
		std::mktime(&buffor);
		if (!(FP::Fit::EqualDates(buffor, point2))) {



			date->insert(date->begin() + i, FP::Fit::toString(buffor));

			for(int j = 0; j< (*data)[i].size(); j++)
				hold.push_back( ((*data)[i][j] + (*data)[i + 1][j])/2);

			data->insert(data->begin() + i, hold);
			hold.clear();
		}


	}
}