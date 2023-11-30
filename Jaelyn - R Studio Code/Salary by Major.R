#barplot starting median salary no color 
ggplot(data = degreespb, aes(x = `Undergraduate Major`, y = `Starting Median Salary`)) +
  +     geom_bar(stat = "identity")

#barplot starting median salary no color vertical x axis 
ggplot(data = degreespb, aes(x = `Undergraduate Major`, y = `Starting Median Salary`)) +
  +     geom_bar(stat = "identity") +
  +     theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))