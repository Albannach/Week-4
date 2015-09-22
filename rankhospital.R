rankhospital = function(state, outcome, rank="best") {
    
    source("outcomeData.R")
    
    od = outcomeData()
    data = od$data()
    
    od$validateState(state)
    columnName = od$validateOutcome(outcome)
    
    columns = c("Hospital.Name", columnName)
    
    stateOutcomes = subset(data, data[,"State"] == state 
                    & !is.na(data[,columnName]), select=columns)

    index = -1
    highestRank = length(stateOutcomes[,2])
    index = if (rank == "best") 1 else if (rank == "worst") highestRank else rank

    if (index > highestRank) c(NA)
    else c(stateOutcomes[order(stateOutcomes[,2], stateOutcomes[,1]),][index, 1])

}