//
//  CalendaeVC.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//

import UIKit
import FSCalendar

class CalendarVC: MainVC, FSCalendarDelegate, FSCalendarDataSource {

    var headerLabel = UILabel()
    var calendarView = FSCalendar()
    var dayView = UIView()
    var dateLabel = UILabel()
    
    override func loadView() {
        super.loadView()
		
		view.addSubview(headerLabel)
		view.addSubview(calendarView)
		view.addSubview(dayView)
        dayView.addSubview(dateLabel)
		
		configureHeaderLabel()
		configureCalendarView()
		configureDayView()
        configureDateLabel()
		
		styleHeaderLabel()
		styleCalendarView()
		styleDayView()
        styleDateLabel()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.delegate = self
    }
	
	func configureHeaderLabel() {
		NSLayoutConstraint.activate([
			headerLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16),
			headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			headerLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
		])
	}
	
	func configureCalendarView() {
		NSLayoutConstraint.activate([
			calendarView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 16),
			calendarView.centerXAnchor.constraint(equalTo: headerLabel.centerXAnchor),
			calendarView.widthAnchor.constraint(equalTo: headerLabel.widthAnchor, multiplier: 1),
			calendarView.heightAnchor.constraint(equalTo: calendarView.widthAnchor, multiplier: 1),
		])
	}
	
	func configureDayView() {
		NSLayoutConstraint.activate([
			dayView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 16),
			dayView.centerXAnchor.constraint(equalTo: calendarView.centerXAnchor),
			dayView.widthAnchor.constraint(equalTo: calendarView.widthAnchor, multiplier: 1),
			dayView.heightAnchor.constraint(equalTo: calendarView.widthAnchor, multiplier: 0.5)
		])
	}
    
    func configureDateLabel() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: dayView.layoutMarginsGuide.topAnchor, constant: 10),
            dateLabel.centerXAnchor.constraint(equalTo: dayView.centerXAnchor),
            dateLabel.widthAnchor.constraint(equalTo: dayView.widthAnchor, multiplier: 0.9),
        ])
    }
	
	
	func styleHeaderLabel() {
		headerLabel.translatesAutoresizingMaskIntoConstraints = false
		headerLabel.font = UIFont(name: "Stolzl-Bold", size: 36)
		headerLabel.textColor = .dailyTitleTextColor
		addShadow(to: headerLabel)
		headerLabel.textAlignment = .center
		headerLabel.text = "Calendar"
	}
	
	func styleCalendarView() {
		calendarView.translatesAutoresizingMaskIntoConstraints = false
		calendarView.backgroundColor = .dailyCalendarBackgroundColor
		calendarView.layer.cornerRadius = 10
		addShadow(to: calendarView)
		calendarView.appearance.titleFont = UIFont(name: "Stolzl-Book", size: 15)
		calendarView.appearance.titleDefaultColor = .dailyTextColor
		calendarView.appearance.weekdayFont = UIFont(name: "Stolzl-Book", size: 15)
		calendarView.appearance.weekdayTextColor = .systemGray
		calendarView.appearance.headerTitleFont = UIFont(name: "Stolzl-Regular", size: 18)
		calendarView.appearance.headerTitleColor = .dailyTextColor
		calendarView.appearance.todayColor = .systemRed
		calendarView.appearance.selectionColor = .systemGray
	}
	
	func styleDayView() {
		dayView.translatesAutoresizingMaskIntoConstraints = false
		dayView.backgroundColor = .dailyCalendarBackgroundColor
		addShadow(to: dayView)
		dayView.layer.cornerRadius = 10
	}
    
    func styleDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont(name: "Stolzl-Regular", size: 18)
        dateLabel.textColor = .dailyTextColor
        dateLabel.textAlignment = .right
        dateLabel.text = "Select a date"
    }
	
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE dd.MM.YYYY"
        let selectedDate = (formatter.string(from: date)).split(separator: " ")
        let dayOfTheWeek = String(selectedDate[0])
        let dayOfTheYear = String(selectedDate[1])
        dateLabel.text = "\(dayOfTheWeek), \(dayOfTheYear)"
        //change this for integration with DiaryVC
    }
    
    func addShadow(to view: UIView){
        view.layer.shadowColor = UIColor.dailyShadowColor
        view.layer.shadowOpacity = 0.05
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 4
    }

}
