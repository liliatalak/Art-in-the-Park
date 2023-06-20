//import the necessary packages
import java.util.Scanner 
import scala.collection.mutable.ListBuffer

//declare a list to store the different types of art
var artTypes : List[String] = List("sculpture", "painting", "photography", "film", "installation", "performance")

//create a mutable list for storing the works of art
var artPieces = ListBuffer[String]()

//create a scanner object to read user input
val scanner = new Scanner(System.in)

//main method
def main(): Unit = {

  //Welcome message
  println("Welcome to Art in the Park!")

  //display list of art types
  showArtTypes()

  //prompt user to choose an art type
  println("Choose an art type you would like to explore:")
  val choice = scanner.nextLine()

  //validate user input
  if(artTypes.contains(choice)) {

    //show list of available art pieces
    showArtPieces(choice)
 
    //prompt user to select an art piece
    println("Choose an art piece you would like to explore:")
    val selection = scanner.nextLine()

    //validate user input
    if(artPieces.contains(selection)) {
   
      //display information about the selected art piece 
      showArtPieceInfo(selection)
   
    } else {
   
      //invalid selection message
      println("Sorry, that is an invalid selection. Please try again.")
   
    }

  } else {

    //invalid choice message
    println("Sorry, that is an invalid choice. Please try again.")

  }

}

//helper method to display the list of art types
def showArtTypes(): Unit = {
  println("Here is a list of art types available in the park:")
  println(artTypes.mkString(", "))
}

//helper method to display the list of art pieces in the selected art type
def showArtPieces(choice: String): Unit = {
  println("Here are the pieces of " + choice + " in the park:")
  println(artPieces.mkString(", "))
}

//helper method to display information about the selected art piece
def showArtPieceInfo(selection: String): Unit = {
  println("Here is the information about the selected art piece:")
  //retrieve information and display
}

//call main method
main()