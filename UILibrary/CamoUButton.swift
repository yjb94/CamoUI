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
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.backgroundColor = UIColor.init(white: 0, alpha: 0.2)
            }
            else
            {
                self.backgroundColor = UIColor.clear
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

    init(frame: CGRect, normal:String = "", highlight:String = "", disable:String = "", animate:Bool = true, animate_mode:AnimateMode = .alpha)
    {
        super.init(frame: frame)
        configure()

        setImages(normal: UIImage(named:normal), highlight: UIImage(named:highlight), disable: UIImage(named:disable))

        defer {
            self.animate_mode = animate_mode
            self.animate = animate
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
