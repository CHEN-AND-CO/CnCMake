#ifndef HEADER_FUNCTIONS
#define HEADER_FUNCTIONS

#include <iostream>
#include <vector>
#include <fstream>
#include <sstream>

std::vector<std::string> split(std::string in, std::string c);

template<typename T>
std::string implode(std::vector<T> a, std::string glue = ""){
	std::string out{""};
	size_t size = a.size();
	size_t index = 0;

	for(auto& elem : a){
		std::stringstream tmp;
		tmp << elem;

		out += tmp.str();

		if(index+1 < size){
			out += glue;
		}

		index ++;
	}

	return out;
}

template<typename V>
std::vector<V> rewrite(std::vector<V> table, unsigned index) {
	std::vector<V> out;

	for(unsigned i{0}; i < index; ++i){
		out.push_back(table[i]);
	}
	for(unsigned i{index+1}; i < table.size(); ++i){
		out.push_back(table[i]);
	}

	return out;
}

std::vector<std::string> mergeFile(const std::string& filename);

#endif //HEADER_FUNCTIONS