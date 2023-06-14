# Normal Curve

set.seed(25)
x = round(rnorm(10000, 70, 10))
hist(x, prob = TRUE, main = "Histogram & Density Curve",
     xlab = "") 
lines(density(x), col = "red")


# Skewed Curve

set.seed(5)

# Right skew

xright <- rbeta(100000,1,100)*1000
hist(xright, prob = TRUE, ylim = c(0,0.1), main = "Histogram & Density Curve")
lines(density(xright), col = "red")

# Left skew

xleft <- rbeta(100000,100,1)*100
hist(xleft, prob = TRUE, main = "Histogram & Density Curve")
lines(density(xleft), col = "red")


# Plot Beta

x = seq(0, 1, length=100)

#create plot of Beta distribution with shape parameters 2 and 10
plot(x, dbeta(x, 2, 10), type='l')



