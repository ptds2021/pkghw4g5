library(shiny)
library(pkghw4g5) # REPLACE N BY YOUR GROUP NUMBER AND DELETE THIS COMMENT

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


?system.time
