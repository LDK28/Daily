import Foundation
import UIKit

class DiaryHeader: UITableViewHeaderFooterView {
    static let identifier = "TaskCustomHeader"
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .dailyTaskTimeColor
        label.font = UIFont(name: "Stolzl-Bold", size: 22)
        label.textAlignment = .left
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        configureContents()
        
        self.tintColor = .clear
    }
    
    func configureContents() {
        title.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(title)
        
        NSLayoutConstraint.activate([
            
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            title.topAnchor.constraint(equalTo: contentView.topAnchor),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setup(data: DiaryCellModel) {
//        title.text = data.time
//    }
}
