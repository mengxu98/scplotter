% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clonalutils.R
\name{top}
\alias{top}
\alias{select}
\alias{uniq}
\alias{shared}
\alias{larger}
\alias{smaller}
\alias{eq}
\title{Helper functions to select clones based on various criteria}
\usage{
top(n, groups = NULL, data = NULL)

select(expr, groups = NULL, data = NULL)

uniq(group1, group2, ..., groups = NULL, data = NULL)

shared(group1, group2, ..., groups = NULL, data = NULL)

larger(
  group1,
  group2,
  include_eq = FALSE,
  shared = FALSE,
  groups = NULL,
  data = NULL
)

smaller(
  group1,
  group2,
  include_eq = FALSE,
  shared = FALSE,
  groups = NULL,
  data = NULL
)

eq(group1, group2, groups = NULL, shared = FALSE, data = NULL)
}
\arguments{
\item{n}{The number of top clones to select or the threshold size.}

\item{groups}{The column names in the meta data to group the cells.
By default, it is assumed \code{facet_by} and \code{split_by} to be in the parent frame.}

\item{data}{The data frame containing clone information. Default is NULL. If NULL, it will get data from parent.frame.
A typical \code{data} should have a column named \code{CloneID} and other columns for the groupings.
Under each grouping column, the value should be the size of the clone.
By default, the data is assumed to be in the parent frame.}

\item{expr}{The expression (in characters) to filter the clones
(e.g. "group1 > group2" to select clones where group1 is larger than group2).}

\item{group1}{The first group to compare.}

\item{group2}{The second group to compare.}

\item{...}{More groups to compare.}

\item{include_eq}{Whether to include equal-sized clones.}
}
\value{
A vector of selected clones.
}
\description{
These helper functions allow for the selection of clones based on various criteria such as size, group comparison, and existence in specific groups.
}
\examples{
data <- data.frame(
   CloneID = 1:10,
   group1 = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9),
   group2 = c(7, 3, 8, 2, 1, 5, 9, 4, 6, 0),
   groups = c("A", "A", "A", "A", "B", "B", "B", "B", "B", "B")
)
data <- data[order(data$group1 + data$group2, decreasing = TRUE), ]
scplotter:::top(3)
scplotter:::top(3, groups = "groups")
scplotter:::select(group1 == 0 | group2 == 0)
scplotter:::uniq(group1, group2)
scplotter:::shared(group1, group2)
scplotter:::larger(group1, group2)
scplotter:::smaller(group1, group2)
scplotter:::smaller(group1, group2, include_eq = TRUE)
scplotter:::smaller(group1, group2, shared = TRUE)
scplotter:::eq(group1, group2)
}
\keyword{internal}
