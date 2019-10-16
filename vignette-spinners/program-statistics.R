#'---
#'title: "Program Statistics from the Centers for Medicare and Medicaid Services"
#'output:
#'  rmarkdown::html_vignette:
#'    toc: yes
#'vignette: |
#'  %\VignetteIndexEntry{MDCR Program Statistics}
#'  %\VignetteEngine{knitr::rmarkdown}
#'  %\VignetteEncoding{UTF-8}
#'---
#'
#+label='setup', include = FALSE, cache = FALSE
library(magrittr)
knitr::opts_chunk$set(collapse = TRUE, cache = FALSE)
options(qwraps2_markup = "markdown")

#'
#' The data sets provided in this package are built from the program statistics
#' data provided by the Centers for Medicaid and Medicare Services,
#' https://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/CMSProgramStatistics/.
#'
#' If you are interested in verifying the construction of the provided data sets
#' you can view the code and verify the source data at
#' https://github.com/dewittpe/cms.program.statistics.
#'
#' This vignette provides a summary of the data sets provided.
#'
#' # Total Medicare Enrollment
#'
#' From the website: The Medicare Enrollment Section contains trend,
#' demographic, and state tables showing total Medicare enrollment, Original
#' Medicare enrollment, Medicare Advantage and Other Health Plan enrollment,
#' newly-enrolled beneficiaries, deaths, and Medicare-Medicaid Enrollment.
#'
#' There are several data sets provided with enrollment data.  The enrollment
#' values are in person years and subject to standard disclaimers regarding
#' rounding issues.
#+ label = "list_enrollment_datasets", echo = FALSE, results = 'asis'
enrollment_data_sets <- data(package = "cms.program.statistics")$results
enrollment_data_sets <- enrollment_data_sets[grepl("^MDCR_ENROLL_.*", enrollment_data_sets[, "Item"]), c("Item", "Title")]
enrollment_data_sets[, "Item"] %<>% paste0("[", ., "](#", tolower(gsub("_", "-", .)), ")")
knitr::kable(enrollment_data_sets)

#'
#' ## MDCR ENROLL AB 01
#'
#' Total Medicare Enrollment:  Total, Original Medicare, and Medicare Advantage
#' and Other Health Plan Enrollment
data(MDCR_ENROLL_AB_01, package = "cms.program.statistics")
str(MDCR_ENROLL_AB_01)
#'
#' ## MDCR ENROLL AB 02
#'
#' Total Medicare Enrollment:  Total, Original Medicare, Medicare Advantage and Other Health Plan Enrollment, and Resident Population, by Area of Residence.
#'
data(MDCR_ENROLL_AB_02, package = "cms.program.statistics")
str(MDCR_ENROLL_AB_02)
