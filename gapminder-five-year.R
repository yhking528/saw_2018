getwd()
setwd("/Users/Una/scw_2018/intro_R")
# everthing after the hastag will be ignored

cats <- 10 # cats <- 9 
cats <-9
x
X
G43
4g <-5
# avoid these as variable names

# 6 main Data types are 
# Characters 'agsdf' 
# integers
# complex
# logical
# numeric

class(cats) # characterization
typeof(cats)

# interger 
i <- 2L
j <- 2

# complex 
k <- 1 + 41
# Logical
TRUE FALSE

i <- 2L
j <- 2
class(i)
typeof(i)

# Data Structures 

# Atomic vector: 
logical_vector <- c(TRUE, TRUE, FALSE, TRUE)
class(logical_vector)
char_vec <- ("Lori", "Updendra", "Chris")
char_vec <- c("Lori", "Updendra", "Chris")
class(char_vec)
length(char_vec)
anyNA(char_vec)
mixed <- c("TRUE", TRUE)
class(mixed)
anohtermixed <- c(FALSE, 2L)
anothermixed <- c(3.14, 2L)
class(anothermixed)
anothermixed <- c("Stanford", FALSE, 2L, 3.14)
class(anothermixed)
# List
mylist <- list(chars = 'coffee', nums = c(1.4,5), logicals = TURE, anotherlist =list(a = 'a', b = 2))
mylist <- list(chars = 'coffee', nums = c(1.4,5), logicals = TRUE, anotherlist = list(a = 'a',b=2))
mylist
char_vec[2]
mylist[2]
class(mylist)
str(mylist)
mylist[3]
mylist$logicals
mylist$nums
# matrix
m <- matrix(nrow = 2, ncol = 3)
class(m)
m
m <- matrix( data = 1:6, nrow=2, ncol=3)
m
m <- matrix(data=1:6, nrow=2, ncol=3, byrow = TRUE)
m
# Dataframes
df <- data.frame( id= letters [1:10], x=1:10, y=11:20)
df
str(df)
class(df)
typeof(df)
head(df)
tail(df)
dim(df)
names(df)
summary(df)

# Factor 
state <- factor(c("Arizona", "California", "Mass"))
state
state <- factor(c("AX","CA", "CA"))
state
# now state have 2 levels in this factor 
nlevels(state)
levels(state)

ratings <- factor(c("low", "high","medium","low"))
ratings

r <- c("low","high","medium","low")
ratings <- factor(r)
ratings <- fatctor(ratings, levels -c("low", "medium","high"), ordered = TRUE)
ratings                   
min(ratings)
ratings
min(ratings)

survey <- data.frame(number =c(1,2,2,1,2), group =c ("A","B", "A","A","B" ))
survey

Exercise <- data.frame(Day = c(1,2,3,4,5), Magnification =c(2, 10, 5, 2, 5), Observation =c("Growth", "Death", "No Change", "Death", "Growth"))
Exercise
Exercise 2 <- data.frame(Day = 1:5, Magnification =c(2, 10, 5, 2, 5), Observation =c("Growth", "Death", "No Change", "Death", "Growth"))

# Import in Data
gapminder <- read.csv(gapminder-FiveYearData.csv.webarchive)
getwd
getwd()
gapminder <- read.csv("gapminder-FiveYearData.csv.webarchive")
getwd()
gapminder <- read.csv("gapminder-FiveYearData.csv")
gapminder[10:15, 5:6]
gapminder[10:15, c("lifeExp", "gdpPercap")]
gapminder[gapminder$country == 'Gabon']
gapminder[10:15, 5:6]
gapminder[541:550, gapminder$country == "Gabon"]


install.packages("dplyr")
library(dplyr)
#this is a pipe %>%

select(gapminder, lifeExp, gdpPercap)

gapminder %>% select(lifeExp, gdpPercap)

gapminder %>% filter(lifeExp > 71)

gapminder %>% 
  select(year, country, gdpPercap) %>%
  filter(country == "Mexico") %>%
  head()
gapminder[10:15, c("lifeExp", "gdpPercap")]
gapminder[gapminder$country == "Gabon"]

View(Mexico)
gapminder %>% 
  select(year, country, continent, gdpPercap) %>%
  filter(gapminder$year > 1980)
gapminder %>% 
  select(year,country, continent, gdpPercap) %>%
  filter(gapminder$year > 1980, gapminder$continent == Europe)
gapminder %>% 
  select(year,country, continent, gdpPercap) %>%
  filter(gapminder$year > 1980, gapminder$continent == "Europe")

# boolean operatior & == "And", | == "OR"

EU_gdp <- gapminder %>% filter (year > 1980 & continent == "Europe")%>% 
                           select(country, gdpPercap)
View(EU_gdp)
summary(gapminder)
gapminder %>% group_by(country) %>% tally()

# Use of arrage function in dplyr
gapminder %>% group_by(country) %>% summarise(avg = mean(pop), std = sd(pop), total = n())
names(gapminder)
gapminder %>% group_by(country) %>% summarise(avg=mean(pop), std = sd(pop), total=n()) %>% arrange(avg)

gapminder %>% group_by(country) %>% summarise(avg=mean(pop), std = sd(pop), total=n()) %>% 
  arrange(desc(avg))

# Mutate

gapminder_mod <- gapminder
gapminder_mod <- gapminder %>% mutate(GDP = pop * gdpPercap) 

# Calculate the average life expectancy per country. Which nation has the longest average life expectancy and which has the shortest average life expectancy? 
gapminder %>% group_by(country) %>% summarise(avglif= mean(lifeExp)) %>% 
  arrange (desc(avglif)) %>% tail()
gapminder %>% group_by(country) %>% summarise(avglif= mean(lifeExp)) %>% 
  arrange ((avglif)) %>% head(1)
gapminder %>% group_by(country) %>% summarise(avglif= mean(lifeExp)) %>% 
  filter (avglif == max(avglif) | avglif == min(avglif)) 


# Plotting 
# base R plotting
plot(x = gapminder_mod$gdpPercap, y = gapminder_mod$lifeExp)

# ggplot2 
install.packages("ggplot2")
library(ggplot2)
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + geom_point()

# log10 conversion 
ggplot(gapminder_mod, aes(x = log10(gdpPercap), y = lifeExp)) + geom_point()

# transparency 
ggplot(gapminder_mod, aes(x = log10(gdpPercap), y = lifeExp)) + geom_point(alpha=1/3, size =3)

# color 
ggplot(gapminder_mod, aes(x = log10(gdpPercap), y = lifeExp, color = continent)) + geom_point()

p <- ggplot(gapminder_mod, aes(x = log10(gdpPercap), y = lifeExp, color = continent)) + geom_point()
p + facet_wrap(~ continent)
p <- p + facet_wrap(~ continent)
p
p2 <- p + geom_smooth(color = "orange")
p2

# Combine dplyr with ggplot2 

gapminder_mod %>% ggplot(aes(GDP, lifeExp)) + geom_point()

# Histogram 

ggplot(gapminder_mod, aes(x = GDP, color = continent)) + geom_histogram()
p3 <- ggplot(gapminder_mod, aes(lifeExp, fill = continent)) + 
  geom_histogram(binwidth = 1) +
  ggtitle("Histogram_lifExp.png")
p3

# Histogram with line 
ggplot(gapminder_mod, aes(gdpPercap)) + geom_freqpoly(binwidth=500)

# Saving plots 
ggsave(p3, file = "histogram_lifExp.png")
ggsave(p3, file = "~/scw_2018/advanced_R/histogram_lifExp.png")


# Line plots 

gapminder_mod %>% filter(country == "Afghanistan") %>% head()

gapminder_mod %>% filter(country == "Afghanistan") %>% summary()
  
gapminder_mod %>% filter(country == "Afghanistan") %>%
  ggplot(aes(x = year, y = lifeExp)) + 
  geom_line(color = "blue")

# Excercise 

p5 <- ggplot(gapminder_mod, aes(lifeExp, year)) + 
  geom_point() + 
  facet_wrap(~continent)+
  geom_smooth(color = "orange", lwd = 2, se = FALSE)
p5
p6 <- p5 + geom_smooth(color = "blue", lwd = 2, se = FALSE, method = "lm")
p6

ggsave(p6, filename = "geom_smooth_type.png")


# density plot 

ggplot(gapminder_mod, aes(gdpPercap, lifeExp)) + 
  geom_point(size = 0.25) +
  geom_density_2d() + 
  scale_x_log10()

# Self practicing generate heatmap

ggplot(gapminder_mod, aes(country, gdpPercap)) +heatmap()


# Combine plots 

install.packages("gridExtra")
library(gridExtra)
p5 <- ggplot(gapminder_mod, aes(lifeExp, year)) + 
  geom_point() + 
  facet_wrap(~continent)+
  geom_smooth(color = "orange", lwd = 2, se = FALSE)
p7 <- ggplot(gapminder_mod, aes(gdpPercap, lifeExp)) + 
  geom_point(size = 0.25) +
  geom_density_2d() + 
  scale_x_log10()

# loops

gapminder_mod %>% filter(continent == "Asia") %>% 
  summarise(ave = mean(lifeExp))

contin <- unique(gapminder_mod$continent)
contin

# for ( variables in list){do something}
for (c in contin) {print(c)}
for (c in contin) 
  res <- gapminder_mod %>% filter(continent == "Asia") %>% 
  summarise(ave = mean(lifeExp))+
  print(paste0("The avg life expectancy of ", c, " is:", res))
  #print(res)}
for (c in contin) {#print(c)
    res <- gapminder_mod %>% filter(continent == "Asia") %>% 
      summarise(ave = mean(lifeExp)) +print(res)}

gapminder_mod %>% group_by(continent, year) %>% summarise(avg = mean(lifeExp))

# Functions

mean(2,3)

adder <- function(x, y){
  print(paste0("the sum of ", x, "and", y, "is :", x+y))
  return(x + y)
} 
adder(2,3)

