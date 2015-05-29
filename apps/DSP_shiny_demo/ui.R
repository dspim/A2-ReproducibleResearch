
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # 是個標題
  titlePanel("Toiletries & Cleaners"),


  # 在Sidebar放進checkbox和畫"model"從server.R回傳的圖
  sidebarLayout(
    sidebarPanel(
      
      checkboxGroupInput('store', 'Columns in diamonds to show:',
                         c("H1","S1","T1"), selected = c("H1","S1","T1")),
      plotOutput("model")
    ),
    

    mainPanel(
  # 在這裡放slider bar
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 365,
                  value = c(1,365),
                  step=1,
                  width=800,
                  format="## Days"
      ),
# 放distPlot從server.R回傳的圖
      plotOutput("distPlot")
      
    )
  )
))
