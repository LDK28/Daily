//
//  DayView.swift
//  Daily
//
//  Created by julie on 06.11.2020.
//

import UIKit

class DayView: UIView {
    
    let dateLabel = UILabel()
    let doneTasksLabel = UILabel()
    let missedTasksLabel = UILabel()
    let doneTasksView = UIView()
    let missedTasksView = UIView()
    let detailsButton = UIButton()
    let doneTasksImageView = UIImageView(image: UIImage(systemName: "sparkles"))
    let missedTasksImageView = UIImageView(image: UIImage(systemName: "zzz"))

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func loadView(fullDate: String, doneTasks: Int, missedTasks: Int) {
        
        detailsButton.addTarget(self, action: #selector(didTapDetails), for: .touchUpInside)
        
        styleDayView()
        
        addSubview(dateLabel)
        addSubview(doneTasksLabel)
        addSubview(missedTasksLabel)
        addSubview(detailsButton)
        addSubview(doneTasksView)
        addSubview(missedTasksView)
        
        doneTasksView.addSubview(doneTasksImageView)
        missedTasksView.addSubview(missedTasksImageView)
        
        configureDateLabel()
        configureTasksLabels()
        configureTasksViews()
        configureDetailsButton()
        
        styleDateLabel(date: fullDate)
        styleTasksLabels(doneTasks: doneTasks, missedTasks: missedTasks)
        styleTasksViews()
        styleDetailsButton()
        
    }
    
    func configureDateLabel() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            dateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dateLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
        ])
    }
    
    func configureTasksLabels() {
        NSLayoutConstraint.activate([
            doneTasksLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15),
            doneTasksLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            doneTasksLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            missedTasksLabel.topAnchor.constraint(equalTo: doneTasksLabel.bottomAnchor, constant: 8),
            missedTasksLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            missedTasksLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        ])
    }
    
    func configureTasksViews() {
        //configure tasksViews
        NSLayoutConstraint.activate([
            doneTasksView.centerYAnchor.constraint(equalTo: doneTasksLabel.centerYAnchor),
            doneTasksView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            doneTasksView.widthAnchor.constraint(equalToConstant: 25),
            doneTasksView.heightAnchor.constraint(equalTo: doneTasksView.widthAnchor),
            missedTasksView.centerYAnchor.constraint(equalTo: missedTasksLabel.centerYAnchor),
            missedTasksView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
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
            detailsButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            detailsButton.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            detailsButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4)
        ])
    }
    
    func styleDayView() {
        styleView(backgroundColor: .dailyCalendarBackgroundColor, cornerRadius: 10)
        addShadow()
    }
    
    func styleDateLabel(date: String) {
        if let dateLabelFont = UIFont(name: "Stolzl-Regular", size: 18) {
            dateLabel.styleLabel(font: dateLabelFont, text: date, textAlignment: .right, textColor: .dailyTextColor)
        }
        //change this for integration with DiaryVC
    }
    
    func styleTasksLabels(doneTasks: Int, missedTasks: Int) {
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
            detailsButton.setTitleWithImage(text: NSLocalizedString("Details ", comment: ""), with: detailsButtonTitleFont, image: detailsImage, for: .normal)
        }
        //when detailsButton is pressed
        if let detailsButtonTitleFont = UIFont(name: "Stolzl-Book", size: 18),
           let detailsImage = UIImage(systemName: "chevron.right") {
            detailsButton.setTitleWithImage(text: "Details ", with: detailsButtonTitleFont, in: .systemGray, image: detailsImage, for: .highlighted)
        }
        detailsButton.styleButton(textAlignment: .right)
    }
    
    @objc func didTapDetails(sender: UIButton) {
        //go to the DiaryVC
     }
    
}
