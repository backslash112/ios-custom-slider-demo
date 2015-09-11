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
        self.view.backgroundColor = UIColor.grayColor()
    }
    
    var slider: RangeSlider!
    func initRangeSlider() {
        self.slider = RangeSlider()
        self.slider.minimumValue = 0
        self.slider.selectedMinimumValue = 0
        self.slider.maximumValue = 500
        self.slider.selectedMaximumValue = 500
        slider.minimumRange = 1

        let height: CGFloat = 463
        let width: CGFloat = 133
        slider.initWithFrame2(frame: CGRectMake((self.view.frame.width-width)/2, (self.view.frame.height - height)/2, width, height))
        
    }
    
    
}

