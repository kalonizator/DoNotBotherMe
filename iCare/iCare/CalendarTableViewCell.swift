//
//  ExpansionRequestCell.swift
//  iCare
//
//  Created by kalonizator on 22.06.17.
//  Copyright © 2017 kalonizator. All rights reserved.
//
import UIKit

//protocol ExpandableCalendarDelegate {
//    func tuggleSection(header: CalendarTableViewCell, section: Int)
//}


class CalendarTableViewCellContent {
    
    var month: String!
    var dayOfTheWeek: String!
    var numberOfRequests: String!
    var requestsText : String!
    var expanded: Bool!
    
    init(month:String, dayOfTheWeek:String, numberOfRequests:String, requestsText: String) {
        self.month = month
        self.dayOfTheWeek = dayOfTheWeek
        self.numberOfRequests = numberOfRequests
        self.requestsText = requestsText
        //            self.expanded = expanded
        self.expanded = false
    }
    
    
}



class CalendarTableViewCell : UITableViewCell {
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(content: CalendarTableViewCellContent) {
        self.monthLabel.text = content.month
        self.dayOfTheWeekLabel.text = content.dayOfTheWeek
        self.numberOfRequestsLabel.text = content.numberOfRequests
        self.requestsTextLabel.text = content.expanded ? content.requestsText : ""
    }
    
    
    
}
