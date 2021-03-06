% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme-current.R
\name{theme_get}
\alias{theme_get}
\alias{theme_set}
\alias{theme_update}
\alias{theme_replace}
\alias{\%+replace\%}
\title{Get, set, and modify the active theme}
\usage{
theme_get()

theme_set(new)

theme_update(...)

theme_replace(...)

e1 \%+replace\% e2
}
\arguments{
\item{new}{new theme (a list of theme elements)}

\item{...}{named list of theme settings}

\item{e1, e2}{Theme and element to combine}
}
\value{
\code{theme_set}, \code{theme_update}, and \code{theme_replace}
invisibly return the previous theme so you can easily save it, then
later restore it.
}
\description{
The current/active theme (see \code{\link[=theme]{theme()}}) is automatically applied to every
plot you draw. Use \code{theme_get} to get the current theme, and \code{theme_set} to
completely override it. \code{theme_update} and \code{theme_replace} are shorthands for
changing individual elements.
}
\section{Adding on to a theme}{


\code{+} and \verb{\%+replace\%} can be used to modify elements in themes.

\code{+} updates the elements of e1 that differ from elements specified (not
NULL) in e2. Thus this operator can be used to incrementally add or modify
attributes of a ggplot theme.

In contrast, \verb{\%+replace\%} replaces the entire element; any element of a
theme not specified in e2 will not be present in the resulting theme (i.e.
NULL). Thus this operator can be used to overwrite an entire theme.

\code{theme_update} uses the \code{+} operator, so that any unspecified values in the
theme element will default to the values they are set in the theme.
\code{theme_replace} uses \verb{\%+replace\%} to completely replace the element, so any
unspecified values will overwrite the current value in the theme with
\code{NULL}.

In summary, the main differences between \code{theme_set()}, \code{theme_update()},
and \code{theme_replace()} are:
\itemize{
\item \code{theme_set()} completely overrides the current theme.
\item \code{theme_update()} modifies a particular element of the current theme
using the \code{+} operator.
\item \code{theme_replace()} modifies a particular element of the current theme
using the \verb{\%+replace\%} operator.
}
}

\examples{
p <- ggplot(mtcars, aes(mpg, wt)) +
  geom_point()
p

# Use theme_set() to completely override the current theme.
# theme_update() and theme_replace() are similar except they
# apply directly to the current/active theme.
# theme_update() modifies a particular element of the current theme.
# Here we have the old theme so we can later restore it.
# Note that the theme is applied when the plot is drawn, not
# when it is created.
old <- theme_set(theme_bw())
p

theme_set(old)
theme_update(panel.grid.minor = element_line(colour = "red"))
p

theme_set(old)
theme_replace(panel.grid.minor = element_line(colour = "red"))
p

theme_set(old)
p


# Modifying theme objects -----------------------------------------
# You can use + and \%+replace\% to modify a theme object.
# They differ in how they deal with missing arguments in
# the theme elements.

add_el <- theme_grey() +
  theme(text = element_text(family = "Times"))
add_el$text

rep_el <- theme_grey() \%+replace\%
  theme(text = element_text(family = "Times"))
rep_el$text

}
\seealso{
\code{\link[=+.gg]{+.gg()}}
}
