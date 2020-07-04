//
//  Helper.swift
//  BodyProgress
//
//  Created by Karthick Selvaraj on 31/05/20.
//  Copyright © 2020 Mallow Technologies Private Limited. All rights reserved.
//

import UIKit

class Helper: NSObject {
    
    class func hapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle = .rigid) {
        if AppSettings.isHapticEnabled() {
            let generator = UIImpactFeedbackGenerator(style: style)
            generator.impactOccurred()
        }
    }
    
}
