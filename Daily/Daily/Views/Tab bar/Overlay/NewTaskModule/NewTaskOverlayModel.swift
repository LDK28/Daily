//
//  NewTaskModel.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

/*

	Initializing models to configure table view cells
		
*/

enum NewTaskViewModelItemType {
   case dateAndTime
   case remindAlert
   case repeatSelector
}

protocol NewTaskViewModelItem {
	var type: NewTaskViewModelItemType { get }
	var rowCount: Int { get }
	var symbolImage: UIImage? { get }
	var tileColor: UIColor { get }
	var symbolColor: UIColor { get }
}

extension NewTaskViewModelItem {
	var rowCount: Int {
		switch type {
		case .dateAndTime:
			return 2
		default:
			return 1
		}
	}
	
	var symbolColor: UIColor {
		return .white
	}
}

// Handy absract class that helps us to prevent copy paste code
class NewTaskViewModelTemplate {
	var symbolImage: UIImage?
	
	required init(symbolName: String) {
		guard let symbol = UIImage(systemName: symbolName) else {
			symbolImage = nil
			return
		}
		self.symbolImage = symbol
	}
}

//MARK: Date and time
//TODO: proper division of two cells

class NewTaskViewModelDateAndTimeItem: NewTaskViewModelTemplate, NewTaskViewModelItem {
	var tileColor: UIColor {
		return .dailyAdaptiveRed
	}
	
	var type: NewTaskViewModelItemType {
		return .dateAndTime
	}
	
	let dateTitle = "Date"
	let setDate: String? = nil
	
	let timeTitle = "Time"
	let setTime: String? = nil
	
	required init(symbolName: String) {
		super.init(symbolName: symbolName)
	}
}

//MARK: Reminder (on or off)

class NewTaskViewModelRemindAlertItem: NewTaskViewModelTemplate, NewTaskViewModelItem {
	var tileColor: UIColor {
		return .dailyAdaptiveYellow
	}
	
	var type: NewTaskViewModelItemType {
		return .remindAlert
	}
	
	let title = "Remind"
	
	required init(symbolName: String) {
		super.init(symbolName: symbolName)
	}
}

//MARK: Repeat (never or set interval)

class NewTaskViewModelRepeatSelectorItem: NewTaskViewModelTemplate, NewTaskViewModelItem {
	var tileColor: UIColor {
		return .dailyAdaptiveGreen
	}
	
	var type: NewTaskViewModelItemType {
		return .repeatSelector
	}
	
	let title = "Repeat"
	
	required init(symbolName: String) {
		super.init(symbolName: symbolName)
	}
}

// The main model that will hold all our table cells
class ProfileViewModel: NSObject {
   var items = [
		NewTaskViewModelDateAndTimeItem(symbolName: "calendar.badge.clock"),
		NewTaskViewModelRemindAlertItem(symbolName: "alarm.fill"),
		NewTaskViewModelRepeatSelectorItem(symbolName: "repeat"),
	]
	
}
