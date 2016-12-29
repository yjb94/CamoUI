//
//  CamoU.swift
//  UILibrary
//
//  Created by Camo_u on 2016. 12. 29..
//  Copyright © 2016년 Camo_u. All rights reserved.
//

import UIKit

class CamoU: NSObject
{
    struct Align : OptionSet
    {
        let rawValue:Int
        
        static let horizontal   = Align(rawValue: 0)
        static let vertical     = Align(rawValue: 1 << 0)
        static let center       = Align(rawValue: 1 << 1)
    }
}
