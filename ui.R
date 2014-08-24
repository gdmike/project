library(shiny)

# Define the overall UI
shinyUI(
    
    # Use a fluid Bootstrap layout
    fluidPage(    
        
        # Give the page a title
        h3("Fine Particulate Matter Pollution for Select U.S. Cities: 1999 - 2008"),
        
        # Generate a row with a sidebar
        sidebarLayout(      
            
            # Define the sidebar with one input
            sidebarPanel(
                helpText("Select a city to see the Pollution Emissions for that city.  Use the checkbox to show pollution specifically from
                          vehicle Emissions in the selected city.  The results will be displayed in the graph on the right."),
                hr(),
                
                selectInput("region", "Select A City:", 
                            choices=c("Los Angeles" = "6037","Philly" ="42101","Charleston"="45019", "Baltimore"="24510")),
                
                hr(),
                checkboxGroupInput("checkBox", "Show just Vehicle related pollution?",
                                   c("Vehicles Only" = "1"))
                                     
                                     
                
               
            ),
            
            # Create a spot for the barplot
            mainPanel(
                plotOutput("pollPlot"),
                br(),
                h5('This data is provided by the US Environmental Protection Agency. Additional information is available at the'),
                a("EPA Web Site", href="http://www.epa.gov/ttn/chief/eiinformation.html")

            )
            
        )
    )
)
