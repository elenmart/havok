% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_havok.R
\name{plot.havok}
\alias{plot.havok}
\title{Plotting functions for the havok package of class “havok"}
\usage{
\method{plot}{havok}(x, what = "interactive", ...)
}
\arguments{
\item{x}{A "havok" object.}

\item{...}{Other calls to plot}
}
\description{
Generic plotting function for object of class ("havok")
}
\examples{

\donttest{
#Generate Data
library(deSolve)
##Set Lorenz Parameters
parameters <- c(s = 10, r = 28, b = 8/3)
n <- 3
state <- c(X = -8, Y = 8, Z =27) ##Inital Values

#Intergrate
dt <- 0.001
tspan <- seq(dt, 200, dt)
N <- length(tspan)

Lorenz <- function(t, state, parameters) {
 with(as.list(c(state, parameters)), {
   dX <- s * (Y - X)
   dY <- X * (r - Z) - Y
   dZ <- X * Y - b * Z
   list(c(dX, dY, dZ))
 })
}

out <- ode(y = state, times = tspan, func = Lorenz, parms = parameters, rtol = 1e-12, atol = 1e-12)
xdat <- out[, "X"]
t <- out[, "time"]
hav <- havok(xdat = xdat, dt = dt, stackmax = 100, lambda = 0,
            rmax = 15, polyOrder = 1, useSine = FALSE)

plot(hav)
}
}
