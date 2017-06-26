data(mtcars)
library(plotly)
library(ggplot2)
mtcars$am <- factor(mtcars$am, labels=c("Automatic", "Manual"))
mtcars$car.name <- rownames(mtcars)
p <- ggplot(mtcars, aes(x=wt, y = mpg, color=am))
p + geom_point() + ggtitle("MPG vs. Weight") + xlab("Weight (thousands of pounds)")

plot_ly(mtcars, x=~wt, y=~mpg, color=~factor(am), colors=c("#E69F00", "#56B4E9"), type="scatter", mode="markers",
        size=I(10), 
        text = ~paste(car.name, '<br>Weight: ', wt, 
                      'K pounds', '<br>', mpg, ' MPG', sep="")) %>%
     layout(xaxis=list(title="Weight (thousand pounds)"),
            yaxis=list(title="MPG"), 
            title="MPG vs. Weight")
