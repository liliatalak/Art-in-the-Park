package main

import (
	"fmt"
	"log"
	"time"
)

func main() {
	// Program to organize an art show in a park
	fmt.Println("Welcome to 'Art in the Park'!")

	// Get input from user on how many artists will be participating
	var artists int
	fmt.Print("Please enter the number of artists: ")
	_, err := fmt.Scan(&artists)
	if err != nil {
		log.Fatal(err)
	}

	// Get input from user on the park name
	var parkName string
	fmt.Print("Please enter the park name: ")
	_, err = fmt.Scan(&parkName)
	if err != nil {
		log.Fatal(err)
	}

	// Get input from user on the event name
	var eventName string
	fmt.Print("Please enter the event name: ")
	_, err = fmt.Scan(&eventName)
	if err != nil {
		log.Fatal(err)
	}

	// Get input from the user on the start date
	var startDate string
	fmt.Print("Please enter the start date (in YYYY-MM-DD format): ")
	_, err = fmt.Scan(&startDate)
	if err != nil {
		log.Fatal(err)
	}

	// Get input from the user on the end date
	var endDate string
	fmt.Print("Please enter the end date (in YYYY-MM-DD format): ")
	_, err = fmt.Scan(&endDate)
	if err != nil {
		log.Fatal(err)
	}

	// Check if the start and end dates are valid
	start, err := time.Parse("2006-01-02", startDate)
	if err != nil {
		log.Fatal(err)
	}
	end, err := time.Parse("2006-01-02", endDate)
	if err != nil {
		log.Fatal(err)
	}
	if end.Before(start) {
		log.Fatal("The end date must be after the start date.")
	}

	// Print a summary of the event
	fmt.Println("----------------------------")
	fmt.Println("Event Summary:")
	fmt.Printf("Name: %s\nPark: %s\nStart: %s\nEnd: %s\nNumber of Artists: %d\n", eventName, parkName, start.Format("2006-01-02"), end.Format("2006-01-02"), artists)
	fmt.Println("----------------------------")

	// Create a map for artist names and contact information
	var artistMap = make(map[string]string)

	// Get the artist information from the user
	for i := 0; i < artists; i++ {
		fmt.Printf("Please enter information for artist %d:\n", i+1)
		// Get input from user on the artist name
		var artistName string
		fmt.Print("Name: ")
		_, err = fmt.Scan(&artistName)
		if err != nil {
			log.Fatal(err)
		}
		// Get input from user on the artist email address
		var artistEmail string
		fmt.Print("Email address: ")
		_, err = fmt.Scan(&artistEmail)
		if err != nil {
			log.Fatal(err)
		}
		// Add the artist to the map
		artistMap[artistName] = artistEmail
	}

	// Print the artist information
	fmt.Println("----------------------------")
	fmt.Println("Artist Information:")
	for name, email := range artistMap {
		fmt.Printf("Name: %s | Email: %s\n", name, email)
	}
	fmt.Println("----------------------------")

	// Get input from user on the event description
	var description string
	fmt.Print("Please enter a description of the event: ")
	_, err = fmt.Scan(&description)
	if err != nil {
		log.Fatal(err)
	}

	// Print confirmation message
	fmt.Println("----------------------------")
	fmt.Printf("Your event %s in %s has been successfully created!\n", eventName, parkName)
	fmt.Println("----------------------------")
}