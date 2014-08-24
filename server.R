library(shiny)
library(ggplot2)

## Read in the data for the cities to be compared

cityData<<-read.csv("cityData.csv")
x<-read.csv("vehIDs.csv")
vehIDs<<-as.vector(x[,1])



library(datasets)

# Define a server for the Shiny app
shinyServer(function(input, output) {
    
    # Fill in the spot we created for a plot
    output$pollPlot <- renderPlot({

        
        toPlot<-cityData[cityData$fips==input$region,]
        if (!is.null(input$checkBox)){
            toPlot<-toPlot[toPlot$SCC %in% vehIDs,]

        }
    
    
        plotSums<- (rowsum(toPlot$Emissions,group=toPlot$year))
        plotSums<-data.frame(c("1999","2002","2005","2008"),plotSums)
        colnames(plotSums)<-c("Year", "Emissions")
        qplot(Year, Emissions, data = plotSums)
        
        
        
    })
})
