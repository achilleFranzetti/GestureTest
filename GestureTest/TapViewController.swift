//
//  TapViewController.swift
//  GestureTest
//
//  Created by FRANZETTI-LAPTOP on 10/12/17.
//  Copyright © 2017 FRANZETTI-LAPTOP. All rights reserved.
//

import UIKit

class TapViewController: UIViewController {

    @IBOutlet weak var tapNumber: UILabel!
    @IBOutlet weak var position: UILabel!
    
    private var numberOfTaps = 0
    
    @IBOutlet var tapView: UIView! {
        didSet {
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(updateUI(byReactingTo: )))
            tapRecognizer.numberOfTapsRequired = 1
            tapView.addGestureRecognizer(tapRecognizer)
        }
    }

    // TAP gesture handler
    @objc func updateUI(byReactingTo tapRecognizer: UITapGestureRecognizer) {
        
        switch tapRecognizer.state {
        case .ended:
            let location = tapRecognizer.location(in: tapView)
            position.text = "X: " + stringFrom(location.x) + "; Y: " + stringFrom(location.y)
            numberOfTaps = numberOfTaps + 1
            tapNumber.text = "\( numberOfTaps )"
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
