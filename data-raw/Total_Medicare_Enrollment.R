# Total Medicare Enrollment:  Total, Original Medicare, and Medicare Advantage and Other Health Plan Enrollment

tmpdir <- tempdir()

# unzip the files
unzip("2013_enrollment/Total_Med_Enroll_XLSX.zip",      junkpaths = TRUE, exdir = paste0(tmpdir, "/2013"))
unzip("2014_enrollment/2014_Total_Med_Enroll_XLSX.zip", junkpaths = TRUE, exdir = paste0(tmpdir, "/2014"))
unzip("2015_enrollment/2015_Total_Med_Enroll_XLSX.zip", junkpaths = TRUE, exdir = paste0(tmpdir, "/2015"))
unzip("2016_enrollment/2016_Total_Med_Enroll_XLSX.zip", junkpaths = TRUE, exdir = paste0(tmpdir, "/2016"))
unzip("2017_enrollment/2017_Total_Med_Enroll_XLSX.zip", junkpaths = TRUE, exdir = paste0(tmpdir, "/2017"))

MDCR_ENROLL_AB_01 <-
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

save(MDCR_ENROLL_AB_01, file = "../data/MDCR_ENROLL_AB_01.rda")

cat("# Auto Generated. Do not edit by hand",
    "#' Total Medicare Enrollment",
    "#'",
    "#' NOTES:  The enrollment counts are determined using a person-year methodology.  Numbers and percentages may not add to totals because of rounding.",
    "#' SOURCE:  Centers for Medicare & Medicaid Services, Office of Enterprise Data and Analytics, CMS Chronic Conditions Data Warehouse.",
    "\"MDCR_ENROLL_AB_01\"",
    sep = "\n",
    file = "../R/mcdr_enroll_MDCR_ENROLL_AB_01.R")
