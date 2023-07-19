#1: Create an object to store the data
events <- data.frame(
    Name = character(0),
    Date = character(0),
    Description = character(0)
    )

#2: Read in the data from a file
data <- read.csv("art_in_the_park_data.csv", header = TRUE)

#3: Append the data to the events object
events <- rbind(events, data)

#4: Add a column for the type of event
events$Type <- "Art in the Park"

#5: Create a plot of the events
ggplot(events, aes(x = Date, y = Name)) +
    geom_point(fill = "midnightblue")

#6: Add an interactive popup for each event
ggplotly(ggplot(events, aes(x = Date, y = Name)),
         tooltip = "Description")

#7: Change the view of the plot to monthly
ggplot(events, aes(x = Date, y = Name)) +
    geom_point(fill = "midnightblue") +
    scale_x_date(date_breaks = "month", date_labels = "%B") 

#8: Create a barplot of the events by month
ggplot(data = events, aes(x = Date, y = Name)) + 
    geom_bar(stat = "count") + 
    scale_x_date(date_breaks = "month", date_labels = "%B")

#9: Create a function to automate plotting
plot_events <- function(dataframe) {
    ggplot(dataframe, aes(x = Date, y = Name)) +
        geom_point(fill = "midnightblue") +
        scale_x_date(date_breaks = "month", date_labels = "%B") 
}

#10: Automate the plot
plot_events(events)

#11: Create an interactive plot
ggplotly(plot_events(events),
         tooltip = "Description")

#12: Add a color gradient to the points
ggplot(events, aes(x = Date, y = Name, color = Type)) +
    geom_point()

#13: Add a legend to the plot
ggplot(events, aes(x = Date, y = Name, color = Type)) +
    geom_point() +
    scale_color_manual(name = "Event Type",
                       values = c("midnightblue", "darkmagenta"), 
                       limits = c("Art in the Park", "Other"))

#14: Highlight upcoming events
events$upcoming <- ifelse(events$Date > Sys.Date(), 
                          1, 0)

#15: Create a custom color palette
custom_palette <- c("midnightblue", "darkmagenta", "forestgreen")

#16: Add an interactive layer
ggplotly(ggplot(events, aes(x = Date, y = Name, 
                             color = factor(upcoming))) +
         geom_point() +
         scale_color_manual(name = "Upcoming",
                            values = custom_palette,
                            labels = c("Not Upcoming",
                                       "Upcoming",
                                       "Currently Happening")),
         tooltip = "Description")

#17: Overlay the previous plot with a histogram
ggplot(events, aes(x = Date, y = Name, color = Type)) +
    geom_point() +
    geom_histogram(aes(x = Date, y = ..count..)) +
    scale_x_date(date_breaks = "month", date_labels = "%B")

#18: Add filter options to the plot
ggplot(events, aes(x = Date, y = Name)) +
    geom_point(aes(color = Type)) +
    facet_wrap(~ Type)  

#19: Create an interactive version of the plot
ggplotly(ggplot(events, aes(x = Date, y = Name)) +
         geom_point(aes(color = Type)) +
         facet_wrap(~ Type),
         tooltip = "Description")

#20: Add an area chart to the plot
ggplot(events, aes(x = Date, y = Name)) +
    geom_point(aes(color = Type)) +
    geom_area(aes(fill = Type)) +
    facet_wrap(~ Type)  

#21: Create a summary table
events_summary <- events %>%
    group_by(Type) %>%
    summarize(count = length(Name))

#22: Add labels and custom colors to the plot
ggplot(events, aes(x = Date, y = Name)) +
    geom_point(aes(color = Type)) +
    geom_area(aes(fill = Type)) +
    labs(fill = "Event Type") +
    scale_fill_manual(values = custom_palette,
                      limits = c("Art in the Park", "Other"))

#23: Add a summary table to the plot
ggplotly(ggplot(events, aes(x = Date, y = Name)) +
         geom_point(aes(color = Type)) +
         geom_area(aes(fill = Type)) +
         labs(fill = "Event Type") +
         scale_fill_manual(values = custom_palette,
                           limits = c("Art in the Park", "Other")),
         tooltip = "Description",
         dataTable = events_summary)

#24: Add a map to the plot
ggplot(data = events, aes(x = Longitude, y = Latitude)) +
    geom_point(size = 2, fill = "midnightblue") +
    coord_quickmap()

#25: Add an interactive layer to the map
ggplotly(ggplot(data = events, aes(x = Longitude, y = Latitude)) +
         geom_point(size = 2, fill = "midnightblue") +
         coord_quickmap(),
         tooltip = "Description")

#26: Add a timeline to the map
ggplot(data = events, aes(x = Date, y = Name)) +
    geom_point(fill = "midnightblue") +
    geom_timeline(aes(height = 0.2)) 

#27: Create an interactive timeline
ggplotly(ggplot(data = events, aes(x = Date, y = Name)) +
         geom_point(fill = "midnightblue") +
         geom_timeline(aes(height = 0.2)),
         tooltip = "Description")

#28: Add a map view to the timeline
mapview <- ggplot(data = events, aes(x = Longitude, y = Latitude)) +
    geom_point(size = 2, fill = "midnightblue") +
    coord_quickmap()

#29: Add the map view to the timeline
ggplotly(ggplot(data = events, aes(x = Date, y = Name)) +
         geom_point(fill = "midnightblue") +
         geom_timeline(aes(height = 0.2)) +
         mapview,
         tooltip = "Description")

#30: Create an animation of the timeline
ggplotly(ggplot(data = events, aes(x = Date, y = Name)) +
         geom_point(fill = "midnightblue") +
         geom_timeline(aes(height = 0.2)) +
         mapview,
         tooltip = "Description",
         animation_opts = list(frame = 0.2))

#31: Add an interactive layer to the animation
ggplotly(ggplot(data = events, aes(x = Date, y = Name)) +
         geom_point(fill = "midnightblue") +
         geom_timeline(aes(height = 0.2)) +
         mapview,
         tooltip = "Description",
         animation_opts = list(frame = 0.2,
                               mode = "immediate"))

#32: Add a storyboard to the plot
ggplotly(ggplot(data = events, aes(x = Date, y = Name)) +
         geom_point(fill = "midnightblue") +
         geom_timeline(aes(height = 0.2)) +
         mapview,
         tooltip = "Description",
         animation_opts = list(frame = 0.2,
                               mode = "immediate"),
         storyboard = "Type")

#33: Create an info graphic of the events
p <- ggplotly(ggplot(data = events, aes(x = Date, y = Type)) +
              geom_col())

#34: Create HTML tags
div_name_events <- tags$div(
    id = "name-events",
    style = "height:500px; width:400px; background-color:lightgray; border:2px solid #444;"
    )

#35: Add an image to the plot
events$image = paste0("images/", events$Name, ".png")

#36: Create a custom color palette
palette = c("midnightblue", "darkmagenta", "forestgreen", "black")

#37: Create HTML tags for the images
events$image_div <- tags$div(
    id = events$Name,
    style = paste0(
        "overflow:hidden; height:100px; width:100px; background-color:lightgray; border:2px solid #444; background-image:url('",
        events$image,
        "'); background-size:contain; background-repeat:no-repeat; padding:10px;"
    ),
    class = "img-div"
)

#38: Create a color vector
events$color <- palette[unlist(str_count(events$Description, "\\S+"))]

#39: Change the background color of the images based on the color vector
events$image_div <- tags$div(
    id = events$Name,
    style = paste0(
        "overflow:hidden; height:100px; width:100px; background-color:",
        events$color,
        "; border:2px solid #444; background-image:url('",
        events$image,
        "'); background-size:contain; background-repeat:no-repeat; padding:10px;"
    ),
    class = "img-div"
)

#40: Add the images to the plot
p$x$layout$annotations <- lapply(
    events$image_div,
    function(img) {
        list(
            x = events$Date[which(events$image_div == img)],
            y = events$Name[which(events$image_div == img)],
            xref = "x",
            yref = "y",
            text = HTML(img),
            showarrow = FALSE
        )
    }
)

#41: Add a subtitle to the plot
p$x$layout$title <- "Art in the Park Events"
p$x$layout$annotations <- list(
    list(
        x = 0.5,
        y = 1.05,
        text = "<b>Upcoming Events</b>",
        xref = "paper",
        yref = "paper",
        xanchor = "center",
        yanchor = "bottom",
        showarrow = FALSE
    )
)

#42: Add an interactive layer
p$x$layout$updatemenus <- list(
    list(
        y = 0.5,
        buttons = list(
            list(
                method = "restyle",
                args = list(
                    "colorscale",
                    list(
                        list(
                            0,
                            list(0.5, "magenta")
                        ),
                        list(
                            0.75,
                            list(1, "midnightblue")
                        )
                    )
                ),
                label = "Upcoming Events"
            ),
            list(
                method = "restyle",
                args = list(
                    "colorscale",
                    list(
                        list(
                            0,
                            list(0.5, "forestgreen")
                        ),
                        list(
                            0.75,
                            list(1, "black")
                        )
                    )
                ),
                label = "Currently Happening"
            ),
            list(
                method = "restyle",
                args = list(
                    "colorscale",
                    list(
                        list(
                            0,
                            list(0.5, "forestgreen")
                        ),
                        list(
                            0.75,
                            list(1, "midnightblue")
                        )
                    )
                ),
                label = "All Events"
            )
        )
    )
)

#43: Add a hover label
p <- p %>%
    layout(hoverlabel = list(namelength = -1))

#44: Add an animation
ggplotly(ggplot(data = events, aes(x = Date, y = Name)) +
         geom_point(fill = "midnightblue") +
         geom_timeline(aes(height = 0.2)) +
         mapview,
         tooltip = "Description",
         animation_opts = list(frame = 0.2,
                               mode = "immediate"),
         storyboard = "Type") %>%
    layout(hoverlabel = list(namelength = -1))

#45: Add a button to the plot
ggplotly(ggplot(data = events, aes(x = Date, y = Name)) +
         geom_point(fill = "midnightblue") +
         geom_timeline(aes(height = 0.2)) +
         mapview,
         tooltip = "Description",
         animation_opts = list(frame = 0.2,
                               mode = "immediate"),
         storyboard = "Type") %>%
    layout(hoverlabel = list(namelength = -1),
           updatemenus = list(list(
               type = 'buttons',
               active = 0,
               buttons = list(
                   list(
                       label = 'Play',
                       method = 'animate',
                       args = list(
                           NULL,
                           list(
                               frame = list(
                                   duration = 200,
                                   redraw = FALSE
                               ),
                               fromcurrent = TRUE,
                               transition = list(
                                   duration = 300,
                                   easing = 'quadratic-in-out'