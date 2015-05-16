shinyUI(fluidPage(
  titlePanel("Widgets"),

  fluidRow(
    column(5,wellPanel(
      # an action button
      actionButton(inputId = "action", label = h4("Action Button"),icon=NULL),
      verbatimTextOutput("value_act"),
      hr(),
      # a number input box
      numericInput("num", label = h4("Numeric input"), value = 1),
      verbatimTextOutput("value_num"),
      hr(),
      # a text input box
      textInput("text", label = h4("Text input"), value = "Enter text..."),
      verbatimTextOutput("value_text"),
      hr(),
      # a date selector 
      dateInput("date", label = h4("Date input"), value = as.Date(Sys.time()),language="zh-TW"),
      verbatimTextOutput("value_date"),
      hr(),
      # a date range selector #Default
      dateRangeInput("dates", label = h4("Date range"),separator = "to"),
      verbatimTextOutput("value_dateRange")
    )),
    column(3,wellPanel(
      # a group of checkboxes
      checkboxGroupInput("checkGroup", label = h4("Checkbox group"), 
        choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
        selected = NULL),
      verbatimTextOutput("value_check"),
      hr(),
      # an radio button
      radioButtons("radio", label = h4("Radio buttons"),
                   choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), 
                   selected = 1),
      verbatimTextOutput("value_rad"),
      hr(),
      # a select box 
      selectInput("select", label = h4("Select box"), 
                  choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), 
                  selected = NULL, multiple=FALSE), 
      verbatimTextOutput("value_sel"),
      hr()
    )),
    column(3,wellPanel(
      # a slider bar 
      sliderInput("slider1", label = h4("Slider"), min = 0, 
                  max = 100, value = 50),
      hr(),
      verbatimTextOutput("value_sli"),
      # a slider range 
      sliderInput("slider2", label = h4("Slider Range"), min = 0, 
                  max = 100, value = c(40, 60)),
      hr(),
      verbatimTextOutput("range"),
      hr()
    ))
  ),
  
  fluidRow(
    column(3,wellPanel(
      a(href = "http://shiny.rstudio.com/gallery/file-upload.html", "FileUpload-Example"),
      a(href = "http://shiny.rstudio.com/gallery/file-download.html","FileDownload-Example")
    )),
    column(3,wellPanel(
    ))
  )
  
  #verticalLayout(
  #)
))



