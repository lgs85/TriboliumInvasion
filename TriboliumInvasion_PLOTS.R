library(ggplot2)
library(Rmisc)

s1 <- read.csv("Dispersal_selection.csv")

f1 <-
  ggplot(s1,
         aes(
           x = Generation,
           y = Dispersal,
           col = Treatment,
           fill = Treatment
         )) +
  geom_line() +
  geom_ribbon(aes(ymin = Dispersal - SE, ymax = Dispersal + SE),
              alpha = 0.2,
              lty = 0) +
  theme_classic() +
  theme(legend.position = "none")+
  annotate(geom = "text",x = c(6,9),y = c(0.75,0.15),label = c("High dispersal lines","Low dispersal lines"))+
  ylab ("Dispersal rate")


h1 <- read.csv("Dispersal_H2.csv")
h1$Cross <- paste(h1$Female, h1$Male, sep = " x ")

f2 <-
  ggplot(h1,
         aes(x = Cross, y = Dispersal)) +
  geom_errorbar(aes(ymax = Dispersal + SE, ymin = Dispersal - SE), width = 0.2) +
  geom_point() +
  theme_classic() +
  ylab ("Dispersal rate")

multiplot(f1, f2)
