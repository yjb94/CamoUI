//
//  CamoURadioButton.swift
//  UILibrary
//
//  Created by Camo_u on 2016. 12. 29..
//  Copyright © 2016년 Camo_u. All rights reserved.
//

import UIKit

class CamoURadioButton: UIView
{
    public var buttons:[UIButton]? {
        didSet {
            removeAllButtonsFromChild()
            addAllButtonsToChild()
        }
    }
    public var margin:CGFloat = 10.0 {
        didSet {
            autoResize()
        }
    }
    
    init(frame: CGRect, buttons:[UIButton]!)
    {
        super.init(frame: frame)
        
        defer {
            self.buttons = buttons
        }
    }

    func autoResize(_ align:CamoU.Align = [.horizontal, .center])
    {
        guard let buttons_to_resize = buttons else { buttons = nil; return; }
        
        //find out the largest size(w,h) of items
        var largest = CGSize()
        for button in buttons_to_resize {
            if largest.width < button.frame.size.width {
                largest.width = button.frame.size.width
            }
            if largest.height < button.frame.size.height {
                largest.height = button.frame.size.height
            }
        }
        
        // resize buttons
        for (index, button) in buttons_to_resize.enumerated()
        {
            var resized_point = CGPoint(x: 0, y: 0)
            
            if align.contains(.horizontal)
            {
                resized_point.x = (largest.width + self.margin) * CGFloat(index)
            }
            else if align.contains(.vertical)
            {
                resized_point.y = (largest.height + self.margin) * CGFloat(index)
            }
            
            button.frame.origin = resized_point
            
            if align.contains(.center)
            {
                button.center.x = resized_point.x + largest.width/2
                button.center.y = resized_point.y + largest.height/2
            }
        }
        
        // resize whole frame
        let total_width = align.contains(.horizontal) ? (largest.width + self.margin) * CGFloat(buttons_to_resize.count) : largest.width
        let total_height = align.contains(.vertical) ? (largest.height + self.margin) * CGFloat(buttons_to_resize.count) : largest.height

        self.frame.size = CGSize(width: total_width, height: total_height)
    }
    
    func addTarget(_ target: Any?, action: Selector)
    {
        guard let buttons_to_add = buttons else { buttons = nil; return; }
        
        buttons_to_add.enumerated().forEach() { index, button in
            button.tag = index
            button.addTarget(target, action: action, for: .touchDown)
        }
    }
    
    func addAllButtonsToChild()
    {
        guard let buttons_to_add = buttons else { buttons = nil; return; }
        buttons_to_add.enumerated().forEach() { index, button in
            button.tag = index
            button.addTarget(self, action: #selector(onButtonDown), for: .touchDown)
            self.addSubview(button)
        }
    }
    
    func removeAllButtonsFromChild()
    {
        for view in self.subviews {
            if view is UIButton {
                view.removeFromSuperview()
            }
        }
    }
    
    func onButtonDown(sender:UIButton)
    {
        guard let buttons_to_filter = buttons else { buttons = nil; return; }
        //filters buttons without tag
            // -- or you can just deselect every button and then select sender button
        let buttons_filtered = buttons_to_filter.filter(){ (button:UIButton) -> (Bool) in
            if button.tag == sender.tag { return false }
            return true
        }
        
        //deselect buttons
        buttons_filtered.forEach() { buttons in buttons.isSelected = false }
        //select button
        sender.isSelected = true
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}

