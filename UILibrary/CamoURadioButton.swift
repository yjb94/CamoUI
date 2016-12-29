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
    public var buttons:[CamoUButton]? {
        didSet {
            addAllButtonsToChild()
            resizeAllButtons()
        }
    }
    public var margin:CGFloat = 10.0 {
        didSet {
            resizeAllButtons()
        }
    }
    public var align:CamoU.Align = .horizontal {
        didSet {
            resizeAllButtons()
        }
    }
    
    
    init(frame: CGRect, buttons:[CamoUButton]? = nil, align:CamoU.Align = .horizontal)
    {
        super.init(frame: frame)
        
        defer {
            self.buttons = buttons
            self.align = align
        }
    }
    
    func resizeAllButtons()
    {
        guard let buttons_to_resize = buttons else { buttons = nil; return; }
        
        var last_size:CGFloat = 0
        for button in buttons_to_resize
        {
            var resized_point = button.frame.origin
            
            switch self.align
            {
            case .horizontal:
                resized_point.x = last_size + self.margin
                last_size = resized_point.x + button.frame.width
                break;
            case .vertical:
                resized_point.y = last_size + self.margin
                last_size = resized_point.y + button.frame.height
                break;
            }
            button.frame.origin = resized_point
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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
