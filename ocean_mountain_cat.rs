//first we need to create a mod
mod art_in_the_park {
    // now create a struct to define what will be part of our art in the park
    #[derive(Debug)]
    pub struct Artwork {
        artist: String,
        title: String,
        media: String,
        year: u16,
    }
    // define a function to add art pieces to the park
    pub fn add_artwork(artist: String, title: String, media: String, year: u16) -> Artwork {
        Artwork {
            artist,
            title,
            media,
            year,
        }
    }
    // define a function to remove art pieces from the park
    pub fn remove_artwork(artwork: Artwork) -> bool {
        // logic to delete art piece
        true
    }
    // define a function to get a list of art pieces in the park
    pub fn get_artworks() -> Vec<Artwork> {
        let artworks = vec![
            add_artwork(String::from("John Doe"),
                        String::from("Untitled"),
                        String::from("Oil on Canvas"),
                        2019),
            add_artwork(String::from("Jane Doe"),
                        String::from("Mindscapes"),
                        String::from("Oil on Canvas"),
                        2020),
            add_artwork(String::from("Bob Smith"),
                        String::from("Abstract #1"),
                        String::from("Acrylic on Canvas"),
                        2018)
        ];
        artworks
    }
    // define a function to print out the list of art pieces in the park
    pub fn print_artworks(artworks: &Vec<Artwork>) {
        for artwork in artworks {
            println!("[ Artist: {}, Title: {}, Media: {}, Year: {} ]",
                     artwork.artist, artwork.title, artwork.media, artwork.year);
        }
    }
    // define a function to search through the list of art pieces in the park
    pub fn search_artworks(artworks: &Vec<Artwork>, title: &str, year: u16) -> Option<&Artwork> {
        for artwork in artworks {
            if artwork.title == title && artwork.year == year {
                return Some(artwork);
            }
        }
        None
    }
}

fn main() {
    let mut artworks = art_in_the_park::get_artworks();
    println!("***CURRENT ART IN THE PARK***");
    art_in_the_park::print_artworks(&artworks);

    let new_artwork = art_in_the_park::add_artwork(String::from("Alice Smith"),
                                                  String::from("Elements of Nature"),
                                                  String::from("Painting on Wood"),
                                                  2020);
    artworks.push(new_artwork);
    println!("***UPDATED ART IN THE PARK***");
    art_in_the_park::print_artworks(&artworks);

    let search_result = art_in_the_park::search_artworks(&artworks, "Elements of Nature", 2020);
    if let Some(artwork) = search_result {
        println!("Found artwork: {:#?}", artwork);
    } else {
        println!("No artwork found!");
    }
}