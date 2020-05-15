beads <- rep(c("red", "blue"), times = c(2,3))
beads      #view beads object
sample(beads,1)

B <- 10000     #no of times to draq onw bead
#events <- replicate(B, sample(beads, 1))
#tab <- table(events)
#tab     #view count table
#prop.table(tab)  #view table of outcome proportions

events <- sample(beads, B, TRUE)
prop.table(table(events))

#to clear out the R environment
#rm(list = ls())