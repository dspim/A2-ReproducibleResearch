library(shiny);library(ggplot2);library(dplyr)
load("../../data/ubikeweather_big5.rda")
shinyServer(function(input, output) { 
  output$plot1 <- renderPlot({
    bike.p <- ggplot(data = filter(ubike, sarea == input$District), 
                     aes(x = reorder(sna, -avg.bemp), y = avg.bemp, colour = sna, fill = sna))
    bike.p + geom_bar(stat="identity") + coord_flip()
  })
})