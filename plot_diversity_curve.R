# Read in the data.
p1 = read.table("passage1.stc")
p2 = read.table("passage2.stc")
p3 = read.table("passage3.stc")
p4 = read.table("passage4.stc")
freeze = read.table("freeze.stc")
thaw = read.table("thaw.stc")

# Plot curves.
pdf("barcode_diversity.pdf")
par(mar=c(3.5, 3.5, 1.5, 1.5))
plot(cumsum(p1$V2) / sum(p1$V2), type="l", xlim=c(0,4000),
  xlab="Barcode index", ylab="Cumulative frequency",
  lwd=2, panel.first=grid(), col="gray25",
  bty="n", xaxt="n", yaxt="n", col.lab="gray25", line=2.2)
lines(cumsum(p2$V2) / sum(p2$V2), lwd=1.6, col='grey20')
lines(cumsum(p4$V2) / sum(p4$V2), lwd=.9, col='grey25')
lines(cumsum(p3$V2) / sum(p3$V2), lwd=1.3, col='grey25')
lines(cumsum(freeze$V2) / sum(freeze$V2), col='dodgerblue3', lwd=1.3)
lines(cumsum(thaw$V2) / sum(thaw$V2), col='deeppink2', lwd=1.3)
axis(side=2, col="gray50", cex.axis=.8, col.axis="gray25")
axis(side=1, col="gray50", cex.axis=.8, col.axis="gray25")
legend(x="bottomright", inset=.02,
   col=c('gray15', 'grey20', 'gray25', 'gray25', 'dodgerblue3', 'deeppink2'),
   lwd=c(2, 1.6, 1.3, .9, 1.3, 1.3),
   legend=c("Passage 1", "Passage 2", "Passage 3", "Passage 4",
      "Frozen", "Revived"),
   text.col="gray25", box.col="gray70", bg="white", cex=.9
)
dev.off()
