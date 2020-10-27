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
    
    override func loadView() {
        super.loadView()
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = UIFont(name: "Stolzl-Bold", size: 36)
        headerLabel.textColor = .dailyTitleTextColor
        addShadow(to: headerLabel)
        headerLabel.textAlignment = .center
        headerLabel.text = "Calendar"
        
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
        
        dayView.translatesAutoresizingMaskIntoConstraints = false
        dayView.backgroundColor = .dailyCalendarBackgroundColor
        addShadow(to: dayView)
        dayView.layer.cornerRadius = 10
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
        calendarView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(headerLabel)
        view.addSubview(calendarView)
        view.addSubview(dayView)
        
        NSLayoutConstraint.activate([
            
            headerLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            calendarView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 16),
            calendarView.centerXAnchor.constraint(equalTo: headerLabel.centerXAnchor),
            calendarView.widthAnchor.constraint(equalTo: headerLabel.widthAnchor, multiplier: 1),
            calendarView.heightAnchor.constraint(equalTo: calendarView.widthAnchor, multiplier: 1),
            
            dayView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 16),
            dayView.centerXAnchor.constraint(equalTo: calendarView.centerXAnchor),
            dayView.widthAnchor.constraint(equalTo: calendarView.widthAnchor, multiplier: 1),
            dayView.heightAnchor.constraint(equalTo: calendarView.widthAnchor, multiplier: 0.5)
            //не всегда влезает на экран :(
        ])
        
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //обработка события нажатия на день
    }
    
    func addShadow(to view: UIView){
        view.layer.shadowOpacity = 0.05
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 4
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
