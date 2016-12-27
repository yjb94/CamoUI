//
//  CamoUButton.swift
//  UILibrary
//
//  Created by Camo_u on 2016. 12. 28..
//  Copyright © 2016년 Camo_u. All rights reserved.
//

import UIKit

class CamoUButton: UIButton
{
    @IBInspectable
    public var animate: Bool = true {
        didSet {
            if animate {
                self.addTarget(self, action: #selector(onTouchDown), for: .touchDown)
            }
            else {
                self.removeTarget(self, action: #selector(onTouchDown), for: .touchDown)
                self.removeTarget(self, action: #selector(onTouchUp), for: .touchUpOutside)
                self.removeTarget(self, action: #selector(onTouchUp), for: .touchUpInside)
            }
        }
    }
    
    @IBInspectable
    public var animate_mode: CamoUButtonMode = .alpha
    public var animate_duration:TimeInterval = 0.15
    
    public enum CamoUButtonMode
    {
        case alpha        //changes alpha with animation
        case scale        //changes scale with animation
    }

    init(frame: CGRect, normal:String = "", highlight:String = "", disable:String = "")
    {
        super.init(frame: frame)
        configure()

        setImages(normal: UIImage(named:normal), highlight: UIImage(named:highlight), disable: UIImage(named:disable))
        
        settingsAfter()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
        settingsAfter()
    }
    
    func configure() {
        //disables button getting black when ...
        adjustsImageWhenDisabled = false
        adjustsImageWhenHighlighted = false
    }
    
    func settingsAfter()
    {
        //set animation
        animate = true
    }
    
    func setImages(normal:UIImage?, highlight:UIImage? = nil, disable:UIImage? = nil)
    {
        guard let normal = normal else { return }
        self.setBackgroundImage(normal, for: .normal)
        
        guard let highlight = highlight else { return }
        self.setBackgroundImage(highlight, for: .highlighted)
        
        guard let disable = disable else { return }
        self.setBackgroundImage(disable, for: .disabled)
    }
    
    
    func onTouchDown(sender:UIButton)
    {
        self.addTarget(self, action: #selector(onTouchUp), for: .touchUpOutside)
        self.addTarget(self, action: #selector(onTouchUp), for: .touchUpInside)
        
        if !animate { return }
        
        switch animate_mode
        {
        case .alpha:
            UIView.animate(withDuration: TimeInterval(animate_duration), animations: { self.alpha = 0.6 })
            break
            
        case .scale:
            UIView.animate(withDuration: TimeInterval(animate_duration), animations: {
                self.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            })
            break
        }
    }
    
    func onTouchUp(sender:UIButton)
    {
        if !animate { return }
        
        switch animate_mode
        {
        case .alpha:
            UIView.animate(withDuration: TimeInterval(animate_duration), animations: { self.alpha = 1 })
            break
            
        case .scale:
            UIView.animate(withDuration: TimeInterval(animate_duration), animations: { self.transform = CGAffineTransform.identity })
            break
        }
    }
}
