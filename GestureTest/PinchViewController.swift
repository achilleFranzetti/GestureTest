//
//  PinchViewController.swift
//  GestureTest
//
//  Created by FRANZETTI-LAPTOP on 10/12/17.
//  Copyright © 2017 FRANZETTI-LAPTOP. All rights reserved.
//

import UIKit

class PinchViewController: UIViewController {


    @IBOutlet weak var scale: UILabel!
    
    
    @IBOutlet var pinchView: UIView! {
        didSet {
            let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(updateUI(byReactingTo: )))
            //pinchRecognizer.numberOfTapsRequired = 1
            pinchView.addGestureRecognizer(pinchRecognizer)
        }
    }
    
    // PINCH gesture handler
    @objc func updateUI(byReactingTo pinchRecognizer: UIPinchGestureRecognizer) {
        
        switch pinchRecognizer.state {
        case .began, .changed:
            scale.text = stringFrom(pinchRecognizer.scale)
            // velocity
            //print(stringFrom(pinchRecognizer.velocity))
            
        case .ended:
            pinchRecognizer.scale = 1

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
