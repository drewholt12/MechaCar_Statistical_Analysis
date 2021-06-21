#load dplyr package
library(dplyr)
#read csv
mpg_table <- read.csv(file='MechaCar_mpg.csv', check.names=F,stringsAsFactors = F)
#check linear model syntax
lm(vehicle_length ~ mpg,mpg_table)
#perform linear regression on all columns against dataframe
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mpg_table)
#perform summary
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mpg_table))
#load tidyverse
library(tidyverse)
# convert suspension_coil.csv to dataframe
coil_table<- read.csv(file='Suspension_Coil.csv', check.names=F,stringsAsFactors=F)
#summarize PSI column for mean, median, variance, and standard deviation
total_summary <- coil_table %>% summarize(mean_PSI = mean(PSI), median_PSI = median(PSI), variance_PSI = var(PSI), STDEV_PSI = sd(PSI, na.rm =FALSE))
#group by PSI and summarize PSI column for mean, median, variance, and standard deviation
lot_summary <- coil_table %>% group_by(Manufacturing_Lot)%>% summarize(mean_PSI = mean(PSI), median_PSI = median(PSI), variance_PSI = var(PSI), STDEV_PSI = sd(PSI, na.rm =FALSE))
#Use T-test to check for statistical difference of each lot from the mean PSI
t.test((coil_table$PSI), mu=1500)
#3 scripts of t.test to compare all 3 lots individually to the mean
#Lot 1 t.test
t.test((subset(coil_table, Manufacturing_Lot=="Lot1")$PSI), mu=1500)
#Lot 2 t.test
t.test((subset(coil_table, Manufacturing_Lot=="Lot2")$PSI), mu=1500)
#Lot 3 t.test
t.test((subset(coil_table, Manufacturing_Lot=="Lot3")$PSI), mu=1500)
