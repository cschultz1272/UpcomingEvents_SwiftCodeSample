//
//  SectionDateView.swift
//
//  Created by Chris Schultz on 9/27/20.
//  Copyright © 2020 Chris Schultz. All rights reserved.
//

import UIKit

class SectionDateView: UIView {
	
	let event: Event

    required init(event: Event){
		self.event = event
        super.init(frame: CGRect.zero)
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MMM dd, yyyy"
		let dateString = dateFormatter.string(from: event.start)
		
		let label = SectionDateLabel()
		label.text = dateString
		addSubview(label)
		
		let labelConstraints = [
		label.centerXAnchor.constraint(equalTo: centerXAnchor),
		label.centerYAnchor.constraint(equalTo: centerYAnchor),
		]
		
		NSLayoutConstraint.activate(labelConstraints)
			
    }
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
