//
//  StatusMenuController.swift
//  Calendar
//
//  Created by Stephanie Baker on 2020-07-29.
//  Copyright © 2020 Stephanie Baker. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
	@IBOutlet weak var statusMenu: NSMenu!
	
	let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
	
	@IBAction func quitClicked(_ sender: NSMenuItem) {
		NSApplication.shared.terminate(self)
	}
	
	override func awakeFromNib() {
		let date = Date()
		let myCalendar = Calendar(identifier: .gregorian)
		let weekDay = myCalendar.component(.weekday, from: date)
		let month = myCalendar.component(.month, from: date)
		let year = myCalendar.component(.year, from: date)
		let day = myCalendar.component(.day, from: date)
		
		let days = ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"]
		let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"]
		
		statusItem.button?.title = "🌍 \(days[weekDay-1]), \(months[month-1]) \(day) \(year) 🌏"
		statusItem.menu = statusMenu
	}
}
