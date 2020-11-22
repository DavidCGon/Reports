# Title     : TODO
# Objective : TODO
# Created by: david
# Created on: 22/10/2020

# load library
library(ggplot2)

# Create test data.
data <- data.frame(
  category=c("A", "B", "C","D","E"),
  count=c(20, 50, 30,15,35)
)

# Compute percentages
data$fraction <- data$count / sum(data$count)

# Compute the cumulative percentages (top of each rectangle)
data$ymax <- cumsum(data$fraction)

# Compute the bottom of each rectangle
data$ymin <- c(0, head(data$ymax, n=-1))

# Compute label position
data$labelPosition <- (data$ymax + data$ymin) / 2

# Compute a good label
data$label <- paste0(data$category,"\n percentil"," ",data$count)

# Make the plot
ggplot(data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=category)) +
  geom_rect() +
  geom_text( x=2, aes(y=labelPosition, label=label, color=category), size=3.5) + # x here controls label position (inner / outer)
  scale_fill_brewer(palette=2) +
  scale_color_brewer(palette=2) +
  coord_polar(theta="y") +
  xlim(c(-1, 4)) +
  theme_void() +
  theme(legend.position = "none")

