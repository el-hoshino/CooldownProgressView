//
//  ProgressRepresentable.swift
//  CooldownProgressView
//
//  Created by 史　翔新 on 2017/03/06.
//  Copyright © 2017年 Crazism. All rights reserved.
//

import UIKit

public protocol CooldownProgressRepresentable: class {
	
	var progressView: ProgressView { get }
	
	var progress: CGFloat { get set }
	
}

extension CooldownProgressRepresentable where Self: UIView {
	
	private func setupSubview(_ subview: UIView) {
		subview.frame = self.bounds
		subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		self.addSubview(subview)
	}
	
	public func setupProgressView() {
		let subview = self.progressView
		subview.frame = self.bounds
		subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		self.addSubview(subview)
	}
	
}

extension CooldownProgressRepresentable {
	
	public func setProgress(to newProgress: CGFloat, within duration: TimeInterval? = nil, completion: (() -> Void)? = nil) {
		self.progress = newProgress
		self.progressView.updateProgress(to: newProgress, within: duration, completion: completion)
	}
	
}
