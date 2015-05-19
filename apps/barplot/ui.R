library(shiny);library(ggplot2);library(dplyr)
load("../../data/ubikeweather_big5.rda")
shinyUI(fluidPage(
  titlePanel("barplot Example"),
  sidebarPanel(
    selectInput(inputId='District', label='選我選我-行政區', choices=unique(ubike$sarea))
  ),
  mainPanel(plotOutput(outputId="plot1"))
))
