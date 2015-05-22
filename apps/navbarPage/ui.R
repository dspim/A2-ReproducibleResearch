library(shiny)
library(ggplot2)
library(dplyr)

## 方便讀檔案，不建議這樣寫
## the working directory is under your apps_names directory
# print(getwd())
load("ubikeweather_utf8.rda")

shinyUI(navbarPage("NavbarPage Example",
  tabPanel("District(sarena)",
    titlePanel("Navlist Panel Example"),
    selectInput(inputId='District', label='district', choices=unique(ubike$sarea)),
    navlistPanel("Header Name",
               tabPanel("FirstTab:barplot",plotOutput('plot1')
               ),
               tabPanel("SecondTab:dataTable",
                        dataTableOutput(outputId="table")
               )
    )#navlistPanel
  )#tabPanel:行政區
)) #shinyUI,navarPage
 