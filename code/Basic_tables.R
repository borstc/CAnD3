require(gt)

## TABLE 1 - DEPENDENT VARIABLE

dv_labels = c("Child cared for by respondent or spouse", "Care in someone's home by a non-relative", 
              "Care in someone's home by a relative", "Care in child's home by a non-relative", 
              "Care in child's home by a relative", "Daycare centre [or CPE/Blank]", "Before and after school program", 
              "Nursery school / preschool", "Other")

table1_data <- data.frame(label = dv_labels, freq = as.vector(table(final_data$cc_pref)), 
                         prop = as.vector(proportions(ftable(final_data$cc_pref), 1)))

table1_data %>% 
  gt() %>%
  tab_header(title = md("**Child care preferences**"), 
             subtitle = "GSS 2017 - Family, Cycle 31") %>%
  fmt_percent(columns = prop, decimals = 1) %>%
  cols_label(label = md("**Type of care preferred**"),
             freq = md("**Frequency**"),
             prop = md("**Proportion**")) %>%
  gtsave(file.path(".","table","table_1.html"))

## TABLE 2 - AGE

t2 <- rbind(as.matrix(summary(final_data$age)),sd(final_data$age))
table2_data <- data.frame(stats = rownames(t2), values = as.vector(t2))
table2_data$stats[7] <- "St. Dev."

table2_data %>% 
  gt() %>%
  tab_header(title = md("**Respondent's Age**"), 
             subtitle = "GSS 2017 - Family, Cycle 31") %>%
  fmt_number(columns = values, decimals = 1) %>%
  cols_label(stats = md("**Summary statistic**"),
             values = md("**Value**")) %>%
  gtsave(file.path(".","table","table_2.html"))

## TABLE 3 - GENDER

table3_data <- data.frame(label = c("Male", "Female"), freq = as.vector(table(final_data$genderF)), 
                          prop = as.vector(proportions(ftable(final_data$genderF), 1)))

table3_data %>% 
  gt() %>%
  tab_header(title = md("**Respondent's Gender (Binary)**"), 
             subtitle = "GSS 2017 - Family, Cycle 31") %>%
  fmt_percent(columns = prop, decimals = 1) %>%
  cols_label(label = md("**Gender**"),
             freq = md("**Frequency**"),
             prop = md("**Proportion**")) %>%
  gtsave(file.path(".","table","table_3.html"))

## TABLE 4 - MARITAL STATUS

table4_data <- data.frame(label = c("Not partnered (Single)", 
                                    "Partnered (Married or Common-law)", 
                                    "Formerly partnered (Widowed, Divorced, Separated)",
                                    "Missing"), 
                          freq = as.vector(table(final_data$marital_status, useNA = "always")), 
                          prop = as.vector(proportions(ftable(final_data$marital_status, exclude = NULL), 1)))

table4_data %>% 
  gt() %>%
  tab_header(title = md("**Respondent's Marital Status**"), 
             subtitle = "GSS 2017 - Family, Cycle 31") %>%
  fmt_percent(columns = prop, decimals = 1) %>%
  cols_label(label = md("**Marital Status**"),
             freq = md("**Frequency**"),
             prop = md("**Proportion**")) %>%
  gtsave(file.path(".","table","table_4.html"))

## TABLE 5 - FAMILY INCOME

table5_data <- data.frame(label = c("Less than $25,000", 
                                    "$25,000 to $49,999", 
                                    "$50,000 to $74,999",
                                    "$75,000 to $99,999", 
                                    "$100,000 to $124,999", 
                                    "$125,000 or more"), 
                          freq = as.vector(table(final_data$family_income)), 
                          prop = as.vector(proportions(ftable(final_data$family_income), 1)))

table5_data %>% 
  gt() %>%
  tab_header(title = md("**Respondent's Family Income**"), 
             subtitle = "GSS 2017 - Family, Cycle 31") %>%
  fmt_percent(columns = prop, decimals = 1) %>%
  cols_label(label = md("**Income category**"),
             freq = md("**Frequency**"),
             prop = md("**Proportion**")) %>%
  gtsave(file.path(".","table","table_5.html"))

## TABLE 6 - EDUCATION

table6_data <- data.frame(label = c("Less than high school", 
                                    "High school or equivalent", 
                                    "Trade certificate",
                                    "College",
                                    "University credential below Bachelor's level",
                                    "Bachelor's degree",
                                    "University credential above Bachelor's level",
                                    "Missing"), 
                          freq = as.vector(table(final_data$education, useNA = "always")), 
                          prop = as.vector(proportions(ftable(final_data$education, exclude = NULL), 1)))

table6_data %>% 
  gt() %>%
  tab_header(title = md("**Respondent's Education**"), 
             subtitle = "GSS 2017 - Family, Cycle 31") %>%
  fmt_percent(columns = prop, decimals = 1) %>%
  cols_label(label = md("**Highest certificate, diploma or degree**"),
             freq = md("**Frequency**"),
             prop = md("**Proportion**")) %>%
  gtsave(file.path(".","table","table_6.html"))

## TABLE 7 - IMMIGRATION

table7_data <- data.frame(label = c("Not born in Canada", 
                                    "Born in Canada", 
                                    "Missing"), 
                          freq = as.vector(table(final_data$bornCan, useNA = "always")), 
                          prop = as.vector(proportions(ftable(final_data$bornCan, exclude = NULL), 1)))

table7_data %>% 
  gt() %>%
  tab_header(title = md("**Respondent's Place of Birth (implied Migrant status)**"), 
             subtitle = "GSS 2017 - Family, Cycle 31") %>%
  fmt_percent(columns = prop, decimals = 1) %>%
  cols_label(label = md("**Place of birth**"),
             freq = md("**Frequency**"),
             prop = md("**Proportion**")) %>%
  gtsave(file.path(".","table","table_7.html"))

## TABLE 8 - VISIBLE MINORITY

table8_data <- data.frame(label = c("Not visible minority", 
                                    "Visible minority", 
                                    "Missing"), 
                          freq = as.vector(table(final_data$visible_minority, useNA = "always")), 
                          prop = as.vector(proportions(ftable(final_data$visible_minority, exclude = NULL), 1)))

table8_data %>% 
  gt() %>%
  tab_header(title = md("**Respondent's Visible Minority Status**"), 
             subtitle = "GSS 2017 - Family, Cycle 31") %>%
  fmt_percent(columns = prop, decimals = 1) %>%
  cols_label(label = md("**Visible minority**"),
             freq = md("**Frequency**"),
             prop = md("**Proportion**")) %>%
  gtsave(file.path(".","table","table_8.html"))

## TABLE 9 - RELIGIOUS ACTIVITY

table9_data <- data.frame(label = c("Not at all", 
                                    "Once or twice a year", 
                                    "At least 3 times a year",
                                    "At least once a month",
                                    "At least once a week",
                                    "Missing"), 
                          freq = as.vector(table(final_data$religious_activity, useNA = "always")), 
                          prop = as.vector(proportions(ftable(final_data$religious_activity, exclude = NULL), 1)))

table9_data %>% 
  gt() %>%
  tab_header(title = md("**Respondent's Frequency of Participation in Religious Activities/Services/Meetings**"), 
             subtitle = "GSS 2017 - Family, Cycle 31") %>%
  fmt_percent(columns = prop, decimals = 1) %>%
  cols_label(label = md("**Frequency of participation**"),
             freq = md("**Frequency**"),
             prop = md("**Proportion**")) %>%
  gtsave(file.path(".","table","table_9.html"))

## CLEAN UP

rm(table1_data, t2, table2_data, table3_data, table4_data, table5_data, table6_data, table7_data, table8_data, table9_data)
