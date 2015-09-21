best <- function(state, outcome) {
    
    validOutcomes = c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                      "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", 
                      "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    names(validOutcomes) = c("heart attack", "heart failure", "pneumonia")
    
    ## Read outcome data
    data = read.csv("rprog_data_ProgAssignment3-data\\outcome-of-care-measures.csv",  
                           colClasses="character")
    for (name in validOutcomes)
        data[, name] = suppressWarnings(as.numeric(data[, name]))
    
    ## Check that state and outcome are valid
    if (!is.element(state, sort(unique(data[, 7])))) stop("invalid state")
    if (!is.element(outcome, names(validOutcomes))) stop("invalid outcome")
    
    ## Return hospital name in that state with lowest 30-day death rate
    columnName = validOutcomes[match(outcome, names(validOutcomes))]
    columns = c("Hospital.Name", columnName)
    y = subset(data, data[,"State"] == state & !is.na(data[,columnName]), select=columns)
    c(y[order(y[,2], y[,1]),][1,1])
}