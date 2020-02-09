#'@export
ui <- shinymaterial::material_page(

  shinyWidgets::setBackgroundImage(
    src = "crater_colorJPG.jpg"
  ),

  title = "Meteroites2",

  nav_bar_color = "blue",

  shinymaterial::material_side_nav(
    fixed = FALSE,
    shinymaterial::material_side_nav_tabs(
      side_nav_tabs = c("Home" = "home_id",
                        "Types" = "type_id",
                        "Locations" = "location_id",
                        "Mass" = "mass_id",
                        "About" = "about_id")
    )
  ),

  shinymaterial::material_side_nav_tab_content(
                  side_nav_tab_id = "home_id",

    shinymaterial::material_column(
      shinymaterial::material_card(img(src = "tms.jpg", height = 100, width = 200), depth = 3, color = "transparent"),
      shinymaterial::material_card(img(src = "nasa-logo-web-rgb.png", height = 100, width = 200), depth = 3, color = "transparent"),
                                    width = 4, offset = 4
    ),

    shinymaterial::material_column(
                                    width = 2, offset = 0
    )

  ),


  shinymaterial::material_side_nav_tab_content(
                  side_nav_tab_id = "type_id",

    shinymaterial::material_card(
      title = "Data",
      color = "transparent",
      depth = 3,
      shiny::tableOutput("Class")
      ),

    shinymaterial::material_card(
      title = "Graph",
      color = "transparent",
      depth = 3,
      shiny::plotOutput("Classes")
      ),

    shinymaterial::material_card(
      title = "HeatMap",
      color = "transparent",
      depth = 3,
      shiny::plotOutput("Heatmap")
    )
  ),

  shinymaterial::material_side_nav_tab_content(
                side_nav_tab_id = "location_id",

    shinymaterial::material_card(
      title = "Location",
      color = "transparent",
      depth = 3,
      shiny::plotOutput("World")
    )
  ),

  shinymaterial::material_side_nav_tab_content(
    side_nav_tab_id = "mass_id",

    shinymaterial::material_card(
      title = "Mass",
      color = "transparent",
      depth = 3,
      shinymaterial::material_slider("mass_size",
                      label = "Size of the included mass",
                      min_value = 1000,
                      max_value = 500000,
                      step_size = 10000,
                      initial_value = 1000,
                      color = "blue"
                      ),

      shiny::plotOutput("Histogram")
    )
  ),

  shinymaterial::material_side_nav_tab_content(
    side_nav_tab_id = "about_id",

    shinymaterial::material_card(
      title = "About",
      color = "white",
      depth = 3,

      shiny::p("This GUI allows you to analyze recorded impacts of meteroites on earth."),
      shiny::p("The Type page shows the numbers of each class of meteroites and a plot which visaulize the data table.
        The Location page shows the geographical positions of the meteroites found on earth.
        The Mass page shows the histogram of the mass of the found meteroites"),
      shiny::br(),
      shiny::p("This application is using data hosted by the NASA and was provided by The Meteoritical Society.
        The original data can be found under the following link:",
        shiny::a("Meteroites Landing", href = "https://data.nasa.gov/Space-Science/Meteorite-Landings/gh4g-9sfh")),
      shiny::br(),
      shiny::br(),
      shiny::br(),
      shiny::p("This shiny application was created by Joel Kischkel"),
      shiny::br(),
      shiny::a(img(src = "GitHub-Mark-64px.png", height = 32, width = 32), href="https://github.com/unimi-dse/09ea9da6"),
      shiny::a(img(src = "LI-In-Bug.png", height = 28, width = 32), href = "https://it.linkedin.com/in/joel-kischkel-180437134")
    )
  )
)

