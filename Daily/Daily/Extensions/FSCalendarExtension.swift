//
//  FSCalendarExtension.swift
//  Daily
//
//  Created by julie on 04.11.2020.
//

import FSCalendar

extension FSCalendar {
    func styleCalendar(backgroundColor: UIColor, titleFont: UIFont, headerTitleFont: UIFont) {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        layer.cornerRadius = 10
        appearance.titleFont = titleFont
        appearance.titleDefaultColor = .dailyTextColor
        appearance.weekdayFont = titleFont
        appearance.weekdayTextColor = .systemGray
        appearance.headerTitleFont = headerTitleFont
        appearance.headerTitleColor = .dailyTextColor
        appearance.todayColor = .systemRed
        appearance.selectionColor = .systemGray
        
    }
}
