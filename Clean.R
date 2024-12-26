

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
  todor, # add TODO comments to your project
  lubridate,  # general package for handling and converting dates  
  parsedate,  # has function to "guess" messy dates
  aweek,      # another option for converting dates to weeks, and weeks to dates
  zoo,        # additional date/time functions
  here,       # file management
  rio,        # data import/export
  tidyverse,  # data management and visualization
  stringr,    # many functions for handling strings
  tidyverse,  # for optional data manipulation
  tools     # alternative for converting to title case
 )

# Import Data ---------------------------
# TODO: check wrong file on import
linelist_raw <- import("linelist_raw.xlsx", setclass = "tibble")


  
    



# Clean Data ----------------------------

linelist <- linelist_raw |> 
  janitor::clean_names() |> 
  rename(
    date_infection = infection_date,
    date_hospitalization = hosp_date,
    date_outcome = date_of_outcome   
  ) %>%
  select(-c(row_num,x28, merged_header)) %>%
  distinct()  |> 
  mutate(
    bmi = wt_kg/(ht_cm/100)^2,
    gender = case_match(
      gender,
      "f" ~ "female",
      "m" ~ "male"
    )
  )


linelist <- import("linelist.xlsx")

# Convert to class date
linelist <- linelist %>% 
  mutate(date_onset = as.Date(date_onset, format = "%d-%m-%Y"))

linelist <- import("linelist.xlsx")

mutate(
  combined_string = str_c(gender,age,age_unit, sep=",")
  ) %>%
  
  mutate(
    days_onset_hosp = date_hospitalisation -date_onset
  ) %>%

df <- data.frame(
  case_ID = c(1:6),
  symptoms  = c("jaundice, fever, chills",     # patient 1
                "chills, aches, pains",        # patient 2 
                "fever",                       # patient 3
                "vomiting, diarrhoea",         # patient 4
                "bleeding from gums, fever",   # patient 5
                "rapid pulse, headache"),      # patient 6
  outcome = c("Recover", "Death", "Death", "Recover", "Recover", "Recover"))

df_split <- separate(df, symptoms, into = c("sym_1", "sym_2", "sym_3"), extra = "merge")
