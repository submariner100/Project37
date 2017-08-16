//
//  GradientView.swift
//  Project37
//
//  Created by Macbook on 16/08/2017.
//  Copyright © 2017 Chappy-App. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
	
	@IBInspectable var topColor: UIColor = UIColor.white
	@IBInspectable var bottomColor: UIColor = UIColor.black
	
	override class var layerClass: AnyClass {
		
		return CAGradientLayer.self
		
	}
	
	override func layoutSubviews() {
		(layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
		
	}
}

   
