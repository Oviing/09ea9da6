#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#'@title App Meteroites
#'@description the function \code{runApp()} opens a shiny web app.
#'@usage
#'runApp(GUI_Meteroites)
#'@param
#'GUI_Meteroites "GUI_Meteroites". Argument to start the web app.
#'@export
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Meteroites impacts on earth"),

        mainPanel(
            tabsetPanel(
                tabPanel("Data",
                         tableOutput("Class")),
                tabPanel("Classes",
                         plotOutput("Classes")),
                tabPanel("Heatmap",
                         plotOutput("Heatmap")),
                tabPanel("World",
                         plotOutput("World")),
                tabPanel("Mass",
                         sidebarLayout(
                             sidebarPanel(
                                 sliderInput("mass_size",
                                             "Size of the included mass",
                                             min = 1,
                                             max = 500000,
                                             value = 10000,
                                             step = 1000)

                             ),
                         plotOutput(("Histogram"))))

        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$Histogram <- renderPlot({
        mass_size <- input$mass_size + 1000
        meteroites.hist(mass_size)
    })

    output$World <- renderPlot({
        meteroites.world()
    })

    output$Classes <- renderPlot({
        meteroites.plotClass()
    })

    output$Heatmap <- renderPlot({
        meteroites.heatMap()
    })

    output$Class <- renderTable(
        classDF
    )

}

# Run the application
shinyApp(ui = ui, server = server)
