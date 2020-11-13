//
//  NewTaskModel.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

enum RepeatSchedule {
	case day, week, month, year
}

class NewTaskOverlayDataSource: OverlayDataSource {
	var shouldRemind = false
	var repearSchedule: RepeatSchedule?
}
