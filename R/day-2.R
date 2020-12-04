# The Elves in accounting are thankful for your help; one of them even offers you a starfish coin they had left over from a past vacation. They offer you a second one if you can find three numbers in your expense report that meet the same criteria.
# 
# Using the above example again, the three entries that sum to 2020 are 979, 366, and 675. Multiplying them together produces the answer, 241861950.
# 
# In your expense report, what is the product of the three entries that sum to 2020?

# input -------------------------------------------------------------------
input <- readr::read_delim("input/day-1.txt", delim = "\n", col_names = F)$X1


for (v1 in seq_len(input)) {
  value_1 <- input[v1]
  
  for (v2 in seq_len(input)) {
    value_2 <- input[v2]
    
    for (v3 in seq_len(input)) {
      value_3 <- input[v3]
      
      sum_values <- value_1 + value_2 + value_3
      if (!is.na(sum_values) & sum_values == 2020) {
        print(value_1 * value_2 * value_3)
        stop()
        }
      
      }
    }
  }

# 281473080
