Collatz Conjecture
================

## GitHub Documents

This is an R Markdown format used for publishing markdown documents to
GitHub. When you click the **Knit** button all R code chunks are run and
a markdown file (.md) suitable for publishing to GitHub is generated.

## Including Code

You can include R code in the document as follows:

``` {r collatz_df}
summary(collatz_df)

```

     start                         
 Min.   :    1             
 1st Qu.: 2501             
 Median : 5000             
 Mean   : 5000          
 3rd Qu.: 7500             
 Max.   :10000            



## Including Plots

You can also embed plots, for example:

```{r, fig.cap="Sequence Length Heatmap", echo=FALSE}
```
![](README_files/figure-gfm/seq-length-to-reach-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
