//
//  DateExtensions.swift
//
//  Created by Chris Schultz on 9/27/20.
//  Copyright © 2020 Chris Schultz. All rights reserved.
//

import UIKit

extension Date {
	func hour() -> Int {
		return Calendar.current.component(.hour, from: self)
	}
	
	func reduceToMonthDayYear() -> Date {
		let calendar = Calendar.current
		let month = calendar.component(.month, from: self)
		let day = calendar.component(.day, from: self)
		let year = calendar.component(.year, from: self)
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MM/dd/yyyy"
		return dateFormatter.date(from: "\(month) \(day), \(year)") ?? Date()
	}
	
	func reduceToHourMinute() -> Date {
		let calendar = Calendar.current
		let hour = calendar.component(.hour, from: self)
		let minute = calendar.component(.minute, from: self)
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "hh:mm"
		return dateFormatter.date(from: "\(hour):\(minute)") ?? Date()
	}
}
