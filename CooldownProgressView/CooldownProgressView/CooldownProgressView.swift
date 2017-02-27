//
//  CooldownProgressView.swift
//  CooldownProgressView
//
//  Created by 史　翔新 on 2017/02/27.
//  Copyright © 2017年 Crazism. All rights reserved.
//

import UIKit

public class CooldownProgressView: UIView {
	
	fileprivate let imageView = UIImageView()
	fileprivate let progressView = ProgressView()
	
	public var image: UIImage? {
		get {
			return self.imageView.image
		}
		set {
			self.imageView.image = newValue
		}
	}
	
	public var progress: CGFloat {
		get {
			return self.progressView.progress
		}
		set {
			self.progressView.progress = newValue
		}
	}
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
		self.setupView()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupView()
	}
	
	convenience public init() {
		self.init(frame: .zero)
	}
	
	private func setupSubview(_ subview: UIView) {
		subview.frame = self.bounds
		subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		self.addSubview(subview)
		
	}
	
	private func setupView() {
		self.setupSubview(self.imageView)
		self.setupSubview(self.progressView)
	}
	
}
