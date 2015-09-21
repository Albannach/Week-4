best <- function(state, outcome) {
    
    od = outcomeData()
    data = od$data()

    od$validateState(state)
    columnName = od$validateOutcome(outcome)
    
    columns = c("Hospital.Name", columnName)
    
    stateOutcomes = subset(data, data[,"State"] == state & !is.na(data[,columnName]), select=columns)
    c(stateOutcomes[order(stateOutcomes[,2], stateOutcomes[,1]),][1,1])
}