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
    
    func configureDateLabel() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: dayView.topAnchor, constant: 20),
            dateLabel.centerXAnchor.constraint(equalTo: dayView.centerXAnchor),
            dateLabel.widthAnchor.constraint(equalTo: dayView.widthAnchor, multiplier: 0.9),
        ])
    }
    
    func configureTasksLabels() {
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
        NSLayoutConstraint.activate([
            detailsButton.bottomAnchor.constraint(equalTo: dayView.bottomAnchor, constant: -20),
            detailsButton.rightAnchor.constraint(equalTo: dateLabel.rightAnchor),
            detailsButton.widthAnchor.constraint(equalTo: dayView.widthAnchor, multiplier: 0.4)
        ])
    }
    
    func styleHeaderLabel() {
        if let headerLabelFont = UIFont(name: "Stolzl-Bold", size: 36) {
            headerLabel.styleLabel(font: headerLabelFont, text: "Calendar", textAlignment: .center, textColor: .dailyTitleTextColor)
            addShadow(to: headerLabel)
        }
    }
    
    func styleCalendarView() {
        if let calendarViewTitleFont = UIFont(name: "Stolzl-Book", size: 15),
            let calendarViewHeaderTitleFont = UIFont(name: "Stolzl-Regular", size: 18) {
            calendarView.styleCalendar(backgroundColor: .dailyCalendarBackgroundColor, titleFont: calendarViewTitleFont, headerTitleFont: calendarViewHeaderTitleFont)
            addShadow(to: calendarView)
        }
    }
    
    func styleDayView() {
        dayView.styleView(backgroundColor: .dailyCalendarBackgroundColor, cornerRadius: 10)
        addShadow(to: dayView)
    }
    
    func styleDateLabel() {
        if let dateLabelFont = UIFont(name: "Stolzl-Regular", size: 18) {
            dateLabel.styleLabel(font: dateLabelFont, text: "Select a date", textAlignment: .right, textColor: .dailyTextColor)
        }
        //change this for integration with DiaryVC
    }
    
    func styleTasksLabels() {
        if let titleTaskLabelFont = UIFont(name: "Stolzl-Book", size: 18),
           let counterTaskLabelFont = UIFont(name: "Stolzl-Regular", size: 18) {
            doneTasksLabel.styleLabelWithTwoFonts(firstText: "Done: ", with: titleTaskLabelFont, in: .dailyTextColor, secondText: String(doneTasks), with: counterTaskLabelFont, in: .systemGreen, textAlignment: .left)
            missedTasksLabel.styleLabelWithTwoFonts(firstText: "Missed: ", with: titleTaskLabelFont, in: .dailyTextColor, secondText: String(missedTasks), with: counterTaskLabelFont, in: .systemRed, textAlignment: .left)
        }
    }
    
    func styleTasksViews(){
        doneTasksView.styleView(backgroundColor: .systemGreen, cornerRadius: 5)
        missedTasksView.styleView(backgroundColor: .systemRed, cornerRadius: 5)
        doneTasksImageView.styleImageView(color: .white)
        missedTasksImageView.styleImageView(color: .white)
    }
    
    func styleDetailsButton() {
        if let detailsButtonTitleFont = UIFont(name: "Stolzl-Book", size: 18),
           let detailsImage = UIImage(systemName: "chevron.right") {
            detailsButton.setTitleWithImage(text: "Details ", with: detailsButtonTitleFont, image: detailsImage, for: .normal)
        }
        //when detailsButton is pressed
        if let detailsButtonTitleFont = UIFont(name: "Stolzl-Book", size: 18),
           let detailsImage = UIImage(systemName: "chevron.right") {
            detailsButton.setTitleWithImage(text: "Details ", with: detailsButtonTitleFont, in: .systemGray, image: detailsImage, for: .highlighted)
        }
        detailsButton.styleButton(textAlignment: .right)
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
