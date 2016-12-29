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
        
        let a = CamoUButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30) , normal: "play_button", animate: false)
        let b = CamoUButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30) , normal: "play_button", animate: false)
        let c = CamoUButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30) , normal: "play_button", animate: false)
        
        let radio = CamoURadioButton(frame: CGRect(x: 0, y: 50, width: 0, height: 0), buttons: [a, b, c])
        radio.autoResize(.vertical)
        radio.addTarget(self, action: #selector(buttonAction))
        self.view.addSubview(radio)
        
//        let d = CamoUButton(frame: CGRect(x: 0, y: 100, width: 100, height: 100) , normal: "play_button")
//        let e = CamoUButton(frame: CGRect(x: 0, y: 100, width: 50, height: 50) , normal: "play_button")
//        let f = CamoUButton(frame: CGRect(x: 0, y: 100, width: 10, height: 10) , normal: "play_button")
//        
//        let radio2 = CamoURadioButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0), buttons: [f, d, e])
//        radio2.autoResize()
//        self.view.addSubview(radio2)
//        
//        let g = CamoUButton(frame: CGRect(x: 0, y: 200, width: 100, height: 100) , normal: "play_button")
//        let h = CamoUButton(frame: CGRect(x: 0, y: 200, width: 50, height: 50) , normal: "play_button")
//        let i = CamoUButton(frame: CGRect(x: 0, y: 200, width: 10, height: 10) , normal: "play_button")
//        
//        let radio3 = CamoURadioButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0), buttons: [h, i, g])
//        radio3.autoResize()
//        self.view.addSubview(radio3)
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

