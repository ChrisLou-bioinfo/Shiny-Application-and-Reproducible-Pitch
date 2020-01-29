library(shiny)
library(colourpicker)
# Define UI for Fake Contacts Generator application
shinyUI(fluidPage(
        # Application title
        titlePanel("Volcano plot by jiacheng Lou"),
        
        # Left panel with control elements for Fake Contacts Generator

        sidebarLayout(sidebarPanel(
     
                                        
                                       numericInput("cutoff.foldchange",
                                                                   "Cutoff of Foldchange",
                                                                   value=1,min =0.585,max =10,step =0.5),
                                       numericInput("cutoff.padj",
                                                                   "Cutoff of Padj",
                                                                   value=0.01,min =0.0001,max =0.1,step =0.001),
                                       numericInput("xmax","Input Number of Xlim",value=10),
                                       numericInput("ymax","Input Number of Ylim",value=300),
                                       
                                       colourInput("col1", "Select colour", "Blue"),
                                       colourInput("col2", "Select colour", "Yellow"),
                                       colourInput("col3", "Select colour", "Red")),
                                       mainPanel(
                                       plotOutput(height = 500,"valcano"))
                
                
        )
))