//
//  EventListController.swift
//
//  Created by Chris Schultz on 9/26/20.
//  Copyright © 2020 Chris Schultz. All rights reserved.
//

import UIKit

class EventListController: UITableViewController {
	fileprivate let cellId = "id"
	fileprivate var events = [[Event]]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureViews()
	}
	
	private func configureViews() {
		navigationItem.title = "Events"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.hidesBarsOnSwipe = true
		
		tableView.register(EventListCell.self, forCellReuseIdentifier: cellId)
		tableView.separatorStyle = .none
		
		loadJson()
		
		if events.count == 0 {
			tableView.backgroundView = NoContentView()
		}
	}
	
	private func loadJson() {
		if let url = Bundle.main.url(forResource: "mock", withExtension: "json") {
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .monthDayYearTime
			do {
				let data = try Data(contentsOf: url)
				let decodedEvents = try decoder.decode([Event].self, from: data)
				markConflicts(arr: decodedEvents)
			} catch {
				print(error)
			}
		}
	}
	
	private func markConflicts(arr: [Event]) {
		var conflictedEvents = arr
		conflictedEvents.sort()
		var latestIndex = 0
		// This algorithm keeps track of the current latest end time
		// and compares that to the next events start time to determine if there are conflicting events
		// runtime complexity is O(n)
		for (index, element) in conflictedEvents.enumerated().dropFirst() {
			if element.start < conflictedEvents[latestIndex].end {
				conflictedEvents[index].setHasConflict(status: true)
				conflictedEvents[latestIndex].setHasConflict(status: true)
				
			}
			if element.end > conflictedEvents[latestIndex].end {
				latestIndex = index
			}
			
		}
		groupEvents(arr: conflictedEvents)
	}
	
	private func groupEvents(arr: [Event]) {
		// Group events by month/day/year
		let ungroupedEvents = arr
		let groupedEvents = Dictionary(grouping: ungroupedEvents) { (element) -> Date in
			return element.start.reduceToMonthDayYear()
		}
		
		let sortedKeys = groupedEvents.keys.sorted()
		for key in sortedKeys {
			if let value = groupedEvents[key] {
				events.append(value)
			}
		}
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return events.count
	}
	
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		if let event = events[section].first {
			return SectionDateView(event: event)
		}
		return nil
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return events[section].count
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 70
	}
	
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 50
	}

	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EventListCell
		cell.event = events[indexPath.section][indexPath.row]
		return cell
	}
	
	
}

