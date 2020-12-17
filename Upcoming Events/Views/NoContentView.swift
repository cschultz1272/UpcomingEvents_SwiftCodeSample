//
//  NoContentView.swift
//
//  Created by Chris Schultz on 9/27/20.
//  Copyright © 2020 Chris Schultz. All rights reserved.
//

import UIKit

// Show this view if there's no data in the json file

class NoContentView: UIView {
	let noContentLabel = UILabel()
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		noContentLabel.translatesAutoresizingMaskIntoConstraints = false
		noContentLabel.text = "No Upcoming Events"
		noContentLabel.font = UIFont.systemFont(ofSize: 30)
		
		addSubview(noContentLabel)
		
		let noContentLabelConstraints = [
			noContentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 200),
			noContentLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
		]
		
		NSLayoutConstraint.activate(noContentLabelConstraints)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
