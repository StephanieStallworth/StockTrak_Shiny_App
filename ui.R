#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

shinyUI(fluidPage(theme =shinytheme("simplex"),
        headerPanel("StockTrak"),
        sidebarPanel(
                textInput("symb", "Ticker Symbol", "GOOG"),
                dateRangeInput("dates", 
                               "Date Range",
                               start = "2014-03-27", 
                               end = as.character(Sys.Date())),
                helpText("Input stock symbol (example: GOOG, AAPL, SBUX) and dates to see stock performance over time"),
                        submitButton('Get Stock')),
        mainPanel(
                plotOutput('newHist'),
                h4("Statistical Summary"),
                verbatimTextOutput("summary"),
                
                h4("Observations"),
                tableOutput("view")
        )
        ))