Diamond Appraisal App
========================================================
author: Thomas Glucksman
date: 08/13/17
autosize: true

Course Project
========================================================

This Shiny app was created for the Developing Data Products course from Coursera's Data Science Specialization. 
The goals of this project are:
- To demonstrate the use of Shiny to build web applications
- Create a reproducible pitch for the application

The App: Diamond Appraisal
========================================================
This application utilizes the <code>diamonds</code> dataset from the <code>UsingR</code> package to predict the price of a diamond
described by a chosen set of parameters. 

All the user must do is input the appropriate values for each parameter and the app will output the estimated cost of such a diamond.


Prediction
========================================================
This code block shows the model and prediction I use to estimate price.
The relevant parameters chosen are:
- Carat
- Cut Quality
- Color
- Price

Price and Carat require transformations to make the primary relationship linear so regression can be performed.

```r
model <- lm(log_price ~ cube_carat + carat + cut + color + clarity, data = myData)

predict(model, newdata = data.frame(carat = caratInput, cube_carat = caratInput^(1/3), cut = cutInput,
                                            color = colorInput, clarity = clarityInput))
```

Plot of Untransformed vs Transformed Data
========================================================
![plot of chunk unnamed-chunk-2](pitch-figure/unnamed-chunk-2-1.png)

The app
========================================================
The source code can be located at: https://github.com/gluckt/Developing-Data-Products-Course-Project

The app itself is hosted here: https://gluckt.shinyapps.io/diamondapp/
