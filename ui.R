#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Diamond Appraisal"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("carat",
                   "Carats:",
                   min = 0.2,
                   max = 5.01,
                   value = 0.2,
                   step = 0.01),
       selectInput("cut",
                   "Cut Quality:",
                   choices = c("Fair", "Good", "Very Good", "Premium", "Ideal")),
       selectInput("color",
                   "Diamond Color from J (worst) to D (best):",
                   choices = c("D", "E", "F", "G", "H", "I", "J")),
       selectInput("clarity",
                   "Diamond Clarity from I1 (worst) to IF (best):",
                   choices = c("I1",  "SI2", "SI1", "VS2", "VS1", "VVS2", "VVS1", "IF"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        tabsetPanel(
            tabPanel("Documentation", p("This is an application that will give a prediction 
                                        for the price of a diamond (in USD) based on the 'diamonds' dataset from the
                                        UsingR package. I've chosen Carat, Cut, Color, and Clarity as the parameters
                                        since they appear to be the most significant in relation to price."),
                     p("Simply select a measurement for each option and the app will generate the predicted price of
                       such a diamond. A plot of the dataset (Carat vs Price) can also be viewed that shows the location
                       of the predicted diamond in relation to those from the dataset.")),
            tabPanel("Plot", plotOutput("plot"), h3("Predicted Price:"), textOutput("pred"))

        )
    )
  )
))
