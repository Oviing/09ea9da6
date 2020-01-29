# 09ea9da6
# Meteroites Package
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
devtools::install_github("unimi-dse\09ea9da6")
```
Load the package
```R
require(meteroites)
```
#### First steps
The first function wich should be executed is:
```R
meteroitesapi()
```
It loads all necessary data for further computation.
#### Documenation and test
To access the documenation for each function please type the following comands
```R
?meteroitesapi
?distance
?clusterComputation
?cluster
?meteroites.hist
?meteroites.plotClass
?meteroites.world
?meteroites.mean
?meteroites.min
?meteroites.max
```
### Warning
Some function depends on other functions. For further information please read the documentation.

##### Example
```R
distance()
clusterComputation()
```
The distance function has to be executed before the clusterComputation function.
