# Total Medicare Enrollment:  Total, Original Medicare, and Medicare Advantage and Other Health Plan Enrollment
library(magrittr)

# Get a temporary directory to extract zip files to.
tmpdir <- tempdir()

# unzip the files{{{
enrollment <-
  list.files(path = ".", recursive = TRUE)  %>%
  grep("\\d{4}_enrollment/.*$", ., value = TRUE) %>%
  lapply(.,
         function(x) {
           unzip(
                 zipfile = x,
                 junkpaths = TRUE,
                 exdir = normalizePath(paste(tmpdir, dirname(x), sep = "/"), mustWork = FALSE)
           )
         }
  )

enrollment %<>% do.call(c, .)

AB_01_files <- grep("MDCR_ENROLL_AB_1\\.", enrollment, value = TRUE)
AB_02_files <- grep("MDCR_ENROLL_AB_2\\.", enrollment, value = TRUE)
AB_03_files <- grep("MDCR_ENROLL_AB_3\\.", enrollment, value = TRUE)
AB_04_files <- grep("MDCR_ENROLL_AB_4\\.", enrollment, value = TRUE)
AB_05_files <- grep("MDCR_ENROLL_AB_5\\.", enrollment, value = TRUE)
AB_06_files <- grep("MDCR_ENROLL_AB_6\\.", enrollment, value = TRUE)
AB_07_files <- grep("MDCR_ENROLL_AB_7\\.", enrollment, value = TRUE)
AB_08_files <- grep("MDCR_ENROLL_AB_8\\.", enrollment, value = TRUE)
AB_09_files <- grep("MDCR_ENROLL_AB_9\\.", enrollment, value = TRUE)
AB_10_files <- grep("MDCR_ENROLL_AB_10\\.", enrollment, value = TRUE)
AB_11_files <- grep("MDCR_ENROLL_AB_11\\.", enrollment, value = TRUE)
AB_12_files <- grep("MDCR_ENROLL_AB_12\\.", enrollment, value = TRUE)
AB_13_files <- grep("MDCR_ENROLL_AB_13\\.", enrollment, value = TRUE)
AB_14_files <- grep("MDCR_ENROLL_AB_14\\.", enrollment, value = TRUE)
AB_15_files <- grep("MDCR_ENROLL_AB_15\\.", enrollment, value = TRUE)
AB_16_files <- grep("MDCR_ENROLL_AB_16\\.", enrollment, value = TRUE)
AB_17_files <- grep("MDCR_ENROLL_AB_17\\.", enrollment, value = TRUE)
AB_18_files <- grep("MDCR_ENROLL_AB_18\\.", enrollment, value = TRUE)
AB_19_files <- grep("MDCR_ENROLL_AB_19\\.", enrollment, value = TRUE)
AB_20_files <- grep("MDCR_ENROLL_AB_20\\.", enrollment, value = TRUE)
AB_21_files <- grep("MDCR_ENROLL_AB_21\\.", enrollment, value = TRUE)
AB_22_files <- grep("MDCR_ENROLL_AB_22\\.", enrollment, value = TRUE)
AB_23_files <- grep("MDCR_ENROLL_AB_23\\.", enrollment, value = TRUE)
AB_24_files <- grep("MDCR_ENROLL_AB_24\\.", enrollment, value = TRUE)
AB_25_files <- grep("MDCR_ENROLL_AB_25\\.", enrollment, value = TRUE)
AB_26_files <- grep("MDCR_ENROLL_AB_26\\.", enrollment, value = TRUE)
AB_27_files <- grep("MDCR_ENROLL_AB_27\\.", enrollment, value = TRUE)
AB_28_files <- grep("MDCR_ENROLL_AB_28\\.", enrollment, value = TRUE)
AB_29_files <- grep("MDCR_ENROLL_AB_29\\.", enrollment, value = TRUE)
AB_30_files <- grep("MDCR_ENROLL_AB_30\\.", enrollment, value = TRUE)
AB_31_files <- grep("MDCR_ENROLL_AB_31\\.", enrollment, value = TRUE)
AB_32_files <- grep("MDCR_ENROLL_AB_32\\.", enrollment, value = TRUE)
AB_33_files <- grep("MDCR_ENROLL_AB_33\\.", enrollment, value = TRUE)
AB_34_files <- grep("MDCR_ENROLL_AB_34\\.", enrollment, value = TRUE)
AB_35_files <- grep("MDCR_ENROLL_AB_35\\.", enrollment, value = TRUE)
AB_36_files <- grep("MDCR_ENROLL_AB_36\\.", enrollment, value = TRUE)
AB_37_files <- grep("MDCR_ENROLL_AB_37\\.", enrollment, value = TRUE)
AB_38_files <- grep("MDCR_ENROLL_AB_38\\.", enrollment, value = TRUE)
AB_39_files <- grep("MDCR_ENROLL_AB_39\\.", enrollment, value = TRUE)
AB_40_files <- grep("MDCR_ENROLL_AB_40\\.", enrollment, value = TRUE)
AB_41_files <- grep("MDCR_ENROLL_AB_41\\.", enrollment, value = TRUE)
AB_42_files <- grep("MDCR_ENROLL_AB_42\\.", enrollment, value = TRUE)
AB_43_files <- grep("MDCR_ENROLL_AB_43\\.", enrollment, value = TRUE)
AB_44_files <- grep("MDCR_ENROLL_AB_44\\.", enrollment, value = TRUE)
AB_45_files <- grep("MDCR_ENROLL_AB_45\\.", enrollment, value = TRUE)
AB_46_files <- grep("MDCR_ENROLL_AB_46\\.", enrollment, value = TRUE)
AB_47_files <- grep("MDCR_ENROLL_AB_47\\.", enrollment, value = TRUE)
AB_48_files <- grep("MDCR_ENROLL_AB_48\\.", enrollment, value = TRUE)

D_01_files  <- grep("MDCR_ENROLL_D_1\\.",  enrollment, value = TRUE)
D_02_files  <- grep("MDCR_ENROLL_D_2\\.",  enrollment, value = TRUE)
D_03_files  <- grep("MDCR_ENROLL_D_3\\.",  enrollment, value = TRUE)

enrollment %>%
  .[!(enrollment %in% c(AB_01_files, AB_02_files, AB_03_files,
                        AB_04_files, AB_05_files, AB_06_files,
                        AB_07_files, AB_08_files, AB_09_files,
                        AB_10_files, AB_11_files, AB_12_files,
                        AB_13_files, AB_14_files, AB_15_files,
                        AB_16_files, AB_17_files, AB_18_files,
                        AB_19_files, AB_20_files, AB_21_files,
                        AB_22_files, AB_23_files, AB_24_files,
                        AB_25_files, AB_26_files, AB_27_files,
                        AB_28_files, AB_29_files, AB_30_files,
                        AB_31_files, AB_32_files, AB_33_files,
                        AB_34_files, AB_35_files, AB_36_files,
                        AB_37_files, AB_38_files, AB_39_files,
                        AB_40_files, AB_41_files, AB_42_files,
                        AB_43_files, AB_44_files, AB_45_files,
                        AB_46_files, AB_47_files, AB_48_files,
                        D_01_files, D_02_files, D_03_files)
     )
    ]
# }}}

MDCR_ENROLL_AB_01 <- # {{{
  lapply(AB_01_files, readxl::read_excel, skip = 3) %>%
    dplyr::bind_rows(.) %>%
    dplyr::distinct(.)

Filter(function(x) !all(is.na(x)), dplyr::filter(MDCR_ENROLL_AB_01, !grepl("20\\d\\d", Year)))

MDCR_ENROLL_AB_01 <- dplyr::filter(MDCR_ENROLL_AB_01,  grepl("20\\d\\d", Year))
MDCR_ENROLL_AB_01 <- dplyr::mutate(MDCR_ENROLL_AB_01,  Year = as.integer(Year))

lapply(MDCR_ENROLL_AB_01, tools::showNonASCII)

cat("# Auto Generated. Do not edit by hand",
    "#' Total Medicare Enrollment:  Total, Original Medicare, and Medicare Advantage and Other Health Plan Enrollment",
    "#'",
    "#' Total Medicare Enrollment",
    "#'",
    "#' @note The enrollment counts are determined using a person-year methodology.  Numbers and percentages may not add to totals because of rounding.",
    "#'",
    "#' @source  Centers for Medicare & Medicaid Services, Office of Enterprise Data and Analytics, CMS Chronic Conditions Data Warehouse.",
    "#'",
    "#' @seealso \\code{vignette(\"program-statistics\", package = \"cms.program.statistics\")}",
    "#'",
    "\"MDCR_ENROLL_AB_01\"",
    sep = "\n",
    file = "../R/MDCR_ENROLL_AB_01.R")
MDCR_ENROLL_AB_01 %<>% as.data.frame
save(MDCR_ENROLL_AB_01, file = "../data/MDCR_ENROLL_AB_01.rda")
# }}}

MDCR_ENROLL_AB_02 <- # {{{
  lapply(AB_02_files, readxl::read_excel, skip = 3)

for(i in seq_along(AB_02_files)) {
  MDCR_ENROLL_AB_02[[i]]$Year <- as.integer(sub(".+(\\d{4})_enrollment.+", "\\1", AB_02_files[i]))
}

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
    "#' @note  The enrollment counts are determined  using a person-year methodology.  Numbers and percentages may not add to totals because of",
    "#' rounding.  For definitions of \"Metropolitan\", \"Micropolitan\", and \"Non-Core-Based Statistical Area\", refer to CPS Glossary.",
    "#'",
    "#' @source  Centers for Medicare & Medicaid Services, Office of Enterprise Data and Analytics, Chronic Conditions Data Warehouse; United States Census Bureau.",
    "#'",
    "#' @seealso \\code{vignette(\"program-statistics\", package = \"cms.program.statistics\")}",
    "#'",
    "#'",
    "\"MDCR_ENROLL_AB_02\"",
    sep = "\n",
    file = "../R/MDCR_ENROLL_AB_02.R")

MDCR_ENROLL_AB_02 %<>% as.data.frame
save(MDCR_ENROLL_AB_02, file = "../data/MDCR_ENROLL_AB_02.rda")
# }}}

MDCR_ENROLL_AB_03 <- #{{{
  lapply(AB_03_files, readxl::read_excel, skip = 2) %>%
  dplyr::bind_rows(.) %>%
  dplyr::distinct(.) %>%
  dplyr::filter(grepl("\\d{4}", Year)) %>%
  dplyr::mutate(Year = as.integer(Year))

cat("# Auto Generated. Do not edit by hand",
    "#' Total Medicare Enrollment:  Part A and/or Part B Total, Aged, and Disabled Enrollees",
    "#'",
    "#' Total Medicare Enrollment:  Part A and/or Part B Total, Aged, and Disabled Enrollees",
    "#'",
    "#' @note  The enrollment counts are determined  using a person-year methodology.  Numbers and percentages may not add to totals because of",
    "#' rounding.  For definitions of \"Metropolitan\", \"Micropolitan\", and \"Non-Core-Based Statistical Area\", refer to CPS Glossary.",
    "#'",
    "#' @source Centers for Medicare & Medicaid Services, Office of Enterprise Data and Analytics, Chronic Conditions Data Warehouse; United States Census Bureau.",
    "#'",
    "#' @seealso \\code{vignette(\"program-statistics\", package = \"cms.program.statistics\")}",
    "#'",
    "\"MDCR_ENROLL_AB_03\"",
    sep = "\n",
    file = "../R/MDCR_ENROLL_AB_03.R")

MDCR_ENROLL_AB_03 %<>% as.data.frame
save(MDCR_ENROLL_AB_03, file = "../data/MDCR_ENROLL_AB_03.rda")

# }}}

MDCR_ENROLL_AB_04 <- #{{{
  lapply(AB_04_files, readxl::read_excel, skip = 2) %>%
  dplyr::bind_rows(.) %>%
  dplyr::distinct(.) %>%
  dplyr::filter(grepl("\\d{4}", Year)) %>%
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
    "#' @seealso \\code{vignette(\"program-statistics\", package = \"cms.program.statistics\")}",
    "#'",
    "\"MDCR_ENROLL_AB_04\"",
    sep = "\n",
    file = "../R/MDCR_ENROLL_AB_04.R")

MDCR_ENROLL_AB_04 %<>% as.data.frame
save(MDCR_ENROLL_AB_04, file = "../data/MDCR_ENROLL_AB_04.rda")
# }}}

MDCR_ENROLL_AB_05 <- #{{{
  lapply(AB_05_files, readxl::read_excel, skip = 3)

for(i in seq_along(AB_05_files)) {
  MDCR_ENROLL_AB_05[[i]]$Year <- as.integer(sub(".+(\\d{4})_enrollment.+", "\\1", AB_05_files[i]))
}

MDCR_ENROLL_AB_05 %<>%
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
    "#' @seealso \\code{vignette(\"program-statistics\", package = \"cms.program.statistics\")}",
    "#'",
    "\"MDCR_ENROLL_AB_05\"",
    sep = "\n",
    file = "../R/MDCR_ENROLL_AB_05.R")

MDCR_ENROLL_AB_05 %<>% as.data.frame
save(MDCR_ENROLL_AB_05, file = "../data/MDCR_ENROLL_AB_05.rda")
# }}}

MDCR_ENROLL_AB_06 <- #{{{
  lapply(AB_06_files, readxl::read_excel, skip = 3, col_type = "text")

for(i in seq_along(AB_06_files)) {
  MDCR_ENROLL_AB_06[[i]]$Year <- as.integer(sub(".+(\\d{4})_enrollment.+", "\\1", AB_06_files[i]))
}

MDCR_ENROLL_AB_06[[1]]$Year <- 2013L
MDCR_ENROLL_AB_06[[2]]$Year <- 2014L
MDCR_ENROLL_AB_06[[3]]$Year <- 2015L
MDCR_ENROLL_AB_06[[4]]$Year <- 2016L
MDCR_ENROLL_AB_06[[5]]$Year <- 2017L

MDCR_ENROLL_AB_06 %<>%
  dplyr::bind_rows(.) %>%
  dplyr::distinct(.) %>%
  tibble::add_column(., "Demographic Group" = .$`Demographic Characteristic`, .before = 1) %>%
  dplyr::mutate(`Demographic Group` = dplyr::if_else(grepl("(Y|y)ears", `Demographic Group`), "Age", `Demographic Group`),
                `Demographic Group` = dplyr::if_else(grepl("^((Female)|(Male))$", `Demographic Group`), "Sex", `Demographic Group`),
                `Demographic Group` = dplyr::if_else(grepl("^((Non-Hispanic White)|(Black \\(or African-American\\))|(Asian\\/Pacific Islander)|(Hispanic)|(American Indian/Alaska Native)|(Other)|(Unknown))$", `Demographic Group`), "Race", `Demographic Group`)
                ) %>%
  dplyr::filter(!is.na(`Total Medicare Enrollees`)) %>%
  dplyr::mutate_at(dplyr::vars(-Year, -`Demographic Group`, -`Demographic Characteristic`),
                   ~ suppressWarnings(as.numeric(.)))


cat("# Auto Generated. Do not edit by hand",
    "#' Total Medicare Enrollment:  Part A and/or Part B Enrollees, by Type of Entitlement and Demographic Characteristics",
    "#'",
    "#' Total Medicare Enrollment:  Part A and/or Part B Enrollees, by Type of Entitlement and Demographic Characteristics",
    "#'",
    "#' NOTES:  The enrollment counts are determined using a person-year methodology.  Numbers and percentages may not add to totals because of rounding.",
    "#'",
    "#' @source Centers for Medicare & Medicaid Services, Office of Enterprise Data and Analytics, CMS Chronic Conditions Data Warehouse.",
    "#'",
    "#' @seealso \\code{vignette(\"program-statistics\", package = \"cms.program.statistics\")}",
    "#'",
    "\"MDCR_ENROLL_AB_06\"",
    sep = "\n",
    file = "../R/MDCR_ENROLL_AB_06.R")

MDCR_ENROLL_AB_06 %<>% as.data.frame
save(MDCR_ENROLL_AB_06, file = "../data/MDCR_ENROLL_AB_06.rda")
# }}}

MDCR_ENROLL_AB_07 <- #{{{
  lapply(AB_07_files, readxl::read_excel, skip = 3, col_type = "text")

for(i in seq_along(AB_07_files)) {
  MDCR_ENROLL_AB_07[[i]]$Year <- as.integer(sub(".+(\\d{4})_enrollment.+", "\\1", AB_07_files[i]))
}

MDCR_ENROLL_AB_07 %<>%
  dplyr::bind_rows(.) %>%
  dplyr::distinct(.) %>%
  dplyr::filter(!is.na(`Part A and/or Part B Total`)) %>%
  dplyr::mutate_at(dplyr::vars(-`Area of Residence`, -Year), as.numeric)

cat("# Auto Generated. Do not edit by hand",
    "#' Total Medicare Enrollment:  Part A and/or Part B Total, Aged, and Disabled Enrollees, by Area of Residence",
    "#'",
    "#' Total Medicare Enrollment:  Part A and/or Part B Total, Aged, and Disabled Enrollees, by Area of Residence",
    "#'",
    "#' NOTES:  The enrollment counts are determined using a person-year methodology.  Numbers and percentages may not add to totals because of rounding.",
    "#'",
    "#' @source Centers for Medicare & Medicaid Services, Office of Enterprise Data and Analytics, CMS Chronic Conditions Data Warehouse.",
    "#'",
    "#' @seealso \\code{vignette(\"program-statistics\", package = \"cms.program.statistics\")}",
    "#'",
    "\"MDCR_ENROLL_AB_07\"",
    sep = "\n",
    file = "../R/MDCR_ENROLL_AB_07.R")

MDCR_ENROLL_AB_07 %<>% as.data.frame
save(MDCR_ENROLL_AB_07, file = "../data/MDCR_ENROLL_AB_07.rda")
# }}}

MDCR_ENROLL_AB_08 <- #{{{
  lapply(AB_08_files, readxl::read_excel, skip = 3, col_type = "text")

for(i in seq_along(AB_08_files)) {
  MDCR_ENROLL_AB_08[[i]]$Year <- as.integer(sub(".+(\\d{4})_enrollment.+", "\\1", AB_08_files[i]))
}

MDCR_ENROLL_AB_08 %<>%
  dplyr::bind_rows(.) %>%
  dplyr::distinct(.) %>%
  dplyr::filter(!is.na(`Total Medicare Enrollees`)) %>%
  dplyr::mutate_at(dplyr::vars(-`Area of Residence`, -Year),
                   ~ suppressWarnings(as.numeric(.)))

cat("# Auto Generated. Do not edit by hand",
    "#' Total Medicare Enrollment:  Part A and/or Part B Enrollees, by Type of Entitlement and Area of Residence.",
    "#'",
    "#' Total Medicare Enrollment:  Part A and/or Part B Enrollees, by Type of Entitlement and Area of Residence.",
    "#'",
    "#' NOTES:  The enrollment counts are determined using a person-year methodology.  Numbers and percentages may not add to totals because of rounding.",
    "#'",
    "#' There are some NA values in this data set.  These NA values are associated with counts between 1 and 10 have been suppressed because of CMS rules to protect the privacy of beneficiaries, or have been cross-suppressed to prevent the recalculation of suppressed counts between 1 and 10.",
    "#'",
    "#' @source Centers for Medicare & Medicaid Services, Office of Enterprise Data and Analytics, CMS Chronic Conditions Data Warehouse.",
    "#'",
    "#' @seealso \\code{vignette(\"program-statistics\", package = \"cms.program.statistics\")}",
    "#'",
    "\"MDCR_ENROLL_AB_08\"",
    sep = "\n",
    file = "../R/MDCR_ENROLL_AB_08.R")

MDCR_ENROLL_AB_08 %<>% as.data.frame
save(MDCR_ENROLL_AB_08, file = "../data/MDCR_ENROLL_AB_08.rda")
# }}}

