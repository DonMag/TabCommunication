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
			//resultVC.doAThing(btnTitle)
			
			// switch to the 4th tab
			tb.selectedIndex = 3
		}
		
	}
	
	func searchBarSearchButtonClicked(_ searchQ: UISearchBar)
	{
		
		print("1 - searchBarSearchButtonClicked")
		
		guard let btnTitle = searchQ.largeContentTitle else {
			print("2 - FAILED to get searchQ.largeContentTitle")
			return
		}
		
		print("2 - got btnTitle", btnTitle)
		
		if let tb = self.tabBarController {
			print("3 - got a tab bar controller reference")
			if let controllers = tb.viewControllers {
				print("4 - got controllers reference")
				if controllers.count == 4 {
					print("5 - we have 4 controllers")
					if let resultVC = controllers[3] as? searchViewController {
						
						print("6 - got a reference to searchViewController")

						// if we have not yet selected the 4th tab,
						//    the view will not yet have been loaded
						//    so make sure it is
						resultVC.loadViewIfNeeded()
						
						// call the func, passing the button title
						resultVC.doAthing(searchQ)
						
						// switch to the 4th tab
						tb.selectedIndex = 3

						print("7 - we should now be at searchViewController")
						
					} else {
						print("6 - FAILED TO GET a reference to searchViewController")
					}
				} else {
					print("5 - FAILED TO GET a reference to searchViewController")
				}
			} else {
				print("4 - FAILED TO GET a reference to searchViewController")
			}
		} else {
			print("3 - FAILED TO GET a reference to searchViewController")
		}
		
	}

	
}
class SecondViewController: UIViewController {
	
}
class ThirdViewController: UIViewController {
	
}
class SearchViewController: UIViewController {
	
	@IBOutlet var resultLabel: UILabel!
	
//	func doAThing(_ str: String) {
//		resultLabel.text = str
//	}
	func doAthing(_ sb: UISearchBar) {
		
	}
	
}
