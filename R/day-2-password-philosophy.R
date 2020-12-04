
# libraries ---------------------------------------------------------------
library(tidyverse)


# input -------------------------------------------------------------------
input <- 
readr::read_delim("input/day-2.txt", delim = ":", 
                         col_names = c("condition", "password")) %>% 
  separate(condition, sep = " ", c("chr_n", "letter")) %>% 
  separate(chr_n, sep = "-", c("min_n", "max_n")) %>% 
  mutate(
    across(
      c(min_n, max_n), ~as.integer(.)
    ), 
    password = str_trim(password)
  ) 

# part 1 ------------------------------------------------------------------

input %>% 
  mutate(
    chr_count = str_count(password, letter), 
    policy_ok = if_else(chr_count >= min_n & chr_count <= max_n, "ok", "not ok")
  ) %>% 
  filter(policy_ok == "ok") %>% 
  count(.) 

# part 2 ------------------------------------------------------------------

input %>% 
  mutate(
    pos_1 = str_sub(password, start = min_n, end = min_n),
    pos_2 = str_sub(password, start = max_n, end = max_n), 
    policy_ok = case_when(
      letter == pos_1 & letter != pos_2  ~ "ok", 
      letter == pos_2 & letter != pos_1  ~ "ok", 
      TRUE                               ~ "not ok"
      )
    ) %>% 
  filter(policy_ok == "ok") %>% 
  count(.) 

  



# other solutions ---------------------------------------------------------

passwords <- read_csv("input/day-2.txt", col_names = "policy") %>% 
  extract(policy, c("min", "max", "letter", "password"), 
          "(\\d+)-(\\d+) (.): *(.*)", convert = T) 

# part 1 
passwords %>% 
  mutate(count = map2_int(password, letter, str_count)) %>% 
  filter(count >= min, count <= max) %>% 
  nrow()


# part 2
passwords %>% 
  mutate(count = (str_sub(password, min, min) == letter) + 
           (str_sub(password, max, max) == letter)) %>% 
  filter(count == 1) %>% 
  nrow()