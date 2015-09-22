source("best.R")
best("TX", "heart attack")
# "CYPRESS FAIRBANKS MEDICAL CENTER"
best("TX", "heart failure")
# "FORT DUNCAN MEDICAL CENTER"
best("MD", "heart attack")
# "JOHNS HOPKINS HOSPITAL, THE"
best("MD", "pneumonia")
# "GREATER BALTIMORE MEDICAL CENTER"
best("BB", "heart attack")
#Error in best("BB", "heart attack") : invalid state
best("NY", "hert attack")
#Error in best("NY", "hert attack") : invalid outcome
source('rankhospital.R')
rankhospital("TX", "heart failure", 4)
# "DETAR HOSPITAL NAVARRO"
rankhospital("MD", "heart attack", "worst")
# "HARFORD MEMORIAL HOSPITAL"
rankhospital("MN", "heart attack", 5000)
# NA