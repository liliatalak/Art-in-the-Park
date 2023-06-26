#include <stdio.h>

//Declare global variables
int numArtists;
int numGuests;
char *artistNames[50];
char *guestNames[250];

//Create a function to prompt user for artist names
void getArtistNames(){
    printf("Please enter the number of artists participating: \n");
    scanf("%d", &numArtists);
    for(int i = 0; i < numArtists; i++){
        printf("Please enter the name of artist #%d: \n", (i + 1));
        scanf("%s", &artistNames[i]);
    }
}

//Create a function to prompt user for guest names
void getGuestNames(){
    printf("Please enter the number of guests attending: \n");
    scanf("%d", &numGuests);
    for(int i = 0; i < numGuests; i++){
        printf("Please enter the name of guest #%d: \n", (i + 1));
        scanf("%s", &guestNames[i]);
    }
}

//Create a function to print the list of artist names
void printArtistNames(){
    printf("The list of artists for the 'Art in the Park' event is: \n");
    printf("======================================================= \n");
    for(int i = 0; i < numArtists; i++){
        printf("%s \n", artistNames[i]);
    }
    printf("======================================================= \n");
}

//Create a function to print the list of guest names
void printGuestNames(){
    printf("The list of guests for the 'Art in the Park' event is: \n");
    printf("======================================================= \n");
    for(int i = 0; i < numGuests; i++){
        printf("%s \n", guestNames[i]);
    }
    printf("======================================================= \n");
}

//Function to print all artist and guest names
void printAllNames(){
    printf("The full list of participants for the 'Art in the Park' event is: \n");
    printf("======================================================= \n");
    printf("ARTISTS: \n");
    for(int i = 0; i < numArtists; i++){
        printf("%s \n", artistNames[i]);
    }
    printf("GUESTS: \n");
    for(int i = 0; i < numGuests; i++){
        printf("%s \n", guestNames[i]);
    }
    printf("======================================================= \n");
}

//Main function
int main(){
    //Call the functions to prompt for user input
    getArtistNames();
    getGuestNames();
    
    //Call the functions to print the artist and guest lists
    printArtistNames();
    printGuestNames();
    printAllNames();
    
    return 0;
}