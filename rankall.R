rankall <- function(outcome, rank="best") {
    
    source("outcomeData.R")
    
    od = outcomeData()
    data = od$data()
    
    columns = c("Hospital.Name", od$validateOutcome(outcome))
    
    allStates = data.frame(hospital=character(0), state=character(0), stringsAsFactors=FALSE)

    for (stateCode in od$states()) {
        stateOutcomes = subset(data, data[,"State"] == stateCode, select=columns)
        stateOutcomes = stateOutcomes[order(stateOutcomes[,2], stateOutcomes[,1]),]
        numberOfHospitals = length(stateOutcomes[,2])
        index = if (rank == "best") 1 else if (rank == "worst") numberOfHospitals else rank
        hospitalName = if (index > numberOfHospitals) NA else stateOutcomes[index, 1]
        allStates[nrow(allStates) + 1, ] = c(hospitalName, stateCode)
    }
    
    allStates 
}