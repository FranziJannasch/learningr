glimpse(NHANES)
??nhanes

nhanes_new <- NHANES %>%
  mutate (AgeDiabetesDiagnosis = DiabetesAge,
          DrinksofAlcoholInDay = AlcoholDay,
          Morethan5DaysActive = if_else (PhysActiveDays > 5,"yes", "no"),
          NumberofBabies = nBabies,
          TotalCholesterol = TotChol)

nhanes_new

nhanes_new %>%
  select(Gender, Age, AgeDiabetesDiagnosis, BMI, BPDiaAve, BPSysAve, DrinksofAlcoholInDay,
         Morethan5DaysActive, NumberofBabies, Poverty, TotalCholesterol, SurveyYr)

nhanes_new %>%
  arrange(Gender)

nhanes_new %>%
  summarise(Mean.Age=mean(Age),
            Mean.AgeDiabetesDiagnosis = mean(AgeDiabetesDiagnosis),
            Mean.BMI = mean(BMI),
            Mean.BPDiaAve = Mean(BPDiaAve),
            Mean.BPSysAve = Mean(BPSysAve),
            Mean.DrinksofAlcoholInDay = Mean(DrinksofAlcoholInDay),
            Mean.NumberofBabies = Mean(NumberofBabies),
            Mean.Poverty = Mean(Poverty),
            Mean.TotalCholesterol = Mean(TotalCholesterol))

nhanes_new %>%
  filter(Age>=18 & Age <=75)

nhanes_new %>%
  select (Gender, Measure, `2009_10`, `2011_12`)
