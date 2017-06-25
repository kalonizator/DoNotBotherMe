//
//  ExpansionRequestCell.swift
//  iCare
//
//  Created by kalonizator on 22.06.17.
//  Copyright © 2017 kalonizator. All rights reserved.
//
import UIKit

protocol ExpandableCalendarDelegate {
    func tuggleSection(header: CalendarTableViewCell, section: Int)
}



class CalendarTableViewCell : UITableViewHeaderFooterView {
    
    var delegate: ExpandableCalendarDelegate?
    var section: Int!
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayOfTheWeekLabel: UILabel!
    @IBOutlet weak var numberOfRequestsLabel: UILabel!
    @IBOutlet weak var requestsTextLabel: UILabel!
    
    
    override init (reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    
    func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer) {
        let cell = gestureRecognizer.view as! CalendarTableViewCell
        delegate?.tuggleSection(header: self, section: cell.section)
    }
    
    func customInit(title: String, section: Int, delegate: ExpandableCalendarDelegate) {
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.textColor = UIColor.white
        self.contentView.backgroundColor = UIColor.darkGray
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    
}
