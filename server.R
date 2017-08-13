#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
library(dplyr)
data(diamonds)
myData <- mutate(diamonds, log_price = log10(price), cube_carat = carat^(1/3))

shinyServer(function(input, output) {
    # transformations log10(price) and cube root of carat so they have a linear relationship 
    # so performing a linear regression is acceptable
    model <- lm(log_price ~ cube_carat + carat + cut + color + clarity, data = myData)
    
    model_pred <- reactive({
        caratInput <- input$carat
        cutInput <- input$cut
        colorInput <- input$color
        clarityInput <- input$clarity
        
        predict(model, newdata = data.frame(carat = caratInput, cube_carat = caratInput^(1/3), cut = cutInput,
                                            color = colorInput, clarity = clarityInput))
    })
    
    
    output$pred <- renderText({
        paste("$",signif(10^(model_pred()), digits = 5), sep = "")
    })
    
    output$plot <- renderPlot({
        caratInput <- input$carat
        ggplot(data = myData, aes(x = carat, y = price)) + geom_point(alpha = 0.1) + 
            geom_point(aes(x = caratInput, y = 10^model_pred()), color = "red", size = 5)
    })
  
})
