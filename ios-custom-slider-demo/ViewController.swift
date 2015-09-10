//
//  ViewController.swift
//  ios-custom-slider-demo
//
//  Created by Carl.Yang on 9/10/15.
//  Copyright © 2015 Yang Cun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.initRangeSlider()
        self.view.addSubview(self.slider)
    }
    
    var slider: RangeSlider!
    func initRangeSlider() {
        self.slider = RangeSlider()
        self.slider.minimumValue = 2
        self.slider.selectedMinimumValue = 2
        self.slider.maximumValue = 10
        self.slider.selectedMaximumValue = 10
        slider.minimumRange = 1
        slider.initWithFrame2(frame: CGRectMake(0, (self.view.frame.height-50)/2, self.view.frame.width, 50))
        
    }
    
    
}

