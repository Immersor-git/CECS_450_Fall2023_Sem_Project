library(ggplot2)
library(readr)
library(reshape)

print("Running-----")

sim <- read.csv("C:/Users/Productivity/Documents/GitHub/CECS_450_Fall2023_Sem_Project/CSV Files/File Cleaning/clean_salaryIncreaseByMajor.csv",header = 1, sep = " ")
sim[,-1] <- lapply(sim[,-1], function(x) as.numeric(gsub("[$,]", "", x)))
View(sim)

print(typeof(sim$Starting_Median_Salary[[2]]))
#`Percent_change_from_Starting_to_Mid_Career_Salary`
print(
ggplot(data = sim, aes(y = `Undergraduate_Major`, x = `Starting_Median_Salary`)) + geom_bar(stat = "identity") + scale_x_continuous(expand = c(0,0), limits = c(0,100000))
)

to_plot <- data.frame(x = sim$`Undergraduate_Major`, y2 = sim$`Starting_Median_Salary`, y1 = sim$`Mid_Career_Median_Salary`)
melted <- melt(to_plot,id="x")

print(
  ggplot(data = melted, aes(y = x, x = value, fill = variable)) + 
    geom_bar(stat = "identity", position = "identity", alpha = ) + 
    scale_x_continuous(expand = c(0,0), limits = c(0,150000))
)

df1 <- data.frame(
  Ch = c(5, 6, 4, 3, 8),
  V = c("x1", "x1", "x2", "x3", "x2")
)

#ggplot(df1, aes(x=`V`, y = `ch`)) +
#  geom_bar(stat = "identity") + coord_flip()
#print(plot)

print("Done!")