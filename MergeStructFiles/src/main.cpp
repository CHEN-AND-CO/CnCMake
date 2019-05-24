#include "functions.hpp"

int main(int argc, char **argv){
	std::string fromFileName, toFileName;

	if(argc < 2){
		std::cout << "From : ";
		std::cin >> fromFileName;
		std::cout << "To : ";
		std::cin >> toFileName;
		std::cout << std::endl;
	} else {
		fromFileName = argv[0];
		toFileName = argv[1];
	}

	std::ofstream writer;

	auto lines = mergeFile(fromFileName);
	writer.open(toFileName.c_str());
	for(auto& line : lines){
		writer << line << std::endl;
	}
	writer.close();

	return 0;
}
