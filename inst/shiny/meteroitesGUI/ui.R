#'@export
ui <- fluidPage(

  # Application title
  titlePanel("Meteroites2"),

  mainPanel(
    setBackgroundImage(
      src = "crater_colorJPG.jpg"
    ),
    fluidRow(
      column(11),
            img(src = "tms.jpg", height = 100, width = 200),
      column(12),
            img(src = "nasa-logo-web-rgb.png", height = 100, width = 200)

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
               p("The tab Data shows the numbers of each class of meteroites.
                 The tab Classes creates an plot out of the data from the Data tab.
                 The World tab shows the geographical positions of the meteroites founded on earth.
                 The Histogram tab shows the histogram of the mass of the founded meteroites"),
               p(""),
               p("This application is using data hsoted by the NASA and was provided by The Meteoritical Society.
                 The original data can be found under the following link:",
               a("Meteroites Landing", href = "https://data.nasa.gov/Space-Science/Meteorite-Landings/gh4g-9sfh")),
               p(""),
               p("This shiny application was created by Joel Kischkel"),
               p(""),
               p(""),
               p(""),
               fluidRow(
                 column(1, offset = 1),
                      a(img(src = "GitHub-Mark-64px.png", height = 32, width = 32), href="https://github.com/unimi-dse/09ea9da6"),
                 column(2),
                      a(img(src = "LI-In-Bug.png", height = 28, width = 32), href = "https://it.linkedin.com/in/joel-kischkel-180437134")

               )
    )

  )
)
)
