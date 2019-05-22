source(here::here ("R/package-loading.R"))

glimpse(NHANES)

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

#create a pipe and start a new line to make it easier to read
#in tidyverse the dataset always comes first to make it tidier
NHANES %>%
  colnames() %>%
  length()

colnames(NHANES)
length(colnames(NHANES))

NHANES %>%
  mutate(Height = Height/100,
         Testing = "yes",
         Highlyactive = if_else(PhysActiveDays >=5,
                                "yes",
                                "no"
                                ))


NHANES_updated <- NHANES %>%
  mutate (UrinVolAverage = (UrineVol1 + UrineVol2)/2)


# Exercise ----------------------------------------------------------------

# Pipe the data into mutate function and:
NHANES_modified <- NHANES %>% # dataset
  mutate(
    # 1. Calculate average urine volume
  UrinVolAverage = (UrineVol1 + UrineVol2)/2,
    # 2. Modify Pulse variable
    Pulse = Pulse/60,
    # 3. Create YoungChild variable using a condition
    YoungChild = if_else(Age < 6, TRUE, FALSE)
  )
NHANES_modified

glimpse(NHANES_modified)


# Selecting variables -----------------------------------------------------

NHANES %>%
  select(Gender, BMI)

NHANES %>%
  select (-BMI)

NHANES %>%
  select(starts_with("Smoke"),
         contains("Vol"),
         matches("[123]"))  #find all variables that contain 1, 2 or 3

NHANES %>%
  rename(
    #new name = old name
    NumberBabies = nBabies,
    Sex = Gender
    )

NHANES %>%
  select(
    BMI, NumberBabies = nBabies,
    Gender, Height
      )

NHANES %>%
  filter(Gender == "female" | BMI >= 25)  #OR

NHANES %>%
  arrange(Age) %>%  #ascending order
  select(Age)

NHANES %>%
  arrange(desc(Age), Gender) %>%  #descending order
  select(Age, Gender)


# Exercise ----------------------------------------------------------------

# To see values of categorical data
summary(NHANES)

# 1. BMI between 20 and 40 and who have diabetes
NHANES %>%
  # format: variable >= number
  filter(BMI >= 20 & BMI <= 40 & Diabetes == "yes")

# 2. Working or renting, and not diabetes
NHANES %>%
  filter((Work == "Working" | HomeOwn == "Rent" )& Diabetes == "No") %>%
  select(Age, Gender, Work, HomeOwn, Diabetes)

# 3. How old is person with most number of children.
NHANES %>%
  arrange(desc(nBabies)) %>%
  select(Age, nBabies)


# Split -------------------------------------------------------------------
#also named Group by and summarize

NHANES %>%
  summarise(MaxAge = max(Age, na.rm=TRUE), #na.rm means remove missing values
            MinBMI = min(BMI, na.rm = TRUE))

NHANES %>%
  group_by(Gender, Work) %>%
  summarise(MeanBMI = mean(BMI, na.rm = TRUE),
            MeanAge = mean(Age, na.rum = TRUE))


# Conversion to long form -------------------------------------------------
table4b %>%
  gather(year, population, -country)

table4b %>%
  gather(year, population, `1999`, `2000`)

nhanes_simple <- NHANES %>%
  select(SurveyYr, Gender, Age, Weight, Height, BMI, BPSysAve)

nhanes_long <- nhanes_simple %>%
  gather(Measure, Value, -SurveyYr, -Gender)

nhanes_summary <- nhanes_long %>%
  group_by(SurveyYr, Gender, Measure) %>%
  summarise(MeanValue = mean (Value, na.rm=TRUE)
  )


# Conversion to wide form -------------------------------------------------

table2 %>%
  spread(type, count) #type is the key, count is the value

nhanes_summary %>%
  spread(Gender, MeanValue)


# Exercise ----------------------------------------------------------------


