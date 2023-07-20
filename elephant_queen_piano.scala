/*
	Art in the Park
	A program in Scala to display and interact with art in a park
*/

//import statements
import scala.collection.mutable.ArrayBuffer

// define classes
class Park (name: String, location: String)

class Art(title: String, medium: String, parkName: String)

// create a works array buffer
val works = ArrayBuffer[Art]()

// define method to add art to works array
def addArt(title: String, medium: String, parkName: String) = {
	val art = new Art(title, medium, parkName)
	works += art
}

// define method to remove art from works array
def removeArt(title: String) = {
	val index = works.indexWhere(x => x.title == title)
	if (index >= 0) works.remove(index)
}

// define a method to display all art in the park
def displayArtByPark(parkName: String) = {
	println("The following art is in " + parkName + " park:")
	for (art <- works) {
		if (art.parkName == parkName) {
			println(art.title + " (" + art.medium + ")")
		}
	}
}

// define a method to interact with a particular work of art
def interactWithArt(title: String) = {
	val art = works.find(x => x.title == title)
	art match {
		case Some(art) => println("You are interacting with " + art.title + " (" + art.medium + ")")
		case None => println("No art found with that title.")
	}
}

// define a method to list all works of art in a particular park
def listArtInPark(parkName: String): ArrayBuffer[Art] = {
	val artList = for (art <- works if art.parkName == parkName) yield art
	artList
}

// create an instance of the Park class
val centralPark = new Park("Central Park", "New York City")

// add some art to the works array buffer
addArt("The Arrival of Spring", "Sculpture", "Central Park")
addArt("Path of Reflections", "Sculpture", "Central Park")
addArt("Portrait of a Young Man", "Painting", "Central Park")

// display all art in Central Park
displayArtByPark("Central Park")

// interact with "Portrait of a Young Man"
interactWithArt("Portrait of a Young Man")

// list all works of art in Central Park
val artWorks = listArtInPark("Central Park")
println("List of art in Central Park:")
for (art <- artWorks) {
	println(art.title + " (" + art.medium + ")")
}

// remove "Path of Reflections" from works array buffer
removeArt("Path of Reflections")

// display remaining artworks in Central Park
println("Remaining artworks in Central Park:")
for (art <- works) {
	if (art.parkName == "Central Park") {
		println(art.title + " (" + art.medium + ")")
	}
}