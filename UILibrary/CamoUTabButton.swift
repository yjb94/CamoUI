//
//  CamoUTabButton.swift
//  UILibrary
//
//  Created by Camo_u on 2016. 12. 31..
//  Copyright © 2016년 Camo_u. All rights reserved.
//

import UIKit

class CamoUTabButton: CamoUButton
{
    override func autoSetButtonsWith(_ normal:UIImage?)
    {
        guard let normal = normal else { return }
        //normal
        self.setBackgroundImage(normal, for: .normal)
        
        //highlighted
        let higlighted = normal.alpha(value: 0.7)
        self.setBackgroundImage(higlighted, for: .highlighted)
        
        //disabled
        let disabled = normal.noir()
        self.setBackgroundImage(disabled, for: .disabled)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        toggleButton()
        super.touchesBegan(touches, with: event)
    }
    
    func toggleButton()
    {
        self.isSelected = !isSelected
    }
    
    var selectColor: UIColor = UIColor.init(white: 0, alpha: 0.2)
    
    override var isSelected: Bool {
        didSet{
            if isSelected
            {
                self.backgroundColor = selectColor
            }
            else
            {
                self.backgroundColor = UIColor.clear
            }
        }
    }
}
