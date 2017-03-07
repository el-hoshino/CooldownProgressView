//
//  CooldownProgressView.swift
//  CooldownProgressView
//
//  Created by 史　翔新 on 2017/02/27.
//  Copyright © 2017年 Crazism. All rights reserved.
//

import UIKit

open class CooldownProgressView: UIView, CooldownProgressRepresentable {
	
	fileprivate let imageView = UIImageView()
	public let progressView = ProgressView()
	
	public var image: UIImage? {
		get {
			return self.imageView.image
		}
		set {
			self.imageView.image = newValue
		}
	}
	
	public var progress: CGFloat = 1
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
		self.setupImageView()
		self.setupProgressView()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupImageView()
		self.setupProgressView()
	}
	
	convenience public init() {
		self.init(frame: .zero)
	}
	
	private func setupImageView() {
		let view = self.imageView
		view.frame = self.bounds
		view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		self.addSubview(view)
	}
	
}
