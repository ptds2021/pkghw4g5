library(shiny)
library(pkghw4g5)

shinyServer(function(input, output) {

    simulate <- reactive({
       estimate_area(input$B, input$seed)
    })

    output$plot <- renderPlot({
       plot_area(simulate())
    })

    output$time <- renderText({
       system.time(simulate())
    })

    output$area <- renderText({
       simulate()$estimated_area
    })

})


