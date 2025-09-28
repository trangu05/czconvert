library(readxl)
puma_mapping <- read_excel('inst/extdata/PUMA2010_PUMA2020_crosswalk.xls')
library(dplyr)
library(haven)

puma_mapping <- puma_mapping %>%
  mutate(puma2010 = as.character(as.numeric(paste0(State10, PUMA10))),
         puma2020 = as.character(as.numeric(paste0(State20, PUMA20))))

puma20_to_10_cw <- puma_mapping %>%
  mutate(pop_share_20to10 = Part_Pop10 / PUMA20_Pop10) %>%
  select(puma2010, puma2020, pop_share_20to10)

puma10_to_cz <- read_dta("inst/extdata/cw_puma2010_czone.dta")
names(puma10_to_cz) <- c('puma2010', 'cz90', 'afactor')
puma10_to_cz$puma2010 <- as.character(puma10_to_cz$puma2010)
puma20_to_cz90 <- puma20_to_10_cw %>%
  inner_join(puma10_to_cz, by = "puma2010") %>%
  mutate(pop_share_joint = pop_share_20to10 *afactor)

#There are PUMA20s with no people in the overlapping part of the PUMA10, so filtered
#them out. Then calculate the weight of crosswalking from PUMA20 to CZ90.

cw_puma2020_czone <- puma20_to_cz90 %>%
  group_by(puma2020) %>% filter(pop_share_joint > 0) %>%
  mutate(afactor = pop_share_joint / sum(pop_share_joint)) %>%
  ungroup() %>% select(puma2020, cz90, afactor)
names(cw_puma2020_czone) <- c('puma', 'cz90', 'afactor')

# Save data
save(cw_puma2020_czone, file = "data/cw_puma2020_czone.rda")

