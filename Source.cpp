#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main()
{
	ofstream myFile("OneBitTwoBtPredictorInputs.txt");
	if (myFile.is_open())
	{
		int i, j, c = 0;
		//r_branch_id <= 1; r_action <= '1'; wait for 10 ns;
		//r_action <= '1'; wait for 10 ns;
		for (i = 0; i < 1000; i++)
		{
			myFile << "1 0" << endl;
			for (j = 0; j < 4; j++)
			{
				myFile << "2 0" << endl;
				c++;
			}
			myFile << "2 1" << endl;
		}
		myFile << "1 1" << endl;
	}
	return 0;
}