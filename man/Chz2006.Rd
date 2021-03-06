\name{Chz2006}
\alias{Chz2006}
\docType{data}
\title{ Data amendment Carhuaz 2006 }
\description{
  Incidents and performance of healthy tubers and rotten potato field infested 
  with naturally Ralstonia solanacearum Race 3/Bv 2A, after application of inorganic 
  amendments and a rotation crop in Carhuaz Peru, 2006.
}
\usage{data(Chz2006)}
\format{
  The format is:
List of 2
  \describe{
    \item{\code{amendment}}{a factor}
    \item{\code{crop}}{a factor}
    \item{\code{block}}{a numeric vector, replications}
    \item{\code{plant}}{a numeric vector, number plant}  
    \item{\code{wilt_percent}}{a numeric vector, wilt percentage at 60 days}  
    \item{\code{health}}{a numeric vector, kg/8m2} 
    \item{\code{rot}}{a numeric vector, kg/8m2} 
  }
}

\details{
  Application of inorganic amendment and crop rotation to control bacterial wilt 
  of the potato (MBP).
}
\source{
  Experimental field, 2006. Data Kindly provided by Pedro Aley.
}

\references{
  International Potato Center. CIP - Lima Peru.
}
\examples{
library(agricolae)
data(Chz2006)
str(Chz2006)
wilt<-Chz2006$wilt
yield<-Chz2006$yield
means <- tapply.stat(wilt[,5],wilt[,1:3],function(x) mean(x,na.rm=TRUE))
names(means)[4]<-"wilt_percent"
model <- aov(wilt_percent ~ block + crop, means)
anova(model)
cv.model(model)
yield<-yield[order(paste(yield[,1],yield[,2],yield[,3])),]
correlation(means[,4],yield[,4],method="spearman")
}
\keyword{datasets}
