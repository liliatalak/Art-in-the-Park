#include <iostream> 
#include <string> 
#include <cmath> 

using namespace std; 

//Function to check for the existence of art in the park
bool isArtInPark(int hei, int wid) 
{
	if(hei < 0 || wid < 0) 
		return false; 
		
	if(sqrt(hei*hei + wid*wid) > 15) 
		return true; 
	else 
		return false; 
}

int main() 
{
	string name; 
	int hei, wid; 
	
	//Prompt the user to enter their name
	cout << "Please enter your name: "; 
	getline(cin, name); 
	
	//Request the user to input the dimensions of the art piece
	cout << "Please enter the height and width of the art pieces: "; 
	cin >> hei >> wid; 
	
	//Check if the art is within the park boundary
	if(isArtInPark(hei, wid)) 
		cout << name << ", the art is in the park." << endl;
	else 
		cout << name << ", the art is not in the park." << endl; 
	
	return 0; 
}

//Function to display the menu for Art in the Park
void displayMenu() 
{
	cout << "Menu\n" 
		 << "1) Display all art in the park \n"
		 << "2) Purchase an art piece \n"
		 << "3) Exit \n"
		 << "Please enter your selection: "; 
}

//Function to allow the user to purchase an art piece
void purchaseArt() 
{
	string name; 
	int hei, wid; 
	
	//Prompt the user to enter their name
	cout << "Please enter your name: "; 
	getline(cin, name); 
	
	//Request the user to input the dimensions of the art piece
	cout << "Please enter the height and width of the art pieces: "; 
	cin >> hei >> wid; 
	
	//Check if the art is within the park boundary
	if(isArtInPark(hei, wid)) 
		cout << name << ", your art purchase is successful. Enjoy your art!" << endl;
	else 
		cout << name << ", the art piece is not within the park boundary. Your purchase cannot be completed." << endl; 
}

//Function to display all art in the park
void displayAllArt() 
{
	//Open the file containing the art pieces
	ifstream artPieces; 
	artPieces.open("artPieces.txt"); 
	
	int hei, wid; 
	
	if(artPieces.is_open()) 
	{
		//Loop through the file to display all art pieces
		while(artPieces >> hei >> wid) 
		{
			if(isArtInPark(hei, wid)) 
			{
				cout << "Height: " << hei << " Width: " << wid << endl; 
			}
			else 
			{
				cout << "Invalid art piece!" << endl; 
			}
		}
	}
	else 
	{
		cout << "Failed to open file!" << endl; 
	}
	
	//Close the file
	artPieces.close(); 
}

//Function control user interactions
void runProgram() 
{
	//Declare the variables 
	int choice; 
	
	//Loop to provide user interaction with the menu
	do 
	{
		//Display the menu
		displayMenu(); 
		
		//Get the user's choice
		cin >> choice; 
		
		//Take appropriate action based on the user's choice
		switch(choice) 
		{
			case 1: 
				displayAllArt(); 
				break;
			case 2: 
				purchaseArt(); 
				break;
			case 3: 
				cout << "Thank you for visiting Art in the Park. Come back soon!" << endl; 
				break;
			default: 
				cout << "Invalid choice!" << endl; 
				break;		
		}
	} while(choice != 3);
}

int main() 
{
	runProgram(); 
	
	return 0; 
}