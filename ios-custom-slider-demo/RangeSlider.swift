//
//  RangeSlider.swift
//  ios-custom-slider-demo
//
//  Created by Carl.Yang on 9/10/15.
//  Copyright © 2015 Yang Cun. All rights reserved.
//

import UIKit

class RangeSlider: UIControl {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    var minimumValue: CGFloat = 0
    var maximumValue: CGFloat = 0
    var minimumRange: CGFloat = 0
    var selectedMinimumValue: CGFloat = 0
    var selectedMaximumValue: CGFloat = 0

    var _maxThumbOn = false
    var _minThumbOn = false
    
    var _padding: CGFloat = 20
    
    var _minThumb: UIImageView!
    var _maxThumb: UIImageView!
    var _track: UIImageView!
    var _trackBackground: UIImageView!
    
    func xForValue(value: CGFloat) -> CGFloat {
        let baseWidth = self.frame.size.width - _padding*2
        let range = maximumValue - minimumValue
        let locationRange = (value - minimumValue)/range
        return baseWidth * locationRange + _padding
     }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.yellowColor()
        
    }

    func initWithFrame2(frame frame: CGRect) {
        self.frame = frame
        self.initBackground()
        self.initHeighlight()
        self.initMaxThumb()
        self.initMinThumb()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initBackground() {
        _trackBackground = UIImageView(image: UIImage(named: "bar-background"))
        _trackBackground.frame = CGRectMake(
            _padding,
            (self.frame.height - _trackBackground.frame.height)/2,
            self.frame.width - _padding*2,
            _trackBackground.frame.height)
        self.addSubview(_trackBackground)
    }
    
    func initHeighlight() {
        _track = UIImageView(image: UIImage(named: "bar-highlight"))
        _track.frame = CGRectMake(
            _padding,
            (self.frame.height - _track.frame.height)/2,
            self.frame.width - _padding*2,
            _track.frame.height)
        self.addSubview(_track)
    }
    
    func initMinThumb() {
        _minThumb = UIImageView(image: UIImage(named: "handle"))
        _minThumb.center = CGPointMake(self.xForValue(self.selectedMinimumValue), self.frame.size.height/2)
        self.addSubview(_minThumb)
    }
    
    func initMaxThumb() {
        _maxThumb = UIImageView(image: UIImage(named: "handle"))
        _maxThumb.center = CGPointMake(self.xForValue(self.selectedMaximumValue), self.frame.size.height/2)
        self.addSubview(_maxThumb)
    }
}
