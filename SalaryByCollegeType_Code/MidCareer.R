library(ggplot2)
library(dplyr)
# School Name,School Type,Starting Median Salary,Mid-Career Median Salary,Mid-Career 10th Percentile Salary,Mid-Career 25th Percentile Salary,Mid-Career 75th Percentile Salary,Mid-Career 90th Percentile Salary
data <- read.csv("salariescollegetype.csv", header = FALSE, sep = ";")


# convert salary to computable numbers
# Remove chars from a specific column
data$V4 <- gsub("$", "", data$V4) 
data$V4 <- gsub(",", "", data$V4) 
str(data$V4)
data$V4 <- as.numeric(as.character(data$V4))
data$V4[is.na(data$V4) | !is.finite(data$V4)] <- NA  # Set invalid entries to NA
  
# engineer mean for mid career
eng_total <- 0
column_name <- "V2"
target_value <- ",Engineering "

# find the row indices where the value occurs
matching_rows <- which(data[[column_name]] == target_value)

# count of engineering colleges
eng_count <- length(matching_rows)
print(eng_count)

# add total mid-career salaries
for (row in matching_rows) {
  salary <- data[row, "V4"]
  eng_total <- eng_total + salary
}
mean_eng_wage <- eng_total / eng_count
print(mean_eng_wage)


# liberal arts mean for mid career
lib_total <- 0
column_name <- "V2"
target_value <- ",Liberal Arts "

# find the row indices where the value occurs
matching_rows <- which(data[[column_name]] == target_value)

# count of liberal arts majors
lib_count <- length(matching_rows)
print(lib_count)

# add total mid-career salaries
for (row in matching_rows) {
  salary <- data[row, "V4"]
  lib_total <- lib_total + salary
}
mean_lib_wage <- lib_total / lib_count
print(mean_lib_wage)


# party mean for mid career
party_total <- 0
column_name <- "V2"
target_value <- ",Party "

# find the row indices where the value occurs
matching_rows <- which(data[[column_name]] == target_value)

# count of liberal arts colleges
party_count <- length(matching_rows)
print(party_count)

# add total mid-career salaries
for (row in matching_rows) {
  salary <- data[row, "V4"]
  party_total <- party_total + salary
}
mean_party_wage <- party_total / party_count
print(mean_party_wage)


# party mean for mid career
party_total <- 0
column_name <- "V2"
target_value <- ",Party "

# find the row indices where the value occurs
matching_rows <- which(data[[column_name]] == target_value)

# count of party colleges
party_count <- length(matching_rows)
print(party_count)

# add total mid-career salaries
for (row in matching_rows) {
  salary <- data[row, "V4"]
  party_total <- party_total + salary
}
mean_party_wage <- party_total / party_count
print(mean_party_wage)


# state mean for mid career
state_total <- 0
column_name <- "V2"
target_value <- ",State "

# find the row indices where the value occurs
matching_rows <- which(data[[column_name]] == target_value)

# count of state colleges
state_count <- length(matching_rows)
print(state_count)

# add total mid-career salaries
for (row in matching_rows) {
  salary <- data[row, "V4"]
  state_total <- state_total + salary
}
mean_state_wage <- state_total / state_count
print(mean_state_wage)


# ivy league mean for mid career
ivy_total <- 0
column_name <- "V2"
target_value <- ",Ivy League "

# find the row indices where the value occurs
matching_rows <- which(data[[column_name]] == target_value)

# count of ivy league colleges
ivy_count <- length(matching_rows)
print(ivy_count)

# add total mid-career salaries
for (row in matching_rows) {
  salary <- data[row, "V4"]
  ivy_total <- ivy_total + salary
}
mean_ivy_wage <- ivy_total / ivy_count
print(mean_ivy_wage)

eng <- mean_eng_wage
print(eng)

# Install and load necessary packages
install.packages("ggplot2")
library(ggplot2)

data_mid_career <- data.frame(
  college = c("Engineering", "Liberal Arts", "Ivy League", "Party", "State"),
  salary = c(mean_eng_wage, mean_lib_wage, mean_ivy_wage, mean_party_wage, mean_state_wage),
  color = c("blue", "orange", "red", "purple","darkgreen")
) 

ggplot(data_mid_career, aes(x = college, y=salary, fill = color)) +
  geom_bar(stat = "identity", width = 0.6) +
  theme(axis.text.x = element_text(size = 8), 
        axis.text.y = element_text(size = 10),
        legend.key.size = unit(0.3, "cm")) +
  labs(title = "Mid-Career Median Salary by School Type", x = "College Type", y = "Salary") +
  scale_fill_manual(values = c("blue", "darkgreen","red","purple", "orange"),
                    labels = c("Engineering", "State", "Liberal Arts", "Party", "Ivy League"))






'''
# Assuming you have already calculated median_wage
# Create a bar chart
ggplot(median_wage, aes(x = `data$V2`, y = median_wage)) +
  geom_bar(stat = "identity") +
  labs(title = "Median Wage by School Category", x = "School Category", y = "Median Wage")


college <- data["V3"]
print(college)

ggplot(data, aes(x = V2, y=V3)) +
  geom_bar(stat = "identity", width = 0.5, linewidth = 1000) +
  #coord_fixed(ratio = 0.000001) +
  theme(axis.text.x = element_text(angle = 270, hjust = 0, size = 2), 
        axis.text.y = element_text( size = 2)) +
  labs(
    title = "Starting Median Salary by School Name",
    x = "School Name",
    y = "Starting Median Salary"
  )

ggplot(data, aes(x = V2, y=V3)) +
  geom_bar(stat = "identity", width = 0.3, size = 100) +
  #coord_fixed(ratio = 5) +
  theme(axis.text.x = element_text(angle = 270, hjust = 0, size = 8), 
        axis.text.y = element_text(hjust = 0, size = 8)) +
  coord_cartesian(ylim = c(0, 1000)) +
  #scale_y_discrete(position = "top", expand = c(0, 1)) +
  labs(
    title = "Starting Median Salary by College Type",
    x = "College Type",
    y = "Starting Median Salary"
  )

'''


