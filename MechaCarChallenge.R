# deliverable one
# import dplyr package
library(tidyverse)

# import MechaCar_mpg.csv as a dataframe
mecha_df <- read.csv(file = 'resources/MechaCar_mpg.csv', header = TRUE)

# perform linear regression
linear_mecha <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_df)
summary(linear_mecha)

# deliverable two
# import Suspension_Coil.csv as a dataframe
suspension_df <- read.csv(file = 'resources/Suspension_Coil.csv', header = TRUE)

# create a total and by lot summary table
total_summary <- suspension_df %>% summarise(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
lot_summary <- suspension_df %>% group_by(Manufacturing_Lot) %>% summarise(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

# deliverable three
# all lot t-test
t.test(suspension_df$PSI,mu = 1500)

# lot 1 t-test
t.test(subset(suspension_df,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)

# lot 2 t-test
t.test(subset(suspension_df,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)

# lot 3 t-test
t.test(subset(suspension_df,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)
