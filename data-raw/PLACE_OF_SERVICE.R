# Place of Service Codes
library(magrittr)

PLACE_OF_SERVICE_raw <-
  rvest::html_session(url = "https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set.html") %>%
  xml2::read_html(.) %>%
  rvest::html_nodes(., "table") %>%
  rvest::html_table(.) %>%
  extract2(1)

PLACE_OF_SERVICE <- data.frame(Code = formatC(1:99, width = 2, flag = "0"),
                               stringsAsFactors = FALSE)
names(PLACE_OF_SERVICE) <- "Place of Service Code"

PLACE_OF_SERVICE <-
  dplyr::left_join(PLACE_OF_SERVICE, PLACE_OF_SERVICE_raw,
                   by = c("Place of Service Code" = "Place of Service Code(s)"))

PLACE_OF_SERVICE$`Place of Service Name`        %<>% gsub(pattern = "\n", replacement = " ", .)
PLACE_OF_SERVICE$`Place of Service Description` %<>% gsub(pattern = "\n", replacement = " ", .)


PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` == "01", "Place of Service Description"] %<>% paste(., "(Revised, effective October 1, 2005)")
PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` == "01", "Place of Service Name"] %<>% sub("\\ \\*\\*", "", .)

PLACE_OF_SERVICE_raw %>% dplyr::filter(grepl("27", `Place of Service Code(s)`))
PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` %in% as.character(27:30), "Place of Service Name"] <- "Unassigned"
PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` %in% as.character(27:30), "Place of Service Description"] <- NA_character_

PLACE_OF_SERVICE_raw %>% dplyr::filter(grepl("35", `Place of Service Code(s)`))
PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` %in% as.character(35:40), "Place of Service Name"] <- "Unassigned"
PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` %in% as.character(35:40), "Place of Service Description"] <- NA_character_

PLACE_OF_SERVICE_raw %>% dplyr::filter(grepl("43", `Place of Service Code(s)`))
PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` %in% as.character(43:48), "Place of Service Name"] <- "Unassigned"
PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` %in% as.character(43:48), "Place of Service Description"] <- NA_character_

PLACE_OF_SERVICE_raw %>% dplyr::filter(grepl("63", `Place of Service Code(s)`))
PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` %in% as.character(63:64), "Place of Service Name"] <- "Unassigned"
PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` %in% as.character(63:64), "Place of Service Description"] <- NA_character_

PLACE_OF_SERVICE_raw %>% dplyr::filter(grepl("66", `Place of Service Code(s)`))
PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` %in% as.character(66:70), "Place of Service Name"] <- "Unassigned"
PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` %in% as.character(66:70), "Place of Service Description"] <- NA_character_

PLACE_OF_SERVICE_raw %>% dplyr::filter(grepl("73", `Place of Service Code(s)`))
PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` %in% as.character(73:80), "Place of Service Name"] <- "Unassigned"
PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` %in% as.character(73:80), "Place of Service Description"] <- NA_character_

PLACE_OF_SERVICE_raw %>% dplyr::filter(grepl("82", `Place of Service Code(s)`))
PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` %in% as.character(82:98), "Place of Service Name"] <- "Unassigned"
PLACE_OF_SERVICE[PLACE_OF_SERVICE$`Place of Service Code` %in% as.character(82:98), "Place of Service Description"] <- NA_character_

# showNonASCII
PLACE_OF_SERVICE %>% lapply(., tools::showNonASCII) %>% str
PLACE_OF_SERVICE[, 2] %<>% iconv(., to = "ASCII")
PLACE_OF_SERVICE[, 3] %<>% iconv(., to = "ASCII")

cat("#AUTO GENERATED, DO NOT EDIT",
    "#' Place of Serivce",
    "#'",
    "#'",
    "\"PLACE_OF_SERVICE\"",
    sep = "\n",
    file = "../R/PLACE_OF_SERVICE.R")

PLACE_OF_SERVICE <- as.data.frame(PLACE_OF_SERVICE)
save(PLACE_OF_SERVICE, file = "../data/PLACE_OF_SERVICE.rda")
