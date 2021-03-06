% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/update.R
\name{arrange-cards}
\alias{arrange-cards}
\alias{arrange_cards}
\alias{randomize_cards}
\title{Arrange cards in a Shuffle grid layout}
\usage{
arrange_cards(session, shuffleId, by, numeric = FALSE, desc = FALSE)

randomize_cards(session, shuffleId)
}
\arguments{
\item{session}{The \code{session} object passed to function given to shinyServer.}

\item{shuffleId}{The id of the shuffle container.}

\item{by}{Key(s) defined in \code{shuffle_card} to sort elements.}

\item{numeric}{Logical, set to \code{TRUE} if key is a numeric value.}

\item{desc}{Logical, set to \code{TRUE} to sort in decreasing order.}
}
\description{
Arrange cards in a Shuffle grid layout
}
\examples{
if (interactive()) {
  library(ggplot2)
  library(shiny)
  library(shufflecards)

  # utility fun
  is.even <- function(x) x \%\% 2 == 0

  ui <- fluidPage(
    tags$h2("Arrange a Shuffle Grid By Groups"),
    fluidRow(
      column(
        width = 3,
        radioButtons(
          inputId = "sort",
          label = "Sort by:",
          choices = c("Ascending order",
                      "Descending order",
                      "Random!")
        )
      ),
      column(
        width = 9,
        shuffle_container(
          shuffleId = "gridNum",
          card_list = lapply(
            X = 1:12,
            FUN = function(i) {
              shuffle_card(
                value = i, # used to sort
                plotOutput(
                  outputId = paste0("plot", i),
                  width = "250px",
                  height = "250px"
                )
              )
            }
          )
        )
      )
    )
  )

  server <- function(input, output, session) {

    # Make individual plots ----
    lapply(
      X = 1:12,
      FUN =  function(i) {
        output[[paste0("plot", i)]] <- renderPlot({
          ggplot() + geom_text(aes(1, 1, label = i), size = 50)
        })
      }
    )

    # Sorts ----
    observe({
      if (input$sort == "Ascending order") {
        arrange_cards(session, "gridNum", "value", numeric = TRUE)
      } else if (input$sort == "Descending order") {
        arrange_cards(session, "gridNum", "value", numeric = TRUE, desc = TRUE)
      } else {
        randomize_cards(session, "gridNum")
      }
    })
  }

  shinyApp(ui, server)
}
}
