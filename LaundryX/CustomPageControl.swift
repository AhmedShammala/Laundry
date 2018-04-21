//
//  CustomPageControl.swift
//
//  Created by Yuichiro on 2015/06/21.
//  Copyright © 2015年 Yu-ichiro. All rights reserved.
//

import UIKit

class CustomPageControl: UIPageControl {
	
	var customImages: [ CGImage? ]? = nil
	func setMaskImageForIndex(_ maskImage:UIImage, index:Int) {
		self.customImages = Array(repeating: nil, count: self.numberOfPages)
		
		let pw = maskImage.size.width * maskImage.scale
		let ph = maskImage.size.height * maskImage.scale
		let bitmapBytesPerRow = (pw * 1.0)
		let context = CGContext(data: nil, width: Int(pw), height: Int(ph), bitsPerComponent: (maskImage.cgImage?.bitsPerComponent)!, bytesPerRow: Int(bitmapBytesPerRow), space: CGColorSpaceCreateDeviceGray(), bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.alphaOnly.rawValue).rawValue)
		context?.translateBy(x: 0.0, y: ph)
		context?.scaleBy(x: 1.0, y: -1.0)
		
		context?.draw(maskImage.cgImage!, in: CGRect(x: 0, y: 0, width: pw, height: ph))
		let mi: CGImage = context!.makeImage()!
		
		self.customImages![index] = mi
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
	}
	
	override func draw(_ rect: CGRect) {
		if customImages == nil { return }
		var index = 0
		for indicator:UIView in self.subviews {
			indicator.alpha = 1.0
			if customImages![index] != nil {
				indicator.alpha = 0.0
				var fill: UIColor? = nil
				if index == self.currentPage {
					fill = self.currentPageIndicatorTintColor != nil ? self.currentPageIndicatorTintColor! : UIColor.white
				} else {
					fill = self.pageIndicatorTintColor != nil ? self.pageIndicatorTintColor! : UIColor.white.withAlphaComponent(0.3)
				}
				fill?.set()
				let frame = CGRect(x: (indicator.frame.origin.x + indicator.frame.size.width/2.0)-6.0, y: (indicator.frame.origin.y + indicator.frame.size.height/2.0)-6.0, width: 12.0, height: 12.0)
				UIGraphicsGetCurrentContext()?.draw(customImages![index]!, in: frame)
			}
			index += 1
		}
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesEnded(touches, with: event)
		self.setNeedsDisplay()
	}
	
	func updatePage(_ newPage: Int) {
		self.currentPage = newPage
		self.setNeedsDisplay()
	}
}
