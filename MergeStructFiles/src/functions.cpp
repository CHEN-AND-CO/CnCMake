#include "functions.hpp"

std::vector<std::string> split(std::string in, std::string c){
	std::vector<std::string> out;
	size_t pos{0};

	while((pos = in.find(c)) != std::string::npos){
		out.push_back(in.substr(0, pos));
		in = in.substr(pos+c.size(), in.size());
	}

	if(in.size()){
		out.push_back(in.substr(0, in.size()));
	}

	return out;
}

std::vector<std::string> mergeFile(const std::string& filename){
	std::vector<std::string> out, lines;
	std::ifstream reader;

	reader.open(filename.c_str());
	{
		std::string line;
		while(getline(reader, line)){
			lines.push_back(line);
		}
	}
	reader.close();

	auto temp = split(filename, "/");
	auto path = implode(rewrite(temp, temp.size()-1), "/");

	for(size_t i{0}; i < lines.size(); ++i){
		auto& line = lines[i];
		if(line.find("\\\\include") != std::string::npos){
			auto file = split(line, "\\\\include ")[1];

			auto filelines = mergeFile(path + "/" + file);

			for(auto& fileline : filelines){
				out.push_back(fileline);
			}
		} else {
			out.push_back(line);
		}
	}

	return out;
}
