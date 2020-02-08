# 09ea9da6
# Meteroites2 Package
This package shows confirmed impacts of meteroites on earth. It is possible to analyse the different types of meteroites by mass and class of meteroites. Additionally the package allows to plot the locations of the meteroites around the world.
### Meteroites
Meteroites are solid pieces from an object from outer space that survived the passage throught the atmosphere to reach the surface. 
### Aim of the package
The package provides functions to analyse and plot the different types and locations of meteroites registered on earth.
## Getting started
These instructions will get you a copy of the package and allows it to run on your local machine.
#### Installing
Install the package
```R
devtools::install_github("unimi-dse/09ea9da6")
```
Load the package
```R
require(meteroites2)
```
## Usage
#### meteroitesapi
```R
meteroitesapi()
```
The meteroitesapi function downloads the data from the NASA SODA API.

#### distance
```R
distance()
```
The distance function calculates the string distance between the main and subtypes of meteroites.

#### clusterComputation
```R
clusterComputation()
```
The clusterComputation function  computes the final data frame in wich categorie a meteroite belongs.

#### meteroitesGUI
```R
meteroitesGUI()
```
Renders a shiny app, which is the frontend of the package.

#### meteroites.hist
```R
meteroites.hist(l)
```
The meteroites.hist function computes a histogram of the mass, depending wich maximal mass should be included.

#### meteroites.plotClass
```R
meteroites.plotClass()
```
The meteroites.plotClass function generates a plot out of the result from the clusterComputation function.

#### meteroites.world

```R
meteroites.world()
```
The meteroites.world function plots all the location of founded meteroites on a world map.

#### meteroites.heatMap
```R
meteroites.heatMap()
```
The meteroites.heatMap function creates a heatmap out of the string distances between main and subtypes of meteroites.


## Documenation and test
To access the documenation for each function please type the following comands
```R
?meteroitesapi
?distance
?clusterComputation
?meteroitesGUI
?meteroites.hist
?meteroites.plotClass
?meteroites.world
?meteroites.heatMap
?meteroites.mean
?meteroites.min
?meteroites.max
```


