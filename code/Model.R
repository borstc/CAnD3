require(nnet)

# Multinomial logistic regression model, using "Child cared for by respondent or spouse" as baseline
# Weights are not applied, complete cases used only (drops 226 cases, 6.4% of data)

use_data <- complete.cases(final_data)
use_data <- final_data[use_data == TRUE,]

cc_pref_model <- multinom(cc_pref ~ age + genderF + marital_status + family_income +
                            education + bornCan + visible_minority + religious_activity,
                          data = use_data)

analysis_of_deviance <- car::Anova(cc_pref_model)

model_summary <- summary(cc_pref_model, Wald.ratios = TRUE)
