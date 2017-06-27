//
//  CalendarViewController.swift
//  iCare
//
//  Created by kalonizator on 22.06.17.
//  Copyright © 2017 kalonizator. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var calendarTableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var gradientLayer: CAGradientLayer!
    var datasource = [CalendarTableViewCellContent]()
    var expanded = 0
    var expandedIndex = 0
    var prevSelectedPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if revealViewController() != nil {
            
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            revealViewController().rightViewRevealWidth = 150
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }
        print(self.revealViewController().frontViewController)
        print(self.revealViewController().rearViewController)
        

        
        calendarTableView.dataSource = self
        calendarTableView.delegate = self
        calendarTableView.tableFooterView = UIView()
        
        datasource = [CalendarTableViewCellContent(month: "December",
                                                   dayOfTheWeek: "December", numberOfRequests: "3", requestsText: "18 отзывов"),
                      CalendarTableViewCellContent(month: "December",
                                                   dayOfTheWeek: "December", numberOfRequests: "3", requestsText: "18 отзывов"),
                      CalendarTableViewCellContent(month: "December",
                                                   dayOfTheWeek: "December", numberOfRequests: "3", requestsText: "18 отзывов")]
        
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
        return datasource.count
    }
    
    //    func tableView(_ requestTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! ExpandingTableViewCell
    //        print(datasource[0].expanded)
    //        if (indexPath.item == 1) {
    //
    //        }
    //        return cell
    //    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell")! as! CalendarTableViewCell
        cell.selectionStyle = .none
        print(datasource[0].expanded)
        return cell
    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    ////        if (datasource[0].expanded == false) {
    ////        print(datasource[0].expanded)
    //       return 210
    //        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if prevSelectedPath != nil && prevSelectedPath != indexPath{
            let prevContent = datasource[prevSelectedPath!.row]
            if prevContent.expanded{
                prevContent.expanded = !prevContent.expanded
            }
        }
        
        let content = datasource[indexPath.row]
        content.expanded = !content.expanded
        
        calendarTableView.reloadRows(at: [indexPath], with: .automatic)
        if (content.expanded == true) {
            expanded = 1
            expandedIndex = indexPath.row
        } else {
            expanded = 0
        }
        prevSelectedPath = indexPath
        tableView.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (expanded == 1) && (expandedIndex == indexPath.row) {
            return 310
        }
        return 210
    }
    
    
}

