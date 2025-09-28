library(haven)
library(stringr)
library(tidyverse)
puma00_to_cz <- read_dta("inst/extdata/cw_puma2000_czone.dta")
cw_puma2000_czone<- puma00_to_cz %>%
  mutate(
    puma2000   = as.character(puma2000),
    state      = as.integer(substr(puma2000, 1, 2)),          # 1..56 (no leading zeros)
    puma_code3 = substring(puma2000, 3, 5),                    # e.g. "100"
    puma_code5 = str_pad(puma_code3, width = 4, pad = "0"),    # e.g. "00100"
    puma_code6 = paste0(state, puma_code5)                     # e.g. "1" + "00100" -> "100100"
  ) %>% select(afactor, puma_code6, czone) %>% rename(puma = puma_code6,
                                                      cz90 = czone)

# Save data
save(cw_puma2000_czone, file = "data/cw_puma2000_czone.rda")


