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