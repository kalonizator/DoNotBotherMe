//
//  Section.swift
//  iCare
//
//  Created by kalonizator on 23.06.17.
//  Copyright © 2017 kalonizator. All rights reserved.
//



import Foundation
import UIKit

struct Section {
    var month: String!
    var dayOfTheWeek: String!
    var numberOfRequests: String!
    var requestsText : [String]!
    var expanded: Bool!
    
    init(month:String, dayOfTheWeek:String, numberOfRequests:String, requestsText: [String], expanded: Bool) {
        self.month = month
        self.dayOfTheWeek = dayOfTheWeek
        self.numberOfRequests = numberOfRequests
        self.requestsText = requestsText
        self.expanded = expanded
    }
}
