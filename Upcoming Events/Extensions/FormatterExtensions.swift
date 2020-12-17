//
//  FormatterExtensions.swift
//
//  Created by Chris Schultz on 9/27/20.
//  Copyright © 2020 Chris Schultz. All rights reserved.
//

import UIKit

extension Formatter {
	static let fullDate: DateFormatter = {
		let formatter = DateFormatter()
		formatter.calendar = Calendar(identifier: .iso8601)
		formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.dateFormat = "MMMM d, yyyy h:mm a"
		return formatter
	}()
	
	static let hoursMinutes: DateFormatter = {
		let formatter = DateFormatter()
		formatter.calendar = Calendar(identifier: .iso8601)
		formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.dateFormat = "h:mm a"
		return formatter
	}()
}
