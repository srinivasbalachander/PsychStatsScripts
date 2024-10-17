library(dplyr)
library(lme4)

# YBOCS Inter-Rater Reliability

df <- read.delim("~/Desktop/ybocs.irr.txt", header = TRUE, sep = "\t")


for(i in names(df)[5:21]) {
  
  tryCatch({
    mod <- lmer(get(i) ~ (1 + 1|rater_name) + (1 + 1|rating_id), data = df )  
    icc_value <- performance::icc(mod)[1,1] %>% round(digits = 3)
    
    print(paste("item = ", i, "  ICC = ", icc_value))
  }, error = function(e){})

}
