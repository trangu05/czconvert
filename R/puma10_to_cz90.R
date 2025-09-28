library(haven)
cw_puma2010_czone <- read_dta("inst/extdata/cw_puma2010_czone.dta")
names(cw_puma2010_czone) <- c('puma', 'cz90', 'afactor')
# Save data
save(cw_puma2010_czone, file = "data/cw_puma2010_czone.rda")


