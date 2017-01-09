//
//  CamoULabel.swift
//  UILibrary
//
//  Created by Camo_u on 2017. 1. 8..
//  Copyright © 2017년 Camo_u. All rights reserved.
//

import UIKit

class CamoULabel: UILabel
{
    init(frame: CGRect, text:String? = nil)
    {
        super.init(frame: frame)
        self.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
