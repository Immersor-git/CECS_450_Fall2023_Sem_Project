library(ggplot2)
library(dplyr)
# School Name,School Type,Starting Median Salary,starting-Career Median Salary,starting-Career 10th Percentile Salary,starting-Career 25th Percentile Salary,starting-Career 75th Percentile Salary,starting-Career 90th Percentile Salary
file_path <- ("/Users/sarahsantos/CECS_450_Fall2023_Sem_Project/SalaryByCollegeType_Code/salariescollegetype.csv")
data <- read.csv(file_path, header = FALSE, sep = ";")
#subdata <- subset(data, V1 >= 1 & V1 <= 50)


# convert salary to computable numbers
# Remove chars from a specific column
data$V3 <- gsub("$", "", data$V3) 
data$V3 <- gsub(",", "", data$V3) 
str(data$V3)
#data$V2 <- as.character(data$V2)
#data$V3 <- as.character(data$V3)
#data$V3 <- as.double(data$V3)
# Convert the character column to numeric, handling invalid entries
data$V3 <- as.numeric(as.character(data$V3))
data$V3[is.na(data$V3) | !is.finite(data$V3)] <- NA  # Set invalid entries to NA

# engineer mean for starting career
eng_total <- 0
column_name <- "V2"
target_value <- ",Engineering "

# find the row indices where the value occurs
matching_rows <- which(data[[column_name]] == target_value)

# count of engineering colleges
eng_count <- length(matching_rows)
print(eng_count)

# add total starting-career salaries
for (row in matching_rows) {
  salary <- data[row, "V3"]
  eng_total <- eng_total + salary
}
mean_eng_wage <- eng_total / eng_count
print(mean_eng_wage)


# liberal arts mean for starting career
lib_total <- 0
column_name <- "V2"
target_value <- ",Liberal Arts "

# find the row indices where the value occurs
matching_rows <- which(data[[column_name]] == target_value)

# count of liberal arts majors
lib_count <- length(matching_rows)
print(lib_count)

# add total starting-career salaries
for (row in matching_rows) {
  salary <- data[row, "V3"]
  lib_total <- lib_total + salary
}
mean_lib_wage <- lib_total / lib_count
print(mean_lib_wage)


# party mean for starting career
party_total <- 0
column_name <- "V2"
target_value <- ",Party "

# find the row indices where the value occurs
matching_rows <- which(data[[column_name]] == target_value)

# count of liberal arts colleges
party_count <- length(matching_rows)
print(party_count)

# add total starting-career salaries
for (row in matching_rows) {
  salary <- data[row, "V3"]
  party_total <- party_total + salary
}
mean_party_wage <- party_total / party_count
print(mean_party_wage)


# party mean for starting career
party_total <- 0
column_name <- "V2"
target_value <- ",Party "

# find the row indices where the value occurs
matching_rows <- which(data[[column_name]] == target_value)

# count of party colleges
party_count <- length(matching_rows)
print(party_count)

# add total starting-career salaries
for (row in matching_rows) {
  salary <- data[row, "V3"]
  party_total <- party_total + salary
}
mean_party_wage <- party_total / party_count
print(mean_party_wage)


# state mean for starting career
state_total <- 0
column_name <- "V2"
target_value <- ",State "

# find the row indices where the value occurs
matching_rows <- which(data[[column_name]] == target_value)

# count of state colleges
state_count <- length(matching_rows)
print(state_count)

# add total starting-career salaries
for (row in matching_rows) {
  salary <- data[row, "V3"]
  state_total <- state_total + salary
}
mean_state_wage <- state_total / state_count
print(mean_state_wage)


# ivy league mean for starting career
ivy_total <- 0
column_name <- "V2"
target_value <- ",Ivy League "

# find the row indices where the value occurs
matching_rows <- which(data[[column_name]] == target_value)

# count of ivy league colleges
ivy_count <- length(matching_rows)
print(ivy_count)

# add total starting-career salaries
for (row in matching_rows) {
  salary <- data[row, "V3"]
  ivy_total <- ivy_total + salary
}
mean_ivy_wage <- ivy_total / ivy_count
print(mean_ivy_wage)

eng <- mean_eng_wage
print(eng)

data_starting_career <- data.frame(
  college = c("Engineering", "Liberal Arts", "Ivy League", "Party", "State"),
  salary = c(mean_eng_wage, mean_lib_wage, mean_ivy_wage, mean_party_wage, mean_state_wage),
  color = c("blue", "orange", "red", "purple","darkgreen")
) 

ggplot(data_starting_career, aes(x = college, y=salary, fill = color)) +
  geom_bar(stat = "identity", width = 0.6) +
  theme(axis.text.x = element_text(size = 8), 
        axis.text.y = element_text(size = 10),
        legend.key.size = unit(0.3, "cm")) +
  labs(title = "Starting-Career Median Salary by School Type", x = "College Type", y = "Salary") +
  scale_fill_manual(values = c("blue", "darkgreen","red","purple", "orange"),
                    labels = c("Engineering", "State", "Liberal Arts", "Party", "Ivy League"))
