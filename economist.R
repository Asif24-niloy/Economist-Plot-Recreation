## Economist's Plot

df <- read.csv("Economist_Assignment_Data.csv")
head(df)
str(df)
df$X <- NULL
head(df)
pointsToLabel <- c("Russia", "Venezuela", "Iraq","Myanmar",
                   "Sudan","Afghanistan","Congo","Greece",
                   "Argentina","Italy","China","South Africa",
                   "Spain","Brazil","India","Botswana","Cape Verde",
                   "Bhutan","Rwanda","France","Germany","United States",
                   "Barbados","Britain","Norway","Japan","New Zealand",
                   "Singapore")

pl <- ggplot(df, aes(x = CPI, y = HDI, color = Region)) +
  geom_point(size = 4, shape = 1)
pl2 <- pl + geom_smooth(aes(group = 1), 
                        se = FALSE, method = "lm",
                        color = "red",
                        formula = y~log(x))

pl3 <- pl2 + geom_text(aes(label = Country), 
                       color = "gray20",
                       data = subset(df, Country %in% pointsToLabel),
                       check_overlap = TRUE)
pl3 + theme_economist_white() + scale_x_continuous(limits= c(0.95,10.5), breaks = 1:10)


ls(mtcars)
mtcars

