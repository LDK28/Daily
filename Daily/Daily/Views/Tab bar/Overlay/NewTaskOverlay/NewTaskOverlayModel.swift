//
//  NewTaskModel.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

enum RepeatSchedule {
	case day, week, month, year, never
}

class NewTaskOverlayDataSource: OverlayDataSource {
	var shouldRemind = false
	var repeatSchedule: RepeatSchedule = .never
}
