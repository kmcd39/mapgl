% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/style_helpers.R
\name{interpolate_palette}
\alias{interpolate_palette}
\title{Create an interpolation expression with automatic palette and break calculation}
\usage{
interpolate_palette(
  data = NULL,
  column,
  data_values = NULL,
  method = "equal",
  n = 5,
  palette = NULL,
  colors = NULL,
  na_color = "grey"
)
}
\arguments{
\item{data}{A data frame or sf object containing the data. If provided, data_values
will be extracted from \code{data[[column]]}. Either data or data_values must be provided.}

\item{column}{The name of the column to use for the interpolation.}

\item{data_values}{A numeric vector of the actual data values used to calculate breaks.
If NULL and data is provided, will be extracted from \code{data[[column]]}.}

\item{method}{The method for calculating breaks. Options are "equal" (equal intervals),
"quantile" (quantile breaks), or "jenks" (Jenks natural breaks). Defaults to "equal".}

\item{n}{The number of break points to create. Defaults to 5.}

\item{palette}{A function that takes n and returns a character vector of colors.
If NULL and colors is also NULL, defaults to \code{viridisLite::viridis}.}

\item{colors}{A character vector of colors to use. If provided, these colors
will be interpolated to match the number of breaks if needed. Either palette
or colors should be provided, but not both.}

\item{na_color}{The color to use for missing values. Defaults to "grey".}
}
\value{
A list of class "mapgl_continuous_scale" containing the interpolation expression and metadata.
}
\description{
This function creates an interpolation expression by automatically calculating
break points using different methods and applying a color palette. It handles
the values/stops matching automatically and supports the same classification
methods as the step functions.
}
\examples{
\dontrun{
# Create continuous color scale - using palette function
my_data <- data.frame(value = c(10, 25, 30, 45, 60, 75, 90))
scale1 <- interpolate_palette(data = my_data, column = "value",
                             method = "equal", n = 5, palette = viridisLite::plasma)

# Using specific colors (will interpolate to 5 if needed)
scale2 <- interpolate_palette(data = my_data, column = "value",
                             method = "equal", n = 5, colors = c("red", "yellow", "blue"))

# Or with piping
scale3 <- my_data |> interpolate_palette("value", method = "equal", n = 5)

# Use in a layer
add_fill_layer(map, fill_color = scale1$expression)

# Extract legend information
labels <- get_legend_labels(scale1, format = "currency")
colors <- scale1$colors

}
}
