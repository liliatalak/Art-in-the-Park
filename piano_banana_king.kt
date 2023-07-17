fun main(args: Array<String>) {

    // Initialize the variables to be used
    var totalAttendees = 0
    var artists = 0
    var exhibitors = 0
    var vendors = 0
    var performances = 0
    var activities = 0

    // Welcome statement
    println("Welcome to Art in the Park!")

    // Ask user for number of attendees
    println("Please enter the number of attendees:")
    totalAttendees = readLine()!!.toInt()

    // Calculate the split of attendees between artists, exhibitors, vendors, performers, and activities
    artists = totalAttendees * 0.4
    exhibitors = totalAttendees * 0.2
    vendors = totalAttendees * 0.2
    performances = totalAttendees * 0.1
    activities = totalAttendees * 0.1

    // Output the results
    println("The estimated attendance forArt in the Park is $totalAttendees people.")
    println("This includes $artists artists, $exhibitors exhibitors, $vendors vendors, $performances performers, and $activities activities.")

    // Ask user for type of event
    println("Please enter the type of event:")
    val eventType = readLine()!!.toString()

    // Ask user for number of vendors
    println("Please enter the number of vendors:")
    val numVendors = readLine()!!.toInt()

    // Ask user for number of performances
    println("Please enter the number of performances:")
    val numPerformances = readLine()!!.toInt()

    // Ask user for number of activities
    println("Please enter the number of activities:")
    val numActivities = readLine()!!.toInt()

    // Calculate number of artists and exhibitors based on vendor, performance, and activity totals
    val numArtists = (numVendors + numPerformances + numActivities) * 0.75
    val numExhibitors = totalAttendees - (numArtists + numVendors + numPerformances + numActivities)

    // Output the results
    println("For a $eventType event, there will be $numArtists artists, $numExhibitors exhibitors, $numVendors vendors, $numPerformances performances, and $numActivities activities.")

    // Ask user for event location
    println("Please enter the location of the event:")
    val eventLocation = readLine()!!.toString()

    // Ask user for event dates
    println("Please enter the start and end dates of the event:")
    val eventStartDate = readLine()!!.toString()
    val eventEndDate = readLine()!!.toString()

    // Output event information to user
    println("The $eventType event will be held at $eventLocation from $eventStartDate to $eventEndDate.")
    println("It will have $numArtists artists, $numExhibitors exhibitors, $numVendors vendors, $numPerformances performances, and $numActivities activities.")

}