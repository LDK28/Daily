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
	var icon: Icon { get }
	var text: UIView { get }
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
	
	var text: UIView {
		switch type {
		case .dateAndTime:
			return UIStackView()
		default:
			return UILabel()
		}
	}
}

//MARK: Date and time

class NewTaskViewModelDateAndTimeItem: NewTaskViewModelItem {
	var type: NewTaskViewModelItemType {
		return .dateAndTime
	}
	
	var icon: Icon {
		return Icon(symbolName: "calendar.badge.clock", tileColor: .dailyAdaptiveRed)
	}
	
	var secondaryIcon: Icon {
		return Icon(symbolName: "clock.fill", tileColor: .dailyAdaptiveBlue)
	}
	var secondaryText = UIStackView()
	
}

//MARK: Reminder (on or off)

class NewTaskViewModelRemindAlertItem: NewTaskViewModelItem {
	var type: NewTaskViewModelItemType {
		return .remindAlert
	}
	
	var icon: Icon {
		return Icon(symbolName: "alarm.fill", tileColor: .dailyAdaptiveYellow)
	}
}

//MARK: Repeat (never otherwise set interval)

class NewTaskViewModelRepeatSelectorItem: NewTaskViewModelItem {
	var type: NewTaskViewModelItemType {
		return .repeatSelector
	}
	
	var icon: Icon {
		return Icon(symbolName: "repeat", tileColor: .dailyAdaptiveGreen)
	}
	
	
}

// MARK: The main model that will hold all our table cells

class ProfileViewModel: NSObject {
	var items: [NewTaskViewModelItem] = [
		NewTaskViewModelDateAndTimeItem(),
		NewTaskViewModelRemindAlertItem(),
		NewTaskViewModelRepeatSelectorItem()
	]
}
