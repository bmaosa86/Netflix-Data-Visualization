# In R, load the dataset and plot
netflix_data <- read.csv("C:/Users/BenjaminMaosaMongare/netflix_shows_movies_cleaned.csv")
library(ggplot2)

head(netflix_data)

# Create a bar plot for the top 10 genres
top_genres <- head(sort(table(netflix_data$listed_in), decreasing = TRUE), 10)

# Convert to a data frame for ggplot
top_genres_df <- as.data.frame(top_genres)
colnames(top_genres_df) <- c("genre", "count")

# Create the bar plot
ggplot(top_genres_df, aes(x = reorder(genre, -count), y = count, fill = genre)) +
  geom_bar(stat = "identity") + # Use stat="identity" for pre-counted data
  labs(title = "Top 10 Most Watched Genres", x = "Genre", y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_brewer(palette = "Set3") +
  theme_minimal()
