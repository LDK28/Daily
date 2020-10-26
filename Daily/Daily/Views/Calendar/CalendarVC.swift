//
//  CalendaeVC.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//

import UIKit
import FSCalendar

class CalendarVC: MainVC, FSCalendarDelegate, FSCalendarDataSource {

    var calendarView = UIView()
    var calendar = FSCalendar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
        calendar.delegate = self
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        calendarView.frame = CGRect(x: 20, y: 44, width: view.frame.size.width - 40, height: view.frame.size.width)
        calendarView.backgroundColor = .dailyCalendarBackground
        calendarView.layer.cornerRadius = 10
        view.addSubview(calendarView)
        
        calendar.frame = CGRect(x: 30, y: 44, width: view.frame.size.width - 60, height: view.frame.size.width)
        calendar.appearance.titleFont = UIFont(name: "Stolzl-Book", size: 15)
        calendar.appearance.weekdayFont = UIFont(name: "Stolzl-Book", size: 15)
        calendar.appearance.weekdayTextColor = .systemGray
        calendar.appearance.subtitleFont = UIFont(name: "Stolzl-Book", size: 15)
        calendar.appearance.headerTitleFont = UIFont(name: "Stolzl-Regular", size: 18)
        calendar.appearance.headerTitleColor = .dailyTextColor
        calendar.appearance.todayColor = .systemRed
        calendar.appearance.selectionColor = .systemGray
        
        view.addSubview(calendar)
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "EEEE dd.MM.YYYY"
//        let selectedDate = (formatter.string(from: date)).split(separator: " ")
//        let dayOfTheWeek = String(selectedDate[0])
//        dateLabel.text = dayOfTheWeek
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
