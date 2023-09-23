## ANALYSIS OF DEVIANCE TABLE

analysis_of_deviance$var <- c("Age", "Gender", "Marital Status", "Family Income", "Education",
                              "Place of Birth", "Visible Minority", "Religious Activity")
analysis_of_deviance$stars <- c("***","","","**","***","","*","***")
analysis_of_deviance <- analysis_of_deviance[, c(4, 1, 2, 3, 5)]

analysis_of_deviance %>%
  gt() %>%
  tab_header(title = md("**Analysis of Deviance Table (Type II tests)**"), 
             subtitle = "Response: Child care preferences (cc_pref)") %>%
  fmt_number(columns = `LR Chisq`, decimals = 3) %>%
  fmt_number(columns = `Pr(>Chisq)`, decimals = 4) %>%
  cols_label(var = md("**Variable**"),
             `LR Chisq` = md("**LR Chisq**"),
             Df = md("**Df**"),
             `Pr(>Chisq)` = md("**Pr(>Chisq)**"),
             stars = "") %>%
  tab_source_note(source_note = "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05") %>%
  gtsave(file.path(".","table","results_table_1.html"))

## MODEL COEFFICIENTS TABLE

short_labels = c("Parent care", "Home care - non-relative", "Home care - relative", "Own home care - non-relative", 
                 "Own home care - relative", "Centre care", "Before & after care", "Nursery/pre- school", "Other")

cbind(short_labels[-1], as.data.frame(model_summary$coefficients)) %>%
  gt() %>%
  tab_header(title = md("**Model Coefficients Table**"), 
             subtitle = "Coefficients are log-odds of preference, relative to Parent care") %>%
  fmt_number(decimals = 4) %>%
  cols_label(`short_labels[-1]` = md("**Preference**"),
             `(Intercept)` = md("**Intercept**"),
             age = md("**Age**"),
             genderFTRUE = md("**Gender (F)**"),
             marital_status = md("**Marital Status**"),
             family_income = md("**Family Income**"),
             education = md("**Education**"),
             bornCanTRUE = md("**Born in (Canada)**"),
             visible_minorityTRUE = md("**Visible Minority**"),
             religious_activity = md("**Religious Activity**")) %>%
  tab_source_note(source_note = md(paste("**Residual deviance:** ", round(model_summary$deviance,2)))) %>%
  tab_source_note(source_note = md(paste("**AIC:** ", round(model_summary$AIC,2)))) %>%
  gtsave(file.path(".","table","results_table_2.html"))
