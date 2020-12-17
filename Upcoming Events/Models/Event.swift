//
//  Event.swift
//
//  Created by Chris Schultz on 9/27/20.
//  Copyright © 2020 Chris Schultz. All rights reserved.
//

import UIKit

struct Event: Codable, Equatable {
	let title: String
	let start: Date
	let end: Date
	var hasConflict: Bool? = false
	
	mutating func setHasConflict(status: Bool) {
		hasConflict = status
	}
}

extension Event: Comparable {
	static func < (eventOne: Event, eventTwo: Event) -> Bool { eventOne.start < eventTwo.start }
}
