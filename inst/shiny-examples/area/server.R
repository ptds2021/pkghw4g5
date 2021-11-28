library(shiny)
library(pkghw4g5)

server <- shinyServer(function(input, output) {

    simulate <- reactive({
       estimate_area(input$B, input$seed)
    })

    output$plot <- renderPlot({
       plot_area(simulate())
    })

    output$time <- renderText({
        time_taken  <- system.time(estimate_area(input$B, input$seed))[3]
        time_taken <- round(time_taken, digits = 3)
        paste("The estimated time taken to compute the result in second was :"
              , time_taken)
    })

    output$area <- renderText({
       area_otp <- simulate()$estimated_area
       paste("The estimated area is :", area_otp)
    })

})

shinyApp(ui = ui, server = server)
