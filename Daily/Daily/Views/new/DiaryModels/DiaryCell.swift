import Foundation
import UIKit

class DiaryCell: UITableViewCell {
    static let identifier = "TaskTableViewCell"
        
    private let progressButton: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setImage(UIImage(systemName: "circle.fill"), for: .selected)
        button.tintColor = .dailyDiaryTileElementColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let taskName: UILabel = {
        let label = UILabel()
        label.textColor = .dailySubtitleTextColor
        label.font = UIFont(name: "Stolzl-Regular", size: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let taskDescription: UILabel = {
        let description = UILabel()
        description.textColor = .dailySubtitleTextColor
        description.font = UIFont(name: "Stolzl-Regular", size: 18)
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = 0
        return description
    }()
    
    private let alarmButton: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.setImage(UIImage(systemName: "alarm.fill"), for: .normal)
        button.setImage(UIImage(systemName: "alarm.fill"), for: .selected)
        button.tintColor = .dailyDiaryTileElementColor
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.setImage(UIImage(systemName: "ellipsis"), for: .selected)
        button.tintColor = .dailyDiaryTileElementColor
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.clipsToBounds = true
        self.layer.cornerRadius = 15
        
        self.selectionStyle = .none
        
        self.backgroundColor = .dailyDiaryTileColor
        
        
        progressButton.addTarget(self, action: #selector(didTapProgressButton), for: .touchUpInside)
        alarmButton.addTarget(self, action: #selector(didTapAlarmButton), for: .touchUpInside)
        
        contentView.addSubview(progressButton)
        contentView.addSubview(taskName)
        contentView.addSubview(taskDescription)
        contentView.addSubview(moreButton)
        contentView.addSubview(alarmButton)
                
    }
    
    @objc func didTapProgressButton() {
        UIView.animate(withDuration: 0.3) {
            [self] in
            progressButton.isSelected.toggle()
            if progressButton.isSelected{
                progressButton.tintColor = .dailyAdaptiveBlue
            } else {
                progressButton.tintColor = .dailyDiaryTileElementColor
            }
        }
    }
    
    @objc func didTapAlarmButton() {
        UIView.animate(withDuration: 0.3) {
            [self] in
            alarmButton.isSelected.toggle()
            if alarmButton.isSelected{
                alarmButton.tintColor = .dailyAdaptiveBlue
            } else {
                alarmButton.tintColor = .dailyDiaryTileElementColor
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        taskName.text = nil
        taskDescription.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            progressButton.centerYAnchor.constraint(equalTo: taskName.topAnchor, constant: 25),
            progressButton.centerXAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 20),
            progressButton.widthAnchor.constraint(equalToConstant: 22),
            progressButton.heightAnchor.constraint(equalToConstant: 22),
            
            taskName.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 10),
            taskName.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 38),
            taskName.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -50),
            
            taskDescription.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 10),
            taskDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            taskDescription.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 38)   ,
            taskDescription.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -50),
            
            moreButton.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 20),
            moreButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -10),
            moreButton.widthAnchor.constraint(equalToConstant: 36),
            moreButton.heightAnchor.constraint(equalToConstant: 10),
            
            alarmButton.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -10),
            alarmButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -10),
            alarmButton.widthAnchor.constraint(equalToConstant: 27),
            alarmButton.heightAnchor.constraint(equalToConstant: 27),
        ])
        
    }
    
    func setup(data: DiaryCellViewModel) {
        taskName.text = data.title
        taskDescription.text = data.description
        if data.shouldRemind == true {
            alarmButton.isSelected = true
            alarmButton.tintColor = .dailyAdaptiveBlue
        } else {
            alarmButton.isSelected = false
            alarmButton.tintColor = .dailyDiaryTileElementColor
        }
        if data.isMade == true {
            progressButton.isSelected = true
            progressButton.tintColor = .dailyAdaptiveBlue
        } else {
            progressButton.isSelected = false
            progressButton.tintColor = .dailyDiaryTileElementColor
        }
    }
}
