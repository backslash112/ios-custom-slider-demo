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
        return  (self.frame.size.width - _padding*2) * (value - minimumValue) / (maximumValue - minimumValue) + _padding
     }
    
    func yForValue(value: CGFloat) -> CGFloat {
        return  (self.frame.size.height - _padding*2) * (value - minimumValue) / (maximumValue - minimumValue) + _padding
    }
    
    func valueForX(x: CGFloat) -> CGFloat {
        return ((x - _padding) / (self.frame.size.width - _padding*2)) * (maximumValue - minimumRange) + minimumValue
    }
    
    func valueForY(y: CGFloat) -> CGFloat {
        return ((y - _padding) / (self.frame.size.height - _padding*2)) * (maximumValue - minimumRange) + minimumValue
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
            (self.frame.width - _trackBackground.frame.width)/2,
            _padding,
            _trackBackground.frame.width,
            self.frame.height - _padding*2)
        self.addSubview(_trackBackground)
    }
    
    func initHeighlight() {
        _track = UIImageView(image: UIImage(named: "bar-highlight"))
        _track.frame = CGRectMake(
            (self.frame.width - _track.frame.width)/2,
            _padding,
            _track.frame.width,
            self.frame.height - _padding*2)
        self.addSubview(_track)
    }
    
//    func initMinThumb() {
//        _minThumb = UIImageView(image: UIImage(named: "handle"))
//        _minThumb.center = CGPointMake(self.xForValue(self.selectedMinimumValue), self.frame.size.height/2)
//        self.addSubview(_minThumb)
//    }

    func initMinThumb() {
        _minThumb = UIImageView(image: UIImage(named: "handle"))
        _minThumb.center = CGPointMake(self.frame.size.width/2, self.yForValue(self.selectedMinimumValue))
        self.addSubview(_minThumb)
    }
    
//    func initMaxThumb() {
//        _maxThumb = UIImageView(image: UIImage(named: "handle"))
//        _maxThumb.center = CGPointMake(self.xForValue(self.selectedMaximumValue), self.frame.size.height/2)
//        self.addSubview(_maxThumb)
//    }

    func initMaxThumb() {
        _maxThumb = UIImageView(image: UIImage(named: "handle"))
        _maxThumb.center = CGPointMake(self.frame.size.width/2, self.yForValue(self.selectedMaximumValue))
        self.addSubview(_maxThumb)
    }
    
    // MARK: - Tracking Touch
    
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        let touchPoint = touch.locationInView(self)
        if CGRectContainsPoint(_minThumb.frame, touchPoint) {
            _minThumbOn = true
        } else if CGRectContainsPoint(_maxThumb.frame, touchPoint) {
            _maxThumbOn = true
        }
        return true
    }
    
    override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        _minThumbOn = false
        _maxThumbOn = false
    }
    
//    override func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
//        if !_minThumbOn && !_maxThumbOn {
//            return true
//        }
//        
//        let touchPoint = touch.locationInView(self)
//        if _minThumbOn {
//            let minimumX = self.xForValue(self.minimumValue)
//            print("minimumX \(minimumX)")
//            print("selectedMaximumValue \(selectedMaximumValue)")
//            print("selectedMaximumValue - minimumRange \(selectedMaximumValue - minimumRange)")
//            print("self.xForValue(selectedMaximumValue - minimumRange) \(self.xForValue(selectedMaximumValue - minimumRange))")
//            print("touchPoint.x \(touchPoint.x)")
//            print("min(touchPoint.x,self.xForValue(selectedMaximumValue - minimumRange)) \(min(touchPoint.x,self.xForValue(selectedMaximumValue - minimumRange)))")
//            
//            let right = min(touchPoint.x,self.xForValue(selectedMaximumValue - minimumRange))
//            print("right \(right)")
//            let left = max(minimumX, right)
//            print("left \(left)")
//            _minThumb.center = CGPointMake(left, _minThumb.center.y)
//            
//            self.selectedMinimumValue = self.valueForX(_minThumb.center.x)
//            print("upper value is now \(self.selectedMaximumValue)")
//            print("lower value is now \(self.selectedMinimumValue)")
//        }
//        if _maxThumbOn {
//            let maximumX = self.xForValue(self.maximumValue)
//            
//            _maxThumb.center = CGPointMake(min(max(self.xForValue(self.selectedMinimumValue + self.minimumRange), touchPoint.x), maximumX), _maxThumb.center.y)
//            
//            self.selectedMaximumValue = self.valueForX(_maxThumb.center.x)
//            print("upper value is now \(self.selectedMaximumValue)")
//        }
//        self.setNeedsDisplay()
//        
//        return true
//    }

    override func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        if !_minThumbOn && !_maxThumbOn {
            return true
        }
        
        let touchPoint = touch.locationInView(self)
        if _minThumbOn {
            let minimumY = self.yForValue(self.minimumValue)
            let right = min(touchPoint.y,self.yForValue(selectedMaximumValue - minimumRange))
            let left = max(minimumY, right)
            _minThumb.center = CGPointMake(_minThumb.center.x, left)
            
            self.selectedMinimumValue = self.valueForY(_minThumb.center.y)
        }
        if _maxThumbOn {
            let maximumY = self.yForValue(self.maximumValue)
            
            _maxThumb.center = CGPointMake(_maxThumb.center.x, min(max(self.yForValue(self.selectedMinimumValue + self.minimumRange), touchPoint.y), maximumY))
            
            self.selectedMaximumValue = self.valueForY(_maxThumb.center.y)
        }
        self.setNeedsDisplay()
        
        return true
    }
    
}








