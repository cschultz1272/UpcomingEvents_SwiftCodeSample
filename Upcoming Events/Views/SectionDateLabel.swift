//
//  SectionDateLabel.swift
//
//  Created by Chris Schultz on 9/27/20.
//  Copyright © 2020 Chris Schultz. All rights reserved.
//

import UIKit

class SectionDateLabel: UILabel {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .clear
		textColor = .lightGray
		textAlignment = .center
		translatesAutoresizingMaskIntoConstraints = false // enables auto layout
		font = UIFont.boldSystemFont(ofSize: 14)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override var intrinsicContentSize: CGSize {
		let originalContentSize = super.intrinsicContentSize
		let height = originalContentSize.height + 12
		layer.cornerRadius = height / 2
		layer.masksToBounds = true
		return CGSize(width: originalContentSize.width + 20, height: height)
	}
	
}
