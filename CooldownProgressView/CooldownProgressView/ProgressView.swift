//
//  ProgressView.swift
//  CooldownProgressView
//
//  Created by 史　翔新 on 2017/02/27.
//  Copyright © 2017年 Crazism. All rights reserved.
//

import UIKit

public final class ProgressView: UIView {
	
	override public class var layerClass: AnyClass {
		return CAShapeLayer.self
	}
	
	var shapeLayer: CAShapeLayer {
		guard let layer = self.layer as? CAShapeLayer else { fatalError("Layer is not CALayer!") }
		return layer
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupView()
		self.setupShapeLayer()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override public func layoutSubviews() {
		super.layoutSubviews()
		self.updateShapeLayerFrame()
	}
	
}

extension ProgressView {
	
	fileprivate func setupView() {
		
		self.isUserInteractionEnabled = false
		self.backgroundColor = .clear
		self.clipsToBounds = true
		
	}
	
	fileprivate func setupShapeLayer() {
		
		self.layer.backgroundColor = UIColor.clear.cgColor
		self.shapeLayer.strokeStart = 0
		self.shapeLayer.strokeEnd = 1
		self.shapeLayer.strokeColor = UIColor(white: 0, alpha: 0.5).cgColor
		self.shapeLayer.fillColor = UIColor.clear.cgColor
		
	}
	
}

extension ProgressView {
	
	fileprivate func updateShapeLayerFrame() {
		
		let lineWidth = max(self.bounds.width, self.bounds.height)
		let center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
		let radius = max(self.bounds.width, self.bounds.height) / 2
		
		self.shapeLayer.lineWidth = lineWidth
		self.shapeLayer.path = UIBezierPath(arcCenter: center,
		                                    radius: radius,
		                                    startAngle: .pi * -0.5,
		                                    endAngle: .pi * 1.5,
		                                    clockwise: true).cgPath
		
	}
	
}

extension ProgressView {
	
	private func animateProgress(to fillProgress: CGFloat, within duration: TimeInterval, completion: (() -> Void)?) {
		
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		
		let animationKeyPath = "strokeEnd"
		let animation = CABasicAnimation(keyPath: animationKeyPath)
		animation.fromValue = self.shapeLayer.current.value(forKey: animationKeyPath)
		animation.toValue = fillProgress
		animation.duration = duration
		animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.215, 0.61, 0.355, 1)
		self.shapeLayer.add(animation, forKey: "updateProgress")
		self.shapeLayer.strokeEnd = fillProgress
		
		CATransaction.commit()
		
	}
	
	private func setProgress(to fillProgress: CGFloat, completion: (() -> Void)?) {
		self.shapeLayer.strokeEnd = fillProgress
		completion?()
	}
	
	func updateProgress(to newProgress: CGFloat, within duration: TimeInterval?, completion: (() -> Void)? = nil) {
				
		let fillProgress = 1 - newProgress
		
		if let duration = duration {
			self.animateProgress(to: fillProgress, within: duration, completion: completion)
			
		} else {
			self.setProgress(to: fillProgress, completion: completion)
		}
		
	}
	
}

private extension CALayer {
	
	var current: CALayer {
		return self.presentation() ?? self
	}
	
}
