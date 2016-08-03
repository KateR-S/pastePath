library(shiny)
library(miniUI)

pastePathGadget <- function() {

  ui <- miniPage(
    gadgetTitleBar("My Gadget"),
    miniContentPanel(
      textInput("path", "Windows Path")
    )
  )

  server <- function(input, output, session) {
    # Define reactive expressions, outputs, etc.

    # When the Done button is clicked, return a value
    observeEvent(input$done, {
      returnValue <- input$path
      stopApp(returnValue)
    })
  }

  runGadget(ui, server)
}
