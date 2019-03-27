# Introduction to RStudio -------------------------------------------------

# The 3-4 "panes" of RStudio

# Keyboard shortcuts:

  # ctrl/cmd + enter:   Run the current line, or highlighted lines, or string of commands

  # ctrl + shift + r:   Add a heading

  # ctrl + shift + m:   Add a "pipe" (%>%)

  # shift + arrow key:  Highlight using the keyboard

# Introduction to R -------------------------------------------------------

# Vocabulary:

  # Command = Function = Verb:    A single name for a series of steps

  # Library = Package:            Like an "add-on" or "extension" in a web browser like Chrome or Firefox

  # "Pipe" ("%>%"):               "And then..."

  # "Tibble" ~ "Data Frame":      A spreadsheet within R, containing rows and columns

# General syntax:

  # Add a comment by putting "#" in front.

  # command_name(option_1, option_2)
  
  # Saving things:

    # variable_name = 123

    # variable_name <- 123

    # 123 -> variable_name

  # Getting a command from a package:

    # install.packages("package_name")  # Install the package (once per computer)

    # Load the package, then use its commands:

      # library(package_name)       # Every time you open R
      # command_name()              # You can now use commands from the package directly
    
    # package_name::command_name()  # Alternatively, "go into package_name, and get the command_name command"
    

# The main verbs of the "tidyverse": --------------------------------------

# select()	  Get specific columns
# slice()     Get specific rows
# filter()	  Get rows that match a pattern
# group_by()  Group rows using a column
# summarize()	Summarize values by group
# mutate()	  Create a new column

# Built-in datasets to experiment with ------------------------------------

iris  # Flower measurements

mpg   # Car measurements

