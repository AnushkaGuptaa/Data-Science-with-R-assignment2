#############q1
# Load the iris dataset
data(iris)

# Side-by-side boxplots of continuous variables by Species
par(mfrow = c(1, 2))
boxplot(Sepal.Length ~ Species, data = iris, main = "Sepal Length by Species")
boxplot(Petal.Length ~ Species, data = iris, main = "Petal Length by Species")

# Scatterplot of Sepal.Length against Petal.Length, colored by Species
plot(Petal.Length ~ Sepal.Length, data = iris, col = iris$Species, pch = 16,
     main = "Scatterplot of Sepal Length vs Petal Length",
     xlab = "Sepal Length", ylab = "Petal Length")
legend("topright", legend = levels(iris$Species), col = 1:3, pch = 16)










################q2
library(imager)

flip <- function(image) {
  width <- dim(image)[2]
  flipped_image <- cbind(image[, width:1, drop = FALSE])
  return(flipped_image)
}









#######################q3
install.packages("MASS")
library(MASS)

data(ships)


barplot(table(ships$type), 
        main = "Number of Accidents by Ship Type",
        xlab = "Ship Type",
        ylab = "Number of Accidents")








#################q4
library(rvest)
questions<- read_html("https://stats.stackexchange.com/questions?tab=Votes")%>%
  html_nodes('h3')%>%
  html_nodes('a')%>%
  html_text()

views<- read_html("https://stats.stackexchange.com/questions?tab=Votes")%>%
  html_elements('span.s-post-summary--stats-item-number') %>% html_text() 




answers<- read_html("https://stats.stackexchange.com/questions?tab=Votes")%>%
  html_elements('span.s-post-summary--stats-item-number') %>% html_attr('title')%>%  html_text()




votes<- read_html("https://stats.stackexchange.com/questions?tab=Votes")%>%
  html_elements('span.s-post-summary--stats-item s-post-summary--stats-item__emphasized') %>% html_attr('title')%>% html_text()%>% as.numeric() 

scraped <- data.frame(
  The_title_of_the_questions= questions, 
  The_number_of_views= views, 
  The_number_of_answers = answers, 
  The_votes=votes,
  
)



################q5
#solution - On the first day, there are 100 whole tablets and zero half-tablets, so we can,t pull half tablet. On the second day, there are 99 wholes and 1 half,so half tablet pulling chance will be 1/100. On the third day there are two halves and 98 wholes,chance of pulling half =(99/100)*(2/100). (The 99/100 is the probability that we didn’t pull first half the day before.) On the fourth day there are three halves and 97 wholes, probabilty of half tablet is (99/100)*(98/100)*(3/100). On the fifth day it’s (99/100)*(98/100)*(97/100)*(4/100). And so on.
#summation n=2 to 100 (99!/(99-(n-2))!)*(n(n-1)/100^(n-1))
#which gives 13 days approximately




