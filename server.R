
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(ggplot2)
library(gridExtra)
source('stick_breaking_construction.R',echo=FALSE)

shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
     
    # use the stick-breaking construction to create samples of Dirichlet process
    
    data_list = list()
    plist = list()
    for (i in 1:input$num_its)
    {
      weights = stick_breaking_process(input$num_probs, input$alpha0)
      piece = as.factor(seq(from=1,to=input$num_probs))
      data_list[[i]] = data.frame(weights=weights,piece=piece)
      title = paste("Iteration #",i,sep="")
      plist[[i]] = ggplot(data_list[[i]], aes(x=piece,y=weights), geom="blank")+geom_bar(stat="identity")+labs(x="Piece",y="Probability")+labs(title=title)
    }
        
  nCol = floor(sqrt(input$num_its))
  main = paste("Realizations of Stick-Breaking Process with alpha =",input$alpha0)
  do.call("grid.arrange", c(plist, ncol=nCol,main=main))

  })
  
})
