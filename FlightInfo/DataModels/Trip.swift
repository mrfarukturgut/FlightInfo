//
//  Trip.swift
//  FlightInfo
//
//  Created by Faruk Turgut on 17.03.2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import Foundation
import Kanna

struct Trip: Duty {
    
    var type: DutyType?
    var startTime: String?
    var endTime: String?
    var flightTime: String?
    var dutyTime: String?
    var duties: [FlightDuty]?
    
    static func createDuty(program: XMLElement?) -> Duty {
        let contentDiv = program?.css("div.ui-panel.ui-widget.ui-widget-content.ui-corner-all.toggle-panel").first
        let mainTableContent = contentDiv?.css("td").first
        
        //Handle This
        let generalTripInformation = mainTableContent?.css("table").first
        
        let flightDutiesTable = mainTableContent?.css("table[class='multi-gray-table'] > tbody > tr")
        print(flightDutiesTable?.first?.toHTML)
        return Trip()
    }
    

}

struct FlightDuty {
    
    var startTime: String?
    var endTime: String?
    var flightType: String?
    var flightTime: String?
    var restTime: String?
    var fligthLegs: [FlightLeg]?
    
}

struct FlightLeg {
    
    var carrier: String?
    var flightNo: String?
    var departurePort: String?
    var arrivalPort: String?
    var aircraftType: String?
    var departureTimeUTC: String?
    var arrivalTimeUTC: String?
    var additionalInfo: String?
    var crew: [Crew]?
    
}

struct Crew {
    
    var ID: String?
    var name: String?
    var surname: String?
    var type: String?
    var duty: String?
    var clazz: String?
    
    //initializer
}
