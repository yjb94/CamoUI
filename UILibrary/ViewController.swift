//
//  ViewController.swift
//  UILibrary
//
//  Created by Camo_u on 2016. 12. 28..
//  Copyright © 2016년 Camo_u. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var button:CamoUButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        let button = UIButton(type: .system)
        
        button = CamoUButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100) , normal: "play_button")
//        button.resize(size: 10, 10)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        button.animate = true
        
//        self.view.addSubview(button)
        
        
        let a = CamoURadioButton(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000), buttons: [button, button, button], align:.vertical)
        self.view.addSubview(a)
    }
    func buttonAction(id:AnyObject? = nil)
    {
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

