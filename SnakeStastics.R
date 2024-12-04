setwd("C:/Users/gilli/OneDrive/Desktop/IND STUD SP2023/middle_east_files")
snake <- read.csv(file.choose(),header = TRUE)
snake <- read.csv("C:/Users/gilli/OneDrive/Desktop/IND STUD SP2023/middle_east_files/master_sheet_merged_done_FINAL.csv")

#master_sheet_merged_done_FINAL
################################################################################
#Colors
#------

#primary colors
unique(snake$primary.color)
BlackSnakes <- subset(snake, primary.color == "black") #216 obs
RedSnakes <- subset(snake, primary.color == "red") #9obs
OrangeSnakes <- subset(snake, primary.color == "orange") #17obs
YellowSnakes <- subset(snake, primary.color == "yellow") #12obs
GreenSnakes <- subset(snake, primary.color == "green") #26obs
BlueSnakes <- subset(snake, primary.color == "blue") #1obs
PurpleSnakes <- subset(snake, primary.color == "purple") #36obs
LightgraySnakes <- subset(snake, primary.color == "lightgray") #220obs
DarkgraySnakes <- subset(snake, primary.color == "darkgray") #144obs
BrownSnakes <- subset(snake, primary.color == "brown") #167obs
LightBrownSnakes <- subset(snake, primary.color == "lightbrown") #282obs
DarkbrownSnakes <- subset(snake, primary.color == "darkbrown") #106obs
BeigeSnakes <- subset(snake, primary.color == "beige") #188obs
WhiteSnakes <- subset(snake, primary.color == "white") #30obs
ColorlessSnakes <- snake[snake$primary.color== "",] #122 obs
#colorless: these include snakes that are museum photos, only the ventral side is showing,
#or the photo is in black and white

#secondary colors
unique(snake$secondary.color)
Black2Snakes <- subset(snake, secondary.color == "black") #279 obs
Red2Snakes <- subset(snake, secondary.color == "red") #9obs
Orange2Snakes <- subset(snake, secondary.color == "orange") #28obs
Yellow2Snakes <- subset(snake, secondary.color == "yellow") #33obs
Green2Snakes <- subset(snake, secondary.color == "green") #12obs
Blue2Snakes <- subset(snake, secondary.color == "blue") #1obs
Purple2Snakes <- subset(snake, secondary.color == "purple") #1obs
Lightgray2Snakes <- subset(snake, secondary.color == "lightgray") #82obs
Darkgray2Snakes <- subset(snake, secondary.color == "darkgray") #64obs
Brown2Snakes <- subset(snake, secondary.color == "brown") #205obs
LightBrown2Snakes <- subset(snake, secondary.color == "lightbrown") #132obs
Darkbrown2Snakes <- subset(snake, secondary.color == "darkbrown") #206obs
Beige2Snakes <- subset(snake, secondary.color == "beige") #148obs
White2Snakes <- subset(snake, secondary.color == "white") #54obs
Colorless2Snakes <- snake[snake$secondary.color== "",] #322 obs
#snakes in this category^ may not have a second color

#tertiary colors
unique(snake$tertiary.color)
Black3Snakes <- subset(snake, tertiary.color == "black") #149 obs
Red3Snakes <- subset(snake, tertiary.color == "red") #4obs
Orange3Snakes <- subset(snake, tertiary.color == "orange") #28obs
Yellow3Snakes <- subset(snake, tertiary.color == "yellow") #12obs
Green3Snakes <- subset(snake, tertiary.color == "green") #2obs
Blue3Snakes <- subset(snake, tertiary.color == "blue") #1obs
#no snakes have purple as their secondary color
Lightgray3Snakes <- subset(snake, tertiary.color == "lightgray") #39obs
Darkgray3Snakes <- subset(snake, tertiary.color == "darkgray") #11obs
Brown3Snakes <- subset(snake, tertiary.color == "brown") #29obs
LightBrown3Snakes <- subset(snake, tertiary.color == "lightbrown") #40obs
Darkbrown3Snakes <- subset(snake, tertiary.color == "darkbrown") #63obs
Beige3Snakes <- subset(snake, tertiary.color == "beige") #130obs
White3Snakes <- subset(snake, tertiary.color == "white") #65obs
Colorless3Snakes <- snake[snake$tertiary.color== "",] #1003 obs
#snakes in this category^ may not have a third color

#quaternary colors
unique(snake$quaternary.color)
Black4Snakes <- subset(snake, quaternary.color == "black") #1 obs
#no snakes have red as their 4th color
Orange4Snakes <- subset(snake, quaternary.color == "orange") #2obs
#no snakes have yellow as their 4th color
#no snakes have green as their 4th color
#no snakes have blue as their 4th color
#no snakes have purple as their 4th color
#no snakes have lightgray as their 4th color
#no snakes have darkgray as their 4th color
#no snakes have brown as their 4th color
#no snakes have lightbrown as their 4th color
#no snakes have darkbrown as their 4th color
Beige4Snakes <- subset(snake, quaternary.color == "beige") #1obs
White4Snakes <- subset(snake, quaternary.color == "white") #1obs
Colorless4Snakes <- snake[snake$quaternary.color== "",]
#snakes in this category^ may not have a fourth color

################################################################################
#Size
#------
#1 foot = 305mm = small
#2 feet = 610mm = medium
#3 feet = 915mm = large
#over 3 feet = very large

unique(snake$Max_Size)
#101 different sizes, can conlomerate them into small medium and large

#tried to do this, didn't work
# SmallSnakes <- subset(snake, Max_Size >= 0 & Max_Size <= 305)
# MediumSnakes <- subset(snake, Max_Size > 305 & Max_Size <= 610)
# LargeSnakes <- subset(snake, Max_Size > 610 & Max_Size <= 915)
# VeryLargeSnakes <- subset(snake, Max_Size > 915)

#this worked but i dont understand it
#Warning messages:
# 1: In eval(e, x, parent.frame()) : NAs introduced by coercion
# 2: In eval(e, x, parent.frame()) : NAs introduced by coercion
SmallSnakes <- subset(snake, !is.na(Max_Size) & as.numeric(Max_Size) >= 0 & as.numeric(Max_Size) <= 305)
MediumSnakes <- subset(snake, !is.na(Max_Size) & as.numeric(Max_Size) > 305 & as.numeric(Max_Size) <= 610)
LargeSnakes <- subset(snake, !is.na(Max_Size) & as.numeric(Max_Size) > 610 & as.numeric(Max_Size) <= 915)
VeryLargeSnakes <- subset(snake, !is.na(Max_Size) & as.numeric(Max_Size) > 915)
################################################################################
#Country
#-------
#there are 13 countries in the middle east
#Bahrain Iran  Israel Jordan Kuwait Lebanon Oman Qatar Saudi.Arabia Syria UAE Yemen 

BahrainSnakes <- snake[snake$Bahrain == "x",]
IranSnakes <- snake[snake$Iran == "x",]
IraqSnakes <- snake[snake$Iraq == "x",]
IsraelSnakes <- snake[snake$Israel == "x",]
JordanSnakes <- snake[snake$Jordan == "x",]
KuwaitSnakes <- snake[snake$Kuwait == "x",]
LebanonSnakes <- snake[snake$Lebanon == "x",]
OmanSnakes <- snake[snake$Oman == "x",]
QatarSnakes <- snake[snake$Qatar == "x",]
SaudiArabiaSnakes <- snake[snake$Saudi.Arabia == "x",]
SyriaSnakes <- snake[snake$Syria == "x",]
UAESnakes <- snake[snake$UAE == "x",]
YemenSnakes <- snake[snake$Yemen == "x",]
################################################################################
#Venomous
#--------
#snakes are either venomous (x), weakly venomous (w), or not (_ or "")
unique(snake$Venomous)

VenomousSnakes <- snake[snake$Venomous == "x",]
WeaklyVenomousSnakes <- snake[snake$Venomous == "w",]
NonVenomousSnakes <- snake[snake$Venomous == "" | snake$Venomous == " ",]
################################################################################
#Users and Need Coding
#--------
#two users: gillian and andrew

unique(snake$User)

AllGilliansSnakes <- snake[snake$User == "gillian",] #806 obs
GilliansSnakes <- snake[snake$User == "gillian" & snake$Need.Andrew.to.Code == "",] #770 obs
AndrewsSnakes <- snake[snake$User == "andrew",] #770 obs

#this set has 36 obs that gillian coded that andrew did not 806 - 770 = 36
NeedsCoding <- snake[snake$Need.Andrew.to.Code == "andrew needs to code this set (finalmissingspeciesphotos)",]
################################################################################
#Chi-Sq
#-------
#Is there a difference in primary color choice between two coders?

cont_table <- table(GilliansSnakes$primary.color, AndrewsSnakes$primary.color)
cont_table2 <- table(GilliansSnakes$primary.pattern, AndrewsSnakes$primary.pattern)

#for merged_DONE_FINAL_BODYONLY with andrew needs to code removed
cont_table <- table(AllGilliansSnakes$primary.color, AndrewsSnakes$primary.color)
cont_table2 <- table(AllGilliansSnakes$primary.pattern, AndrewsSnakes$primary.pattern)

length(GilliansSnakes)

chisq.test(cont_table)
#Pearson's Chi-squared test
# data:  cont_table
# X-squared = 1799.7, df = 182, p-value < 2.2e-16
# Warning message:
# In chisq.test(cont_table) : Chi-squared approximation may be incorrect

fisher.test(cont_table)
#Error in fisher.test(cont_table) : FEXACT error 5.
# The hash table key cannot be computed because the largest key
# is larger than the largest representable int.
# The algorithm cannot proceed.
# Reduce the workspace, consider using 'simulate.p.value=TRUE' or another algorithm.

fisher.test(cont_table, simulate.p.value = TRUE)
# #Fisher's Exact Test for Count Data with simulated p-value (based on 2000 replicates)
# 
# data:  cont_table
# p-value = 0.0004998
# alternative hypothesis: two.sided
########################
chisq.test(cont_table2)
# Pearson's Chi-squared test
# 
# data:  cont_table2
# X-squared = 1501.1, df = 42, p-value < 2.2e-16
# 
# Warning message:
# In chisq.test(cont_table2) : Chi-squared approximation may be incorrect
# 
fisher.test(cont_table2)
# Error in fisher.test(cont_table2) : FEXACT error 5.
# The hash table key cannot be computed because the largest key
# is larger than the largest representable int.
# The algorithm cannot proceed.
# Reduce the workspace, consider using 'simulate.p.value=TRUE' or another algorithm.
fisher.test(cont_table2, simulate.p.value = TRUE)
# 
# Fisher's Exact Test for Count Data with simulated p-value (based on 2000 replicates)
# 
# data:  cont_table2
# p-value = 0.0004998
# alternative hypothesis: two.sided
####################################################
#If you conduct a Fisher's exact test to evaluate the hypothesis that two people
# will select the same colors for a snake, and you obtain a very low p-value,
# this suggests that the observed data is unlikely to have occurred by chance alone,
# assuming that the null hypothesis of no association between the two people's color selections is true.

#In other words, a low p-value indicates that the evidence from the data is in
# favor of the alternative hypothesis that there is an association between the 
# two people's color selections. The exact interpretation of this association 
# depends on the specific study design and the context of the data.
################################################################################
#Patterns
#---------

#primary pattern
unique(snake$primary.pattern)
UniformSnakes <- snake[snake$primary.pattern == "uniform",] #327 obs
PatternlessSnakes <- snake[snake$primary.pattern == "",] #237 obs
DiamondSnakes <- snake[snake$primary.pattern == "diamond",] #92 obs 
BandedSnakes <- snake[snake$primary.pattern == "banded",] #185 obs
BlotchedSnakes <- snake[snake$primary.pattern == "blotched",] #500 obs
StripedSnakes <- snake[snake$primary.pattern == "striped",] #81obs
SpottedSnakes <- snake[snake$primary.pattern == "spotted",] #134 obs
AntPostSnakes <- snake[snake$primary.pattern == "anterior-posterior",] #20obs

#secondary pattern
unique(snake$secondary.pattern)
Uniform2Snakes <- snake[snake$secondary.pattern == "uniform",] #8obs
Patternless2Snakes <- snake[snake$secondary.pattern == "",] #1478 obs
Diamond2Snakes <- snake[snake$secondary.pattern == "diamond",] #3 obs
Banded2Snakes <- snake[snake$secondary.pattern == "banded",] #18 obs
Blotched2Snakes <- snake[snake$secondary.pattern == "blotched",] #21 obs
Striped2Snakes <- snake[snake$secondary.pattern == "striped",] #16 obs
Spotted2Snakes <- snake[snake$secondary.pattern == "spotted",] #26 obs
AntPost2Snakes <- snake[snake$secondary.pattern == "anterior-posterior",] #6obs

#tertiary pattern
unique(snake$tertiary.pattern)
Uniform3Snakes <- snake[snake$tertiary.pattern == "uniform",] #10 obs
Patternless3Snakes <- snake[snake$tertiary.pattern == "",] #1558 obs
#no snakes have diamond as their 3rd pattern
Banded3Snakes <- snake[snake$tertiary.pattern == "banded",] #2 obs
Blotched3Snakes <- snake[snake$tertiary.pattern == "blotched",] #5 obs
#no snakes have striped as their 3rd pattern
#no snakes have spotted as their 3rd pattern
AntPost3Snakes <- snake[snake$tertiary.pattern == "anterior-posterior",] #1 obs

#quaternary pattern
unique(snake$quaternary.pattern)
#no snakes have uniform as their 4th pattern
Patternless4Snakes <- snake[snake$quaternary.pattern == "",] #1575 obs
#no snakes have diamond as their 4th pattern
#no snakes have banded as their 4th pattern
#no snakes have blotched as their 4th pattern
#no snakes have striped as their 4th pattern
#no snakes have spotted as their 4th pattern
AntPost4Snakes <- snake[snake$quaternary.pattern == "anterior-posterior",] #1 obs
###################################### ##########################################
#Number of photos for each species - Histogram (x2 gillian and andrew)
# Load ggplot2 library for data visualization
library(ggplot2)

# Create histogram of species number without species number labels
ggplot(snake, aes(x = species.number)) +
  geom_histogram(binwidth = 1, fill = "pink", alpha = 0.5) +
  labs(x = "Species Number", y = "Frequency", 
       title = "Histogram of Species Number in Snake Dataset")

# Create histogram of species number with species number label
ggplot(snake, aes(x = species.number)) +
  geom_histogram(binwidth = 1, fill = "blue", alpha = 0.5) +
  labs(x = "Species Number", y = "Number of Photos", 
       title = "Photos for each species in the Middle East") +
  scale_x_continuous(breaks = unique(snake$species.number))
################################################################################
#Number of species/photos found in each country (x2 gillian and andrew)
# Create a new data frame that summarizes the number of species in each country
country_counts <- data.frame(
  country = c("Bahrain", "Iran", "Iraq", "Israel", "Kuwait", "Jordan", "Lebanon", 
              "Yemen", "Oman", "UAE", "Saudi Arabia", "Qatar", "Syria"),
  count = c(sum(snake$Bahrain == "x"), sum(snake$Iran == "x"), sum(snake$Iraq == "x"), 
            sum(snake$Israel == "x"), sum(snake$Kuwait == "x"), sum(snake$Jordan == "x"), 
            sum(snake$Lebanon == "x"), sum(snake$Yemen == "x"), sum(snake$Oman == "x"), 
            sum(snake$UAE == "x"), sum(snake$Saudi.Arabia == "x"), sum(snake$Qatar == "x"), 
            sum(snake$Syria == "x"))
)
# Create a histogram of the number of species in each country
ggplot(country_counts, aes(x = country, y = count)) +
  geom_bar(stat = "identity", fill = "purple", alpha = 0.5) +
  labs(x = "Country", y = "Number of Species Photos", 
       title = "Number of Species Photos in Each Country")
################################################################################
#new try with ggplot colors

#going to use gillian's snakes to determine species number instead
#of number of photos(snake has gillian and andrew = repeats) maybe

install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all(colorblindFriendly = TRUE)
################################################################################
#Bahrain Snakes by color - andrew
# Define custom colors for each category
black <- "black"
white <- "white"
lightgray <- "#ACAAAE"
darkgray <- "#4E4553"
brown <- "#876542"
lightbrown <- "#BF9164"
darkbrown <- "#543618"
red <- "#E7351F"
orange <- "#E7A01F"
yellow <- "#E7D21F"
green <- "#26944A"
blue <- "#2647A7"
purple <- "#9F1FE7"
beige <- "#E0C8B0"
colorless <- "#C7FCF9"
###############################################################################
# Create a new data frame that summarizes the number of photos in each color category for user "andrew"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue", 
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue", 
                            "purple", "beige", "colorless")),
  count = c(sum(BahrainSnakes$primary.color[BahrainSnakes$User == "andrew"] == "black"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "andrew"] == "white"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "andrew"] == "lightgray"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "andrew"] == "darkgray"),
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "andrew"] == "brown"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "andrew"] == "lightbrown"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "andrew"] == "darkbrown"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "andrew"] == "red"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "andrew"] == "orange"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "andrew"] == "yellow"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "andrew"] == "green"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "andrew"] == "blue"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "andrew"] == "purple"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "andrew"] == "beige"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "andrew"] == "" | BahrainSnakes$primary.color[BahrainSnakes$user == "gillian"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Primary Color", y = "Number of Species") + 
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue, 
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Bahrain - Andrew")

#################################################################################################
#Bahrain Snakes by color - gillian

# Create a new data frame that summarizes the number of photos in each color category for user "gillian"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue", 
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue", 
                            "purple", "beige", "colorless")),
  count = c(sum(BahrainSnakes$primary.color[BahrainSnakes$User == "gillian"] == "black"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "gillian"] == "white"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "gillian"] == "lightgray"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "gillian"] == "darkgray"),
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "gillian"] == "brown"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "gillian"] == "lightbrown"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "gillian"] == "darkbrown"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "gillian"] == "red"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "gillian"] == "orange"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "gillian"] == "yellow"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "gillian"] == "green"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "gillian"] == "blue"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "gillian"] == "purple"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "gillian"] == "beige"), 
            sum(BahrainSnakes$primary.color[BahrainSnakes$User == "gillian"] == "" | BahrainSnakes$primary.color[BahrainSnakes$user == "gillian"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Primary Color", y = "Number of Species") + 
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue, 
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Bahrain - Gillian")
################################################################################
#Iran snakes by color - gillian

# Create a new data frame that summarizes the number of photos in each color category for user "gillian"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue", 
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue", 
                            "purple", "beige", "colorless")),
  count = c(sum(IranSnakes$primary.color[IranSnakes$User == "gillian"] == "black"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "gillian"] == "white"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "gillian"] == "lightgray"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "gillian"] == "darkgray"),
            sum(IranSnakes$primary.color[IranSnakes$User == "gillian"] == "brown"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "gillian"] == "lightbrown"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "gillian"] == "darkbrown"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "gillian"] == "red"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "gillian"] == "orange"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "gillian"] == "yellow"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "gillian"] == "green"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "gillian"] == "blue"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "gillian"] == "purple"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "gillian"] == "beige"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "gillian"] == "" | IranSnakes$primary.color[IranSnakes$user == "gillian"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Primary Color", y = "Number of Species") + 
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue, 
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Iran - Gillian")
################################################################################
#Iran snakes by color - andrew

# Create a new data frame that summarizes the number of photos in each color category for user "andrew"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue", 
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue", 
                            "purple", "beige", "colorless")),
  count = c(sum(IranSnakes$primary.color[IranSnakes$User == "andrew"] == "black"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "andrew"] == "white"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "andrew"] == "lightgray"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "andrew"] == "darkgray"),
            sum(IranSnakes$primary.color[IranSnakes$User == "andrew"] == "brown"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "andrew"] == "lightbrown"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "andrew"] == "darkbrown"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "andrew"] == "red"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "andrew"] == "orange"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "andrew"] == "yellow"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "andrew"] == "green"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "andrew"] == "blue"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "andrew"] == "purple"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "andrew"] == "beige"), 
            sum(IranSnakes$primary.color[IranSnakes$User == "andrew"] == "" | IranSnakes$primary.color[IranSnakes$User == "andrew"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Primary Color", y = "Number of Species") + 
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue, 
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Iran - Andrew")
#####################################################################################
#Iraq snakes by color - Gillian

# Create a new data frame that summarizes the number of photos in each color category for user "gillian"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue", 
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue", 
                            "purple", "beige", "colorless")),
  count = c(sum(IraqSnakes$primary.color[IraqSnakes$User == "gillian"] == "black"), 
            sum(IraqSnakes$primary.color[IraqSnakes$User == "gillian"] == "white"), 
            sum(IraqSnakes$primary.color[IraqSnakes$User == "gillian"] == "lightgray"), 
            sum(IraqSnakes$primary.color[IraqSnakes$User == "gillian"] == "darkgray"),
            sum(IraqSnakes$primary.color[IraqSnakes$User == "gillian"] == "brown"), 
            sum(IraqSnakes$primary.color[IraqSnakes$User == "gillian"] == "lightbrown"), 
            sum(IraqSnakes$primary.color[IraqSnakes$User == "gillian"] == "darkbrown"), 
            sum(IraqSnakes$primary.color[IraqSnakes$User == "gillian"] == "red"), 
            sum(IraqSnakes$primary.color[IraqSnakes$User == "gillian"] == "orange"), 
            sum(IraqSnakes$primary.color[IraqSnakes$User == "gillian"] == "yellow"), 
            sum(IraqSnakes$primary.color[IraqSnakes$User == "gillian"] == "green"), 
            sum(IraqSnakes$primary.color[IraqSnakes$User == "gillian"] == "blue"), 
            sum(IraqSnakes$primary.color[IraqSnakes$User == "gillian"] == "purple"), 
            sum(IraqSnakes$primary.color[IraqSnakes$User == "gillian"] == "beige"), 
            sum(IraqSnakes$primary.color[IraqSnakes$User == "gillian"] == "" | IraqSnakes$primary.color[IraqSnakes$user == "gillian"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Primary Color", y = "Number of Species") + 
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue, 
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Iraq - Gillian")
#####################################################################################
#Iraq snakes by color - Andrew

# Create a new data frame that summarizes the number of photos in each color category for user "andrew"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(IraqSnakes$primary.color[IraqSnakes$User == "andrew"] == "black"),
            sum(IraqSnakes$primary.color[IraqSnakes$User == "andrew"] == "white"),
            sum(IraqSnakes$primary.color[IraqSnakes$User == "andrew"] == "lightgray"),
            sum(IraqSnakes$primary.color[IraqSnakes$User == "andrew"] == "darkgray"),
            sum(IraqSnakes$primary.color[IraqSnakes$User == "andrew"] == "brown"),
            sum(IraqSnakes$primary.color[IraqSnakes$User == "andrew"] == "lightbrown"),
            sum(IraqSnakes$primary.color[IraqSnakes$User == "andrew"] == "darkbrown"),
            sum(IraqSnakes$primary.color[IraqSnakes$User == "andrew"] == "red"),
            sum(IraqSnakes$primary.color[IraqSnakes$User == "andrew"] == "orange"),
            sum(IraqSnakes$primary.color[IraqSnakes$User == "andrew"] == "yellow"),
            sum(IraqSnakes$primary.color[IraqSnakes$User == "andrew"] == "green"),
            sum(IraqSnakes$primary.color[IraqSnakes$User == "andrew"] == "blue"),
            sum(IraqSnakes$primary.color[IraqSnakes$User == "andrew"] == "purple"),
            sum(IraqSnakes$primary.color[IraqSnakes$User == "andrew"] == "beige"),
            sum(IraqSnakes$primary.color[IraqSnakes$User == "andrew"] == "" | IraqSnakes$primary.color[IraqSnakes$user == "andrew"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Iraq - Andrew")
###############################################################################
#Israel Snakes by color - gillian
# Create a new data frame that summarizes the number of photos in each color category for user "gillian"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(IsraelSnakes$primary.color[IsraelSnakes$User == "gillian"] == "black"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "gillian"] == "white"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "gillian"] == "lightgray"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "gillian"] == "darkgray"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "gillian"] == "brown"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "gillian"] == "lightbrown"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "gillian"] == "darkbrown"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "gillian"] == "red"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "gillian"] == "orange"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "gillian"] == "yellow"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "gillian"] == "green"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "gillian"] == "blue"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "gillian"] == "purple"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "gillian"] == "beige"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "gillian"] == "" | IsraelSnakes$primary.color[IsraelSnakes$user == "gillian"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Israel - Gillian")

###############################################################################
#Israel Snakes by color - Andrew
# Create a new data frame that summarizes the number of photos in each color category for user "andrew"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(IsraelSnakes$primary.color[IsraelSnakes$User == "andrew"] == "black"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "andrew"] == "white"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "andrew"] == "lightgray"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "andrew"] == "darkgray"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "andrew"] == "brown"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "andrew"] == "lightbrown"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "andrew"] == "darkbrown"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "andrew"] == "red"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "andrew"] == "orange"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "andrew"] == "yellow"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "andrew"] == "green"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "andrew"] == "blue"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "andrew"] == "purple"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "andrew"] == "beige"),
            sum(IsraelSnakes$primary.color[IsraelSnakes$User == "andrew"] == "" | IsraelSnakes$primary.color[IsraelSnakes$user == "andrew"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Israel - Andrew")
###############################################################################
#Jordan Snakes by color - gillian
# Create a new data frame that summarizes the number of photos in each color category for user "gillian"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(JordanSnakes$primary.color[JordanSnakes$User == "gillian"] == "black"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "gillian"] == "white"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "gillian"] == "lightgray"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "gillian"] == "darkgray"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "gillian"] == "brown"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "gillian"] == "lightbrown"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "gillian"] == "darkbrown"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "gillian"] == "red"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "gillian"] == "orange"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "gillian"] == "yellow"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "gillian"] == "green"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "gillian"] == "blue"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "gillian"] == "purple"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "gillian"] == "beige"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "gillian"] == "" | JordanSnakes$primary.color[JordanSnakes$user == "gillian"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Jordan - Gillian")

###############################################################################
#Jordan Snakes by color - Andrew
# Create a new data frame that summarizes the number of photos in each color category for user "andrew"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(JordanSnakes$primary.color[JordanSnakes$User == "andrew"] == "black"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "andrew"] == "white"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "andrew"] == "lightgray"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "andrew"] == "darkgray"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "andrew"] == "brown"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "andrew"] == "lightbrown"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "andrew"] == "darkbrown"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "andrew"] == "red"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "andrew"] == "orange"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "andrew"] == "yellow"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "andrew"] == "green"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "andrew"] == "blue"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "andrew"] == "purple"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "andrew"] == "beige"),
            sum(JordanSnakes$primary.color[JordanSnakes$User == "andrew"] == "" | JordanSnakes$primary.color[JordanSnakes$user == "andrew"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Jordan - Andrew")
###############################################################################
#Kuwait Snakes by color - gillian
# Create a new data frame that summarizes the number of photos in each color category for user "gillian"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "gillian"] == "black"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "gillian"] == "white"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "gillian"] == "lightgray"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "gillian"] == "darkgray"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "gillian"] == "brown"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "gillian"] == "lightbrown"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "gillian"] == "darkbrown"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "gillian"] == "red"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "gillian"] == "orange"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "gillian"] == "yellow"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "gillian"] == "green"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "gillian"] == "blue"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "gillian"] == "purple"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "gillian"] == "beige"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "gillian"] == "" | KuwaitSnakes$primary.color[KuwaitSnakes$user == "gillian"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Kuwait - Gillian")

###############################################################################
#Kuwait Snakes by color - Andrew
# Create a new data frame that summarizes the number of photos in each color category for user "andrew"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "andrew"] == "black"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "andrew"] == "white"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "andrew"] == "lightgray"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "andrew"] == "darkgray"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "andrew"] == "brown"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "andrew"] == "lightbrown"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "andrew"] == "darkbrown"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "andrew"] == "red"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "andrew"] == "orange"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "andrew"] == "yellow"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "andrew"] == "green"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "andrew"] == "blue"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "andrew"] == "purple"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "andrew"] == "beige"),
            sum(KuwaitSnakes$primary.color[KuwaitSnakes$User == "andrew"] == "" | KuwaitSnakes$primary.color[KuwaitSnakes$user == "andrew"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Kuwait - Andrew")
################################################################################
#LebanonSnakes by color - gillian
# Create a new data frame that summarizes the number of photos in each color category for user "gillian"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(LebanonSnakes$primary.color[LebanonSnakes$User == "gillian"] == "black"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "gillian"] == "white"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "gillian"] == "lightgray"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "gillian"] == "darkgray"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "gillian"] == "brown"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "gillian"] == "lightbrown"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "gillian"] == "darkbrown"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "gillian"] == "red"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "gillian"] == "orange"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "gillian"] == "yellow"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "gillian"] == "green"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "gillian"] == "blue"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "gillian"] == "purple"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "gillian"] == "beige"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "gillian"] == "" | LebanonSnakes$primary.color[LebanonSnakes$user == "gillian"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Lebanon- Gillian")

###############################################################################
#LebanonSnakes by color - Andrew
# Create a new data frame that summarizes the number of photos in each color category for user "andrew"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(LebanonSnakes$primary.color[LebanonSnakes$User == "andrew"] == "black"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "andrew"] == "white"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "andrew"] == "lightgray"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "andrew"] == "darkgray"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "andrew"] == "brown"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "andrew"] == "lightbrown"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "andrew"] == "darkbrown"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "andrew"] == "red"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "andrew"] == "orange"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "andrew"] == "yellow"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "andrew"] == "green"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "andrew"] == "blue"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "andrew"] == "purple"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "andrew"] == "beige"),
            sum(LebanonSnakes$primary.color[LebanonSnakes$User == "andrew"] == "" | LebanonSnakes$primary.color[LebanonSnakes$user == "andrew"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Lebanon- Andrew")
################################################################################
#OmanSnakes by color - gillian
# Create a new data frame that summarizes the number of photos in each color category for user "gillian"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(OmanSnakes$primary.color[OmanSnakes$User == "gillian"] == "black"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "gillian"] == "white"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "gillian"] == "lightgray"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "gillian"] == "darkgray"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "gillian"] == "brown"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "gillian"] == "lightbrown"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "gillian"] == "darkbrown"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "gillian"] == "red"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "gillian"] == "orange"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "gillian"] == "yellow"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "gillian"] == "green"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "gillian"] == "blue"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "gillian"] == "purple"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "gillian"] == "beige"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "gillian"] == "" | OmanSnakes$primary.color[OmanSnakes$user == "gillian"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Oman- Gillian")

###############################################################################
#OmanSnakes by color - Andrew
# Create a new data frame that summarizes the number of photos in each color category for user "andrew"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(OmanSnakes$primary.color[OmanSnakes$User == "andrew"] == "black"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "andrew"] == "white"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "andrew"] == "lightgray"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "andrew"] == "darkgray"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "andrew"] == "brown"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "andrew"] == "lightbrown"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "andrew"] == "darkbrown"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "andrew"] == "red"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "andrew"] == "orange"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "andrew"] == "yellow"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "andrew"] == "green"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "andrew"] == "blue"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "andrew"] == "purple"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "andrew"] == "beige"),
            sum(OmanSnakes$primary.color[OmanSnakes$User == "andrew"] == "" | OmanSnakes$primary.color[OmanSnakes$user == "andrew"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Oman- Andrew")
################################################################################
#QatarSnakes by color - gillian
# Create a new data frame that summarizes the number of photos in each color category for user "gillian"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(QatarSnakes$primary.color[QatarSnakes$User == "gillian"] == "black"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "gillian"] == "white"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "gillian"] == "lightgray"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "gillian"] == "darkgray"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "gillian"] == "brown"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "gillian"] == "lightbrown"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "gillian"] == "darkbrown"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "gillian"] == "red"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "gillian"] == "orange"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "gillian"] == "yellow"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "gillian"] == "green"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "gillian"] == "blue"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "gillian"] == "purple"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "gillian"] == "beige"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "gillian"] == "" | QatarSnakes$primary.color[QatarSnakes$user == "gillian"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Qatar- Gillian")
###############################################################################
#QatarSnakes by color - Andrew
# Create a new data frame that summarizes the number of photos in each color category for user "andrew"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(QatarSnakes$primary.color[QatarSnakes$User == "andrew"] == "black"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "andrew"] == "white"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "andrew"] == "lightgray"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "andrew"] == "darkgray"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "andrew"] == "brown"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "andrew"] == "lightbrown"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "andrew"] == "darkbrown"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "andrew"] == "red"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "andrew"] == "orange"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "andrew"] == "yellow"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "andrew"] == "green"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "andrew"] == "blue"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "andrew"] == "purple"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "andrew"] == "beige"),
            sum(QatarSnakes$primary.color[QatarSnakes$User == "andrew"] == "" | QatarSnakes$primary.color[QatarSnakes$user == "andrew"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Qatar- Andrew")
################################################################################
#SaudiArabiaSnakes by color - gillian
# Create a new data frame that summarizes the number of photos in each color category for user "gillian"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "gillian"] == "black"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "gillian"] == "white"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "gillian"] == "lightgray"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "gillian"] == "darkgray"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "gillian"] == "brown"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "gillian"] == "lightbrown"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "gillian"] == "darkbrown"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "gillian"] == "red"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "gillian"] == "orange"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "gillian"] == "yellow"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "gillian"] == "green"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "gillian"] == "blue"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "gillian"] == "purple"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "gillian"] == "beige"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "gillian"] == "" | SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$user == "gillian"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of SaudiArabia- Gillian")
###############################################################################
#SaudiArabiaSnakes by color - Andrew
# Create a new data frame that summarizes the number of photos in each color category for user "andrew"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "andrew"] == "black"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "andrew"] == "white"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "andrew"] == "lightgray"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "andrew"] == "darkgray"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "andrew"] == "brown"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "andrew"] == "lightbrown"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "andrew"] == "darkbrown"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "andrew"] == "red"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "andrew"] == "orange"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "andrew"] == "yellow"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "andrew"] == "green"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "andrew"] == "blue"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "andrew"] == "purple"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "andrew"] == "beige"),
            sum(SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$User == "andrew"] == "" | SaudiArabiaSnakes$primary.color[SaudiArabiaSnakes$user == "andrew"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of SaudiArabia- Andrew")
################################################################################
#SyriaSnakes by color - gillian
# Create a new data frame that summarizes the number of photos in each color category for user "gillian"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(SyriaSnakes$primary.color[SyriaSnakes$User == "gillian"] == "black"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "gillian"] == "white"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "gillian"] == "lightgray"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "gillian"] == "darkgray"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "gillian"] == "brown"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "gillian"] == "lightbrown"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "gillian"] == "darkbrown"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "gillian"] == "red"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "gillian"] == "orange"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "gillian"] == "yellow"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "gillian"] == "green"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "gillian"] == "blue"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "gillian"] == "purple"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "gillian"] == "beige"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "gillian"] == "" | SyriaSnakes$primary.color[SyriaSnakes$user == "gillian"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Syria- Gillian")
###############################################################################
#SyriaSnakes by color - Andrew
# Create a new data frame that summarizes the number of photos in each color category for user "andrew"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(SyriaSnakes$primary.color[SyriaSnakes$User == "andrew"] == "black"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "andrew"] == "white"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "andrew"] == "lightgray"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "andrew"] == "darkgray"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "andrew"] == "brown"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "andrew"] == "lightbrown"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "andrew"] == "darkbrown"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "andrew"] == "red"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "andrew"] == "orange"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "andrew"] == "yellow"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "andrew"] == "green"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "andrew"] == "blue"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "andrew"] == "purple"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "andrew"] == "beige"),
            sum(SyriaSnakes$primary.color[SyriaSnakes$User == "andrew"] == "" | SyriaSnakes$primary.color[SyriaSnakes$user == "andrew"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Syria- Andrew")
###############################################################################
#UAESnakes by color - gillian
# Create a new data frame that summarizes the number of photos in each color category for user "gillian"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(UAESnakes$primary.color[UAESnakes$User == "gillian"] == "black"),
            sum(UAESnakes$primary.color[UAESnakes$User == "gillian"] == "white"),
            sum(UAESnakes$primary.color[UAESnakes$User == "gillian"] == "lightgray"),
            sum(UAESnakes$primary.color[UAESnakes$User == "gillian"] == "darkgray"),
            sum(UAESnakes$primary.color[UAESnakes$User == "gillian"] == "brown"),
            sum(UAESnakes$primary.color[UAESnakes$User == "gillian"] == "lightbrown"),
            sum(UAESnakes$primary.color[UAESnakes$User == "gillian"] == "darkbrown"),
            sum(UAESnakes$primary.color[UAESnakes$User == "gillian"] == "red"),
            sum(UAESnakes$primary.color[UAESnakes$User == "gillian"] == "orange"),
            sum(UAESnakes$primary.color[UAESnakes$User == "gillian"] == "yellow"),
            sum(UAESnakes$primary.color[UAESnakes$User == "gillian"] == "green"),
            sum(UAESnakes$primary.color[UAESnakes$User == "gillian"] == "blue"),
            sum(UAESnakes$primary.color[UAESnakes$User == "gillian"] == "purple"),
            sum(UAESnakes$primary.color[UAESnakes$User == "gillian"] == "beige"),
            sum(UAESnakes$primary.color[UAESnakes$User == "gillian"] == "" | UAESnakes$primary.color[UAESnakes$user == "gillian"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of UAE- Gillian")
###############################################################################
#UAESnakes by color - Andrew
# Create a new data frame that summarizes the number of photos in each color category for user "andrew"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(UAESnakes$primary.color[UAESnakes$User == "andrew"] == "black"),
            sum(UAESnakes$primary.color[UAESnakes$User == "andrew"] == "white"),
            sum(UAESnakes$primary.color[UAESnakes$User == "andrew"] == "lightgray"),
            sum(UAESnakes$primary.color[UAESnakes$User == "andrew"] == "darkgray"),
            sum(UAESnakes$primary.color[UAESnakes$User == "andrew"] == "brown"),
            sum(UAESnakes$primary.color[UAESnakes$User == "andrew"] == "lightbrown"),
            sum(UAESnakes$primary.color[UAESnakes$User == "andrew"] == "darkbrown"),
            sum(UAESnakes$primary.color[UAESnakes$User == "andrew"] == "red"),
            sum(UAESnakes$primary.color[UAESnakes$User == "andrew"] == "orange"),
            sum(UAESnakes$primary.color[UAESnakes$User == "andrew"] == "yellow"),
            sum(UAESnakes$primary.color[UAESnakes$User == "andrew"] == "green"),
            sum(UAESnakes$primary.color[UAESnakes$User == "andrew"] == "blue"),
            sum(UAESnakes$primary.color[UAESnakes$User == "andrew"] == "purple"),
            sum(UAESnakes$primary.color[UAESnakes$User == "andrew"] == "beige"),
            sum(UAESnakes$primary.color[UAESnakes$User == "andrew"] == "" | UAESnakes$primary.color[UAESnakes$user == "andrew"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of UAE- Andrew")
###############################################################################
#YemenSnakes by color - gillian
# Create a new data frame that summarizes the number of photos in each color category for user "gillian"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(YemenSnakes$primary.color[YemenSnakes$User == "gillian"] == "black"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "gillian"] == "white"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "gillian"] == "lightgray"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "gillian"] == "darkgray"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "gillian"] == "brown"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "gillian"] == "lightbrown"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "gillian"] == "darkbrown"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "gillian"] == "red"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "gillian"] == "orange"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "gillian"] == "yellow"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "gillian"] == "green"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "gillian"] == "blue"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "gillian"] == "purple"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "gillian"] == "beige"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "gillian"] == "" | YemenSnakes$primary.color[YemenSnakes$user == "gillian"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Yemen- Gillian")
###############################################################################
#YemenSnakes by color - Andrew
# Create a new data frame that summarizes the number of photos in each color category for user "andrew"
color_counts <- data.frame(
  color = factor(c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                   "darkbrown", "red", "orange", "yellow", "green", "blue",
                   "purple", "beige", "colorless"),
                 levels = c("black", "white", "lightgray", "darkgray", "brown", "lightbrown",
                            "darkbrown", "red", "orange", "yellow", "green", "blue",
                            "purple", "beige", "colorless")),
  count = c(sum(YemenSnakes$primary.color[YemenSnakes$User == "andrew"] == "black"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "andrew"] == "white"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "andrew"] == "lightgray"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "andrew"] == "darkgray"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "andrew"] == "brown"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "andrew"] == "lightbrown"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "andrew"] == "darkbrown"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "andrew"] == "red"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "andrew"] == "orange"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "andrew"] == "yellow"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "andrew"] == "green"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "andrew"] == "blue"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "andrew"] == "purple"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "andrew"] == "beige"),
            sum(YemenSnakes$primary.color[YemenSnakes$User == "andrew"] == "" | YemenSnakes$primary.color[YemenSnakes$user == "andrew"] == " ")
  )
)

# Create a bar plot of color counts
ggplot(data = color_counts, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Color", y = "Number of Species") +
  scale_fill_manual(values = c(black, white, lightgray, darkgray, brown, lightbrown,
                               darkbrown, red, orange, yellow, green, blue,
                               purple, beige, colorless)) +
  ggtitle("Primary Snake Colors of Yemen- Andrew")
###############################################################################
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"
# Filter out snakes without a primary pattern
filtered_snakes <- BahrainSnakes[BahrainSnakes$primary.pattern != "", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == "uniform"),
            sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == ""),
            sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == "diamond"),
            sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == "banded"),
            sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == "blotched"),
            sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == "striped"),
            sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == "spotted"),
            sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Bahrain - Andrew")
##############################################################################################################
#BahrainSnakes by pattern - Andrew
# Create a new data frame that summarizes the number of photos in each pattern category for user "andrew"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary pattern in BahrainSnakes dataset for user "andrew"
filtered_snakes <- BahrainSnakes[BahrainSnakes$primary.pattern != "" & BahrainSnakes$User == "andrew", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Bahrain - Andrew")

################################################################################
#BahrainSnakes by pattern - Gillian
# Create a new data frame that summarizes the number of photos in each pattern category for user "gillian"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(BahrainSnakes$primary.pattern[BahrainSnakes$User == "gillian" & BahrainSnakes$primary.pattern != ""] == "uniform"),
            sum(BahrainSnakes$primary.pattern[BahrainSnakes$User == "gillian" & BahrainSnakes$primary.pattern != ""] == ""),
            sum(BahrainSnakes$primary.pattern[BahrainSnakes$User == "gillian" & BahrainSnakes$primary.pattern != ""] == "diamond"),
            sum(BahrainSnakes$primary.pattern[BahrainSnakes$User == "gillian" & BahrainSnakes$primary.pattern != ""] == "banded"),
            sum(BahrainSnakes$primary.pattern[BahrainSnakes$User == "gillian" & BahrainSnakes$primary.pattern != ""] == "blotched"),
            sum(BahrainSnakes$primary.pattern[BahrainSnakes$User == "gillian" & BahrainSnakes$primary.pattern != ""] == "striped"),
            sum(BahrainSnakes$primary.pattern[BahrainSnakes$User == "gillian" & BahrainSnakes$primary.pattern != ""] == "spotted"),
            sum(BahrainSnakes$primary.pattern[BahrainSnakes$User == "gillian" & BahrainSnakes$primary.pattern != ""] == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Bahrain- Gillian")

###############################################################################
#IranSnakes by pattern - Andrew
# Create a new data frame that summarizes the number of photos in each pattern category for user "andrew"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary pattern
filtered_snakes <- IranSnakes[IranSnakes$primary.pattern != "", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == "uniform"),
            sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == ""),
            sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == "diamond"),
            sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == "banded"),
            sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == "blotched"),
            sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == "striped"),
            sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == "spotted"),
            sum(filtered_snakes$primary.pattern[filtered_snakes$User == "andrew"] == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Iran - Andrew")

################################################################################
#IranSnakes by pattern - Gillian
# Create a new data frame that summarizes the number of photos in each pattern category for user "gillian"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary pattern for user "Gillian"
filtered_snakes <- IranSnakes[IranSnakes$primary.pattern != "" & IranSnakes$User == "gillian", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Iran - Gillian")

###############################################################################
#IraqSnakes by pattern - Andrew
# Create a new data frame that summarizes the number of photos in each pattern category for user "andrew"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary pattern for user "Andrew"
filtered_snakes <- IraqSnakes[IraqSnakes$primary.pattern != "" & IraqSnakes$User == "andrew", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Iraq - Andrew")

################################################################################
#IraqSnakes by pattern - Gillian
# Create a new data frame that summarizes the number of photos in each pattern category for user "gillian"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary pattern for user "Gillian"
filtered_snakes <- IraqSnakes[IraqSnakes$primary.pattern != "" & IraqSnakes$User == "gillian", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Iraq - Gillian")

###############################################################################
#IsraelSnakes by pattern - Andrew
# Create a new data frame that summarizes the number of photos in each pattern category for user "andrew"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary pattern for user "Andrew"
filtered_snakes <- IsraelSnakes[IsraelSnakes$primary.pattern != "" & IsraelSnakes$User == "andrew", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Israel - Andrew")

################################################################################
#IsraelSnakes by pattern - Gillian
# Create a new data frame that summarizes the number of photos in each pattern category for user "gillian"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary pattern for user "Gillian"
filtered_snakes <- IsraelSnakes[IsraelSnakes$primary.pattern != "" & IsraelSnakes$User == "gillian", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Israel - Gillian")

###############################################################################
#IsraelSnakes by pattern - Andrew
# Create a new data frame that summarizes the number of photos in each pattern category for user "gillian"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"
# Filter out snakes without a primary pattern for user "Andrew"
filtered_snakes <- IsraelSnakes[IsraelSnakes$primary.pattern != "" & IsraelSnakes$User == "andrew", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Israel - Andrew")

################################################################################
#IsraelSnakes by pattern - Gillian
# Create a new data frame that summarizes the number of photos in each pattern category for user "gillian"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary pattern for user "Gillian"
filtered_snakes <- IsraelSnakes[IsraelSnakes$primary.pattern != "" & IsraelSnakes$User == "gillian", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Israel - Gillian")

###############################################################################
#JordanSnakes by pattern - Andrew
# Create a new data frame that summarizes the number of photos in each pattern category for user "andrew"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary pattern for user "Andrew"
filtered_snakes <- JordanSnakes[JordanSnakes$primary.pattern != "" & JordanSnakes$User == "andrew", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Jordan - Andrew")

################################################################################
#JordanSnakes by pattern - Gillian
# Create a new data frame that summarizes the number of photos in each pattern category for user "gillian"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary pattern for user "Gillian"
filtered_snakes <- JordanSnakes[JordanSnakes$primary.pattern != "" & JordanSnakes$User == "gillian", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Jordan - Gillian")

###############################################################################
#KuwaitSnakes by pattern - Andrew
# Create a new data frame that summarizes the number of photos in each pattern category for user "andrew"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary pattern for user "Andrew"
filtered_snakes <- KuwaitSnakes[KuwaitSnakes$primary.pattern != "" & KuwaitSnakes$User == "andrew", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Kuwait - Andrew")

################################################################################
#KuwaitSnakes by pattern - Gillian
# Create a new data frame that summarizes the number of photos in each pattern category for user "gillian"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary pattern for user "Gillian"
filtered_snakes <- KuwaitSnakes[KuwaitSnakes$primary.pattern != "" & KuwaitSnakes$User == "gillian", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Kuwait - Gillian")

###############################################################################
#LebanonSnakes by pattern - Andrew
# Create a new data frame that summarizes the number of photos in each pattern category for user "andrew"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary color for user "Andrew" in LebanonSnakes dataset
filtered_snakes <- LebanonSnakes[LebanonSnakes$primary.pattern != "" & LebanonSnakes$User == "andrew", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Lebanon - Andrew")

################################################################################
#LebanonSnakes by pattern - Gillian
# Create a new data frame that summarizes the number of photos in each pattern category for user "gillian"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary color for user "Gillian" in LebanonSnakes dataset
filtered_snakes <- LebanonSnakes[LebanonSnakes$primary.pattern != "" & LebanonSnakes$User == "gillian", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Lebanon - Gillian")

###############################################################################
#OmanSnakes by pattern - Andrew
# Create a new data frame that summarizes the number of photos in each pattern category for user "andrew"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary color for user "Andrew" in OmanSnakes dataset
filtered_snakes <- OmanSnakes[OmanSnakes$primary.pattern != "" & OmanSnakes$User == "andrew", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Oman - Andrew")

################################################################################
#OmanSnakes by pattern - Gillian
# Create a new data frame that summarizes the number of photos in each pattern category for user "gillian"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary color for user "Gillian" in OmanSnakes dataset
filtered_snakes <- OmanSnakes[OmanSnakes$primary.pattern != "" & OmanSnakes$User == "gillian", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Oman - Gillian")

###############################################################################
#QatarSnakes by pattern - Andrew
# Create a new data frame that summarizes the number of photos in each pattern category for user "andrew"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary color for user "Andrew" in QatarSnakes dataset
filtered_snakes <- QatarSnakes[QatarSnakes$primary.pattern != "" & QatarSnakes$User == "andrew", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Qatar - Andrew")

################################################################################
#QatarSnakes by pattern - Gillian
# Create a new data frame that summarizes the number of photos in each pattern category for user "gillian"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary color for user "Gillian" in QatarSnakes dataset
filtered_snakes <- QatarSnakes[QatarSnakes$primary.pattern != "" & QatarSnakes$User == "gillian", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Qatar - Gillian")

###############################################################################
#SaudiArabiaSnakes by pattern - Andrew
# Create a new data frame that summarizes the number of photos in each pattern category for user "andrew"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary color for user "Andrew" in SaudiArabiaSnakes dataset
filtered_snakes <- SaudiArabiaSnakes[SaudiArabiaSnakes$primary.pattern != "" & SaudiArabiaSnakes$User == "andrew", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Saudi Arabia - Andrew")

################################################################################
#SaudiArabiaSnakes by pattern - Gillian
# Create a new data frame that summarizes the number of photos in each pattern category for user "gillian"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary color for user "Gillian" in SaudiArabiaSnakes dataset
filtered_snakes <- SaudiArabiaSnakes[SaudiArabiaSnakes$primary.pattern != "" & SaudiArabiaSnakes$User == "gillian", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Saudi Arabia - Gillian")
#######################################################################################################
#SyriaSnakes by pattern - Andrew
# Create a new data frame that summarizes the number of photos in each pattern category for user "andrew"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary color for user "Andrew" in SyriaSnakes dataset
filtered_snakes <- SyriaSnakes[SyriaSnakes$primary.pattern != "" & SyriaSnakes$User == "andrew", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Syria - Andrew")

################################################################################
#SyriaSnakes by pattern - Gillian
# Create a new data frame that summarizes the number of photos in each pattern category for user "gillian"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary color for user "Gillian" in SyriaSnakes dataset
filtered_snakes <- SyriaSnakes[SyriaSnakes$primary.pattern != "" & SyriaSnakes$User == "gillian", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Syria - Gillian")
#######################################################################################################
#######################################################################################################
#UAESnakes by pattern - Andrew
# Create a new data frame that summarizes the number of photos in each pattern category for user "andrew"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary color for user "Andrew" in UAESnakes dataset
filtered_snakes <- UAESnakes[UAESnakes$primary.pattern != "" & UAESnakes$User == "andrew", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of UAE - Andrew")

################################################################################
#UAESnakes by pattern - Gillian
# Create a new data frame that summarizes the number of photos in each pattern category for user "gillian"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary color for user "Gillian" in UAESnakes dataset
filtered_snakes <- UAESnakes[UAESnakes$primary.pattern != "" & UAESnakes$User == "gillian", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of UAE - Gillian")
#######################################################################################################
#######################################################################################################
#YemenSnakes by pattern - Andrew
# Create a new data frame that summarizes the number of photos in each pattern category for user "andrew"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary color for user "Andrew" in YemenSnakes dataset
filtered_snakes <- YemenSnakes[YemenSnakes$primary.pattern != "" & YemenSnakes$User == "andrew", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Yemen - Andrew")

################################################################################
#YemenSnakes by pattern - Gillian
# Create a new data frame that summarizes the number of photos in each pattern category for user "gillian"
uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

# Filter out snakes without a primary color for user "Gillian" in YemenSnakes dataset
filtered_snakes <- YemenSnakes[YemenSnakes$primary.pattern != "" & YemenSnakes$User == "gillian", ]

# Calculate pattern counts for the filtered snakes
pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(filtered_snakes$primary.pattern == "uniform"),
            sum(filtered_snakes$primary.pattern == ""),
            sum(filtered_snakes$primary.pattern == "diamond"),
            sum(filtered_snakes$primary.pattern == "banded"),
            sum(filtered_snakes$primary.pattern == "blotched"),
            sum(filtered_snakes$primary.pattern == "striped"),
            sum(filtered_snakes$primary.pattern == "spotted"),
            sum(filtered_snakes$primary.pattern == "anterior-posterior"))
)

# Create a bar plot of pattern counts
ggplot(data = pattern_counts, aes(x = pattern, y = count, fill = pattern)) +
  geom_bar(stat = "identity") +
  labs(x = "Primary Pattern", y = "Number of Species") +
  scale_fill_manual(values = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost)) +
  ggtitle("Primary Snake Patterns of Yemen - Gillian")
#################################################################################################
#PATTERN TESTING - DID NOT WORK
#JordanSnakes by pattern - Gillian
# library(ggpattern)
# library(ggplot2)
# install.packages("ggplot2")
# install.packages("ggpattern")

install.packages("ggpattern")  # uncomment to install the package
library(ggplot2)
library(ggpattern)

uniform <- "#E8CB79"
blank <- "#D0B66C"
diamond <- "#B9A260"
banded <- "#A28E54"
blotched <- "#8B7948"
striped <- "#74653C"
spotted <- "#5C5130"
antpost <- "#453C24"

pattern_counts <- data.frame(
  pattern = factor(c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior"),
                   levels = c("uniform", "blank", "diamond", "banded", "blotched", "striped", "spotted", "anterior-posterior")),
  count = c(sum(JordanSnakes$primary.pattern[JordanSnakes$User == "gillian"] == "uniform"),
            sum(JordanSnakes$primary.pattern[JordanSnakes$User == "gillian"] == ""),
            sum(JordanSnakes$primary.pattern[JordanSnakes$User == "gillian"] == "diamond"),
            sum(JordanSnakes$primary.pattern[JordanSnakes$User == "gillian"] == "banded"),
            sum(JordanSnakes$primary.pattern[JordanSnakes$User == "gillian"] == "blotched"),
            sum(JordanSnakes$primary.pattern[JordanSnakes$User == "gillian"] == "striped"),
            sum(JordanSnakes$primary.pattern[JordanSnakes$User == "gillian"] == "spotted"),
            sum(JordanSnakes$primary.pattern[JordanSnakes$User == "gillian"] == "anterior-posterior"))
)

ggplot(data = pattern_counts, aes(x = pattern, y = count, pattern = pattern)) +
  geom_col_pattern(fill = c(uniform, blank, diamond, banded, blotched, striped, spotted, antpost), 
                   pattern = c("stripe", "solid", "small checkerboard", "wide checkerboard", "crosshatch", "dots", "vertical stripe", "horizontal stripe")) +
  scale_pattern_manual(values = c("stripe" = "stripe", "solid" = "solid", "small checkerboard" = "checkerboard_s", 
                                  "wide checkerboard" = "checkerboard_w", "crosshatch" = "crosshatch", 
                                  "dots" = "dots", "vertical stripe" = "stripe_v", "horizontal stripe" = "stripe_h")) +
  labs(x = "Primary Pattern", y = "Number of Species") +
  ggtitle("Primary Snake Patterns of Jordan- Gillian")
###############################################################################

#make color families

Uniform3Snakes <- snake[snake$tertiary.pattern == "uniform",] #10 obs

WhitishColorFam <- snake[snake$primary.color == "lightgray" | snake$primary.color == "white" |
                           snake$secondary.color == "lightgray" | snake$secondary.color == "white",] #376 obs
LightColorFam <- snake[snake$primary.color == "yellow" | snake$primary.color == "white" |
                           snake$primary.color == "beige" | snake$secondary.color == "white" |
                           snake$secondary.color == "yellow" | snake$secondary.color == "beige",] #464 obs
BrownColorFam <- snake[snake$primary.color == "brown" | snake$primary.color == "lightbrown" |
                         snake$primary.color == "darkbrown" | snake$secondary.color == "brown" |
                         snake$secondary.color == "darkbrown" | snake$secondary.color == "lightbrown",] #836 obs
DarkColorFam <- snake[snake$primary.color == "darkbrown" | snake$primary.color == "black" |
                         snake$primary.color == "darkgray" | snake$secondary.color == "darkbrown" |
                         snake$secondary.color == "black" | snake$secondary.color == "darkgray",] #930 obs
################################################################################
#make color neighbors

WhiteNeighbor <- snake[snake$primary.color == "lightgray",] #220 obs
YellowNeighbor <- snake[snake$primary.color == "beige",] #188 obs
BeigeNeighbor <- snake[snake$primary.color == "pink" | snake$primary.color == "lightgray",] #220 obs
BrownNeighbor <- snake[snake$primary.color == "olive",] #0 obs
DarkBrownNeighbor <- snake[snake$primary.color == "olive",] #0 obs
BlackNeighbor <- snake[snake$primary.color == "darkbrown",] #106 obs
DarkgrayNeighbor <- snake[snake$primary.color == "lightgray",] #220 obs
OrangeNeighbor <- snake[snake$primary.color == "pink" | snake$primary.color == "brown",] # 167 obs
RedNeighbor <- snake[snake$primary.color == "purple" | snake$primary.color == "brown",] #203 obs
OliveNeighbor <- snake[snake$primary.color == "darkbrown",] #106 obs
################################################################################
#scale type
unique(snake$scale_type)
SmoothSnakes <- snake[snake$scale_type == "smooth",] #946 obs
KeeledSnakes <- snake[snake$scale_type == "keeled",] #343 obs
UnknownScaleSnakes <- snake[snake$scale_type == "" | snake$scale_type == " ",] #287 obs
################################################################################
#subsetting by species

# create empty list to store subsets
species_number_list <- list()

# loop through all species numbers
for (i in 1:162) {
  # create subset for current species number
  subset_df <- subset(snake, species.number == i)
  
  # add subset to list
  species_number_list[[i]] <- subset_df
  
  # save subset as separate object
  assign(paste0("species_", i), subset_df)
}

# access subset for any species using its number (1-162)
species_162
################################################################################
#Visualizing Snkaes by Country
#Bahrain - The only species in bahrain is species_127 = Platyceps ventromaculatus
#IranSnakes
library(ggplot2)

# Create a data frame with counts of each species
species_counts <- data.frame(table(IranSnakes$species.number))

# Create a bar plot of the species counts
ggplot(data = species_counts, aes(x = Var1, y = Freq, fill = Var1)) + 
  geom_bar(stat = "identity") +
  labs(x = "Species", y = "Photo Count") +
  ggtitle("Distribution of Snake Species in Iran")
#Iraq
#Israel
#Jordan
#Kuwait
#Lebanon
#Oman
#Qatar
#Saudi Arabia
#Syria
#Qatar
#UAE
#Yemen
################################################################################
#Gillian v Andrew Color and Pattern Comparison
# Count the occurrences of each color in GilliansSnakes
gillians_color_counts <- table(GilliansSnakes$primary.color)
# Find the most common color in GilliansSnakes
gillians_most_common_color <- names(which.max(gillians_color_counts))
#Gillian's most common color was lightbrown.

# Count the occurrences of each color in AndrewsSnakes
andrews_color_counts <- table(AndrewsSnakes$primary.color)
# Find the most common color in AndrewsSnakes
andrews_most_common_color <- names(which.max(andrews_color_counts))
#Andrew's most common color was lightgray

# Count the occurrences of each pattern in GilliansSnakes
gillians_pattern_counts <- table(GilliansSnakes$primary.pattern)
# Find the most common pattern in GilliansSnakes
gillians_most_common_pattern <- names(which.max(gillians_pattern_counts))
#Gillian's most common pattern was blotched.

# Count the occurrences of each pattern in AndrewsSnakes
andrews_pattern_counts <- table(AndrewsSnakes$primary.pattern)
# Find the most common pattern in AndrewsSnakes
andrews_most_common_pattern <- names(which.max(andrews_pattern_counts))
#Andrew's most common pattern was blotched.
################################################################################
#Number of Species per color

library(ggplot2)

ggplot(GilliansSnakes, aes(x = species.number, fill = primary.color)) +
  geom_histogram(position = "dodge", bins = 20) +
  labs(x = "Species Number", y = "Count") +
  ggtitle("Snake Species by Color")

library(dplyr)

# Iterate over each species
for (i in 1:162) {
  # Subset the dataset for the current species
  species_data <- species_1 %>% filter(species.number == i)
  
  # Find the most common primary color
  most_common_color <- species_data %>%
    group_by(primary.color) %>%
    summarize(n = n()) %>%
    arrange(desc(n)) %>%
    slice(1) %>%
    pull(primary.color)
  
  # Assign the most common color as the main color for the species
  species_1$main.color[species_1$species.number == i] <- most_common_color
}

species_1$main.color #is black

################################################################################
#Summer Reworking

# Find the common image names
common_image_names <- intersect(unique(AllGilliansSnakes$image_file_name), unique(AndrewsSnakes$image_file_name))

# Filter GilliansSnakes to include only the common image names
AllGilliansSnakes <- AllGilliansSnakes[AllGilliansSnakes$image_file_name %in% common_image_names, ]

# Filter AndrewsSnakes to include only the common image names
AndrewsSnakes <- AndrewsSnakes[AndrewsSnakes$image_file_name %in% common_image_names, ]

unique(AllGilliansSnakes$image_file_name)
unique(AndrewsSnakes$image_file_name)

# Combine GilliansSnakes and AndrewsSnakes
combined_snakes <- rbind(AllGilliansSnakes, AndrewsSnakes)

# Delete the column "Need.Andrew.to.Code" using the subset() function
combined_snakes <- subset(combined_snakes, select = -c(Need.Andrew.to.Code))
combined_snakes <- subset(combined_snakes, select = -c(X))
combined_snakes <- subset(combined_snakes, select = -c(X.1))

# Export the combined_snakes dataset to a CSV file
write.csv(combined_snakes, "combined_snakes.csv")
####################################################################
#NEW Chi-Sq
#-------
#Is there a difference in primary color choice between two coders?

newSnakes <- read.csv(file.choose(),header = TRUE)

newGilliansSnakes <- newSnakes[newSnakes$User == "gillian",] 
newAndrewsSnakes <- newSnakes[newSnakes$User == "andrew",] 

cont_table <- table(newGilliansSnakes$primary.color, newAndrewsSnakes$primary.color)
cont_table2 <- table(newGilliansSnakes$primary.pattern, newAndrewsSnakes$primary.pattern)

#for merged_DONE_FINAL_BODYONLY with andrew needs to code removed
cont_table <- table(newGilliansSnakes$primary.color, newAndrewsSnakes$primary.color)
cont_table2 <- table(newGilliansSnakes$primary.pattern, newAndrewsSnakes$primary.pattern)

chisq.test(cont_table)
# Pearson's Chi-squared test
# 
# data:  cont_table
# X-squared = 1063, df = 143, p-value < 2.2e-16
# 
# Warning message:
# In chisq.test(cont_table) : Chi-squared approximation may be incorrect

fisher.test(cont_table, simulate.p.value = TRUE)
# 	Fisher's Exact Test for Count Data with simulated p-value (based on 2000
# replicates)
# 
# data:  cont_table
# p-value = 0.0004998
# alternative hypothesis: two.sided
########################
chisq.test(cont_table2)
# Pearson's Chi-squared test
# 
# data:  cont_table2
# X-squared = 961.76, df = 42, p-value < 2.2e-16
# 

fisher.test(cont_table2, simulate.p.value = TRUE)
# 
# Fisher's Exact Test for Count Data with simulated p-value (based on 2000
# 	replicates)
# 
# data:  cont_table2
# p-value = 0.0004998
# alternative hypothesis: two.sided
####################################################
#If you conduct a Fisher's exact test to evaluate the hypothesis that two people
# will select the same colors for a snake, and you obtain a very low p-value,
# this suggests that the observed data is unlikely to have occurred by chance alone,
# assuming that the null hypothesis of no association between the two people's color selections is true.

#In other words, a low p-value indicates that the evidence from the data is in
# favor of the alternative hypothesis that there is an association between the 
# two people's color selections. The exact interpretation of this association 
# depends on the specific study design and the context of the data.
###########################################################################
#Combined COlor and Pattern Matrix

# Create a matrix of color and pattern combinations
color_pattern_matrix <- table(combined_snakes$primary.color, combined_snakes$primary.pattern)

# Split the combined_snakes dataset by user
user_matrices <- split(combined_snakes, combined_snakes$User)

# Create a matrix for each user and associate with user name
for (user in c("andrew", "gillian")) {
  if (user %in% names(user_matrices)) {
    user_matrix <- table(user_matrices[[user]]$primary.color, user_matrices[[user]]$primary.pattern)
    print(paste("Matrix for User:", user))
    print(user_matrix)
  } else {
    print(paste("No data available for user:", user))
  }
}

interest <- unique(combined_snakes$primary.patternattern)
