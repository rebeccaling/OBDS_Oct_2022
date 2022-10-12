myday2matrix <- readRDS('/t1-data/project/obds/shared/resources/2_r/my_day2matrix.rds')

#Add row sums and means

myday2matrix_plus <- cbind(myday2matrix, rowSums= rowSums(myday2matrix), rowMeans=rowMeans(myday2matrix))
dim(myday2matrix_plus)

#Add col sums and means

myday2matrix_plus_plus<-rbind(myday2matrix_plus, c(colSums(myday2matrix),NA,NA), 
                         c(colMeans(myday2matrix), NA, NA))

dim(myday2matrix_plus_plus)
tail(myday2matrix_plus_plus)  

#Load ToothGrowth dataset using data(ToothGrowth)

data("ToothGrowth")
help("ToothGrowth")
colnames(ToothGrowth)

#what is mean Toothlength

mean(ToothGrowth$len)

#what is the maximum and minimum

max(ToothGrowth$len)
min(ToothGrowth$len)
#what are rowSums and rowMeans. No there is as character (called a string) column which 

Exercise 3
#load AirQuality
data("airquality")

dim(airquality)

colnames(airquality)

head(airquality)

airquality2 <- airquality[order(airquality$Ozone),]
head(airquality2)
airquality2 <- airquality[order(airquality$Month,airquality$Temp, 
                                decreasing = TRUE ),]
head(airquality2)

write.table(airquality2, file='airquality_ordered_month_temp.csv', sep=',', 
            quote=FALSE, row.names = FALSE)

getwd()

#Exercise 4

buildings <- data.frame(location=c(1,2,3),name=c('b1','b2','b3'))

data <- data.frame(survey=c(1,1,1,2,2,2),location=c(1,2,3,2,3,1), efficiency=c(41,2,3,34,545,23))

buildingStats <- merge(buildings,data, by='location')

#Exercise 5
airqual_agg <- aggregate(airquality, by=list(Month=airquality$Month), FUN = mean, na.rm=T)
head(airqual_agg)

airqual_agg_SolarR <- aggregate(airquality$Solar.R, 
                                by=list('Month'=airquality$Month), FUN = mean, na.rm=T)
head(airqual_agg_SolarR)

#rename a column
names(airqual_agg_SolarR)[names(airqual_agg_SolarR) == 'x'] <- 'SolarR'

airqual_agg_sd <- aggregate(airquality, by=list(Month=airquality$Month), 
                         FUN = sd, na.rm=T)

#Alternative
airqual_agg_SolarR <- aggregate(Solar.R~Month,airquality, FUN=mean, na.rm=TRUE)


#Custom functions

costfruit <- function(apples, pears) {
  output <- apples*0.5+pears*0.75 
  return(output)}

costfruit(5,9)
#can either put on multiple lines (suggested) or on one line with semicolons between

calc_hypot <- function(x=NULL, y=NULL) {
  output <- sqrt((x^2)+(y^2)) 
  return(output)} 

calc_hypot <- function(x=NULL, y=NULL) {output <- sqrt((x^2)+(y^2)); return(output)} 

calc_hypot(0,3)

current_sum <- 0
for(i in 1:10) {
  current_sum <- current_sum+i
  print(current_sum)}
#how to write a loop
for(i in 1:7) {
  print(i^3)}

#column names of iris data set and number of letters in colnames
data(iris)
colnames(iris)
print(length(colnames(iris)))
iris_cols <- c()

nchar(colnames(iris), type='chars', allowNA=FALSE, keepNA=NA)

for (i in colnames(iris)){
  print(paste0(i, ' (', nchar(i), ').'))}

colour_vector <- c('red','orange','purple','yellow','pink', 'blue')

test_vector <- ifelse(nchar(colour_vector)==4, colour_vector, 'not 4')
print(test_vector)


              
              