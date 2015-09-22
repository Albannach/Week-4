outcomeData = function() {
    
    validOutcomes = c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                      "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", 
                      "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    names(validOutcomes) = c("heart attack", "heart failure", "pneumonia")
    
    ## Read outcome data
    rawData = read.csv("rprog_data_ProgAssignment3-data\\outcome-of-care-measures.csv",  
                        colClasses="character")
    for (name in validOutcomes)
        rawData[, name] = suppressWarnings(as.numeric(rawData[, name]))
    
    stateCodes = sort(unique(rawData[, 7]))

    data = function() rawData
    validateState = function(state) if (!is.element(state, stateCodes)) stop("invalid state")
    validateOutcome = function(outcome) {
        if (!is.element(outcome, names(validOutcomes))) stop("invalid outcome")
        validOutcomes[match(outcome, names(validOutcomes))]
    }
    states = function() stateCodes
    
    list(data=data, 
         validateState=validateState, 
         validateOutcome=validateOutcome,
         states=states)
}