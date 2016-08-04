#' Gadget
#'
#' Paste a path in from windows and get the extra backslash back
#'
#' @usage pastePathGadget()
#' @import shiny
#' @import miniUI
#' @export

pastePathGadget <- function() {

  requireNamespace("miniUI")
  requireNamespace("shiny")

  ui <- miniPage(
    gadgetTitleBar("My Gadget"),
    miniContentPanel(
      textInput("path", "Windows Path")
    ),
    miniButtonBlock(
      actionButton("go", "Go")
    ),
    miniContentPanel(
      textOutput("pathOut")
    )
  )

  server <- function(input, output, session) {
    # Define reactive expressions, outputs, etc.

    # When the Done button is clicked, return a value
    observeEvent(input$done, {
      stopApp()
    })

    observeEvent(input$go, {
      returnValue <- substring(capture.output(print(input$path)), 4)
      output$pathOut <- renderText(returnValue)
    })
  }

  runGadget(ui, server)
}
