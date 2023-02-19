pw <- c()

for (i in 1:54){
  pw <- c(pw,paste(sample(LETTERS, 1),sample(9,1), 
                   sample(LETTERS, 1),sample(9,1), 
                   sample(LETTERS, 1))
  )
}
pw

write.csv(pw, file = "pw.csv")
