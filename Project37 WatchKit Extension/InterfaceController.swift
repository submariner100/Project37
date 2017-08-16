//
//  InterfaceController.swift
//  Project37 WatchKit Extension
//
//  Created by Macbook on 15/08/2017.
//  Copyright © 2017 Chappy-App. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
	
	
	
	
    @IBOutlet var welcomeText: WKInterfaceLabel!
    @IBOutlet var hideButton: WKInterfaceButton!
	
	
	
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
	
	if WCSession.isSupported() {
		let session = WCSession.default()
		session.delegate = self
		session.activate()
	}
	
}
	
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
	
	func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
		
	}
	
	func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
		WKInterfaceDevice().play(.click)
		
	}

	@IBAction func hideWelcomeText() {
		
		welcomeText.setHidden(true)
		hideButton.setHidden(true)
		
	}
}
