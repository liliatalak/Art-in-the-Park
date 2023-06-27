// art_in_the_park.rs

// Dependencies 
use std::fmt;

// Structs 
struct Art {
    name: String,
    year: u16,
    size: (u16, u16),
    media: String,
}

struct Park {
    name: String,
    location: (f32, f32),
    art: Vec<Art>,
}

// Implementations 
impl fmt::Display for Art {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f,
               "The artwork '{}' was created in {}, is {} ft x {} ft, and is a {}.",
               self.name,
               self.year,
               self.size.0,
               self.size.1,
               self.media
        )
    }
}

impl fmt::Display for Park {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let mut list = String::from("");

        for art in &self.art {
            list.push_str(&format!("{}\n\n", art));
        }
                
        write!(f,
               "'{}' is located at ({}, {}) and has the following artwork:\n{}",
               self.name, 
               self.location.0, 
               self.location.1, 
               list,
        )
    }
}

// Main 
fn main() {
    let sunset_park = Park {
        name: String::from("Sunset Park"),
        location: (40.6782, 73.9921),
        art: vec![
            Art {
                name: String::from("Mountain View"),
                year: 1996,
                size: (8, 10),
                media: String::from("paint on canvas"),
            },
            Art {
                name: String::from("Blue Ocean"),
                year: 2004,
                size: (4, 8),
                media: String::from("acrylic on paper"),
            },
        ],
    };

    println!("{}", sunset_park);
}