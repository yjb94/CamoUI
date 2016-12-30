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
                removeTargets()
            }
        }
    }
    
    @IBInspectable
    public var animate_mode: AnimateMode = .alpha
    public var animate_duration:TimeInterval = 0.15
    
    public enum AnimateMode
    {
        case alpha        //changes alpha with animation
        case scale        //changes scale with animation
    }

    init(frame: CGRect, normal:String = "", animate:Bool = true, buttons_autoset:Bool = false, animate_mode:AnimateMode = .alpha)
    {
        super.init(frame: frame)
        configure()

        setImagesFor(UIImage(named:normal))

        defer {
            self.animate_mode = animate_mode
            self.animate = animate
        }
        
        if buttons_autoset
        {
            autoSetButtonsWith(UIImage(named:normal))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure() {
        //disables button getting black when ...
        adjustsImageWhenDisabled = false
        adjustsImageWhenHighlighted = false
    }
    
    func setImagesFor(_ normal:UIImage?, for state: UIControlState = .normal)
    {
        guard let normal = normal else { return }
        self.setBackgroundImage(normal, for: state)
    }
    
    func autoSetButtonsWith(_ normal:UIImage?)
    {
        guard let normal = normal else { return }
        //normal
        self.setBackgroundImage(normal, for: .normal)
        
        //selected
        let selected = normal.alpha(value: 0.2)
        self.setBackgroundImage(selected, for: .selected)
        
        //highlighted
        let higlighted = normal.alpha(value: 0.7)
        self.setBackgroundImage(higlighted, for: .highlighted)
        
        //disabled
        let disabled = normal.noir()
        self.setBackgroundImage(disabled, for: .disabled)
    }
    
    func onTouchDown(sender:UIButton)
    {
        if !animate { return }
        
        self.addTarget(self, action: #selector(onTouchUp), for: .touchUpOutside)
        self.addTarget(self, action: #selector(onTouchUp), for: .touchUpInside)
        
        
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
    
    func removeTargets()
    {
        self.removeTarget(self, action: #selector(onTouchDown), for: .touchDown)
        self.removeTarget(self, action: #selector(onTouchUp), for: .touchUpOutside)
        self.removeTarget(self, action: #selector(onTouchUp), for: .touchUpInside)
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
