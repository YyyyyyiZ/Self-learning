## Data Format

> incorrectly formatted data can

* lead to mistakes
* take time to fix
* affect stakeholder’s decision-making

## Tools and Resources

> Best practices for searching online

* Thinking skills
	* mental model–your thought process and the way you approach a problem
* Data analytics terms
* Basic knowledge of tools

## Troubleshooting Questions

* How should I prioritize these questions?
* In a single setence, what’s the issueI’m facing?
* What resources can help me solve the problem?
* How can I stop this problem from happening in the future?

## Advantage of Programming Languages

* clarify the steps of your analysis
* save time
* reproduce your work and share with others

## R

> A programming language frequently usedfor statistical analysis, visualization, and other data analysis

> Based on another language S

### Adavantages

* accessible
* data-centric
	* reproducing your analysis
	* processing lots of data
	* creating data visualizations
* open source
* community

### Course Overview

* operators

* Basic concepts

	* functions
	* comments
	* variables
	* data types
	* vectors
	* pipes—a tool in R for expressing a sequence of multiple operations, represented with “%>%”

* packages—Units of reproducible R code

	* resuable R functions
	* documentation about the functions
	* sample datasets
	* tests for checking your code

	```R
	# list installed packages
	installed.packages()
	```

	> tidyverse

	![image-20230723133112173](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230723133112173.png)

	```R
	# update all packages
	tidyverse_update()
	# update one package
	install.packages("package_name")
	```


## Tibbles

### Features

* Never change the data types of the inputs
* Never change the names of your variables
* Never create row names
* Make printing easier

```R
#创建tibble
get3<-tibble(
  Person=c("czk","xwj","pjj"),
  Age=c(18,19,19),
  Weighted=c(70,80,60),
  Height=c(168, 180, 165),
  Salary=c(8000,4000,5000),
  Sex=as.factor(c("female","male","male"))
)
get3
```

```R
# A tibble: 3 × 6
  Person   Age Weighted Height Salary Sex   
  <chr>  <dbl>    <dbl>  <dbl>  <dbl> <fct> 
1 czk       18       70    168   8000 female
2 xwj       19       80    180   4000 male  
3 pjj       19       60    165   5000 male 
```

### Tidy data standards

* Variables are organized into columns
* Observations are organized into rows
* Each value must have its own cell

## Visualization

* ggplot2
	* Aesthetics—a visual property of an object in your plot
	* Geoms—geometric object
	* Facets—display smaller groups or subsets of data
	* Labels and annotations
* plotly
* lattice
* RGL
* dygraphs
* leaflet
* highcharter
* patchwork
* gganimate
* ggridges

## R Markdown

> documenting your analysis at any stage

## Terminology

* IDE(Integrated Development Environment)—a software appliction that brings together all the tools you may want to use in a single place
* CRAN(Comprehensive R Archive Network)—a online archive with R packages, source code, manuals, and documentation

* Nested—in programming, describes code that performs a particular function and is contained within code that performs a broader function
