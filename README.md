# czconvert

`czconvert` provides functions to crosswalk Public Use Microdata Area (PUMA) codes from the U.S. Census to Commuting Zones (CZ90). This is useful for researchers working with ACS or Census microdata who want to map geographic units to commuting zones for regional analysis.


# Installation

You can install the development version from GitHub with:   

``` r
# install.packages("devtools")
devtools::install_github("trangu05/czconvert")
```

# Data included

- cw_puma2000_czone – Crosswalk PUMA 2000 to CZ90 (from David Dorn https://www.ddorn.net/data.htm)
- cw_puma2010_czone – Crosswalk PUMA 2010 to CZ90 (from David Dorn https://www.ddorn.net/data.htm)
- cw_puma2020_czone – Crosswalk PUMA 2020 to CZ90
Each dataset contains mappings with allocation factors when PUMAs split across CZs.

# Citation

If you use `czconvert` in your research, please cite both the package and the original commuting zone definitions:

- Nguyen, T. (2025). `czconvert`: Crosswalking PUMA codes to Commuting Zones (CZ90). R package, version 0.1.0. https://github.com/trangu05/czconvert  

- Dorn, D. (2013). “The Growth of Low-Skill Service Jobs and the Polarization of the U.S. Labor Market.” American Economic Review, 103(5), 1553-1597, 2013. 


# License

This package is released under the MIT License.