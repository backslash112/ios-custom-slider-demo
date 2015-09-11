//
//  PopView.swift
//  ios-custom-slider-demo
//
//  Created by Carl.Yang on 9/11/15.
//  Copyright © 2015 Yang Cun. All rights reserved.
//

import UIKit

class PopView: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override init(image: UIImage?) {
        super.init(image: image)
        
        self.initValueLabel()
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initValueLabel() {
        valueLabel = UILabel(frame: self.frame)
        self.addSubview(valueLabel)
        
    }
    var valueLabel: UILabel!
    var _popValue: String = ""
    var popValue: String {
        get {
            return _popValue
        }
        set {
            _popValue = newValue
            self.valueLabel.text = _popValue
        }
    }
}
