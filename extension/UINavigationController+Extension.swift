//
//  UINavigationController+Extension.swift
//
//  Created by winterviolet12 on 2019/12/19.
//  Copyright © 2019 winterviolet12. All rights reserved.
//

import UIKit

public extension UINavigationController {
	
	/// Push to ViewController with completion
	/// - Parameters:
	/// 	- viewController: `UIViewController` to push
	///		- animated: animate or not `Bool` default is true
	///		- completion: after pushing to `UIViewControoler`
	func pushViewController(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void) {
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		pushViewController(viewController, animated: animated)
		CATransaction.commit()
	}

	/// Pop from current ViewController with completion
	/// - Parameters:
	///		- animated: animate or not `Bool`. default is `true`
	///		 - completion: after popping from current ViewController
	func popViewController(animated: Bool = true, completion: @escaping () -> Void) {
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		popViewController(animated: animated)
		CATransaction.commit()
	}

	/// Pop to RootViewControoler with completion
	/// - Parameters:
	/// 	- animated: animate or not `Bool`. default is `true`
	/// 	- completion: after popping to RootViewController
	func popToRootViewController(animated: Bool = true, completion: @escaping () -> Void) {
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		popToRootViewController(animated: animated)
		CATransaction.commit()
	}
}
