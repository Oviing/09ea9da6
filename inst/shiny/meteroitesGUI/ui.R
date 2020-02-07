#'@export
ui <- material_page(

  shinyWidgets::setBackgroundImage(
    src = "crater_colorJPG.jpg"
  ),

  title = "Meteroites2",

  nav_bar_color = "blue",

  material_side_nav(
    fixed = FALSE,
    material_side_nav_tabs(
      side_nav_tabs = c("Home" = "home_id",
                        "Types" = "type_id",
                        "Locations" = "location_id",
                        "Mass" = "mass_id",
                        "About" = "about_id")
    )
  ),

  material_side_nav_tab_content(
    side_nav_tab_id = "home_id",
    img(src = "tms.jpg", height = 100, width = 200),
    img(src = "nasa-logo-web-rgb.png", height = 100, width = 200)
  ),


  material_side_nav_tab_content(
    side_nav_tab_id = "type_id",

    material_card(
      title = "Data",
      color = "transparent",
      depth = 3,
      tableOutput("Class"),
      ),

    material_card(
      title = "Graph",
      color = "transparent",
      depth = 3,
      plotOutput("Classes")
      )
  ),

  material_side_nav_tab_content(
    side_nav_tab_id = "location_id",

    material_card(
      title = "Location",
      color = "transparent",
      depth = 3,
      plotOutput("World")
    )
  ),

  material_side_nav_tab_content(
    side_nav_tab_id = "mass_id",

    material_card(
      title = "Mass",
      color = "transparent",
      depth = 3,
      material_slider("mass_size",
                      label = "Size of the included mass",
                      min_value = 1000,
                      max_value = 500000,
                      step_size = 10000,
                      initial_value = 1000,
                      color = "blue"
                      ),

      plotOutput("Histogram")
    )
  ),

  material_side_nav_tab_content(
    side_nav_tab_id = "about_id",

    material_card(
      title = "About",
      color = "white",
      depth = 3,

      p("This GUI allows you to analyze registert impacts of meteroites on earth."),
      p("The tab Data shows the numbers of each class of meteroites.
        The tab Classes creates an plot out of the data from the Data tab.
        The World tab shows the geographical positions of the meteroites founded on earth.
        The Histogram tab shows the histogram of the mass of the founded meteroites"),
      br(),
      p("This application is using data hsoted by the NASA and was provided by The Meteoritical Society.
        The original data can be found under the following link:",
        a("Meteroites Landing", href = "https://data.nasa.gov/Space-Science/Meteorite-Landings/gh4g-9sfh")),
      br(),
      br(),
      br(),
      p("This shiny application was created by Joel Kischkel"),
      br(),
      a(img(src = "GitHub-Mark-64px.png", height = 32, width = 32), href="https://github.com/unimi-dse/09ea9da6"),
      a(img(src = "LI-In-Bug.png", height = 28, width = 32), href = "https://it.linkedin.com/in/joel-kischkel-180437134")
    )
  )
)

