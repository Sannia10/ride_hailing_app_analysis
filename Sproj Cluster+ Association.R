setwd("F:/Sproj")

#cluster analysis
data<- read.csv("Categorical Data.csv")
gower_dist <- daisy(data[, -1], metric = "gower")
gower_mat <- as.matrix(gower_dist)

#silhoutte method for clusters
sil_width <- c(NA)

#loop for cluster number 
for(i in 2:20){
  
  pam_fit <- pam(gower_dist,
                 diss = TRUE,
                 k = i)
  sil_width[i] <- pam_fit$silinfo$avg.width
}

#plotting
plot(1:20, sil_width,
     xlab = "Number of clusters",
     ylab = "Silhouette Width")



lines(1:10, sil_width)

#metoids
pam_fit <- pam(gower_dist, diss = TRUE, k = 9)
data[pam_fit$medoids, ]






#visualization
tsne_obj <- Rtsne(gower_dist, is_distance = TRUE)

tsne_data <- tsne_obj$Y %>%
  data.frame() %>%
  setNames(c("X", "Y")) %>%
  mutate(cluster = factor(pam_fit$clustering),
         name = data$Driver.ID)

ggplot(aes(x = X, y = Y), data = tsne_data) +
  geom_point(aes(color = cluster))


pam_results <- data %>%
  dplyr::select(-data$Driver.ID) %>%
  mutate(cluster = pam_fit$clustering) %>%
  group_by(cluster) %>%
  do(the_summary = summary(.))

pam_results$the_summary



#association rules
data$Driver.ID<- NULL
data$Rejections<- NULL

Final <- as(data, "transactions")
str(data)
Grules <- apriori(Final, parameter = list(support = 0.01, conf = 0.7))
Grules
inspect(Grules[1:20])
rulesRejectionHigh <- subset(Grules, subset = rhs%in% "X..rejection=High")
rulesRejectionHigh 
inspect(sort(rulesRejectionHigh , by = "lift")[1:8])

plot(rulesRejectionHigh , measure = c("support", "confidence"), shading="lift")

plot(rulesRejectionHigh , method = "grouped")


rulesRejectionLow <- subset(Grules, subset = rhs%in% "X..rejection=Low")
rulesRejectionLow 
inspect(sort(rulesRejectionLow , by = "lift")[1:10])

plot(rulesRejectionLow , measure = c("support", "confidence"), shading="lift")

plot(rulesRejectionLow , method = "grouped")
