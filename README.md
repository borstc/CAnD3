# CAnD3

## Reproducibility and Workflow Management Activity

### Study Description

Nominally, this study looks at the demographic predictors of child care preferences expressed by respondents to the 2017 Canadian General Social Survey. A multinomial logistic regression model suggests that respondent age, education, and frequency of participation in religious activities are the strongest predictors, followed by family income and visible minority status.

That said, the analysis run is an exercise and has not been subject to any of the usual tests. The actual purpose of the exercise is to try to create a fully reproducible workflow and commit it to Git.


### Data Description

The data used comes from the 2017 (cycle 31) Canadian General Social Survey on the Family. The data is made available through ODESI, a service provided by the Ontario Council of University Libraries, under the terms of a DLI License from Statistics Canada. For the present project, that license has been extended to CAnD3 (Consortium on Analytics for Data-Driven Decision-making) at McGill University for training purposes only. Redistribution of the data is not permitted.

However, the data and documentation now appears to be available under a Statistics Canada Open License from the [Borealis](https://hdl.handle.net/11272.1/AB2/G3DUFG) dataverse or directly from [Statistics Canada](https://www150.statcan.gc.ca/n1/pub/45-25-0001/index-eng.htm).


Statistics Canada. 2020. General Social Survey, Cycle 31, 2017 [Canada]: Family (version 2020-09). Statistics Canada [producer and distributor], accessed September 10, 2021. ID: gss-12M0025-E-2017-c-31


### Instructions for Data Preparation and Analysis

Clone this repository. Acquire the data. The script assumes that the data is a csv located in the parent directory of the project file (i.e., one level up). The analysis was conducted in R 4.3.1. An RMarkdown document (RRWM_Main.Rmd) is in the `code` directory. Knitting it should execute all other scripts and reproduce the output in full, though see the caveats in the file.

Note that, for comparison purposes, the tables provided should be copied to a separate directory so that they are not overwritten when the process is re-run.