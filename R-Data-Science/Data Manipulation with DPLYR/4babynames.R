babynames %>%
  # Filter for the year 1990
  filter(year == 1990) %>%
  # Sort the number column in descending order 
  arrange(desc(number))
  
# Find the most common name in each year
babynames %>%
  group_by(year) %>%
  top_n(1, number)
  
# Find the year each name is most common 
babynames %>%
group_by(year) %>%
mutate(year_total = sum(number)) %>%
ungroup() %>%
mutate(fraction = number / year_total) %>%
group_by(name) %>%
top_n(1, fraction)

babynames %>%
  group_by(name) %>%
  mutate(name_total = sum(number),
         name_max = max(number)) %>% 
           # Ungroup the table 
         ungroup() %>% 
           # Add the fraction_max column containing the number by the name maximum 
         mutate(fraction_max = number / name_max)

# Filter for the names Steven, Thomas, and Matthew
names_filtered <- names_normalized %>%
  filter(name %in% c("Steven", "Thomas", "Matthew"))

# Visualize these names over time
ggplot(data = names_filtered, aes(x = year, y = fraction_max, color = name)) + geom_line()

babynames_fraction %>%
  # Arrange the data in order of name, then year 
  arrange(name, year) %>%
  # Group the data by name
  group_by(name) %>%
  # Add a ratio column that contains the ratio between each year 
  mutate(ratio = fraction / lag(fraction))
  
babynames_ratios_filtered %>%
  # Extract the largest ratio from each name 
  top_n(1, ratio) %>%
  # Sort the ratio column in descending order 
  arrange(desc(ratio)) %>%
  # Filter for fractions greater than or equal to 0.001
  filter(fraction > 0.001)
  

