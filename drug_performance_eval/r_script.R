# ==============================================================================
#                      LOAD PACKAGES
# ==============================================================================
# Data manipulation
library(data.table)
library(dplyr)

# Visualization
library(GGally)
library(ggplot2)
library(gridExtra)
library(shiny)
library(shinydashboard)

# Data summaries
library(stats)

# ==============================================================================
#                   DATA PREPROCESSING
# ==============================================================================

# LOAD DATA
# ------------------------------------------------------------------------------
# Load data in a data.table object
dt <- fread("data.csv")

# Explore the structure of the data 
str(dt, vec.len=1)

# SELECT FEATURES
# ------------------------------------------------------------------------------
# Drop columns which are not necessary for the analysis 
dt[,  c("Indication", "Reviews", "Type") := NULL]

# Display first few rows of the data
head(dt)

# HANDLING MISSING VALUES
# ------------------------------------------------------------------------------
# Check for missing values in n multiple columns of the data.table
missing_values <- lapply(dt, function(x) sum(is.na(x)))
missing_values

# HANDLING DUPLICATES
# ------------------------------------------------------------------------------
# Subset dt to only include the duplicate rows
duplicates <- dt[duplicated(dt)]

# Check for duplicates
if (length(duplicates) > 0) {
  print("Duplicates found in the data.table.")
} else {
  print("No duplicates found in the data.table.")
}

# Display duplicate rows
duplicates

# Drop duplicate rows by keeping only the first occurrence
dt <- dt[!duplicated(dt)]

# TRANSFORMING VARIABLES
# ------------------------------------------------------------------------------
# COLUMN 'Condition'
# Total number of unique entries 
num_conditions <- uniqueN(dt$Condition)
num_conditions

# COLUMN 'Drug'
# Total number of unique entries 
num_drugs <- uniqueN(dt$Drug)
num_drugs

# COLUMN 'Form'
# Total number of unique entries
num_forms <- uniqueN(dt$Form)
num_forms

# List unique entries
forms <- unique(dt$Form)
forms

# Convert the Form entries into factors
dt[, Form  := as.factor(Form)]

# Count number of occurrences of each level in the Form factor 
summary(dt$Form)

# ==============================================================================
#                   EXPLORATORY DATA ANALYSIS
# ==============================================================================
# Function to generate grouped bar plot
grouped_bar_plot <- function(data, col_name) {
  # Calculate the number of drugs grouping by a given column
  counts <- data[, .(num_drugs = .N), by = col_name]
  
  # Create the plot
  g <- ggplot(data = counts,                                          # data source
              mapping = aes(
                x = reorder(!!rlang::sym(col_name), -num_drugs),      # order bars descending 
                y = num_drugs)) + 
    geom_bar(stat = "identity", fill = "steelblue") +                 # create grouped bar plot
    geom_text(aes(label = num_drugs),                                 # add bar count label
              vjust = -0.5, color = "steelblue", size = 3.5) +     
    ggtitle(paste("Total number of drugs reviewed per", col_name)) +  # add plot title
    xlab(col_name) +                                                  # set X axis label
    ylab("Drug Count") +                                              # set Y axis label
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +        # rotate X axis labels
    coord_cartesian(ylim = c(0, max(counts$num_drugs) * 1.1))         # adjusts the Y axis limits 
  
  return(g)                                                                                       
}

# Generate and print the grouped bar plots
print(grouped_bar_plot(dt, "Condition"))    # plot drug count per medical condition
print(grouped_bar_plot(dt, "Form"))         # plot drug count per drug form

# ==============================================================================
#                      SHINY DASHBOARD
# ==============================================================================

# Select name of columns with numerical data 
numeric_col <- names(dt)[sapply(dt, is.numeric)]

# HEADER
# ------------------------------------------------------------------------------
header <- dashboardHeader(title = "Drug Performance Evaluation")

# SIDEBAR
# ------------------------------------------------------------------------------
sidebar <- dashboardSidebar(
  # Sidebar content
  sidebarMenu(
    # Menu items for each tab
    menuItem("Descriptive Statistics", tabName = "descriptive", icon = icon("chart-bar")),
    menuItem("Statistical Inference", tabName = "inference", icon = icon("calculator"))
  )
)

# BODY
# ------------------------------------------------------------------------------
body <- dashboardBody(
  # Body content
  tabItems(
    # TAB: Descriptive Statistics 
    tabItem(tabName = "descriptive",
            # Sidebar for Descriptive Statistics
            sidebarLayout(
              sidebarPanel(
                # Sidebar content for Descriptive Statistics
                style = "flex: 0 0 auto; max-width: 300px;",        # adjust max-width for the sidebar panel
                tags$style(".selectize-input { width: 100%; }"),    # adjust width for selectInput
                checkboxGroupInput("form_checkbox",                 # create checkbox for filtering drug forms
                                   label = "Filter by drug form:",  
                                   choices = forms,
                                   selected = NULL),
                selectInput("column_select",                        # create dropdown menu for selecting customer review
                            label = "Select a customer review:", 
                            choices = numeric_col,
                            selected =  numeric_col[1])
              ),
              # Main panel for Descriptive Statistics
              mainPanel( 
                fluidRow(                                 # represent row in a fluid grid system
                  # Box plot
                  column(width = 12,                      # define column with a width of 12 (full width)
                         plotOutput("boxplot")            # renders box plot for the selected data
                  )
                ),
                fluidRow(
                  # Density plot
                  column(width = 12,
                         plotOutput("densityplot")        # render density plot for the selected data
                  )
                ),
                fluidRow(
                  # Summary section
                  column(width = 12,
                         uiOutput("summary_tables")       # render summary stats for the selected data
                  )
                )
              )
            )
    ),
    
    # TAB: Statistical Inference 
    tabItem(tabName = "inference",
            sidebarLayout(
              # Sidebar for Statistical Inference
              sidebarPanel(
                # Sidebar content for Statistical Inference
                selectInput("correlation_method",         # create dropdown menu for selecting corr. method
                            label = "Correlation method:",
                            choices = c("Spearman", "Kendall"),
                            selected = "Spearman")
              ),
              
              # Main panel for Statistical Inference
              mainPanel(
                # Correlogram plot
                plotOutput("correlogram")                 # render correlogram for the selected corr. method
              )
            )
    )
  )
)

# USER-INTERFACE
# ------------------------------------------------------------------------------
ui <- dashboardPage(header, sidebar, body)

# SERVER
# ------------------------------------------------------------------------------
server <- function(input, output) {
  
  # CODE FOR THE DESCRIPTIVE STATISTICS TAB
  # Filter the data based on the selected form(s)
  filtered_data <- reactive({
    req(input$form_checkbox)
    dt %>%
      filter(Form %in% input$form_checkbox)
  })
  
  # Render the box plot
  output$boxplot <- renderPlot({
    ggplot(filtered_data(), aes(x = Form, y = .data[[input$column_select]], fill = Form)) +
      geom_boxplot() +
      scale_fill_discrete(name = "Form") +
      labs(title = "Box Plot", x = "Form", y = input$column_select)
  })
  
  # Render the density plot on the filtered data
  output$densityplot <- renderPlot({
    ggplot(filtered_data(), aes(x = .data[[input$column_select]], fill = Form)) +
      geom_density(alpha = 0.5) +
      scale_fill_discrete(name = "Form") +
      labs(title = "Density Plot", x = input$column_select) +
      theme(plot.margin = margin(0, 20, 0, 0))
  })
  
  # Generate summary statistics for selected column and form
  output$summary_tables <- renderUI({
    req(input$column_select, input$form_checkbox)
    
    column_name <- input$column_select
    form_values <- input$form_checkbox
    
    filtered_data <- dt[dt$Form %in% form_values, ]
    
    tables <- lapply(form_values, function(forms) {
      selected_data <- filtered_data[filtered_data$Form == forms, ]
      
      summary_stats <- data.frame(
        Min = min(selected_data[[column_name]]),
        First_Quantile = quantile(selected_data[[column_name]], 0.25),
        Median = median(selected_data[[column_name]]),
        Mean = mean(selected_data[[column_name]]),
        SD = sd(selected_data[[column_name]]),
        Third_Quantile = quantile(selected_data[[column_name]], 0.75),
        Max = max(selected_data[[column_name]])
      )
      
      # Create a table with the form as the table name
      table_name <- paste("Summary for", forms)
      table_output <- renderTable(summary_stats)
      
      tagList(
        h4(table_name),
        table_output
      )
    })
    
    do.call(tagList, tables)
  })
  
  # CODE FOR THE STATISTICAL INTERFERENCE TAB
  # Perform correlation analysis based on selected method
  correlation_analysis <- reactive({
    method <- switch(input$correlation_method,
                     "Spearman" = "spearman",
                     "Kendall" = "kendall")
    
    GGally::ggpairs(
      dt[, ..numeric_col],
      lower = list(continuous = wrap("points", alpha = 0.5, size = 1)),
      diag = list(continuous = wrap("densityDiag", fill = "lightblue")),
      upper = list(continuous = wrap("cor", method = method)),
      title = paste("Correlogram with", input$correlation_method, "'s Rank-Order Correlation Coefficients Method")
    )
  })
  
  # Render the correlogram plot
  output$correlogram <- renderPlot({
    correlation_analysis()
  })
}

# RUN THE SHINY APP
# ------------------------------------------------------------------------------
shinyApp(ui = ui, server = server)

