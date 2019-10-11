#'---
#'title: "Program Statistics from the Centers for Medicare and Medicaid Services"
#'author:
#'  - name: Peter DeWitt
#'output:
#'  BiocStyle::html_document:
#'    toc: yes
#'    toc_float: true
#'package: cms.program.statistics
#'vignette: |
#'  %\VignetteIndexEntry{MDCR Program Statistics}
#'  %\VignetteEngine{knitr::rmarkdown}
#'  %\VignetteEncoding{UTF-8}
#'---
#'
#+label='setup', include = FALSE, cache = FALSE
knitr::opts_chunk$set(collapse = TRUE, cache = FALSE)
options(qwraps2_markup = "markdown")

#'
#' # Total Medicare Enrollment
#'
#' From the website: The Medicare Enrollment Section contains trend,
#' demographic, and state tables showing total Medicare enrollment, Original
#' Medicare enrollment, Medicare Advantage and Other Health Plan enrollment,
#' newly-enrolled beneficiaries, deaths, and Medicare-Medicaid Enrollment.
#'
#' ## MDCR ENROLL AB 1
#'
#' Total Medicare Enrollment:  Total, Original Medicare, and Medicare Advantage
#' and Other Health Plan Enrollment,
data(MDCR_ENROLL_AB_01, package = "cms.program.statistics")
str(MDCR_ENROLL_AB_01)
#'
#' ## MDCR ENROLL AB 2
#'
#' Total Medicare Enrollment:  Total, Original Medicare, Medicare Advantage and
#' Other Health Plan Enrollment, and Resident Population, by Area of Residence.
#'
data(MDCR_ENROLL_AB_02, package = "cms.program.statistics")
str(MDCR_ENROLL_AB_02)
