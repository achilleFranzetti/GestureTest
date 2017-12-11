//
//  PanViewController.swift
//  GestureTest
//
//  Created by FRANZETTI-LAPTOP on 10/12/17.
//  Copyright © 2017 FRANZETTI-LAPTOP. All rights reserved.
//

import UIKit

class PanViewController: UIViewController {

    @IBOutlet weak var startPosition: UILabel!
    @IBOutlet weak var currentPosition: UILabel!
    @IBOutlet weak var panSpeed: UILabel!
    
    @IBOutlet var panView: UIView! {
        didSet {
            let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(updateUI(byReactingTo: )))
            panRecognizer.minimumNumberOfTouches = 1 // This is by default = 1
            panView.addGestureRecognizer(panRecognizer)
        }
    }

    // PAN gesture handler
    @objc func updateUI(byReactingTo panRecognizer: UIPanGestureRecognizer) {
        
        switch panRecognizer.state {
        case .began:
            let translation = panRecognizer.translation(in: panView)
            startPosition.text = "X: " + stringFrom(translation.x) + "; Y: " + stringFrom(translation.y)
            
        case .changed:
            let translation = panRecognizer.translation(in: panView)
            startPosition.text = "X: " + stringFrom(translation.x) + "; Y: " + stringFrom(translation.y)

            // velocity (CGPoint) has 2 components, x and y
            let velocity = panRecognizer.velocity(in: panView)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            panSpeed.text = stringFrom(magnitude)
            
        case .ended:
            panRecognizer.setTranslation(CGPoint.zero, in: panView)
            
        default:
            break
        }
    }
    
    private func stringFrom(_ value: CGFloat) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesGroupingSeparator = false
        return numberFormatter.string(from: NSNumber(value: Double(value)))!
    }

}
