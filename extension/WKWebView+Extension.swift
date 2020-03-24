//
//  WKWebView+Extension.swift
//
//  Created by prehacke on 2019/12/23.
//  Copyright © 2019 winterviolet12. All rights reserved.
//

import UIKit
import WebKit

public extension WKWebView {

	/// load URL String
	/// - Parameters:
	/// 	- urlString: `String`
	func load(urlString: String) {
        if let url = URL(string: urlString) {
			load(url: url)
		}
    }

	/// load URL
	/// - Parameters:
	/// 	- url: `URL`
    func load(url: URL) {
		load(URLRequest(url: url))
	}
	
	/// Set Item in Local Storage
	/// - Parameters:
	/// 	- key: Key `String`
	/// 	- value: Value `String`
	/// 	- completionHandler: CompletionHandler (Any?, Error?) -> Void
	func setItemInLocalStorage(_ key: String, _ value: String, _ completionHandler: ((Any?, Error?) -> Void)?) {
		self.evaluateJavaScript("window.localStorage.setItem('\(key)', '\(value)');",
			completionHandler: completionHandler)
	}

	/// Get Item from Local Storage
	/// - Parameters:
	/// 	- key: Key `String`
	/// 	- completionHandler: CompletionHandler (Any?, Error?) -> Void
	func getItemFromLocalStorage(_ key: String, _ completionHandler: ((Any?, Error?) -> Void)?) {
		self.evaluateJavaScript("window.localStorage.getItem('\(key)');",
			completionHandler: completionHandler)
	}

	/// Remove Item in Local Storage
	/// - Parameters:
	/// 	- key: Key `String`
	/// 	- completionHandler: CompletionHandler (Any?, Error?) -> Void
	func removeItemInLocalStorage(_ key: String, _ completionHandler: ((Any?, Error?) -> Void)?) {
		self.evaluateJavaScript("window.localStorage.removeItem('\(key)');",
			completionHandler: completionHandler)
	}

	/// Clear All Items in Local Storage
	/// - Parameters:
	/// 	- completionHandler: CompletionHandler (Any?, Error?) -> Void
	func clearItemInLocalStorage(_ completionHandler: ((Any?, Error?) -> Void)?) {
		self.evaluateJavaScript("window.localStorage.clear();",
								completionHandler: completionHandler)
	}
}
