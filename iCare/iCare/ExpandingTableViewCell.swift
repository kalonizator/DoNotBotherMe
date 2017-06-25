//
//  ExpansionRequestCell.swift
//  iCare
//
//  Created by kalonizator on 22.06.17.
//  Copyright © 2017 kalonizator. All rights reserved.
//
import UIKit

class ExpandingTableViewCellContent {
    var serviceName: String?
    var timeFrom: String?
    var timeTo: String?
    var symtomName: String?
    var tag: String?
    var commentary: String?
    var region: String?
    var visitTime: String?
    var dateRequest: String?
    var feedback: String?
    var price: String?
    var expanded: Bool
    var gradientLayer: CAGradientLayer!
    
    init(serviceName: String, timeFrom: String, timeTo: String, symtomName: String, tag: String, commentary: String, region: String, visitTime: String, dateRequest: String, feedback: String, price: String) {
        self.serviceName = serviceName
        self.timeFrom = timeFrom
        self.timeTo = timeFrom
        self.symtomName = symtomName
        self.tag = tag
        self.commentary = commentary
        self.region = region
        self.visitTime = visitTime
        self.expanded = false
        self.dateRequest = dateRequest
        self.feedback = feedback
        self.price = price
//        self.expanded = expanded
    }
}



class ExpandingTableViewCell : UITableViewCell {
    
    @IBOutlet weak var serviceNameLabel: UILabel!
    @IBOutlet weak var dateRequestLabel: UILabel!
    @IBOutlet weak var symtomNameLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var commentaryLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var visitTimeLabel: UILabel!
    @IBOutlet weak var timeFromLabel: UITextField!
    @IBOutlet weak var timeToLabel: UITextField!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var respondLabel: UIButton!
    @IBOutlet weak var requestView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        requestView.layer.cornerRadius = 5
        requestView.layer.masksToBounds = true
        priceLabel.layer.cornerRadius = 3
        priceLabel.layer.masksToBounds = true
        respondLabel.layer.cornerRadius = 3
        respondLabel.layer.masksToBounds = true
        timeToLabel.layer.cornerRadius = 3
        timeToLabel.layer.masksToBounds = true
        timeFromLabel.layer.cornerRadius = 3
        timeFromLabel.layer.masksToBounds = true
        tagLabel.layer.cornerRadius = 3
        tagLabel.layer.masksToBounds = true
        
    }
    
    func set(content: ExpandingTableViewCellContent) {
        self.serviceNameLabel.text = content.serviceName
        self.timeFromLabel.text = content.expanded ? content.timeFrom : ""
        self.timeToLabel.text = content.expanded ? content.timeTo : ""
        self.symtomNameLabel.text = content.symtomName
        self.tagLabel.text = content.tag
        self.commentaryLabel.text = content.commentary
        self.regionLabel.text = content.region
        self.visitTimeLabel.text = content.expanded ? content.visitTime: ""
        self.dateRequestLabel.text = content.dateRequest
        self.feedbackLabel.text = content.feedback
        self.priceLabel.text = content.price
    }
    
}
