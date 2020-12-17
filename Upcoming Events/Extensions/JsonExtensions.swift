//
//  JsonExtensions.swift
//
//  Created by Chris Schultz on 9/27/20.
//  Copyright © 2020 Chris Schultz. All rights reserved.
//

import UIKit

extension JSONDecoder.DateDecodingStrategy {
	static let monthDayYearTime = custom {
		let container = try $0.singleValueContainer()
		let string = try container.decode(String.self)
		guard let date = Formatter.fullDate.date(from: string) else {
			throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: " + string)
		}
		return date
	}
}
