
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Stick-Breaking Construction"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    tags$head( tags$script(src="https://cdn.mathjax.org/mathjax/2.0-latest/MathJax.js?config=TeX-AMS_HTML") ),
    sliderInput("alpha0", 
                "Concentration Parameter (\\( \\alpha \\)): ", 
                min = 0.1, 
                max = 10, 
                value = 1),
    sliderInput("num_probs", 
                "Number of Pieces", 
                min = 1, 
                max = 20, 
                value = 10),
    sliderInput("num_its",
                "Number of Iterations",
                min = 1,
                max = 10,
                value = 4)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
))
