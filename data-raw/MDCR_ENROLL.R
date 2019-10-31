# Total Medicare Enrollment:  Total, Original Medicare, and Medicare Advantage and Other Health Plan Enrollment
library(magrittr)

# Helper Functions
#
# name_repair: used to create simple names for the columns when reading in data
# from .xlsx files.  The names are not important, and are not used.  This really
# just an easy way to suppress messages from readxl::read_excel without just
# ignoring the messages.
name_repair <- function(nms) {
  paste0("V", seq(1, length(nms)))
}

# Get a temporary directory to extract zip files to.
tmpdir <- tempdir()

# unzip the files
unzip("2013_enrollment/Total_Med_Enroll_XLSX.zip",      junkpaths = TRUE, exdir = paste0(tmpdir, "/2013"))
unzip("2014_enrollment/2014_Total_Med_Enroll_XLSX.zip", junkpaths = TRUE, exdir = paste0(tmpdir, "/2014"))
unzip("2015_enrollment/2015_Total_Med_Enroll_XLSX.zip", junkpaths = TRUE, exdir = paste0(tmpdir, "/2015"))
unzip("2016_enrollment/2016_Total_Med_Enroll_XLSX.zip", junkpaths = TRUE, exdir = paste0(tmpdir, "/2016"))
unzip("2017_enrollment/2017_Total_Med_Enroll_XLSX.zip", junkpaths = TRUE, exdir = paste0(tmpdir, "/2017"))

MDCR_ENROLL_AB_01 <- # {{{
  lapply(
         c(paste0(tmpdir, "/2013/CPS_MDCR_ENROLL_AB_1.xlsx"),
           paste0(tmpdir, "/2014/CPS_MDCR_ENROLL_AB_1.xlsx"),
           paste0(tmpdir, "/2015/CPS_MDCR_ENROLL_AB_1.xlsx"),
           paste0(tmpdir, "/2016/CPS_MDCR_ENROLL_AB_1.xlsx"),
           paste0(tmpdir, "/2017/CPS_MDCR_ENROLL_AB_1.xlsx"))
         ,
         readxl::read_excel,
         skip = 3)

MDCR_ENROLL_AB_01 <- dplyr::distinct(dplyr::bind_rows(MDCR_ENROLL_AB_01))

Filter(function(x) !all(is.na(x)), dplyr::filter(MDCR_ENROLL_AB_01, !grepl("20\\d\\d", Year)))

MDCR_ENROLL_AB_01 <- dplyr::filter(MDCR_ENROLL_AB_01,  grepl("20\\d\\d", Year))
MDCR_ENROLL_AB_01 <- dplyr::mutate(MDCR_ENROLL_AB_01,  Year = as.integer(Year))

lapply(MDCR_ENROLL_AB_01, tools::showNonASCII)

cat("# Auto Generated. Do not edit by hand",
    "#' Total Medicare Enrollment:  Total, Original Medicare, and Medicare Advantage and Other Health Plan Enrollment",
    "#'",
    "#' Total Medicare Enrollment:  Total, Original Medicare, and Medicare Advantage and Other Health Plan Enrollment",
    "#'",
    "#' NOTES:  The enrollment counts are determined using a person-year methodology.  Numbers and percentages may not add to totals because of rounding.",
    "#'",
    "#' @source  Centers for Medicare & Medicaid Services, Office of Enterprise Data and Analytics, CMS Chronic Conditions Data Warehouse.",
    "#'",
    "#'",
    "\"MDCR_ENROLL_AB_01\"",
    sep = "\n",
    file = "../R/MDCR_ENROLL_AB_01.R")
MDCR_ENROLL_AB_01 %<>% as.data.frame
save(MDCR_ENROLL_AB_01, file = "../data/MDCR_ENROLL_AB_01.rda")
# }}}

MDCR_ENROLL_AB_02 <- # {{{
  lapply(
         c(paste0(tmpdir, "/2013/CPS_MDCR_ENROLL_AB_2.xlsx"),
           paste0(tmpdir, "/2014/CPS_MDCR_ENROLL_AB_2.xlsx"),
           paste0(tmpdir, "/2015/CPS_MDCR_ENROLL_AB_2.xlsx"),
           paste0(tmpdir, "/2016/CPS_MDCR_ENROLL_AB_2.xlsx"),
           paste0(tmpdir, "/2017/CPS_MDCR_ENROLL_AB_2.xlsx"))
         ,
         readxl::read_excel,
         skip = 3)

MDCR_ENROLL_AB_02[[1]]$Year <- 2013L
MDCR_ENROLL_AB_02[[2]]$Year <- 2014L
MDCR_ENROLL_AB_02[[3]]$Year <- 2015L
MDCR_ENROLL_AB_02[[4]]$Year <- 2016L
MDCR_ENROLL_AB_02[[5]]$Year <- 2017L

MDCR_ENROLL_AB_02 %<>%
  dplyr::bind_rows(.) %>%
  dplyr::filter(`Area of Residence` != "BLANK") %>%
  dplyr::mutate(`Area of Residence` = gsub("\\d$", "", `Area of Residence`)) %>%
  dplyr::filter(`Area of Residence` %in% c("United States", state.name)) %>%
  dplyr::distinct(.) %>%
  dplyr::rename(`State Population` = `State Population 1`)

MDCR_ENROLL_AB_02 %>% dplyr::filter(`Area of Residence` == "United States")

lapply(MDCR_ENROLL_AB_02, tools::showNonASCII)

suppressWarnings({
                   MDCR_ENROLL_AB_02$`Total Enrollment Non-Core-Based Statistical Area` %<>% as.integer(.)
                   MDCR_ENROLL_AB_02$`Total Enrollment Micropolitan Residence` %<>% as.integer(.)
                 })

cat("# Auto Generated. Do not edit by hand",
    "#' Total Medicare Enrollment:  Total, Original Medicare, Medicare Advantage and Other Health Plan Enrollment, and Resident Population, by Area of Residence",
    "#'",
    "#' Total Medicare Enrollment:  Total, Original Medicare, Medicare Advantage and Other Health Plan Enrollment, and Resident Population, by Area of Residence",
    "#'",
    "#' Counts between 1 and 10 have been suppressed because of CMS rules to protect the privacy of beneficiaries.",
    "#'",
    "#' United States Totals Excludes territories, possessions, foreign countries, and unknown.",
    "#'",
    "#' Total United States and state population estimates are available on the U.S. Census Bureau's website:  http://www.census.gov/popest/",
    "#'",
    "#' NOTES:  The enrollment counts are determined  using a person-year methodology.  Numbers and percentages may not add to totals because of",
    "#' rounding.  For definitions of \"Metropolitan\", \"Micropolitan\", and \"Non-Core-Based Statistical Area\", refer to CPS Glossary.",
    "#'",
    "#' @source  Centers for Medicare & Medicaid Services, Office of Enterprise Data and Analytics, Chronic Conditions Data Warehouse; United States Census Bureau.",
    "#'",
    "\"MDCR_ENROLL_AB_02\"",
    sep = "\n",
    file = "../R/MDCR_ENROLL_AB_02.R")

MDCR_ENROLL_AB_02 %<>% as.data.frame
save(MDCR_ENROLL_AB_02, file = "../data/MDCR_ENROLL_AB_02.rda")
# }}}

MDCR_ENROLL_AB_03 <- #{{{
  lapply(
         c(paste0(tmpdir, "/2013/CPS_MDCR_ENROLL_AB_3.xlsx"),
           paste0(tmpdir, "/2014/CPS_MDCR_ENROLL_AB_3.xlsx"),
           paste0(tmpdir, "/2015/CPS_MDCR_ENROLL_AB_3.xlsx"),
           paste0(tmpdir, "/2016/CPS_MDCR_ENROLL_AB_3.xlsx"),
           paste0(tmpdir, "/2017/CPS_MDCR_ENROLL_AB_3.xlsx"))
         ,
         readxl::read_excel,
         skip = 2)

MDCR_ENROLL_AB_03 %<>%
  dplyr::bind_rows(.) %>%
  dplyr::distinct(.) %>%
  dplyr::filter(Year %in% as.character(2008:2017)) %>%
  dplyr::mutate(Year = as.integer(Year))

cat("# Auto Generated. Do not edit by hand",
    "#' Total Medicare Enrollment:  Part A and/or Part B Total, Aged, and Disabled Enrollees",
    "#'",
    "#' Total Medicare Enrollment:  Part A and/or Part B Total, Aged, and Disabled Enrollees",
    "#'",
    "#' NOTES:  The enrollment counts are determined  using a person-year methodology.  Numbers and percentages may not add to totals because of",
    "#' rounding.  For definitions of \"Metropolitan\", \"Micropolitan\", and \"Non-Core-Based Statistical Area\", refer to CPS Glossary.",
    "#'",
    "#' @source Centers for Medicare & Medicaid Services, Office of Enterprise Data and Analytics, Chronic Conditions Data Warehouse; United States Census Bureau.",
    "#'",
    "\"MDCR_ENROLL_AB_03\"",
    sep = "\n",
    file = "../R/MDCR_ENROLL_AB_03.R")

MDCR_ENROLL_AB_03 %<>% as.data.frame
save(MDCR_ENROLL_AB_03, file = "../data/MDCR_ENROLL_AB_03.rda")

# }}}

MDCR_ENROLL_AB_04 <- #{{{
  lapply(
         c(paste0(tmpdir, "/2013/CPS_MDCR_ENROLL_AB_4.xlsx"),
           paste0(tmpdir, "/2014/CPS_MDCR_ENROLL_AB_4.xlsx"),
           paste0(tmpdir, "/2015/CPS_MDCR_ENROLL_AB_4.xlsx"),
           paste0(tmpdir, "/2016/CPS_MDCR_ENROLL_AB_4.xlsx"),
           paste0(tmpdir, "/2017/CPS_MDCR_ENROLL_AB_4.xlsx"))
         ,
         readxl::read_excel,
         skip = 2)

MDCR_ENROLL_AB_04 %<>%
  dplyr::bind_rows(.) %>%
  dplyr::distinct(.) %>%
  dplyr::filter(Year %in% as.character(2000:2020)) %>%
  dplyr::mutate(Year = as.integer(Year))

cat("# Auto Generated. Do not edit by hand",
    "#' Total Medicare Enrollment:  Part A and/or Part B Enrollees, by Age Group",
    "#'",
    "#' Total Medicare Enrollment:  Part A and/or Part B Enrollees, by Age Group",
    "#'",
    "#' NOTES:  The enrollment counts are determined using a person-year methodology.  Numbers and percentages may not add to totals because of rounding.",
    "#'",
    "#' @source Centers for Medicare & Medicaid Services, Office of Enterprise Data and Analytics, CMS Chronic Conditions Data Warehouse.",
    "#'",
    "\"MDCR_ENROLL_AB_04\"",
    sep = "\n",
    file = "../R/MDCR_ENROLL_AB_04.R")

MDCR_ENROLL_AB_04 %<>% as.data.frame
save(MDCR_ENROLL_AB_04, file = "../data/MDCR_ENROLL_AB_04.rda")
# }}}

MDCR_ENROLL_AB_05 <- #{{{
  lapply(
         c(paste0(tmpdir, "/2013/CPS_MDCR_ENROLL_AB_5.xlsx"),
           paste0(tmpdir, "/2014/CPS_MDCR_ENROLL_AB_5.xlsx"),
           paste0(tmpdir, "/2015/CPS_MDCR_ENROLL_AB_5.xlsx"),
           paste0(tmpdir, "/2016/CPS_MDCR_ENROLL_AB_5.xlsx"),
           paste0(tmpdir, "/2017/CPS_MDCR_ENROLL_AB_5.xlsx"))
         ,
         readxl::read_excel,
         skip = 3)

MDCR_ENROLL_AB_05[[1]]$Year <- 2013L
MDCR_ENROLL_AB_05[[2]]$Year <- 2014L
MDCR_ENROLL_AB_05[[3]]$Year <- 2015L
MDCR_ENROLL_AB_05[[4]]$Year <- 2016L
MDCR_ENROLL_AB_05[[5]]$Year <- 2017L

MDCR_ENROLL_AB_05 %>%
  dplyr::bind_rows(.) %>%
  dplyr::distinct(.) %>%
  tibble::add_column(., "Demographic Group" = .$`Demographic Characteristic`, .before = 1) %>%
  dplyr::mutate(`Demographic Group` = dplyr::if_else(grepl("(Y|y)ears", `Demographic Group`), "Age", `Demographic Group`),
                `Demographic Group` = dplyr::if_else(grepl("^((Female)|(Male))$", `Demographic Group`), "Sex", `Demographic Group`),
                `Demographic Group` = dplyr::if_else(grepl("^((Non-Hispanic White)|(Black \\(or African-American\\))|(Asian\\/Pacific Islander)|(Hispanic)|(American Indian/Alaska Native)|(Other)|(Unknown))$", `Demographic Group`), "Race", `Demographic Group`)
                ) %>%
  dplyr::filter(!is.na(`Part A and/or Part B`))


cat("# Auto Generated. Do not edit by hand",
    "#' Total Medicare Enrollment:  Part A and/or Part B Enrollees, by Demographic Characteristic",
    "#'",
    "#' Total Medicare Enrollment:  Part A and/or Part B Enrollees, by Demographic Characteristic",
    "#'",
    "#' NOTES:  The enrollment counts are determined using a person-year methodology.  Numbers and percentages may not add to totals because of rounding.",
    "#'",
    "#' @source Centers for Medicare & Medicaid Services, Office of Enterprise Data and Analytics, CMS Chronic Conditions Data Warehouse.",
    "#'",
    "\"MDCR_ENROLL_AB_05\"",
    sep = "\n",
    file = "../R/MDCR_ENROLL_AB_05.R")

MDCR_ENROLL_AB_05 %<>% as.data.frame
save(MDCR_ENROLL_AB_05, file = "../data/MDCR_ENROLL_AB_05.rda")
# }}}


