#'@export
ui <- fluidPage(

  # Application title
  titlePanel("Meteroites impacts on earth"),

  mainPanel(
    setBackgroundImage(
      src = "crater.jpg"
    ),
    fluidRow(
      column(12, offset = 12,
             img(src = "nasa-logo-web-rgb.png", height = 100, width = 200)
      )
    ),
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
                               min = 1000,
                               max = 500000,
                               value = 10000,
                               step = 1000)),
                 plotOutput(("Histogram")))),
      tabPanel("About",
               p("This GUI allows you to analyze registert impacts of meteroites on earth."),
               p("It clusters the subtypes of meteroites to the main types.
                           Results will be shown in numerical and visualizated form."),
               p("The GUI also shows you the location of the founding places of meteroites around the world."),
               p("Also interactive histogram of the mass can be seen."))

    )

  )
)
