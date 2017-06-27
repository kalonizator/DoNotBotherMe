//
//  RequestViewController.swift
//  iCare
//
//  Created by kalonizator on 22.06.17.
//  Copyright © 2017 kalonizator. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var requestTableView: UITableView!
    var gradientLayer: CAGradientLayer!
    var datasource = [ExpandingTableViewCellContent]()
    var expanded = 0
    var expandedIndex = 0
    var prevSelectedPath: IndexPath?
    
    @IBOutlet weak var requestView: UIView!
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
        
       requestTableView.layer.cornerRadius = 3
       requestTableView.backgroundColor = UIColor.white
        requestTableView.dataSource = self
        requestTableView.delegate = self
        requestTableView.tableFooterView = UIView() // Removes empty cell separators
//        requestTableView.estimatedRowHeight = 60
//        requestTableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view, typically from a nib.
        
        datasource = [ExpandingTableViewCellContent(serviceName: "Вызов врача на дом",
                                                    timeFrom: "9:00", timeTo: "11:00", symtomName: "Brain MRT", tag: "Research", commentary: "I don't know", region: "Наурызбайский, Алмалинский", visitTime: "Время приема", dateRequest: "16 декабря 09.30 - 10.30", feedback: "18 отзывов", price: "2500"),
                      ExpandingTableViewCellContent(serviceName: "Поставить укол",
                                                    timeFrom: "10:00", timeTo: "11:00", symtomName: "Brain MRT", tag: "Research", commentary: "I don't know", region: "Наурызбайский, Алмалинский", visitTime: "Время приема", dateRequest: "16 декабря 09.30 - 10.30", feedback: "18 отзывов", price: "2500"),
                      ExpandingTableViewCellContent(serviceName: "Измерить температуру",
                                                    timeFrom: "11:00", timeTo: "11:30", symtomName: "Brain MRT", tag: "Research", commentary: "I don't know", region: "Наурызбайский, Алмалинский", visitTime: "Время приема", dateRequest: "16 декабря 09.30 - 10.30", feedback: "18 отзывов", price: "2500")]
        
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
    
    
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
//    func tableView(_ requestTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! ExpandingTableViewCell
        cell.selectionStyle = .none
        print(datasource[0].expanded)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        requestTableView.reloadRows(at: [indexPath], with: .automatic)
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


//extension RequestViewController : UITableViewDataSource, UITableViewDelegate {
//    
//    func requestTableView(_ requestTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return datasource.count
//    }
//    
//    func requestTableView(_ requestTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print(indexPath.row)
//        let cell = requestTableView .dequeueReusableCell(withIdentifier: String(describing: ExpandingTableViewCell.self), for: indexPath) as! ExpandingTableViewCell
//        cell.set(content: datasource[indexPath.row])
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        if (datasource[0].expanded == false) {
//            return 210
////        } else {
////            return 310
////        }
//    }
//    
//    func requestTableView(_ requestTableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let content = datasource[indexPath.row]
//        content.expanded = !content.expanded
//        requestTableView.reloadRows(at: [indexPath], with: .automatic)
//    }
//    
//}
