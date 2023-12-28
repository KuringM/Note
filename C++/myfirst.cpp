#include <iostream>                        // a preprocessor directive
int main()                                 // function header
{                                          // start of function body
	using namespace std;                     // mark definitions visible, lazy approach, all names available
  /* make ** available
	using std::cout;
	using std::endl;
	using std::cin;
	*/
	cout << "Come up and C++ me some time.\n"; // message; \n means start a new line
	cout << endl;                              // start a new line
	cout << "You won't regret it!" << endl;    // more output

	int carrots;                               // declare an integer variable
	carrots = 25;                              // assign a value to the variable
	carrots -= 1;                              // modify the variable
	return 0;                                  // terminate main()
}                                            // end of function body
