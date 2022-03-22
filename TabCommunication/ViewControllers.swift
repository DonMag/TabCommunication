//
//  ViewController.swift
//  TabCommunication
//
//  Created by Don Mag on 3/22/22.
//

import UIKit

class HomeViewController: UIViewController {
	
	@IBAction func gotTap(_ btn: UIButton) {
		
		// safely unwrap the optional button title
		guard let btnTitle = btn.currentTitle else { return }

		// make sure we are in a tab bar controller
		// get its controllers
		// make sure there are 4 tabs
		// get the 4th tab as SearchViewController
		if let tb = self.tabBarController,
		   let controllers = tb.viewControllers,
		   controllers.count == 4,
		   let resultVC = controllers[3] as? SearchViewController {
			
			// if we have not yet selected the 4th tab,
			//	the view will not yet have been loaded
			//	so make sure it is
			resultVC.loadViewIfNeeded()
			
			// call the func, passing the button title
			resultVC.doAThing(btnTitle)
			
			// switch to the 4th tab
			tb.selectedIndex = 3
		}
		
	}
	
}
class SecondViewController: UIViewController {
	
}
class ThirdViewController: UIViewController {
	
}
class SearchViewController: UIViewController {
	
	@IBOutlet var resultLabel: UILabel!
	
	func doAThing(_ str: String) {
		resultLabel.text = str
	}
	
}
