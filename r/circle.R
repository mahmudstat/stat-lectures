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
plot(f(t), type="p", pch=20, main = "Circle Using Euler Formula")
r <- seq(0,1, length.out = 10)
for (i in r){
  points(f(t)*i+rnorm(n=n, mean = 0, sd = 0.15), pch=20)
}

## If we change values of n, we get plots with differing densities.
# Let's automate it with another for loop.

par(mfrow=c(2,2))
for (n in c(10, 20, 35, 50)){
  f <- function(t) exp(1i*t)
  t <- seq(0, 360, length.out = n)*pi/180
  plot(f(t), type="p", pch=20, 
       main = "Circle Using Euler Formula",
       xlab = "", ylab = "")
  r <- seq(0,1, length.out = n)
  for (i in r){
    points(f(t)*i+rnorm(n=n, mean = 0, sd = 0.1), pch=20)
  }
}

## Now let's put his inside a function
# Both radius (r) and number of points (n) would be used as arguments.
# Also  use sd (for scattering) as an argument. 






