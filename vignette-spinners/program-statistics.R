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
#' This vignette provides a summary of the data sets provided.  Each of the
#' data sets are provided as pure data.tables.  Many of the names for the
#' columns of the data sets are not R syntactically valid names, that is, many
#' of the names contain spaces.
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
#'
#' Load the data set:
data(MDCR_ENROLL_AB_01, package = "cms.program.statistics")

#'
#' This data set contains total enrollment data for the years
{{ as.character(min(MDCR_ENROLL_AB_01$Year)) }}
#' to
{{ paste0(max(MDCR_ENROLL_AB_01$Year), ".") }}
#'
#' The provided enrollment information is:
#+ results = "asis"
cat(paste("*", names(MDCR_ENROLL_AB_01)), sep = "\n")

#'
#' The overall enrollment in Medicare can be seen in the following graphic.
#+ label = "plot_MDCR_ENROLL_AB_01", echo = FALSE, results = "hide", fig.width = 7, fig.height = 7
plot_enroll <-
  reshape2::melt(MDCR_ENROLL_AB_01,
                 id.vars = "Year",
                 measure.vars = c("Total Enrollment",
                                  "Total Original Medicare Enrollment",
                                  "Total Medicare Advantage and Other Health Plan Enrollment"))

levels(plot_enroll$variable)[grepl("^Total\\ Enrollment$", levels(plot_enroll$variable))] <- "Total"
levels(plot_enroll$variable)[grepl("Original",             levels(plot_enroll$variable))] <- "Orignal Medicare"
levels(plot_enroll$variable)[grepl("Medicare Advantage",   levels(plot_enroll$variable))] <- "Medicare Advantage and Other Health Plan"
plot_enroll$facet <- "Total Enrollment"

plot_percent_increase <-
  reshape2::melt(MDCR_ENROLL_AB_01,
                 id.vars = "Year",
                 measure.vars = c("Total Enrollment Percentage Increase from Prior Year",
                                  "Total Original Medicare Enrollment Percentage Increase from Prior Year",
                                  "Total Medicare Advantage and Other Health Plan Enrollment Percentage Increase from Prior Year"))

levels(plot_percent_increase$variable)[grepl("^Total\\ Enrollment", levels(plot_percent_increase$variable))] <- "Total"
levels(plot_percent_increase$variable)[grepl("Original",            levels(plot_percent_increase$variable))] <- "Orignal Medicare"
levels(plot_percent_increase$variable)[grepl("Medicare Advantage",  levels(plot_percent_increase$variable))] <- "Medicare Advantage and Other Health Plan"
plot_percent_increase$facet <- "Percent Increase from Prior Year"

plot_percent_of_total <-
  reshape2::melt(MDCR_ENROLL_AB_01,
                 id.vars = "Year",
                 measure.vars = c("Total Original Medicare Percent of Total Enrollment",
                                  "Total Medicare Advantage and Other Health Plan Enrollment Percent of Total Enrollment"))

levels(plot_percent_of_total$variable)[grepl("Original",           levels(plot_percent_of_total$variable))] <- "Orignal Medicare"
levels(plot_percent_of_total$variable)[grepl("Medicare Advantage", levels(plot_percent_of_total$variable))] <- "Medicare Advantage and Other Health Plan"
plot_percent_of_total$facet <- "Percent of Total"

plot_data <- rbind(plot_enroll, plot_percent_increase, plot_percent_of_total)
plot_data$facet %<>% factor(levels = c("Total Enrollment", "Percent Increase from Prior Year", "Percent of Total"))

ggplot2::ggplot(data = plot_data) +
  ggplot2::aes(x = Year, y = value, color = variable) +
  ggplot2::geom_line() +
  ggplot2::geom_point() +
  ggplot2::facet_wrap( ~ facet, scale = "free_y", ncol = 1) +
  ggplot2::scale_x_continuous(breaks = MDCR_ENROLL_AB_01$Year) +
  ggplot2::ylab("") +
  ggplot2::theme(legend.position = "bottom",
                 legend.title = ggplot2::element_blank())

#'
#' The full data set is relatively small and can be displayed in one table
#' easily.
#+ label = "table_MDCR_ENROLL_AB_01", echo = FALSE, results = "asis"
knitr::kable(MDCR_ENROLL_AB_01)

#'
#' ## MDCR ENROLL AB 02
#'
#' Total Medicare Enrollment:  Total, Original Medicare, Medicare Advantage and Other Health Plan Enrollment, and Resident Population, by Area of Residence.
#'
data(MDCR_ENROLL_AB_02, package = "cms.program.statistics")
str(MDCR_ENROLL_AB_02)
