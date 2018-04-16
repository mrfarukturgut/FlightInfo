//
//  Event.swift
//  FlightInfo
//
//  Created by Faruk Turgut on 9.03.2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import Foundation
import UIKit
import Kanna

struct GroundActivity: Duty {
    
    var type: DutyType?
    var code: String?
    var description: String?
    var startTimeLMT: String?
    var startTimeUCT: String?
    var endTimeLMT: String?
    var endTimeUCT: String?
    var vacation: String?
    var activityStation: String?
    
    static func createDuty(program: XMLElement?) -> Duty {
        
        let head = program?.css("thead").first?.css("span")
        let body = program?.css("tbody").first?.css("span")
        var dutyDictionary: [String:String] = [:]
        
        //COVER OPTIONALS
        for (index ,data) in body!.enumerated() {
            dutyDictionary[head![index].innerHTML!] = data.innerHTML!
        }
        
        return GroundActivity(type: .groundActivity,
                              code: dutyDictionary["Code"],
                              description: dutyDictionary["Description"],
                              startTimeLMT: dutyDictionary["Start Time LMT"],
                              startTimeUCT: dutyDictionary["Start Time UTC"],
                              endTimeLMT: dutyDictionary["End Time LMT"],
                              endTimeUCT: dutyDictionary["End Time UTC"],
                              vacation: dutyDictionary["Vacation"],
                              activityStation: dutyDictionary["Activity Station"])
    }
    
    
    
}



