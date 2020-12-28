//
//  CalendaeVC.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//

import UIKit
import FSCalendar

class CalendarVC: MainVC {

    var interactor: CalendarBusinessLogic?
    var router: (CalendarRoutingLogic & CalendarDataPassing)?
    
    let scrollView = UIScrollView()
    let headerLabel = UILabel()
    let calendarView = FSCalendar()
    let dayView = DayView()
    
    //day review example. change this for integration with DiaryVC
    let doneTasks = 6
    let missedTasks = 2
    
    override func loadView() {
        super.loadView()
        
        interactor?.doSomething()
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(headerLabel)
        scrollView.addSubview(calendarView)
        scrollView.addSubview(dayView)
        
        configureScrollView()
        configureHeaderLabel()
        configureCalendarView()
        configureDayView()
        
        styleHeaderLabel()
        styleCalendarView()
        
        dayView.loadView(fullDate: getCurrentDate(), doneTasks: doneTasks, missedTasks: missedTasks)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.delegate = self
    }

}

extension CalendarVC: FSCalendarDelegate, FSCalendarDataSource  {
    
    func getCurrentDate() -> String {
        let todayDate = Date()
        let (dayOfTheWeek, date) = formatDate(fullDate: todayDate)
        return "\(dayOfTheWeek), \(date)"
    }
    
    func formatDate(fullDate: Date) -> (String, String){
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE dd.MM.YYYY"
        let selectedDate = (formatter.string(from: fullDate)).split(separator: " ")
        let dayOfTheWeek = String(selectedDate[0])
        let date = String(selectedDate[1])
        return (dayOfTheWeek, date)
    }
    
    func calendar(_ calendar: FSCalendar, didSelect fullDate: Date, at monthPosition: FSCalendarMonthPosition) {
        let (dayOfTheWeek, date) = formatDate(fullDate: fullDate)
        dayView.dateLabel.text = "\(dayOfTheWeek), \(date)"
        //change this for integration with DiaryVC
    }
    
}

extension CalendarVC: CalendarDisplayLogic {
    func displaySomething() {
        
    }
    
}

extension CalendarVC {
    
    func configureScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        scrollView.showsVerticalScrollIndicator = false
    }
    
    func configureHeaderLabel() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            headerLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            headerLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
        ])
    }
    
    func configureCalendarView() {
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 16),
            calendarView.centerXAnchor.constraint(equalTo: headerLabel.centerXAnchor),
            calendarView.widthAnchor.constraint(equalTo: headerLabel.widthAnchor),
            calendarView.heightAnchor.constraint(equalTo: calendarView.widthAnchor),
        ])
    }
    
    func configureDayView() {
        NSLayoutConstraint.activate([
            dayView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 16),
            dayView.centerXAnchor.constraint(equalTo: calendarView.centerXAnchor),
            dayView.widthAnchor.constraint(equalTo: calendarView.widthAnchor),
            dayView.heightAnchor.constraint(equalTo: calendarView.widthAnchor, multiplier: 0.5),
            dayView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -36)
        ])
    }

    func styleHeaderLabel() {
        if let headerLabelFont = UIFont(name: "Stolzl-Bold", size: 36) {
            headerLabel.styleLabel(font: headerLabelFont, text: "Calendar", textAlignment: .center, textColor: .dailyTitleTextColor)
            headerLabel.addShadow()
        }
    }
    
    func styleCalendarView() {
        if let calendarViewTitleFont = UIFont(name: "Stolzl-Book", size: 15),
            let calendarViewHeaderTitleFont = UIFont(name: "Stolzl-Regular", size: 18) {
            calendarView.styleCalendar(backgroundColor: .dailyCalendarBackgroundColor, titleFont: calendarViewTitleFont, headerTitleFont: calendarViewHeaderTitleFont)
            calendarView.addShadow()
        }
    }
    
}
