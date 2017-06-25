//
//  CalendarViewController.swift
//  iCare
//
//  Created by kalonizator on 22.06.17.
//  Copyright © 2017 kalonizator. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UITableViewDelegate, ExpandableCalendarDelegate, UITableViewDataSource{
    
    @IBOutlet weak var calendarTableView: UITableView!
    
    
    var gradientLayer: CAGradientLayer!
    
    var sections = [
        
        Section(month: "December",
                dayOfTheWeek: "Monday",
                numberOfRequests: "8",
                requestsText: ["No requests"],
                expanded: true),
        Section(month: "December",
        dayOfTheWeek: "Monday",
        numberOfRequests: "8",
        requestsText: ["No requests"],
        expanded: true),
        Section(month: "December",
        dayOfTheWeek: "Monday",
        numberOfRequests: "8",
        requestsText: ["No requests"],
        expanded: true)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        ////////Set Gradient Background////////
        func createGradientLayer() {
            gradientLayer = CAGradientLayer()
            
            gradientLayer.frame = self.view.bounds
            
            gradientLayer.colors = [UIColor(red:0.35, green:0.59, blue:0.75, alpha:0.2).cgColor,UIColor(red:0.38, green:0.12, blue:0.64, alpha:0.2).cgColor]
            
            self.view.layer.addSublayer(gradientLayer)
        }
        ////////Set Gradient Background////////
        
        ///////Показать вьюшку///////////
        func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)
            createGradientLayer()
        }
        viewWillAppear(animated: true)
        ///////Показать вьюшку///////////
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    
    func calendarTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].requestsText.count
    }
    
    func calendarTableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func calendarTableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].expanded) {
            return 44
        } else {
            return 0
        }
    }
    
    func calendarTableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func calendarTableView(_ calendarTableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CalendarTableViewCell()
        header.customInit(title: sections[section].month, section: section, delegate: self)
        header.customInit(title: sections[section].dayOfTheWeek, section: section, delegate: self)
        header.customInit(title: sections[section].numberOfRequests, section: section, delegate: self)
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell")!
        cell.textLabel?.text = sections[indexPath.section].requestsText[indexPath.row]
        return cell
    }
    
    func tuggleSection(header: CalendarTableViewCell, section: Int) {
        sections[section].expanded = !sections[section].expanded
        
        calendarTableView.beginUpdates()
        for i in 0 ..< sections[section].requestsText.count {
            calendarTableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        calendarTableView.endUpdates()
    }
    
    
}
