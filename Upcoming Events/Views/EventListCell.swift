//
//  EventListCell.swift
//
//  Created by Chris Schultz on 9/27/20.
//  Copyright © 2020 Chris Schultz. All rights reserved.
//

import UIKit


class EventListCell: UITableViewCell {
	private let titleLabel = UILabel()
	private let startLabel = UILabel()
	private let endLabel = UILabel()
	private var hasConflictImageView = UIImageView()
	public var event: Event! {
		didSet {
			titleLabel.text = event.title
			startLabel.text = Formatter.hoursMinutes.string(from: event.start)
			endLabel.text = Formatter.hoursMinutes.string(from: event.end)
			
			// Update cell to show ! image if it has a conflicting event
			if let hasConflict = event.hasConflict, hasConflict == true {
				if let bellImage = UIImage(systemName: "exclamationmark.circle.fill") {
					hasConflictImageView.image = bellImage
					hasConflictImageView.tintColor = UIColor.lightGray
				}
			}
			else {
				hasConflictImageView.image = nil
			}
			
		}
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		selectionStyle = .none
		
		// add shadow on cell
		backgroundColor = .clear
		layer.masksToBounds = false
		layer.shadowOpacity = 0.23
		layer.shadowRadius = 4
		layer.shadowOffset = CGSize(width: 0, height: 0)
		layer.shadowColor = UIColor.black.cgColor

		contentView.backgroundColor = .white
		contentView.layer.cornerRadius = 8
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		startLabel.translatesAutoresizingMaskIntoConstraints = false
		endLabel.translatesAutoresizingMaskIntoConstraints = false
		hasConflictImageView.translatesAutoresizingMaskIntoConstraints = false
		
		// This was a trade off here, if a title was very long or lengths were inconsistent
		// then showing the entire title would make the UI look messy
		// instead I chose to just show 2 lines here to keep things clean
		// if I was to continue the app further I would create a detail view to show the rest
		// but of course our mock data only has short titles so 2 lines was enough
		titleLabel.numberOfLines = 2
		titleLabel.font = UIFont.systemFont(ofSize: 16)
		startLabel.font = UIFont.systemFont(ofSize: 14)
		endLabel.font = UIFont.systemFont(ofSize: 14)
		
		addSubview(titleLabel)
		addSubview(hasConflictImageView)
		addSubview(startLabel)
		addSubview(endLabel)
		
		
		
		let titleLabelConstraints = [
		titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
		titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
		titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
		]
		
		let startLabelConstraints = [
		startLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
		startLabel.heightAnchor.constraint(equalToConstant: 15),
		startLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
		]
		
		let endLabelConstraints = [
		endLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
		endLabel.heightAnchor.constraint(equalToConstant: 15),
		endLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
		]
		
		let hasConflictImageViewConstraints = [
		hasConflictImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
		hasConflictImageView.heightAnchor.constraint(equalToConstant: 20),
		hasConflictImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100),
		]
		
		NSLayoutConstraint.activate(titleLabelConstraints)
		NSLayoutConstraint.activate(startLabelConstraints)
		NSLayoutConstraint.activate(endLabelConstraints)
		NSLayoutConstraint.activate(hasConflictImageViewConstraints)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
