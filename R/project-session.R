
weight_kilo<-10
#comment: use alt-minus (-) to make <-
weight_kilo

#vectors: character
c("a", "b")

#numeric
c(1,2)

#logic
c(TRUE, FALSE)

#data frame
head(iris)

colnames(iris)
str(iris)
summary(iris)

# Exercise ----------------------------------------------------------------

# Object names
DayOne
dayone

T <- FALSE
c <- 9
mean <- function(x) sum(x)

# Spacing
x[,1]
x[,1]
x[,1]
mean (x, na.rm = TRUE)
mean (x, na.rm = TRUE)
function (x){}
function(x){}
height<-feet*12+inches
mean(x, na.rm=10)
sqrt(x ^ 2 + y ^ 2)
df $ z
x <- 1 : 10

# Indenting
if (y < 0 && debug)
  message("Y is negative")

# Object names

# Should be camel case
# DayOne
day_one
# dayone better with snake case
day_one

# Should not over write existing function names
# T = TRUE, so don't name anything T
# T <- FALSE
false <- FALSE
# c is a function name already. Plus c is not descriptive
# c <- 9
number_value <- 9
# mean is a function, plus does not describe the function which is sum
# mean <- function(x) sum(x)
sum_vector <- function(x) sum(x)

# Spacing
# Commas should be in correct place
# x[,1]
# x[ ,1]
# x[ , 1]
x[, 1]
# Spaces should be in correct place
# mean (x, na.rm = TRUE)
# mean( x, na.rm = TRUE )
mean(x, na.rm = TRUE)
# function (x) {}
# function(x){}
function(x) {}
# height<-feet*12+inches
height <- feet * 12 + inches
# mean(x, na.rm=10)
mean(x, na.rm = 10)
# sqrt(x ^ 2 + y ^ 2)
sqrt(x^2 + y^2)
# df $ z
df$z
# x <- 1 : 10
x <- 1:10

# Indenting should be done after if, for, else functions
# if (y < 0 && debug)
# message("Y is negative")
if (y < 0 && debug)
  message("Y is negative")


x[, 1]


# Functions ---------------------------------------------------------------

sd
lm

add_two <- function(x, y) {
  added <- x + y
  return (added)
}
#return means to send the function out
add_two (1, 2)
#or explicitly
add_two (y = 2, x = 1)

source(here::here("R/package-loading.R"))
#hier geht man sicher, dass R immer zurück geht und von dem R Projekt
#ausgeht und package-loading sucht und so ist es reproduzierbar auf anderen Computern


# save data ---------------------------------------------------------------
#taking a dataset and saving it as a file
write_csv(iris, here::here("data/iris.csv"))
imported_iris <- read_csv(here::here("data/iris.csv"))
glimpse(imported_iris)
