##########################

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

   # Bet entry for point spread entries
   dateInput("gameday", "Game Day (yyyy/mm/dd)"),
   textInput("sport", "Sport"),
   textInput("league", "League"), # make multiple=True once code has list of leagues
   textInput("team", "Team"), # make multiple=True once code has list of teams
   textInput("bettype", "Bet Type"), # make multiple=True once code has list of bettypes
   textInput("overunderval", "Over/Under Value"),
   textInput("draftkingsodds", "DraftKings Odds", value = 0),
   textInput("538odds", "FiveThiryEight Odds", value = 0),
   textInput("payoutodds", "Payout Odds", value = 0),
   textInput("wager", "Wager", value = 00.00),
   actionButton("savebet", "Save Bet"),
   # Insert data input header for "Results" Section
   textInput("actualpayout", "Actual Payout", value = 0),
   textInput("gameresult", "Game Results"),
   actionButton("saveresults", "Save Results")

)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
   # Reactive Expression
      betpage <- reactive({
         get(input$Bets, "package:datasets")
   })


   output$summary <-  renderPrint({
      # Using reactive expression
      summary(betpage())
   })
   output$table <- renderTable({
      betpage()
   })

}

# Run the application
shinyApp(ui = ui, server = server)
