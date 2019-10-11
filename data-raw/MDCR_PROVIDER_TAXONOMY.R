library(magrittr)

provider_taxonomy <- readr::read_csv("MDCR_PROVIDER_TAXONOMY.csv")
attr(provider_taxonomy, "spec") <- NULL

lapply(provider_taxonomy, grep, pattern = "\\[1\\]", value = TRUE)
lapply(provider_taxonomy, grep, pattern = "\\[2\\]", value = TRUE)
lapply(provider_taxonomy, grep, pattern = "\\[3\\]", value = TRUE)
lapply(provider_taxonomy, grep, pattern = "\\[4\\]", value = TRUE)
lapply(provider_taxonomy, grep, pattern = "\\[5\\]", value = TRUE)
lapply(provider_taxonomy, grep, pattern = "\\[6\\]", value = TRUE)
lapply(provider_taxonomy, grep, pattern = "\\[7\\]", value = TRUE)
lapply(provider_taxonomy, grep, pattern = "\\[8\\]", value = TRUE)
lapply(provider_taxonomy, grep, pattern = "\\[9\\]", value = TRUE)
lapply(provider_taxonomy, grep, pattern = "\\[10\\]", value = TRUE)
lapply(provider_taxonomy, grep, pattern = "\\[11\\]", value = TRUE)
lapply(provider_taxonomy, grep, pattern = "\\[12\\]", value = TRUE)
lapply(provider_taxonomy, grep, pattern = "\\[13\\]", value = TRUE)
lapply(provider_taxonomy, grep, pattern = "\\[14\\]", value = TRUE)
lapply(provider_taxonomy, grep, pattern = "\\[15\\]", value = TRUE)

cat("# Generated Automatically: DO NOT EDIT",
    "#' Provider Taxonomy",
    "#'",
    "#' Provider Codes, last updated October 1, 2019 from https://data.cms.gov/Medicare-Enrollment/CROSSWALK-MEDICARE-PROVIDER-SUPPLIER-to-HEALTHCARE/j75i-rw8y",
    "#'",
    "#' Important Notes:",
    "#'",
    # 1
    "#' Medicare no longer enrolls the provider type: Voluntary Health or Charitable Agency",
    "#'",
    # 2
    "#' \"Mass Immunizer Roster Biller\" is an arrangement whereby immunization services are rendered by health care providers who are under contract to the entity/individual who is enrolled in Medicare as a Mass Immunization Roster Biller. The Healthcare Provider Taxonomy Code(s) would be that (those) of the health care provider(s) who render the immunization services.",
    "#'",
    # 3
    "#' Medicare carriers use Specialty Code 87 for Pharmacies when processing prescription drugs that are paid through the Medicare Physician Fee Schedule.  However, the description for Specialty Code 87 remains \"All Other Suppliers.\"",
    "#'",
    # 4
    "#' Because the Medicare Provider Type \"Physician/Undefined Physician Type\" applies to physicians, \"Unknown Supplier/Provider Specialty\" applies to other than physicians.  Because Medicare does not enroll every non-physician supplier/provider type in the Healthcare Provider Taxonomy Code Set, we cannot arbitrarily link this Medicare Provider Type to all remaining supplier/provider types in the Healthcare Provider Taxonomy Code Set.  In truth, this Medicare Provider Type would link to every Healthcare Provider Taxonomy Code (except those that describe physicians) that is listed in this document.  We do not list them here because doing so would greatly increase the size of this document.",
    "#'",
    # 5
    "#' Because the Medicare Provider Type 96 indicates that the provider/supplier is a Physician, we have linked this to the most generic All opathic & Osteopathic Physicians classification.  It could technically link to every Allopathic & Osteopathic Physician.",
    "#'",
    # 6
    "#' Medicare specialty code designation \"Physician/Undefined Physician type\" is for Part B DMEPOS purposes.",
    "#'",
    # 7
    "#' Medicare specialty code designation \"A0\" is for Part B DMEPOS purposes.",
    "#'",
    # 8
    "#' Medicare specialty code designation \"A1\" is for Part B DMEPOS purposes.",
    "#'",
    # 9
    "#' Medicare specialty code designation \"A2\" is for Part B DMEPOS purposes.",
    "#'",
    # 10
    "#' Medicare specialty code designation \"A3\" is for Part B DMEPOS purposes.",
    "#'",
    # 11
    "#' Medicare specialty code designation \"A4\" is for Part B DMEPOS purposes.",
    "#'",
    # 12
    "#' RE: \"A9\": There is no linkage to specific Healthcare Provider Taxonomy Codes because an Indian Health Service facility can be various provider types/classifications.",
    "#'",
    # 13
    "#' Medicare specialty code designation \"Indian Health Service facility\" is for Part B DMEPOS purposes.",
    "#'",
    # 14
    "#' RE: \"B4\": Does not meet the definition of \"health care provider\" at 45 CFR 160.103; is not eligible for an NPI.",
    "#'",
    "\"provider_taxonomy\"",
    sep = "\n",
    file = "../R/provider_taxonomy.R")

# clean up
provider_taxonomy %<>% dplyr::filter(!grepl("^\\[1\\]", `MEDICARE SPECIALTY CODE`))
provider_taxonomy %<>% dplyr::filter(!grepl("^\\[2\\]", `MEDICARE SPECIALTY CODE`))
provider_taxonomy %<>% dplyr::filter(!grepl("^\\[3\\]", `MEDICARE SPECIALTY CODE`))
provider_taxonomy %<>% dplyr::filter(!grepl("^\\[4\\]", `MEDICARE SPECIALTY CODE`))
provider_taxonomy %<>% dplyr::filter(!grepl("^\\[5\\]", `MEDICARE SPECIALTY CODE`))
provider_taxonomy %<>% dplyr::filter(!grepl("^\\[6\\]", `MEDICARE SPECIALTY CODE`))
provider_taxonomy %<>% dplyr::filter(!grepl("^\\[7\\]", `MEDICARE SPECIALTY CODE`))
provider_taxonomy %<>% dplyr::filter(!grepl("^\\[8\\]", `MEDICARE SPECIALTY CODE`))
provider_taxonomy %<>% dplyr::filter(!grepl("^\\[9\\]", `MEDICARE SPECIALTY CODE`))
provider_taxonomy %<>% dplyr::filter(!grepl("^\\[10\\]", `MEDICARE SPECIALTY CODE`))
provider_taxonomy %<>% dplyr::filter(!grepl("^\\[11\\]", `MEDICARE SPECIALTY CODE`))
provider_taxonomy %<>% dplyr::filter(!grepl("^\\[12\\]", `MEDICARE SPECIALTY CODE`))
provider_taxonomy %<>% dplyr::filter(!grepl("^\\[13\\]", `MEDICARE SPECIALTY CODE`))
provider_taxonomy %<>% dplyr::filter(!grepl("^\\[14\\]", `MEDICARE SPECIALTY CODE`))

provider_taxonomy[["MEDICARE PROVIDER/SUPPLIER TYPE DESCRIPTION"]] %<>%
  sub("\\[1\\]", "", .) %>%
  sub("\\[2\\]", "", .) %>%
  sub("\\[4\\]", "", .) %>%
  sub("\\[6\\]", "", .) %>%
  sub("\\[13\\]", "", .)

provider_taxonomy[["MEDICARE SPECIALTY CODE"]] %<>%
  sub("\\[3\\]", "", .) %>%
  sub("\\[5\\]", "", .) %>%
  sub("\\[7\\]", "", .) %>%
  sub("\\[8\\]", "", .) %>%
  sub("\\[9\\]", "", .) %>%
  sub("\\[10\\]", "", .) %>%
  sub("\\[11\\]", "", .) %>%
  sub("\\[12\\]", "", .) %>%
  sub("\\[14\\]", "", .)

# Checks
provider_taxonomy %$% unique(`MEDICARE SPECIALTY CODE`)
provider_taxonomy %$% unique(`MEDICARE PROVIDER/SUPPLIER TYPE DESCRIPTION`)
provider_taxonomy %$% unique(`PROVIDER TAXONOMY CODE`)
provider_taxonomy %$% unique(`PROVIDER TAXONOMY DESCRIPTION`)

tools::showNonASCII(provider_taxonomy[[1]])

tools::showNonASCII(provider_taxonomy[[2]])
provider_taxonomy[[2]][448] %<>% iconv(to = "ASCII//TRANSLIT")

tools::showNonASCII(provider_taxonomy[[3]])

tools::showNonASCII(provider_taxonomy[[4]])
provider_taxonomy[[4]][194] %<>% iconv(to = "ASCII//TRANSLIT")
provider_taxonomy[[4]][258] %<>% iconv(to = "ASCII//TRANSLIT")
provider_taxonomy[[4]][426] %<>% iconv(to = "ASCII//TRANSLIT")

provider_taxonomy %<>% as.data.frame
head(provider_taxonomy)

# save
save(provider_taxonomy, file = "../data/provider_taxonomy.rda")
