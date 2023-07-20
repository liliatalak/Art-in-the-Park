package main

import "fmt"

func main() {
	// Declare a variable to store the name of the event
	eventName := "Art in the Park"

	// Initialize a slice to store information about each artist
	artists := []string{
		"John Doe: Abstract Paintings",
		"Jane Doe: Caricatures",
		"Sam Smith: Photographs",
		"Jill Johnson: Pottery",
		"Billy Bob: Wood carvings",
	}

	// Print out a message to introduce the event
	fmt.Printf("Welcome to %s!\n", eventName)

	// Iterate through the artists slice and print out information about each one
	for _, artist := range artists {
		fmt.Println(artist)
	}

	// Declare a variable to store the number of artists
	numArtists := len(artists)

	// Print out a message letting attendees know how many artists to expect
	fmt.Printf("You can expect to see art from %d artists today!\n", numArtists)

	// Declare a variable for the start time of the event
	eventStartTime := "10am"

	// Print out a message to remind attendees when the event starts
	fmt.Printf("%s starts at %s, so don't be late!\n", eventName, eventStartTime)

	// Store a map of additional event information
	eventInfo := map[string]string{
		"location":    "Central Park",
		"date":        "June 10th",
		"weather":     "sunny and mild",
		"attendance":  "1000+",
		"food":        "concessions stand and food trucks",
		"restroom":    "portable toilets at the entrance",
		"registration": "free",
	}

	// Print out event information
	fmt.Println("\nAdditional Event Information:")
	for key, value := range eventInfo {
		fmt.Printf("%s: %s\n", key, value)
	}

	// Declare a variable to store the event end time
	eventEndTime := "5pm"

	// Print out a message to let attendees know when the event ends
	fmt.Printf("Don't forget, %s ends at %s!\n", eventName, eventEndTime)

	// Create a slice to store information about different art mediums
	artMediums := []string{
		"painting",
		"drawing",
		"sculpture",
		"photography",
		"mixed media",
		"ceramics",
	}

	// Print out a message about the different art mediums to expect
	fmt.Printf("At %s, you can expect to find a wide variety of art mediums, including %s.\n", eventName, artMediums)

	// Print out a message thanking attendees for coming
	fmt.Printf("\nThank you for coming to %s! We hope you have a great time!\n", eventName)
}