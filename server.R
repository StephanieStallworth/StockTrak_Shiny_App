#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(quantmod)
library(shiny)

shinyServer(
        function(input, output) {
                datasetInput <- reactive({
                        getSymbols(input$symb, src = "google", 
                                   from = input$dates[1],
                                   to = input$dates[2],
                                   auto.assign = FALSE)
                })
                output$newHist <- renderPlot({
                        candleChart(datasetInput(),
                                    theme=chartTheme('white',up.col='dark blue',dn.col='red'),TA=c(addBBands()))
                        addMACD() 
                })
                # Generate a summary of the dataset
                output$summary <- renderPrint({
                        dataset <- datasetInput()
                        summary(dataset)
                }) 
                # Show the first "n" observations
                output$view <- renderTable({
                        head(datasetInput(), n = 10)
                })
        })