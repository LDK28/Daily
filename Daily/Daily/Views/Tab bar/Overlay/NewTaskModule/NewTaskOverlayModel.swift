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

struct Icon {
	var tileColor: UIColor
	var symbol: UIImage?
	
	init(symbolName: String, tileColor: UIColor, symbolColor: UIColor = .white) {
		self.tileColor = tileColor
		
		guard let symbol = UIImage(systemName: symbolName) else {
			self.symbol = nil
			return
		}
		
		self.symbol = symbol
		self.symbol = self.symbol!.withTintColor(symbolColor)
	}
}

enum NewTaskViewModelItemType {
	case dateAndTime
	case remindAlert
	case repeatSelector
}

protocol NewTaskViewModelItem {
	var type: NewTaskViewModelItemType { get }
	var rowCount: Int { get }
}

protocol NewTaskViewModelComponent {
	var textView: UIView { get }
	var icon: Icon { get }
}

//Default values
extension NewTaskViewModelItem {
	var rowCount: Int {
		switch type {
		case .dateAndTime:
			return 2
		default:
			return 1
		}
	}
}

class DailyComponent: NewTaskViewModelComponent {
	var textView: UIView
	var icon: Icon
	
	init(textView: UIView, icon: Icon) {
		self.icon = icon
		self.textView = textView
	}
}

//MARK: Date and time

class NewTaskViewModelDateAndTimeItem: NewTaskViewModelItem {
	var type: NewTaskViewModelItemType {
		return .dateAndTime
	}
	
	var components: [DailyComponent] = [
		DailyComponent(textView: UIStackView(), icon: Icon(symbolName: "calendar.badge.clock", tileColor: .dailyAdaptiveRed)),
		DailyComponent(textView: UIStackView(), icon: Icon(symbolName: "clock.fill", tileColor: .dailyAdaptiveBlue))
	]
}

//MARK: Reminder (on or off)

class NewTaskViewModelRemindAlertItem: NewTaskViewModelItem {
	var type: NewTaskViewModelItemType {
		return .remindAlert
	}
	
	var component = DailyComponent(textView: UILabel(), icon: Icon(symbolName: "alarm.fill", tileColor: .dailyAdaptiveYellow))
}

//MARK: Repeat (never otherwise set interval)

class NewTaskViewModelRepeatSelectorItem: NewTaskViewModelItem {
	var type: NewTaskViewModelItemType {
		return .repeatSelector
	}
	
	var component = DailyComponent(textView: UILabel(), icon: Icon(symbolName: "repeat", tileColor: .dailyAdaptiveGreen))
}

// MARK: The main model that will hold all our table cells

class NewTaskViewModel {
	var items: [NewTaskViewModelItem] = [
		NewTaskViewModelDateAndTimeItem(),
		NewTaskViewModelRemindAlertItem(),
		NewTaskViewModelRepeatSelectorItem()
	]
}
