library(shiny)

ui <- fluidPage(
  titlePanel("Posit Connect Off-Host Test"),
  sidebarLayout(
    sidebarPanel(
      actionButton("btn", "Trigger Pod Initialization")
    ),
    mainPanel(
      textOutput("status")
    )
  )
)

server <- function(input, output, session) {
  status <- reactiveVal("Waiting for action...")
  
  observeEvent(input$btn, {
    status("Pod initialized successfully!")
  })
  
  output$status <- renderText({ status() })
}

shinyApp(ui, server)
