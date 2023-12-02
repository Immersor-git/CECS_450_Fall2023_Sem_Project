library(ggplot2)

#barplot starting median salary no color 
ggplot(data = degreespb, aes(x = `Undergraduate Major`, y = `Starting Median Salary`)) +
  geom_bar(stat = "identity")

#barplot starting median salary no color vertical x axis 
ggplot(data = degreespb, aes(x = `Undergraduate Major`, y = `Starting Median Salary`)) + 
  geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

#starting at 30,000
#Create the plot
ggplot(data = degreespb, aes(x = `Undergraduate Major`, y = AdjustedSalary)) + 
  geom_bar(stat = "identity") +
  scale_y_continuous(breaks = seq(0, 46000, by = 2000), labels = seq(30000, 76000, by = 2000)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

##green code 
# Create the plot with conditional coloring
ggplot(data = degreespb, aes(x = `Undergraduate Major`, y = AdjustedSalary, fill = SalaryRange)) + 
  +     geom_bar(stat = "identity") +
  +     scale_fill_manual(values = c("Under 35k" = "#adebad", "35k-50k" = "#5cd65c", "50k-65k" = "#33cc33", "65k-70k" = "#248f24", "Over 70k" = "#145214")) +
  +     scale_y_continuous(breaks = seq(0, 46000, by = 2000), labels = seq(30000, 76000, by = 2000)) +
  +     theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

# Create the plot with more distinct coloring
 ggplot(data = degreespb, aes(x = `Undergraduate Major`, y = AdjustedSalary, fill = SalaryRange)) + 
  +     geom_bar(stat = "identity") +
  +     scale_fill_manual(values = c("Under 35k" = "#d9f2d9",   # Very light green for "Under 35k"
                                     +                                  "35k-50k" = "#85e085",    # Medium light green for "35k-50k"
                                     +                                  "50k-65k" = "#339933",    # Medium dark green for "50k-65k"
                                     +                                  "65k-70k" = "#267326",    # Dark green for "65k-70k"
                                     +                                  "Over 70k" = "#0d4d0d")) + # Very dark green for "Over 70k"
  +     scale_y_continuous(breaks = seq(0, 46000, by = 2000), labels = seq(30000, 76000, by = 2000)) +
  +     theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
 
 # Create a new column for coloring condition
 degreespb$Color <- ifelse(degreespb$`Starting Median Salary` <= 35000, "Below or Equal to 35k", "Above 35k")
 
 # Create the plot with conditional coloring
 ggplot(data = degreespb, aes(x = `Undergraduate Major`, y = `Starting Median Salary`, fill = Color)) + 
   geom_bar(stat = "identity") +
   scale_fill_manual(values = c("Below or Equal to 35k" = "red", "Above 35k" = "grey")) +
   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
 
 # Reorder 'Undergraduate Major' based on the median of 'Starting Median Salary'
 degreespb$`Undergraduate Major` <- reorder(degreespb$`Undergraduate Major`, degreespb$`Starting Median Salary`, FUN = median)
 
 # Create the ggplot
 ggplot(data = degreespb, aes(x = `Undergraduate Major`, y = `Starting Median Salary`)) +
   geom_bar(stat = "identity", fill = "green") +
   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
 
 
 # Count the number of unique undergraduate majors
 number_of_majors <- length(unique(degreespb$`Undergraduate Major`))
 
 # Print the result
 number_of_majors
 
 