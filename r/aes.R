# Libs
library(ggplot2)


#circle
t <- seq(0, 2*pi, length.out = 100)
x <- cos(t)
y <- sin(t)
plot(x,y, pch = 18, col = 'blue', main = "Circle",
     xlab="x = cost", ylab = "y = sint")


### Circle using discrete angles


t <- seq(0,180, 10)*pi/180
x <- cos(t)
y <- sin(t)
plot(x,y, pch=20, xlab = "cosx", ylab = "cosx", type = "b",
     main = "Trogonometric Circle")


### Plot circle using trigonometric complex equation


f <- function(t) cos(t)+1i*sin(t)
t <- seq(0,180, 10)*pi/180
plot(f(t), type="b", pch=20, xlab="Angle", ylab = "cos(x)+isin(x)",
     main = "Circle Using Trigonometric Complex Equation")

### Circle using Euler Formula


f <- function(t) exp(1i*t)
t <- seq(0,180, 10)*pi/180
plot(f(t), type="b", pch=20, xlab="Angle", ylab = expression(e^{ix}),
     main = "Circle Using Euler Formula")

f <- function(t) exp(1i*t)
t <- seq(0,360, 10)*pi/180
plot(f(t), type="b", pch=20, xlab="Angle", ylab = expression(e^{ix}),
     main = "Circle Using Euler Formula")

## Ellipse

t <- seq(0, 2*pi, length.out = 100)
x <- 3*cos(t)
y <- 2*sin(t)
plot(x,y, pch = 18, col = 'blue', ylim=c(-3,3), main = "Ellipse",
     xlab="x = 3cost", ylab = "y = 2sint")

#Butterfly curve (transcendental)
t <- seq(0, 12*pi, length.out = 1000)
x <- sin(t)*(exp(cos(t))-2*cos(4*t)-((sin(t/12))^5))
y <- cos(t)*(exp(cos(t))-2*cos(4*t)-((sin(t/12))^5))
plot(x,y, col="red", type="l")
plot(x, y, pch = 19, col = rainbow(7))

# Lituus
t <- seq(0, 20*pi, length.out = 500)
k <- 5
x <- sqrt(k*t)*cos(t)
y <- sqrt (k*t) * sin(t)
plot(x,y,pch=19, col="blue")

#logarithmic spiral
t <- seq(0, pi, length.out = 500)
x <- 3*exp(1.5*t)*sin(t)
y <- 3*exp(1.5*t)*cos(t)
plot(x,y, pch = 16, col = 'blue')


#logarithmic spiral multiple line
t <- seq(0, 2*pi, length.out = 500)
x <- exp(t)*sin(t)
y <- exp(t)*cos(t)
plot(x,y, type = 'l', col = 'blue')

#Golden spiral
t <- seq(0, 2*pi, length.out = 500)
r <-  1.618^(t*2/pi)
x <- r*sin(t)
y <- r*cos(t)
plot(x,y, type = 'l', col = 'blue')

#Golden spiral manual
angle <- 1/3*log(1/2)
n <- seq(1,500,20)
t <- angle*n
x <- sin(t)
y <- cos(t)
plot(x*t,y*t, pch=16, col="blue", main = " Golden angle")


#Circle the clumsy
x = seq(-10,10, 0.000225) 
y1 = sqrt(100-x^2)
y2 = -sqrt(100-x^2)
y = c(y1,y2)
plot(rep(x,2),y, pch=19)

curve(sqrt(25-x^2), from=-10, to=10, ylim=c(-10,10))

#with golden angle

angle <- pi*(3-sqrt(5))
n <- 500
t <- angle*(1:n)
x <- sin(t)
y <- cos(t)
plot(x*t,y*t, pch=16, col="blue", main = " Golden angle")

#fermat's spiral

angle <- pi*137.508/180
n <- 500
t <- angle*(1:n)
x <- sin(t)
y <- cos(t)
plot(x*t,y*t, pch=16, col="blue", main="Fermat")


#constant angle
angle <- pi*(3-sqrt(5))
n <- 500
t <- rep(angle, n)
x <- sin(t)
y <- cos(t)
plot(x*t,y*t, pch=16, col="blue", main = " Golden angle")



### Folium of Descartes


a <- 1
p <- seq(-100, 120, length.out = 1000)
x <- 3*a*p/(1+p^3)
y <- 3*a*p^2/(1+p^3)
library(ggplot2)
plot(x, y, type="l", col="brown")


### Complex plotting

x <- sample(10, 20, replace = TRUE)
y <- sample(5, 20, replace = TRUE)
par(mfrow=c(1,2))
plot(x+y*1i, pch=20); plot(x,y, pch=20)


### Binomial Probability


Value <- c(0:4)
Freq <- c(5, 8, 3, 4, 2)
par(mfrow=c(1,2))
plot(Value, Freq, type="h", lwd=6); plot(Value+Freq*1i, type = "h")

## Using ggplot2

angle=pi*(3-sqrt(5))
n=500
t=angle*(1:n)
x=sin(t)
y=cos(t)
df=data.frame(t,x,y)

p=ggplot(df, aes(x*t,y*t))
p+geom_point(size=8, alpha=0.6, color='blue')+
  theme(title=element_blank(),
        text=element_blank(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill='white'))

## Love equation

n=5000
t=angle*(1:n)
x <- 16*(sin(t))^3
y <- 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t)
plot(x,y, col=rainbow(n), pch=19)

## ggplot2 love
df <- data.frame(t,x,y)

p <- ggplot(df, aes(x,y))+
  theme_void()+
  theme(legend.position = "none")

p+geom_line(color = rep(2:6, each = 1000))

p+geom_line(color = "red")

p+geom_line(color = "blue")

p+geom_line(color = topo.colors(5000))

p+geom_line(color = rainbow(5000))

## Use colorRampPalette 

colfunc <- colorRampPalette(c("#ff3399", "#0099ff"))

p+geom_line(color = colfunc(5000))


#Butterfly curve (transcendental)

# Much more beautiful version 
n <- 5000
t <- seq(0, 12*pi, length.out = n)
x <- sin(t)*(exp(cos(t))-2*cos(4*t)-((sin(t/12))^5))
y <- cos(t)*(exp(cos(t))-2*cos(4*t)-((sin(t/12))^5))

df <- data.frame(t,x,y)

p <- ggplot(df, aes(x,y))+
  theme_void()+
  theme(legend.position = "none")

p+geom_point(color = colfunc(5000))

## New love
n <- 5000
t <- seq(0, 12*pi, length.out = n)
x <- cos(t)
y <- sin(t)+(abs(cos(t)))^0.5
plot(x,y)

## Another love

