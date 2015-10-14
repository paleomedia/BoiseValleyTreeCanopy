#GETTING SETUP
rm(list=ls())
options(graphics.record=TRUE)
windows(record=TRUE)
#library(reshape)

#READ DATASET OF CHOICE
#ADJUST PATH TO FILE IN COMMAND BELOW IF NEEDED
data1 <- read.table("UTC_Demographics_TV_2013.csv", header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
#GET A VISUAL OF ALL VARIABLES
head(data1)

#NUMBER OF OBSERVATIONS
nrow(data1)

#DATA DICTIONARY
#BLOCKGRP: Cencus Blockgroup (BG) ID
#Land_Acres: Area of BG from tree canopy files in acres
#UTC_Acres: Urban tree canopy area size
#POP_2013: Population in BG, 2013
#Hispanic_pct: ACS 2013
#White_pct: ACS 2013
#Black_pct: ACS 2013
#NativeAmer_pct: ACS 2013
#Asian_pct: ACS 2013
#PacIsland_pct: ACS 2013
#OtherRace_pct: ACS 2013
#TwoPlus_pct: ACS 2013
#MedHshldIncome: ACS 2013
#Vacant_pct: ACS 2013
#Rent_pct: ACS 2013
#Value: Median home value, ACS 2013
#NoHighSchool_pct: ACS 2013
#HighSchool_pct: ACS 2013
#College_pct: ACS 2013
#AdvDegree_pct: ACS 2013

# CREATING NEW VARIABLES
#Tree_P: Percent tree canopy from high-res land cover
#logTree_P:
#PopDens:
data1$Tree_P <- ((data1$UTC_Acres/data1$Land_Acres)*100)
data1$logTree_P <- log(data1$Tree_P)
data1$PopDens <- data1$POP_2013 / data1$Land_Acres
data1$AllRaces <- data1$Hispanic_pct + data1$White_pct + data1$Black_pct + data1$NativeAmer_pct + data1$Asian_pct + data1$PacIsland_pct + data1$OtherRace_pct

#SOME VISUAL CHECKS ON NORMALITY AND CORRELATIONS
hist(data1$MedHshldIncome)
hist(data1$PopDens)
qqnorm(data1$Tree_P)
qqnorm(data1$logTree_P)
qqnorm(data1$PopDens)
pairs(data1[,5:12])
pairs(data1[,13:20])

#REVIEW NEW VARIABLES
head(data1)

#BASELINE SPECIFICATION - DEPENDENT VARIABLE IS LEVEL
lm1 <- lm(Tree_P ~ PopDens + Asian_pct + Black_pct + Hispanic_pct + NativeAmer_pct +
+ NoHighSchool_pct + College_pct + AdvDegree_pct + MedHshldIncome + Rent_pct + Vacant_pct, data=data1)
summary(lm1)

# BASELINE SPECIFICATION - DEPENDENT VARIABLE IS LOG
lm1_log<- lm(logTree_P ~ PopDens + Asian_pct + Black_pct + Hispanic_pct + NativeAmer_pct +
+ NoHighSchool_pct + College_pct + AdvDegree_pct + MedHshldIncome + Rent_pct + Vacant_pct, data=data1)
summary(lm1_log)

