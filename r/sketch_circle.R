sketch_circle <- function(npoints=c(15, 25, 35, 50), 
                          r1=0, r2=1, ncircle=20, sd=0.1){
  nplots = length(npoints) 
  par(mfrow=c(sqrt(nplots), sqrt(nplots)))
  for (n in npoints){
    t <- seq(0, 360, length.out = n)*pi/180
    plot(exp(1i*t)*r2, type="p", pch=20, 
         main = "Circle Using Euler Formula",
         xlab = "", ylab = "")
    r <- seq(r1, r2, length.out = ncircle)
    for (i in r){
      points(exp(1i*t)*i+rnorm(n=n, mean = 0, sd = sd), pch=20)
    }
  }
}
