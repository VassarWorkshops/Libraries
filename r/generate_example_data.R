# Generate example event data
# Author: Jacob Levernier, j@adunumdatum.org
# Year: 2018
# License: MIT

# Load packages -----------------------------------------------------------

library(dplyr)
library(lubridate)
library(purrr)
library(readr)
library(stringr)

# Settings ----------------------------------------------------------------

number_of_records <- runif(1, 500, 1000) %>% round()
number_of_people <- runif(1, 50, 400) %>% round()

output_wifi_filename <- "wifi_dataset.csv"
output_card_swipe_filename <- "card_swipe_dataset.csv"

possible_wifi_events <- c(
  "start_session",
  "journal_access",
  "website_access"
)

# Set up functions for writing random data of various types ---------------

generate_random_date <- function(throwaway_variable, min_year = 2017, max_year = 2017) {
  paste(
    runif(1, min_year, max_year) %>% 
      round(),
    runif(1, 01, 12) %>% 
      round() %>% 
      str_pad(width = 2, side = "left", pad = 0),
    # We're generating example data, so it's ok if we don't have any
    # 29-31s of the month (such that all dates that we DO have are
    # valid):
    runif(1, 01, 28) %>% 
      round() %>% 
      str_pad(width = 2, side = "left", pad = 0),
    sep = "-"
  )
}

# generate_ip_address <- function(throwaway_variable) {
#   paste(
#     runif(4, 1, 255) %>% map_dbl(round),
#     # sep = ".",
#     collapse = "."
#   )
# }

generate_id_numbers <- function(throwaway_variable) {
  paste(
    runif(1, 900160000, 900169999) %>% map_dbl(round),
    # sep = ".",
    collapse = "."
  )
}

generate_event <- function(throwaway_variable, possible_event = possible_wifi_events) {
  sample(possible_event, 1)
}

# Generate wifi data ------------------------------------------------------

dates <- 1:number_of_records %>%
  sapply(generate_random_date)

# ip_addresses <- 1:number_of_records %>% 
#   sapply(generate_ip_address) %>% 
#   sample(size = number_of_people, replace = FALSE) %>% 
#   sample(size = number_of_records, replace = TRUE)

card_numbers <- 1:number_of_records %>% 
    sapply(generate_id_numbers) %>%
    sample(size = number_of_people, replace = FALSE) %>%
    sample(size = number_of_records, replace = TRUE)

events <- 1:number_of_records %>% 
  sapply(generate_event)

example_wifi_data <- tibble(
  date = dates,
  # ip_address = ip_addresses,
  card_number = card_numbers,
  event = events
)

# Generate card swipe data ------------------------------------------------

# Generate wifi data ------------------------------------------------------

dates <- 1:number_of_records %>%
  sapply(generate_random_date)

card_numbers <- 1:number_of_records %>% 
  sapply(generate_id_numbers) %>%
  sample(size = number_of_people, replace = FALSE) %>%
  sample(size = number_of_records, replace = TRUE)

events <- "card_swipe"

example_card_swipe_data <- tibble(
  date = dates,
  card_number = card_numbers,
  event = events
)

# Write the data ----------------------------------------------------------

example_wifi_data %>% 
  readr::write_csv(
    path = file.path("data", output_wifi_filename)
  )

example_card_swipe_data %>% 
  readr::write_csv(
    path = file.path("data", output_card_swipe_filename)
  )

