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

     start                   length      
 Min.   :    1           Min.   :  1.00  
 1st Qu.: 2501           1st Qu.: 46.00  
 Median : 5000           Median : 74.00  
 Mean   : 5000           Mean   : 85.97  
 3rd Qu.: 7500           3rd Qu.:126.00  
 Max.   :10000           Max.   :262.00  
                             
    parity                 max_val        
 Length:10000           Min.   :       1  
 Class :character       1st Qu.:    9232  
 Mode  :character       Median :   13336  
                        Mean   :   58996  
                        3rd Qu.:   32272  
                        Max.   :27114424

## Including Plots

You can also embed plots, for example:

![](README_files/figure-gfm/seq-length-to-reach-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
