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
	
//	func searchBarSearchButtonClicked(_ searchQ: UISearchBar)
//	{
//
//		print("1 - searchBarSearchButtonClicked")
//
//		guard let btnTitle = searchQ.largeContentTitle else {
//			print("2 - FAILED to get searchQ.largeContentTitle")
//			return
//		}
//
//		print("2 - got btnTitle", btnTitle)
//
//		if let tb = self.tabBarController {
//			print("3 - got a tab bar controller reference")
//			if let controllers = tb.viewControllers {
//				print("4 - got controllers reference")
//				if controllers.count == 4 {
//					print("5 - we have 4 controllers")
//					if let resultVC = controllers[3] as? searchViewController {
//
//						print("6 - got a reference to searchViewController")
//
//						// if we have not yet selected the 4th tab,
//						//    the view will not yet have been loaded
//						//    so make sure it is
//						resultVC.loadViewIfNeeded()
//
//						// call the func, passing the button title
//						resultVC.doAthing(searchQ)
//
//						// switch to the 4th tab
//						tb.selectedIndex = 3
//
//						print("7 - we should now be at searchViewController")
//
//					} else {
//						print("6 - FAILED TO GET a reference to searchViewController")
//					}
//				} else {
//					print("5 - FAILED TO GET a reference to searchViewController")
//				}
//			} else {
//				print("4 - FAILED TO GET a reference to searchViewController")
//			}
//		} else {
//			print("3 - FAILED TO GET a reference to searchViewController")
//		}
//
//	}

	
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

class TabView: UIView {
	var shapeLayer: CAShapeLayer!
	override class var layerClass: AnyClass {
		return CAShapeLayer.self
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}
	private func commonInit() {
		shapeLayer = self.layer as? CAShapeLayer
		shapeLayer.fillColor = UIColor.clear.cgColor
		shapeLayer.strokeColor = UIColor.gray.cgColor
		shapeLayer.lineWidth = 1
	}
	override func layoutSubviews() {
		super.layoutSubviews()
		
		let middleRad: CGFloat = bounds.height - 10.0
		
		let cornerRad: CGFloat = 12.0
		
		let pth = UIBezierPath()
		
		let topLeftC: CGPoint = CGPoint(x: bounds.minX + cornerRad, y: bounds.minY + cornerRad)
		let topRightC: CGPoint = CGPoint(x: bounds.maxX - cornerRad, y: bounds.minY + cornerRad)
		let botRightC: CGPoint = CGPoint(x: bounds.maxX - cornerRad, y: bounds.maxY - cornerRad)
		let botLeftC: CGPoint = CGPoint(x: bounds.minX + cornerRad, y: bounds.maxY - cornerRad)

		var pt: CGPoint!

		// 1
		pt = CGPoint(x: bounds.minX, y: bounds.minY + cornerRad)
		pth.move(to: pt)
		
		// c1
		pth.addArc(withCenter: topLeftC, radius: cornerRad, startAngle: .pi * 1.0, endAngle: .pi * 1.5, clockwise: true)

		// 2
		pt = CGPoint(x: bounds.midX - middleRad, y: bounds.minY)
		pth.addLine(to: pt)

		// c2
		pt.y += middleRad * 0.5
		pth.addArc(withCenter: pt, radius: middleRad * 0.5, startAngle: -.pi * 0.5, endAngle: 0.0, clockwise: true)
		
		// c3
		pt.x += middleRad * 1.0
		pth.addArc(withCenter: pt, radius: middleRad * 0.5, startAngle: .pi * 1.0, endAngle: 0.0, clockwise: false)
		
		// c4
		pt.x += middleRad * 1.0
		pth.addArc(withCenter: pt, radius: middleRad * 0.5, startAngle: .pi * 1.0, endAngle: .pi * 1.5, clockwise: true)

		// 3
		pt = CGPoint(x: bounds.maxX - cornerRad, y: bounds.minY)
		pth.addLine(to: pt)

		// c5
		pth.addArc(withCenter: topRightC, radius: cornerRad, startAngle: -.pi * 0.5, endAngle: 0.0, clockwise: true)

		// 4
		pt = CGPoint(x: bounds.maxX, y: bounds.maxY - cornerRad)
		pth.addLine(to: pt)
		
		// c6
		pth.addArc(withCenter: botRightC, radius: cornerRad, startAngle: 0.0, endAngle: .pi * 0.5, clockwise: true)
		
		// 5
		pt = CGPoint(x: bounds.minX + cornerRad, y: bounds.maxY)
		pth.addLine(to: pt)
		
		// c7
		pth.addArc(withCenter: botLeftC, radius: cornerRad, startAngle: .pi * 0.5, endAngle: .pi * 1.0, clockwise: true)
		
		pth.close()
		
		shapeLayer.path = pth.cgPath
		
		return()
/*
 //let r: CGFloat = 20
 
 var pt1: CGPoint!
 var pt2: CGPoint!

		pt2 = pt1
		pt2.y = bounds.minY
		pt2.x = bounds.midX - gap * 1.0
		pth.addLine(to: pt2)
		
		pt2.y += gap * 0.5
		pth.addArc(withCenter: pt2, radius: gap * 0.5, startAngle: -.pi * 0.5, endAngle: 0.0, clockwise: true)

		pt2.x += gap * 1.0
		pth.addArc(withCenter: pt2, radius: gap * 0.5, startAngle: .pi * 1.0, endAngle: 0.0, clockwise: false)

		pt2.x += gap * 1.0
		//pt2.y -= gap * 0.25
		pth.addArc(withCenter: pt2, radius: gap * 0.5, startAngle: .pi * 1.0, endAngle: .pi * 1.5, clockwise: true)

		pt1 = CGPoint(x: bounds.maxX, y: bounds.minY)
		pth.addLine(to: pt1)

		pt1 = CGPoint(x: bounds.maxX, y: bounds.maxY)
		pth.addLine(to: pt1)
		
		pt1 = CGPoint(x: bounds.minX, y: bounds.maxY)
		pth.addLine(to: pt1)
		
		pth.close()
		
		shapeLayer.path = pth.cgPath
		
		return()

		pt1 = CGPoint(x: bounds.minX, y: bounds.maxY)
		pth.move(to: pt1)
		
		pt1.y = bounds.minY + r
		pt2 = pt1
		pt2.x = bounds.minX + r
		pth.addArc(withCenter: pt2, radius: r, startAngle: .pi, endAngle: .pi * 1.5, clockwise: true)
		
		pt1.x = bounds.midX - r
		pt1.y = bounds.minY
		pth.addLine(to: pt1)
		
		pt2 = pt1
		pt2.y = bounds.minY + r
		pth.addArc(withCenter: pt2, radius: r, startAngle: .pi * 1.5, endAngle: .pi * 2.0, clockwise: true)
		
		pt1.x = bounds.midX
		pt1.y = bounds.midY - r
		pth.addLine(to: pt1)
		
		pt2 = pt1
		pt2.x = bounds.midX + r
		pth.addArc(withCenter: pt2, radius: r, startAngle: .pi, endAngle: .pi * 0.5, clockwise: false)
		
		pt1.x = bounds.maxX
		pt1.y = bounds.midY
		pth.addLine(to: pt1)
		
		pt1.y = bounds.maxY
		pth.addLine(to: pt1)
		
		pth.close()
		
		shapeLayer.path = pth.cgPath
*/
	}
}
