#' ---
#' title: "organize_data.R"
#' author: ""
#' ---

# This script will process the GSS data from the input directory and clean up variables,
# subset, and save the analytical data to the output directory.

#use the script provided by GSS to read in data (no factor coding)
setwd("input/none_gss_extract/")
source("GSS.r")
setwd("../../")

# Recode Pray -------------------------------------------------------------
# 9        "No answer"
# 8        "Don't know"
# 6        "Never"
# 5        "Lt once a week"
# 4        "Once a week"
# 3        "Several times a week"
# 2        "Once a day"
# 1        "Several times a day"
# 0        "Not applicable"

#never and lt once a weeek shift dramatically from 2002 to 2004, because None was not
#included as a pre-defined option before 2004, so collapse these two
GSS$pray <- factor(ifelse(GSS$PRAY==6, 5, GSS$PRAY), 
                   levels=5:1,
                   labels=c("lt once a week","once a week","several times a week",
                            "once a day","several times a day"), 
                   ordered = TRUE)
table(GSS$pray, GSS$PRAY, exclude=NULL)

# simplified version of prayer - lt once a week, weekly, daily
GSS$pray.simple <- factor(ifelse(is.na(GSS$pray), NA,
                                 ifelse(GSS$pray>="once a day", "daily",
                                        ifelse(GSS$pray>="once a week", "weekly", "lt once a week"))),
                          levels=c("lt once a week", "weekly", "daily"), 
                          ordered=TRUE)
table(GSS$pray, GSS$pray.simple, exclude=NULL)


# Recode Belief in God ----------------------------------------------------
# 9        "No answer"
# 8        "Don't know"
# 6        "Know god exists"
# 5        "Believe but doubts"
# 4        "Believe sometimes"
# 3        "Some higher power"
# 2        "No way to find out"
# 1        "Dont believe"
# 0        "Not applicable"

GSS$god <- factor(GSS$GOD, 
                  levels=1:6,
                  labels=c("dont believe","no way to find out","some higher power",
                           "believe sometimes","believe but doubts","know god exists"),
                  ordered=TRUE)
table(GSS$god, GSS$GOD, exclude=NULL)

#simplified version - non-believer, higher power, believer
GSS$god.simple <- factor(ifelse(is.na(GSS$god), NA, 
                                ifelse(GSS$god>="believe sometimes", "believer",
                                       ifelse(GSS$god=="some higher power", "higher power","non-believer"))),
                         levels=c("non-believer","higher power","believer"),
                         ordered=TRUE)
table(GSS$god, GSS$god.simple)


# Recode Belief in Afterlife ----------------------------------------------
# 9        "No answer"
# 8        "Don't know"
# 2        "No"
# 1        "Yes"
# 0        "Not applicable"

GSS$postlife <- factor(GSS$POSTLIFE, 
                       levels=2:1,
                       labels=c("no","yes"),
                       ordered=TRUE)
table(GSS$postlife, GSS$POSTLIFE, exclude=NULL)



# Recode Attendance -------------------------------------------------------
# 9        "Dk,na"
# 8        "More thn once wk"
# 7        "Every week"
# 6        "Nrly every week"
# 5        "2-3x a month"
# 4        "Once a month"
# 3        "Sevrl times a yr"
# 2        "Once a year"
# 1        "Lt once a year"
# 0        "Never"

GSS$attend <- factor(GSS$ATTEND, 
                     levels=0:8,
                     labels=c("never","lt once a year","once a year","several times a yr",
                              "once a month","2-3x a month","nrly every week","every week",
                              "more thn once week"),
                     ordered=TRUE)
table(GSS$attend, GSS$ATTEND, exclude=NULL)


# Identify Nones ----------------------------------------------------------
# 99       "No answer"
# 98       "Don't know"
# 13       "Inter-nondenominational"
# 12       "Native american"
# 11       "Christian"
# 10       "Orthodox-christian"
# 9        "Moslem/islam"
# 8        "Other eastern"
# 7        "Hinduism"
# 6        "Buddhism"
# 5        "Other"
# 4        "None"
# 3        "Jewish"
# 2        "Catholic"
# 1        "Protestant"
# 0        "Not applicable"

GSS$nones <- factor(ifelse(GSS$RELIG==0 | GSS$RELIG>=98, NA, 
                           ifelse(GSS$RELIG==4, "None","Religious")),
                    levels=c("Religious","None"))
table(GSS$RELIG, GSS$nones, exclude=NULL)

GSS$nones16 <- factor(ifelse(GSS$RELIG16==0 | GSS$RELIG16>=98, NA, 
                             ifelse(GSS$RELIG16==4, "None","Religious")),
                      levels=c("Religious","None"))
table(GSS$RELIG16, GSS$nones16, exclude=NULL)

mean(is.na(GSS$nones))

#compare 
table(GSS$nones16, GSS$nones, exclude=NULL)

# a variable that separates the never affiliated from the disaffiliated
GSS$affiliation <- factor(ifelse(is.na(GSS$nones16) | is.na(GSS$nones), NA, 
                                 ifelse(GSS$nones16=="Religious" & GSS$nones=="None", "Disaffiliated",
                                        ifelse(GSS$nones16=="None" & GSS$nones=="None", "Never Affiliated",
                                               "Affiliated"))),
                          levels=c("Affiliated","Never Affiliated","Disaffiliated"))
table(GSS$affiliation, exclude=NULL)

# Recode Age and Birthyear ------------------------------------------------

GSS$age <- ifelse(GSS$AGE>=98, NA, GSS$AGE)
GSS$year <- GSS$YEAR

#ten-year birth cohorts
birthyear <- GSS$year-GSS$age
#before 1930, things are pretty scarce for the nones so lets collapse these cohorts
birthyear[birthyear<1930] <- 1930

GSS$birthyear10 <- factor(floor(birthyear/10)*10, ordered=TRUE,
                          levels=c(1930,1940,1950,1960,1970,1980,1990),
                          labels=c("pre-1940","1940-1949",
                                   "1950-1959","1960-1969","1970-1979","1980-1989",
                                   "1990-1999"))
table(GSS$age, GSS$birthyear10)

# Save Analytical Dataset -------------------------------------------------

#weighting data
GSS$wtssall <- GSS$WTSSALL
GSS$vstrat <- GSS$VSTRAT

#if you are missing on affilation then drop. Limit to recoded variables
gss <- subset(GSS, !is.na(nones),
              select=c("year","age","birthyear10","nones", "nones16","affiliation",
                       "god","god.simple","postlife","pray","pray.simple","attend",
                       "wtssall","vstrat"))
save(gss, file="output/gss_relig.RData")
