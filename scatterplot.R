# Title     : TODO
# Objective : TODO
# Created by: david
# Created on: 22/10/2020

# Library
library(ggplot2)
library(hrbrthemes)

# Create dummy data
data <- data.frame(
  cond = rep(c("condition_1", "condition_2"), each=10),
  my_x = 1:100 + rnorm(100,sd=9),
  my_y = 1:100 + rnorm(100,sd=16)
)

# Basic scatter plot.
p1 <- ggplot(data, aes(x=my_x, y=my_y)) +
  geom_point( color="#69b3a2") +
  theme_bw()

# with linear trend
p2 <- ggplot(data, aes(x=my_x, y=my_y)) +
  geom_point() +
  geom_smooth(method=lm , color="red", se=FALSE) +
  theme_bw()

# linear trend + confidence interval
p3 <- ggplot(data, aes(x=my_x, y=my_y)) +
  geom_point() +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) +
  theme_bw()