getwd()
setwd("C:/Users/Sannia/Desktop/Sproj")
pivot <- read.csv(file = "Book1.csv")
extra <- read.csv(file = "EXTRA.csv")
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






