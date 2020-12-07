
library(tidyverse)
data <- read_tsv("input/day-3.txt", col_names = c("pattern"))

right <- 3
tree_counter <- function(right) {
  data %>%
    mutate(key_x = (((row_number()-1)*right)+1)%% str_length(pattern),
           key_x = ifelse(key_x==0, str_length(pattern),key_x),
           is_tree = str_sub(string = pattern, start = key_x, end = key_x)=="#") %>% 
    summarize(is_tree = sum(is_tree)) %>% 
    pull()
}

# part 1
tree_counter(3)

# part 2