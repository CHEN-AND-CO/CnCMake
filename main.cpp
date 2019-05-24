#include "functions.hpp"

int main(int argc, char *argv[]){
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

	auto lines = mergeFile(fromFileName);
	std::ofstream writer{toFileName};

	if(writer){
		for(auto& line : lines){
			writer << line << std::endl;
		}

    	return EXIT_SUCCESS;
	} else {
		return EXIT_FAILURE;
	}
}