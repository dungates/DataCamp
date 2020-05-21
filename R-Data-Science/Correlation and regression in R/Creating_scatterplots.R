# Mammals scatterplot

ggplot(data = mammals, aes(x = BodyWt, y = BrainWt)) + geom_point()

# Baseball player scatterplot

ggplot(data = mlbBat10, aes(x = OBP, y = SLG)) +geom_point()

# Body dimensions scatterplot

ggplot(data = bdims, aes(x = hgt, y = wgt, color = factor(sex))) +geom_point()

# Smoking scatterplot

ggplot(data = smoking, aes(x = age, y = amtWeekdays)) + geom_point()
