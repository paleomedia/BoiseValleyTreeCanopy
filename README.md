# Boise Valley Tree Canopy
Treasure Valley Idaho tree canopy data combined with 2013 American Community Survey demographic data with R scripts for multivariate analysis. 

##Background
A recent article in [PLOS One] (http://journals.plos.org/plosone/s/journal-information), a peer-reviewed, open access journal, discussed urban tree canopies in Baltimore, LA, New York, Philadelphia, Raleigh, Sacramento and Washington, D.C. as tree cover relates to socioecomonic factors and environmental justice.

The article, [*Trees Grow on Money: Urban Tree Canopy Cover and Environmental Justice*](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4382324/) , asserts: 

> Urban Tree Canopy (UTC) cover is widely regarded as an environmental good or amenity. UTC cover as an environmental amenity stems from the direct flow of perceived benefits, or ecosystem services, to people and neighborhoods where UTC cover is found.

The author's data is [available via figshare](http://figshare.com/articles/Urban_Tree_Canopy_and_Environmental_Justice/1213775).

We worked with Michail Fragkias, one of the article's co-authors and an economist at Boise State University, to reproduce the data for the Boise Valley, also know as the Treasure Valley, part of a two-county area in Southwest Idaho.

This repository contains the data we used in the analysis.

##Tree Canopy data

The tree canopy data comes from the [Treasure Valley Canopy Analysis Project] (http://www.tv.terrasummit.com/TV-Canopy_Data_Tools.html), a large survey completed in 2013. The [Treasure Valley Canopy Network] (http://www.tvcanopy.net/) also offers an online map viewer and many other tools.

For this analysis, we used the Urban Tree Canopy (UTC) coverage, as a percent of land area by Census block. You can find this as a GIS layer Under the "Treasure Valley Area of Interest" section, "AOI Results--State Plane" files.

We exported the census block data to a csv file and aggregated blocks to block groups by stripping the 12-character block ID out of the 15-character block ID (h/t [John Mackenzie at University of Delaware](http://www.udel.edu/johnmack/frec682/census/census_lab2.html)). We then [summarized the blockgroups](http://webapps.stackexchange.com/questions/36103/how-to-group-data-in-a-google-spreadsheet) into a new sheet. We performed these operations in [Google Sheets](https://docs.google.com/spreadsheets/d/1kZj6hDU7M5camDR4Kc-0YqGqqINisiBXeTHTQSv1mcw/edit?usp=sharing), where you can follow along.

We also eliminated ~29 outlying Census blocks that fell outside of the Treasure Valley block groups by comparing the aggregated acreage of the blocks to the acreage of the block groups. That is the ACRES_DIFF column in the UTC_Demographics_TV_2013 - MASTER TRIMMED.csv in this directory.

##Census data

The Census data comes from [Census Reporter](http://censusreporter.org), an amazing, data-rich portal to the American Community Survey. We downloaded shapefiles (available here as well) of the following Census tables for Ada and Canyon counties Idaho:
+ B02001 - race
+ B19013 - median household income
+ B03003 - Hispanic origin
+ B25002 - occupied/vacant
+ B11012 - housing tenure
+ B25077 - home value
+ B15003 - educational attainment

We then exported CSV files for each table using QGIS, an open source GIS application; Census Reporter offers CSV direct downloads as well, btw. Using the data, we created percentage columns and built a table matching the demographic information to the tree canopy data, by Census Block Group.

##Data Notes
+ Some small block groups have high margins of error for certain demographics
+ On the race table, we combined "Two races including Some other race" and "Two races excluding Some other race, and three or more races" with "Two or more races"
+ On the educational attainment table, we combined several categories to "% bachelor's degree or higher" and "% no high school"

##Read the full report at http://thebluereview.org
Full URL to come... 

