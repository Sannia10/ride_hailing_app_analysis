getwd()
setwd("C:/Users/Sannia/Desktop/Sproj")
pivot <- read.csv(file = "All Rides Data(1 Mrach 2017 - 31 June 2017) Sporj Lums -22-02-2018.csv")
extra <- read.csv(file = "All Rides Data(1 Mrach 2017 - 31 June 2017) Sporj Lums -22-02-2018.csv")
view(pivot)

# ride time with total fare
ggplot(pivot, aes(x=pivot$Average.ride.time, y=pivot$Average.of.total_fare))+
  geom_point() +
  coord_cartesian(xlim = c(0, 180), ylim = c(0, 300))

# is there a relation between no of rides and the average ride time
ggplot(extra, aes(x=extra$Count.of.status, y=extra$Average.of.ride_time))+
  geom_point()

ggplot(extra, aes(x=extra$Count.of.status, y=extra$Average.of.ride_time))+
  geom_point()+
  coord_cartesian(xlim = c(0, 100), ylim = c(0, 50))
  

# no of rides with driver rating 
ggplot(extra, aes(x=extra$Count.of.status, y=extra$Average.of.driver_rating))+
  geom_point()



head(ride_data)
ggplot(ride_data, aes(x=ride_data$status))+
  geom_bar()
pivot_data<- read.csv("pivot.csv")
View(pivot_data)
ggplot(pivot_data, aes(x=pivot_data$Count.of.status,y=pivot_data$Average.of.driver_rating))+
  geom_point().


