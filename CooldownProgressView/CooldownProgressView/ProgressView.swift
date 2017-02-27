//
//  ProgressView.swift
//  CooldownProgressView
//
//  Created by 史　翔新 on 2017/02/27.
//  Copyright © 2017年 Crazism. All rights reserved.
//

import UIKit

class ProgressView: UIView {
	
	var progress: CGFloat = 0 {
		didSet {
			self.setNeedsDisplay()
		}
	}
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		self.drawPie(rect: rect)
	}
	
	private func drawPie(rect: CGRect) {
		
		guard let context = UIGraphicsGetCurrentContext() else {
			return
		}
		
		let fillProgress = 1 - self.progress
		let fillColor = UIColor(white: 0, alpha: 0.5).cgColor
		let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
		let radius = max(rect.width, rect.height) * sqrt(2)
		let startRadian: CGFloat = 0 - (.pi * 0.5)
		let endRadian: CGFloat = (fillProgress * .pi * 2) - (.pi * 0.5)
		
		context.setFillColor(fillColor)
		context.move(to: center)
		context.addArc(center: center, radius: radius, startAngle: startRadian, endAngle: endRadian, clockwise: false)
		context.fillPath()
		
	}
	
}
