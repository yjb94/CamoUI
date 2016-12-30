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
        
//        let a  = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
//        a.setTitleColor(UIColor.black, for: .normal)
//        a.setTitle("temptitle", for: .normal)
//        a.setTitle("hightht", for: .selected)
//        a.sizeToFit()
        
        let a = CamoUButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30) , normal: "play_button", animate: true, buttons_autoset:true, animate_mode: .scale)
        let b = CamoUButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30) , normal: "play_button", animate: false, buttons_autoset:true)
        let c = CamoUButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30) , normal: "play_button", animate: false, buttons_autoset:true)
        
        let d = CamoUTabButton(frame: CGRect(x: 0, y: 100, width: 30, height: 30) , normal: "play_button")
        d.animate = false
        self.view.addSubview(d)
        
        let radio = CamoURadioButton(frame: CGRect(x: 0, y: 50, width: 0, height: 0), buttons: [a, b, c, d])
        radio.autoResize()
//        radio.addTarget(self, action: #selector(buttonAction))
        self.view.addSubview(radio)
    }
    func buttonAction(sender:UIButton)
    {
        print(sender.tag)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

