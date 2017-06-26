//
//  ViewController.swift
//  iCare
//
//  Created by kalonizator on 21.06.17.
//  Copyright © 2017 kalonizator. All rights reserved.
//

import UIKit

class ProfileSettingsViewController: UIViewController {
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var gradientLayer: CAGradientLayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if revealViewController() != nil {

            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            revealViewController().rightViewRevealWidth = 150
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        print(self.revealViewController().frontViewController)
        print(self.revealViewController().rearViewController)
    }
    
    ////////Set Gradient Background////////
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [UIColor(red:0.35, green:0.59, blue:0.75, alpha:0.2).cgColor,UIColor(red:0.38, green:0.12, blue:0.64, alpha:0.2).cgColor]
        
        self.view.layer.addSublayer(gradientLayer)
    }
    ////////Set Gradient Background////////
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        createGradientLayer()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}

