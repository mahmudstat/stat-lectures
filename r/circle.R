## Euler formula
# It's easier to draw circles using this formula, since we need to change 
# parameters only once. 

f <- function(t) exp(1i*t)
t <- seq(0,360, 10)*pi/180
plot(f(t), type="b", pch=20, main = "Circle Using Euler Formula")

## Change radius
# rnorm is used to scatter points from circumference. 
# f(t) multiplied by r makes circles of different radiuses. 
# n controls how many points are plotted. To make a denser plot, we need
# higher values of n. 


n <- 30
f <- function(t) exp(1i*t)  # makes a unit circle
t <- seq(0,360, length.out = n)*pi/180
plot(f(t), type="b", pch=20, main = "Circle Using Euler Formula")
r <- seq(0,1, length.out = 10)
for (i in r){
  points(f(t)*i+rnorm(n=n, mean = 0, sd = 0.15), pch=20)
}

## If we change values of n, we get plots with differing densities.
# Let's automate it with another for loop.

par(mfrow=c(2,2))
for (n in c(10, 20, 30, 40, 50)){
  f <- function(t) exp(1i*t)
  t <- seq(0,360, length.out = n)*pi/180
  plot(f(t), type="b", pch=20, main = "Circle Using Euler Formula")
  r <- seq(0,1, length.out = n)
  for (i in r){
    points(f(t)*i+rnorm(n=n, mean = 0, sd = 0.15), pch=20)
  }
}


### Circle using discrete angles

t <- seq(0,360, 10)*pi/180
x <- cos(t)
y <- sin(t)

par(mfrow=c(2,2))
plot(x,y, pch=20, xlab = "cosx", ylab = "cosx", type = "p",
     main = "Trogonometric Circle")


## Manual 
par(mfrow=c(2,2))
plot(x,y, pch=20, xlab = "cosx", ylab = "cosx", type = "p",
     main = "Trogonometric Circle")
## Take different lengths to change number of points
r <- seq(0,1, length.out = 10)
for (i in r){
  points(i*x+rnorm(50, 0, 0.12), i*y+rnorm(50,0, 0.12), pch=20)
}

plot(x,y, pch=20, xlab = "cosx", ylab = "cosx", type = "p",
     main = "Trogonometric Circle")
r <- seq(0,1, length.out = 20)
for (i in r){
  points(i*x+rnorm(50, 0, 0.12), i*y+rnorm(50,0, 0.12), pch=20)
}

plot(x,y, pch=20, xlab = "cosx", ylab = "cosx", type = "p",
     main = "Trogonometric Circle")
r <- seq(0,1, length.out = 35)
for (i in r){
  points(i*x+rnorm(50, 0, 0.12), i*y+rnorm(50,0, 0.12), pch=20)
}

plot(x,y, pch=20, xlab = "cosx", ylab = "cosx", type = "p",
     main = "Trogonometric Circle")
r <- seq(0,1, length.out = 50)
for (i in r){
  points(i*x+rnorm(50, 0, 0.12), i*y+rnorm(50,0, 0.12), pch=20)
}

## Automated; two loops

for (n in c(10, 25, 35, 50)){
  r <- seq(0,1, length.out = n)
  for (i in r){
    points(i*x+rnorm(50, 0, 0.12), i*y+rnorm(50,0, 0.12), pch=20)
  }
}



