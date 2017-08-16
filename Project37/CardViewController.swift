//
//  CardViewController.swift
//  Project37
//
//  Created by Macbook on 15/08/2017.
//  Copyright © 2017 Chappy-App. All rights reserved.
//

import UIKit
import GameplayKit

class CardViewController: UIViewController {
	
	weak var delegate: ViewController!
	
	var front: UIImageView!
	var back: UIImageView!
	var isCorrect = false

    override func viewDidLoad() {
        super.viewDidLoad()
	
	view.bounds = CGRect(x: 0, y: 0, width: 100, height: 140)
	front = UIImageView(image: UIImage(named: "cardBack"))
	back = UIImageView(image: UIImage(named: "cardBack"))
	
	view.addSubview(front)
	view.addSubview(back)
	
	front.isHidden = true
	back.alpha = 0
	
	UIView.animate(withDuration: 0.2) {
		self.back.alpha = 1
	}
	
	let tap = UITapGestureRecognizer(target: self, action: #selector(cardTapped))
	back.isUserInteractionEnabled = true
	back.addGestureRecognizer(tap)
	
	perform(#selector(wiggle), with: nil, afterDelay: 1)
	
}
	
	func cardTapped() {
		
		delegate.cardTapped(self)
		
	}
	
	func wasntTapped() {
		
		UIView.animate(withDuration: 0.7) {
			self.view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
			self.view.alpha = 0
		}
	}
	
	func wasTapped() {
		
		UIView.transition(with: view, duration: 0.7, options: [.transitionFlipFromRight], animations: { [ unowned self] in
			self.back.isHidden = true
			self.front.isHidden = false
		})
	}
	
	func wiggle() {
		
		if GKRandomSource.sharedRandom().nextInt(upperBound: 4) == 1 {
			
			UIView.animate(withDuration: 0.2, delay: 0, options: .allowUserInteraction, animations: {
				self.back.transform = CGAffineTransform(scaleX: 1.01, y: 1.01)
				
			}) { _ in
				
				self.back.transform = CGAffineTransform.identity
			}
			
			perform(#selector(wiggle), with: nil, afterDelay: 8)
			
		} else {
			
			perform(#selector(wiggle), with: nil, afterDelay: 2)
	
		}
	
	}

	
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
