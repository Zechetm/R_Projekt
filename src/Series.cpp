#include "Series.hpp"



void Series::InsertDate(const std::vector<std::string>& _dates) {
	this->date = _dates;
}


void Series::InsertTable(const std::vector<std::vector<float>>& tb) {
	this->table = tb;
}

//void Series::display() {
//	for (int a = 0; a < date.size(); a++) {
//		std::cout << date[a] << " ";
//		for (int b = 0; b < table[a].size(); b++) {
//			std::cout << table[a][b]<<" ";
//		}
//		printf("\n");
//
//	}
//}

bool Series::empty() const{
	return (this->table.size() == 0 || this->date.size() == 0);
}
int Series::size() const{
	return this->date.size();
}

std::string Series::getDate(const int& index) const {
	return this->date[index];
}

std::vector<float> Series::getData(const int& index) const {
	return this->table[index];
}

std::vector<std::string> Series::getAllDate() const{
  return this->date;
}