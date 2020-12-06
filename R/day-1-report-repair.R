# Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isn't quite adding up.
# 
# Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.
# 
# For example, suppose your expense report contained the following:
# 
# 1721
# 979
# 366
# 299
# 675
# 1456
# 
# In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579, so the correct answer is 514579.
# 
# Of course, your expense report is much larger. Find the two entries that sum to 2020; what do you get if you multiply them together?


# input -------------------------------------------------------------------
input <- readr::read_delim("input/day-1.txt", delim = "\n", col_names = F)$X1


# part 1 ------------------------------------------------------------------

for (i in seq_len(input)) {
  value_1 <- input[i]
  for (j in seq_len(input)) {
    if (i < j) {
      value_2 <- input[j]
      sum_values <- value_1 + value_2
      if (!is.na(sum_values) & sum_values == 2020) {
        print(value_1 * value_2)
        stop()
      }
    }
  }
}
# 864864


# part 2 ------------------------------------------------------------------
# The Elves in accounting are thankful for your help; one of them even offers you a starfish coin they had left over from a past vacation. They offer you a second one if you can find three numbers in your expense report that meet the same criteria.
# 
# Using the above example again, the three entries that sum to 2020 are 979, 366, and 675. Multiplying them together produces the answer, 241861950.
# 
# In your expense report, what is the product of the three entries that sum to 2020?

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


# other solutions ---------------------------------------------------------

# part 1 


# part 2
