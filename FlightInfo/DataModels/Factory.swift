//
//  Factory.swift
//  FlightInfo
//
//  Created by Faruk Turgut on 18.03.2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import Foundation
import Kanna

protocol Duty {
    var type: DutyType? {get set}
    static func createDuty(program: XMLElement?) -> Duty
}

typealias DutyFactory = (XMLElement?) -> Duty

enum DutyType: String {
    case trip = "Trip"
    case groundActivity = "GroundActivity"
}

enum DutyCreator {
    static func factory(for type: DutyType) -> DutyFactory {
        switch type {
        case .trip:
            return Trip.createDuty
        case .groundActivity:
            return GroundActivity.createDuty
        }
    }
}
