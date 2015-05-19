library(shiny)
library(ggplot2)
library(dplyr)

## 方便讀檔案，不建議這樣寫
## the working directory is under your apps_names directory
# print(getwd())
load("../../data/ubikeweather_big5.rda")

shinyUI(navbarPage("NavbarPage Example",
  tabPanel("行政區",
    titlePanel("Navlist Panel Example"),
    selectInput(inputId='District', label='選我選我-行政區', choices=unique(ubike$sarea)),
    navlistPanel("Header Name",
               tabPanel("FirstTab:barplot",plotOutput('plot1')
               ),
               tabPanel("SecondTab:dataTable",
                        dataTableOutput(outputId="table")
               )
    )#navlistPanel
  )#tabPanel:行政區
)) #shinyUI,navarPage
 