d <- read.table("./data.csv", header=TRUE, sep="\t")
g_range <- range(0, d$Prey, d$Predator)

png(file="test.png",width=800,height=600)

plot(d$iteration, d$Prey, col="blue", 
     ylim=g_range,
     type="l",
     xlab="iterations",
     ylab="population",
     main="Prey and Predator game"
)

lines(d$Predator, type="l", col="red")

legend(1, g_range[2], c("prey","predator"), 
  cex=0.8, 
  col=c("blue","red"), 
  pch=21:22, 
  lty=1:2
)

dev.off()
q() 
