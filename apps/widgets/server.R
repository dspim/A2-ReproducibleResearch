shinyServer(function(input, output) {
  
  # Action
  output$value_act <- renderPrint({ input$action })
  # Numeric Input
  output$value_num <- renderPrint({ input$num })
  # Text Input
  output$value_text <- renderPrint({ input$text })
  # Date selector
  output$value_date <- renderPrint({ input$date })
  # Date range selector
  output$value_dateRange <- renderPrint({ input$dates })
  
  # CheckGroup  
  output$value_check <- renderPrint({ input$checkGroup })
  # Radio
  output$value_rad <- renderPrint({ input$radio })
  # Select
  output$value_sel <- renderPrint({ input$select })
  
  # Slider Bar
  output$value_sli <- renderPrint({ input$slider1 })
  # Slider Range
  output$range <- renderPrint({ input$slider2 })

  
  
  

})