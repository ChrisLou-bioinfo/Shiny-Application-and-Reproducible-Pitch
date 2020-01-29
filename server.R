#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
#Volcano

shinyServer(function(input, output) {
Volcano.plot<-reactive({

        logFCcut<-input$cutoff.foldchange
        padjcut<-input$cutoff.padj
        xmax<-input$xmax
        ymax<-input$ymax
        gene<-input$selgeneV
        selgenerow<-input$VoldataTable_rows_selected
        Vol.data<-read.csv("VolResult-3.csv",header = T)
        mypal_V <- c(input$col1,input$col2,input$col3)
        p<-ggplot(data = Vol.data, aes(x = Log2FoldChange,y = -log10(Padj), color = change, label = SYMBOL)) + 
                        geom_point(alpha = 0.8, size = 1) + 
                        xlim(-xmax, xmax) +
                        ylim(0,ymax) +
                        theme_bw(base_size = 18) + 
                        geom_vline(xintercept = logFCcut, color = "grey40", linetype = "longdash", size = 0.5) + 
                        geom_vline(xintercept = -logFCcut, color = "grey40", linetype = "longdash", size = 0.5) + 
                        geom_hline(yintercept = -log10(padjcut), color = "grey40", linetype = "longdash", size = 0.5) + 
                        scale_color_manual(name = "", values = mypal_V, limits = c("DOWN", "NOT", "UP"))
                

                p
                
         
        
        })
output$valcano<-renderPlot({Volcano.plot()})
})
#volcano


