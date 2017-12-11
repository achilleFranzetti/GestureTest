//
//  SwipeViewController.swift
//  GestureTest
//
//  Created by FRANZETTI-LAPTOP on 10/12/17.
//  Copyright © 2017 FRANZETTI-LAPTOP. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {

    @IBOutlet weak var swipeDirection: UILabel!
    @IBOutlet weak var numberOfSwipes: UILabel!
    
    private var swipesNum = 0
    
    @IBOutlet var swipeView: UIView! {
        didSet {
            let swipeUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(updateUI(byReactingTo: )))
            swipeUpRecognizer.direction = UISwipeGestureRecognizerDirection.up
            swipeView.addGestureRecognizer(swipeUpRecognizer)

            let swipeDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(updateUI(byReactingTo: )))
            swipeDownRecognizer.direction = UISwipeGestureRecognizerDirection.down
            swipeView.addGestureRecognizer(swipeDownRecognizer)

            let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(updateUI(byReactingTo: )))
            swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirection.left
            swipeView.addGestureRecognizer(swipeLeftRecognizer)

            let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(updateUI(byReactingTo: )))
            swipeRightRecognizer.direction = UISwipeGestureRecognizerDirection.right
            swipeView.addGestureRecognizer(swipeRightRecognizer)
        }
    }
    
    @objc func updateUI(byReactingTo swipeRecognizer: UISwipeGestureRecognizer) {
        
        switch swipeRecognizer.state {
        case .ended:
            
            /*
            let location = swipeRecognizer.location(in: swipeView)
            print("X: " + stringFrom(location.x) + "; Y:" + stringFrom(location.y))
            */
            
            let direction = swipeRecognizer.direction
            switch direction {
            case UISwipeGestureRecognizerDirection.up:
                swipeDirection.text = "up"
            case UISwipeGestureRecognizerDirection.down:
                swipeDirection.text = "down"
            case UISwipeGestureRecognizerDirection.left:
                swipeDirection.text = "left"
            case UISwipeGestureRecognizerDirection.right:
                swipeDirection.text = "right"
            default:
                swipeDirection.text = "unknown"
            }
            
            swipesNum = swipesNum + 1
            numberOfSwipes.text = "\(swipesNum)"
            
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
