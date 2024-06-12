#ifndef SERIES_HPP
#define SERIES_HPP
#include <vector>
#include <iostream>

class Series {
private:
	std::vector<std::string> date;
	std::vector<std::vector<float>> table;
public:
	Series() {}
	void InsertDate(const std::vector<std::string>&);
	void InsertTable(const std::vector<std::vector<float>>&);
	//void display();
	bool empty() const;
	int size() const;

	std::string getDate(const int&) const;
	std::vector<std::string> getAllDate() const;
	std::vector<float> getData(const int&) const;
  
	~Series() {}
};

#endif