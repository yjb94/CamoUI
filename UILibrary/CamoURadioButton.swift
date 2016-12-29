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

    func autoResize(align:CamoU.Align = [.horizontal, .center])
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
        
        for (index, button) in buttons_to_resize.enumerated()
        {
            var resized_point = button.frame.origin
            
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
    }
    
    func addAllButtonsToChild()
    {
        guard let buttons_to_add = buttons else { buttons = nil; return; }
        
        for button in buttons_to_add
        {
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
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}
