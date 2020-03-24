//
//  UIImage+Extension.swift
//  OnlineTourForiOS
//
//  Created by prehacke on 2020/03/23.
//  Copyright © 2020 OnlineTour. All rights reserved.
//

import UIKit
import Kingfisher

public extension UIImageView {
	/// setImage from URLString in cache or not.
	/// if not in cache get Image from given URL
	/// - Parameters:
	/// 	- urlString: image `URL` `String`
	func setImage(with urlString: String) {
		ImageCache.default.retrieveImage(forKey: urlString,
										 options: nil,
										 callbackQueue: CallbackQueue.mainAsync) { (result) in
											switch result {
											case .success(let image):
												switch(image.cacheType) {
												// 캐시 이미지 존재 disk, memory
												case .disk, .memory:
													self.image = image.image
													break
													
												// 캐시 이미지 없는 경우
												case .none:
													let url = URL.init(string: urlString)!
													let resource = ImageResource(downloadURL: url, cacheKey: urlString)
													self.kf.setImage(with: resource)
													break
												}
												break
												
											case .failure(let image):
												print("RetrieveImage Fail : \(image.errorCode)")
												break
											}
										}
	}
}
