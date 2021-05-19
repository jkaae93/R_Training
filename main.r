#run R in vscode terminal
R

# choose file
df<- read.csv(file.choose())

# set folder, load file
getwd()
setwd("./example")

df<- read.csv("data.csv")

head(df)
tail(df)
summary(df) # summary view
str(df) # type view

df[1,2]
df[1,] # show first row
df[,2] # show all column

df[c(1,2), c(1,2)]

# called name for df

str(df) # show data frame
df[,3]
df[,"name"]
df$name

# make year count at month data
df$reviews_per_month * 12
df$reviews_per_month / df$availability_365

# add new variable at the column
df$reviews_frequency <- df$reviews_per_month / df$availability_365
str(df)

# update variable
df$reviews_frequency <- df$reviews_frequency * 365
str(df)

# update variable type
df$name <- as.character(df$name)
str(df)

# filter
df$city == "Hawaii"
df[df$city == "Hawaii",]
df[df$price<200,]
df[(df$city == "Hawaii" & df$price<200),]

# calc data frame
str(df)
head(df)

tail(df)
summary(df)

nrow(df)
ncol(df)

# vector function
length(df$price)
mean(df$price)

# histogram
hist(df$availability_365)
?hist
help(hist)


hist(df$availability_365, xlab = "available") # xlab = x name
hist(df$availability_365, xlab = "available", col="skyblue") # col = color
hist(df$availability_365, xlab = "available", col="skyblue", main="Availabilty of listings") #main = main title

summary(df$city)
hist(df[df$city=="Hawaii",]$availability_365) # hawaii histogram

# plot
plot(df$price, df$reviews_per_month)
plot(df$price, df$reviews_per_month, xlab="PRICE", ylab="REIVIEW", xlim=c(0,600), ylim=c(0,12)) #xlim = x limit, ylim = ylimit

#matrix
str(df)
plot(df[,c("price","reviews_per_month","availability_365")])

#barplot -factor
summary(df$room_type)
plot(df$room_type, df$price)



# ggplots
# asthetics : arrow
# data : dataframe
# scale : set graphic element and view types
# geometric : draw graph Ex. dot, line, etc..
# statistics : show average 
# facets : draw graph for category
# coordinate : graph type


install.packages("ggplot2")
library(ggplot2)
setwd("./example")
getwd()

cities <- read.csv("minard.cities.csv")
troops <- read.csv("minard.troops.csv")
temps <- read.csv("minard.temps.csv")

str(cities)
str(troops)
str(temps)

ggplot(data = troops, aes(x=long, y=lat)) + geom_path(aes(group=group, color=direction, size=survivors), lineend = "round") +
scale_size(range = c(0.5,15)) +
scale_color_manual(values = c("#DFC17E", "#252523")) +
xlab("") +
ylab("") + 
guides(color=F, size=F) + 
geom_text(data = cities, aes(x=long, y=lat, label=city))

ggplot(temps, aes(x=long, y=temp)) + geom_path() + geom_point() + geom_text(aes(label=date), vjust=2, col="red")
