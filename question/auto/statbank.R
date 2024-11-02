bank <- read.csv("question/auto/stat.csv")

unique(bank$Topic)


View(bank)

write.csv(bank[-1], file = "bank.csv", row.names = FALSE)
