library(shiny)
library(ggplot2)
library(dplyr)

# library(data.table)
# ubike <- fread("data/ubikeweatherbig5.csv", 
#                showProgress = interactive(), data.table = FALSE)
# save(ubike,file="data/ubikeweather_big5.rda")

## the working directory is under your apps_names directory
# print(getwd())
load("../../data/ubikeweather_big5.rda")
## sbi:車輛數, bemp:空位數, max.anemo:最大風速

shinyServer(function(input, output, session) { 
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    filter(ubike,sarea == input$District)
  })
  output$plot1 <- renderPlot({
    bike.p <- ggplot(data = selectedData(), 
                      aes(x = reorder(sna, -avg.bemp), y = avg.bemp, colour = sna, fill = sna)) 
    bike.p + geom_bar(stat="identity", width=0.5) + coord_flip()
    # geom_text can't using chinese text
    })
  output$table <- renderDataTable(selectedData())  
})


