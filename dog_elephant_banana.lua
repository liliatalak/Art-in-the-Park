-- Art in the Park --

-- set up global variables 
local artworks = {}
local currentArtwork = nil

-- define helper functions
local function displayArtworkInfo ()
	-- display info about the currently selected artwork
	print("Artwork Name: " .. currentArtwork.name)
	print("Artist Name: " .. currentArtwork.artistName)
	print("Location: " .. currentArtwork.location)
	print("Description: " .. currentArtwork.description)
end

local function displayArtworkList ()
	-- display the list of available artworks
	local i = 1
	for artworkName, artwork in pairs(artworks) do
		print(i .. ". " .. artworkName)
		i = i + 1
	end
	print("")
end

local function selectArtwork ()
	-- select the artwork from the list
	print("Please enter the name of the artwork you would like to view.")
	local artworkName = io.read ()
	
	if artworks[artworkName] then
		currentArtwork = artworks[artworkName]
	else
		print("This artwork does not exist. Please try again.")
		selectArtwork ()
	end
end

-- main loop
while true do
	-- display the list of available artworks
	displayArtworkList ()
	
	-- select the artwork to view
	selectArtwork ()
	
	-- display info about the artwork
	displayArtworkInfo ()
	
	-- prompt the user to continue
	print("Would you like to view another artwork? (y/n)")
	local response = io.read ()
	
	if response == "n" then
		break
	end
end