//
//  CalendaeVC.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//

import UIKit
import FSCalendar

class CalendarVC: MainVC, FSCalendarDelegate, FSCalendarDataSource {

    let scrollView = UIScrollView()
    let headerLabel = UILabel()
    let calendarView = FSCalendar()
    let dayView = UIView()
    let dateLabel = UILabel()
    let doneTasksLabel = UILabel()
    let missedTasksLabel = UILabel()
    let doneTasksView = UIView()
    let missedTasksView = UIView()
    let detailsButton = UIButton()
    let doneTasksImageView = UIImageView(image: UIImage(systemName: "sparkles"))
    let missedTasksImageView = UIImageView(image: UIImage(systemName: "zzz"))
    let detailsImageView = UIImageView(image: UIImage(systemName: "chevron.right"))
    
    //day review example. change this for integration with DiaryVC
    let doneTasks = 6
    let missedTasks = 2
    
    override func loadView() {
        super.loadView()
		
        view.addSubview(scrollView)
		scrollView.addSubview(headerLabel)
		scrollView.addSubview(calendarView)
		scrollView.addSubview(dayView)
        dayView.addSubview(dateLabel)
        dayView.addSubview(doneTasksLabel)
        dayView.addSubview(missedTasksLabel)
        dayView.addSubview(detailsButton)
        dayView.addSubview(doneTasksView)
        dayView.addSubview(missedTasksView)
        doneTasksView.addSubview(doneTasksImageView)
        missedTasksView.addSubview(missedTasksImageView)
        detailsButton.addSubview(detailsImageView)
		
        configureScrollView()
		configureHeaderLabel()
		configureCalendarView()
		configureDayView()
        configureDateLabel()
        configureTasksLabels()
        configureTasksViews()
        configureDetailsButton()
		
		styleHeaderLabel()
		styleCalendarView()
		styleDayView()
        styleDateLabel()
        styleTasksLabels()
        styleTasksViews()
        styleDetailsButton()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.delegate = self
        detailsButton.addTarget(self, action: #selector(didTapDetails), for: .touchUpInside)
    }
	
    func configureScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
	func configureHeaderLabel() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			headerLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
			headerLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
			headerLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
		])
	}
	
	func configureCalendarView() {
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
			calendarView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 16),
			calendarView.centerXAnchor.constraint(equalTo: headerLabel.centerXAnchor),
			calendarView.widthAnchor.constraint(equalTo: headerLabel.widthAnchor),
			calendarView.heightAnchor.constraint(equalTo: calendarView.widthAnchor),
		])
	}
	
	func configureDayView() {
        dayView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
			dayView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 16),
			dayView.centerXAnchor.constraint(equalTo: calendarView.centerXAnchor),
			dayView.widthAnchor.constraint(equalTo: calendarView.widthAnchor),
            dayView.heightAnchor.constraint(equalTo: calendarView.widthAnchor, multiplier: 0.5),
            dayView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -36)
		])
	}
    
    func configureDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: dayView.topAnchor, constant: 20),
            dateLabel.centerXAnchor.constraint(equalTo: dayView.centerXAnchor),
            dateLabel.widthAnchor.constraint(equalTo: dayView.widthAnchor, multiplier: 0.9),
        ])
    }
    
    func configureTasksLabels() {
        doneTasksLabel.translatesAutoresizingMaskIntoConstraints = false
        missedTasksLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doneTasksLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15),
            doneTasksLabel.leftAnchor.constraint(equalTo: dayView.leftAnchor, constant: 50),
            doneTasksLabel.widthAnchor.constraint(equalTo: dayView.widthAnchor, multiplier: 0.5),
            missedTasksLabel.topAnchor.constraint(equalTo: doneTasksLabel.bottomAnchor, constant: 8),
            missedTasksLabel.leftAnchor.constraint(equalTo: dayView.leftAnchor, constant: 50),
            missedTasksLabel.widthAnchor.constraint(equalTo: dayView.widthAnchor, multiplier: 0.5)
        ])
    }
    
    func configureTasksViews() {
        //configure tasksViews
        doneTasksView.translatesAutoresizingMaskIntoConstraints = false
        missedTasksView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doneTasksView.centerYAnchor.constraint(equalTo: doneTasksLabel.centerYAnchor),
            doneTasksView.leftAnchor.constraint(equalTo: dayView.leftAnchor, constant: 15),
            doneTasksView.widthAnchor.constraint(equalToConstant: 25),
            doneTasksView.heightAnchor.constraint(equalTo: doneTasksView.widthAnchor),
            missedTasksView.centerYAnchor.constraint(equalTo: missedTasksLabel.centerYAnchor),
            missedTasksView.leftAnchor.constraint(equalTo: dayView.leftAnchor, constant: 15),
            missedTasksView.widthAnchor.constraint(equalToConstant: 25),
            missedTasksView.heightAnchor.constraint(equalTo: missedTasksView.widthAnchor)
        ])
        //configure tasksImageViews
        doneTasksImageView.translatesAutoresizingMaskIntoConstraints = false
        missedTasksImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doneTasksImageView.centerYAnchor.constraint(equalTo: doneTasksView.centerYAnchor),
            doneTasksImageView.centerXAnchor.constraint(equalTo: doneTasksView.centerXAnchor),
            doneTasksImageView.widthAnchor.constraint(equalTo: doneTasksView.widthAnchor, multiplier: 0.7),
            doneTasksImageView.heightAnchor.constraint(equalTo: doneTasksView.heightAnchor, multiplier: 0.7),
            missedTasksImageView.centerYAnchor.constraint(equalTo: missedTasksView.centerYAnchor),
            missedTasksImageView.centerXAnchor.constraint(equalTo: missedTasksView.centerXAnchor),
            missedTasksImageView.widthAnchor.constraint(equalTo: missedTasksView.widthAnchor, multiplier: 0.7),
            missedTasksImageView.heightAnchor.constraint(equalTo: missedTasksView.heightAnchor, multiplier: 0.7)
        ])
    }
    
    func configureDetailsButton() {
        detailsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsButton.bottomAnchor.constraint(equalTo: dayView.bottomAnchor, constant: -20),
            detailsButton.rightAnchor.constraint(equalTo: dateLabel.rightAnchor),
            detailsButton.widthAnchor.constraint(equalTo: dayView.widthAnchor, multiplier: 0.4)
        ])
        detailsImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsImageView.centerYAnchor.constraint(equalTo: detailsButton.centerYAnchor),
            detailsImageView.heightAnchor.constraint(equalTo: detailsButton.heightAnchor, multiplier: 0.8),
            detailsImageView.rightAnchor.constraint(equalTo: detailsButton.rightAnchor)
        ])
    }
	
	func styleHeaderLabel() {
		headerLabel.font = UIFont(name: "Stolzl-Bold", size: 36)
		headerLabel.textColor = .dailyTitleTextColor
		addShadow(to: headerLabel)
		headerLabel.textAlignment = .center
		headerLabel.text = "Calendar"
	}
	
	func styleCalendarView() {
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
		dayView.backgroundColor = .dailyCalendarBackgroundColor
		addShadow(to: dayView)
		dayView.layer.cornerRadius = 10
	}
    
    func styleDateLabel() {
        dateLabel.font = UIFont(name: "Stolzl-Regular", size: 18)
        dateLabel.textColor = .dailyTextColor
        dateLabel.textAlignment = .right
        dateLabel.text = "Select a date"
        //change this for integration with DiaryVC
    }
    
    func styleTasksLabels() {
        doneTasksLabel.font = UIFont(name: "Stolzl-Book", size: 18)
        doneTasksLabel.textColor = .dailyTextColor
        doneTasksLabel.textAlignment = .left
        doneTasksLabel.text = "Done: " + String(doneTasks)
        doneTasksImageView.tintColor = .white
        missedTasksLabel.font = UIFont(name: "Stolzl-Book", size: 18)
        missedTasksLabel.textColor = .dailyTextColor
        missedTasksLabel.textAlignment = .left
        missedTasksLabel.text = "Missed: " + String(missedTasks)
        missedTasksImageView.tintColor = .white
    }
    
    func styleTasksViews(){
        doneTasksView.backgroundColor = .systemGreen
        doneTasksView.layer.cornerRadius = 5
        missedTasksView.backgroundColor = .systemRed
        missedTasksView.layer.cornerRadius = 5
    }
    
    func styleDetailsButton() {
        detailsButton.titleLabel?.font =  UIFont(name: "Stolzl-Book", size: 18)
        detailsButton.setTitleColor(.dailyTextColor, for: .normal)
        detailsButton.contentHorizontalAlignment = .center
        detailsButton.setTitle("Details", for: .normal)
        detailsImageView.tintColor = .dailyTextColor
        //if detailsButton is highlighted
        detailsButton.setTitleColor(.systemGray3, for: .highlighted)
        //change color of detailsImageView when the detailsButton is pressed
    }
    
    func addShadow(to view: UIView){
        view.layer.shadowColor = UIColor.dailyShadowColor
        view.layer.shadowOpacity = 0.05
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 4
    }
    
    @objc func didTapDetails(sender: UIButton!) {
        //go to the DiaryVC
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

}
