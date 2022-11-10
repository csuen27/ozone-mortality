#install.packages('Matrix')
#install.packages('metafor')
#install.packages('meta')
library(Matrix)
library(metafor)
library(meta)

setwd("/csuen27/Meta-analysis")

## Here we use RRs for all-cause mortality as a tutorial example
## Import information from all studies: 
data <- read.csv("all-cause(all).csv", header = TRUE)

## This imported csv file should contain lists as: 
## 1) labels for each "study" (e.g. Authors and year); and
## 2) the metric- and unit-unified RR values; 
## 3) with upper bound (UB) or lower bound (LB) of 95% CI. 

yi   <- log(data$RR) 
seTE <- (log(data$UB)-log(data$RR))/1.96 

m.o3mort <- metagen(TE = yi,seTE = seTE,data = data,
                    studlab = paste(study),
                    comb.fixed = FALSE,
                    comb.random = TRUE,
                    method.tau = "DL", # choose "HS" for limited studies 
                    hakn = FALSE,
                    prediction = FALSE,
                    sm = "RR")
m.o3mort # display the results

forest(m.o3mort, digits = 3) # display the forest plot

## Funnel plot by trim-and-fill method:
yi   <- log(data$RR) 
seTE <- (log(data$UB)-log(data$RR))/1.96 
res <- rma(yi, seTE, data = data, measure="RR")
taf <- trimfill(res)
funnel(taf, legend=TRUE, digits = 2)
