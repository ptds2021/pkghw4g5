library(shiny)

ui <- shinyUI(fluidPage(

    titlePanel("Area Estimation"),

    sidebarLayout(

        sidebarPanel(

            numericInput(inputId = "seed",
                         label = "Select Seed Value",
                         value = 1),

            sliderInput(inputId = "B",
                        label = "Select Number of Simulations",
                        min = 1,
                        max = 1000000,
                        value = 5000)

        ),

        mainPanel(

            plotOutput(outputId = "plot"),

            textOutput(outputId = "time"),

            textOutput(outputId = "area")
        )
    )
))




