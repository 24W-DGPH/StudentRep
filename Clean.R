

# Load Packages -------------------------
pacman::p_load(
  rio, # importing data
  here, # relative file pathways
  janitor, # data cleaning and tables
  lubridate, # working with dates
  matchmaker, # dictionary-based cleaning
  epikit, # age_categories() function
  tidyverse, # data management and visualization
  #
  styler, # source code formatting
  lintr, # detects bad code patterns, which are not errors
  #
  todor # add TODO comments to your project
)
# Import Data ---------------------------
# TODO: check wrong file on import
linelist_raw <- import("linelist_raw.xlsx", setclass = "tibble")


  
    



# Clean Data ----------------------------

linelist <- linelist_raw %>%
  janitor::clean_names() %>%
  rename(
    date_infection = infection_date,
    date_hospitalization = hosp_date,
    date_outcome = date_of_outcome   
  ) %>%
  select(-c(row_num,x28, merged_header)) %>%
  distinct() %>%
  mutate(
    bmi = wt_kg/(ht_cm/100)^2,
    gender = case_match(
      gender,
      "f" ~ "female",
      "m" ~ "male"
    )
  )

#change data types
mutate(
  across(contains ("date"), as .Date)
  
)

