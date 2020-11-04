//
//  FSCalendarExtension.swift
//  Daily
//
//  Created by julie on 04.11.2020.
//

import FSCalendar

extension FSCalendar {
    func styleCalendar(backgroundColor: UIColor, titleFont: UIFont, headerTitleFont: UIFont) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 10
        self.appearance.titleFont = titleFont
        self.appearance.titleDefaultColor = .dailyTextColor
        self.appearance.weekdayFont = titleFont
        self.appearance.weekdayTextColor = .systemGray
        self.appearance.headerTitleFont = headerTitleFont
        self.appearance.headerTitleColor = .dailyTextColor
        self.appearance.todayColor = .systemRed
        self.appearance.selectionColor = .systemGray
        
    }
}
