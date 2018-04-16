//
//  DutyManager.swift
//  FlightInfo
//
//  Created by Faruk Turgut on 18.03.2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import Foundation
import Kanna

public class DutyManager {
    
    static let shared : DutyManager = DutyManager()
    
    private init(){}
    
    private let tripCreator = DutyCreator.factory(for: .trip)
    private let groundActCreator = DutyCreator.factory(for: .groundActivity)
    
    var duties: [Duty] = []

    func parseDuty(duties: [XMLElement?]){
        
        for duty in duties {
            let typeOfDuty = duty?.css("span.ui-panel-title").first?.innerHTML?.split(separator: "-").last?.replacingOccurrences(of: " ", with: "")
            if typeOfDuty == DutyType.groundActivity.rawValue {
                self.duties.append(self.groundActCreator(duty))
            }else{
                self.duties.append(self.tripCreator(duty))
            }
        }
    }
}
