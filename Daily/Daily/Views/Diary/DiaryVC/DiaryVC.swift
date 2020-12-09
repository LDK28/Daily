import Foundation
import UIKit

class DiaryVC: MainVC {
    
    let myDate = Date()
    let weekday = Calendar.current.component(.weekday, from: Date())
    private let tableView = UITableView(frame: CGRect.zero, style: .grouped)

    // MARK: - External vars
    
    // MARK: - Internal vars
    private var interactor: DiaryBusinessLogic?
    private var dataToDisplay = [DiaryCellModel]()
    var headerLabel = UILabel()
    var subheaderLabel = UILabel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let presenter = DiaryPresenter()
        let interactor = DiaryInteractor()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
    }
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(headerLabel)
        view.addSubview(subheaderLabel)
        view.addSubview(tableView)
        
        configureHeaderLabel()
        configureSubheaderLabel()
        configureTableView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchDiary()
    }
    
    func configureHeaderLabel() {
        // MARK: - Header style
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = UIFont(name: "Stolzl-Bold", size: 36)
        headerLabel.textColor = .dailyTitleTextColor
        addShadow(to: headerLabel)
        headerLabel.textAlignment = .right
        switch weekday{
        case 1:
            headerLabel.text = "Sunday"
        case 2:
            headerLabel.text = "Monday"
        case 3:
            headerLabel.text = "Tuesday"
        case 4:
            headerLabel.text = "Wednesday"
        case 5:
            headerLabel.text = "Thursday"
        case 6:
            headerLabel.text = "Friday"
        case 7:
            headerLabel.text = "Saturday"
        default:
            headerLabel.text = "Date"
        }
        
        // MARK: - Header constraints
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        ])
    }
    
    func configureSubheaderLabel() {
        // MARK: - Subheader style
        subheaderLabel.translatesAutoresizingMaskIntoConstraints = false
        subheaderLabel.font = UIFont(name: "Stolzl-Bold", size: 18)
        subheaderLabel.textColor = .dailyTitleTextColor
        addShadow(to: subheaderLabel)
        subheaderLabel.textAlignment = .right
        subheaderLabel.text = myDate.asString(style: .long)
        
        // MARK: - Subheader constraints
        NSLayoutConstraint.activate([
            subheaderLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 56),
            subheaderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subheaderLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        ])
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        
        tableView.register(DiaryCell.self, forCellReuseIdentifier: DiaryCell.identifier)
        tableView.register(DiaryHeader.self, forHeaderFooterViewReuseIdentifier: DiaryHeader.identifier)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 90),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func addShadow(to view: UIView){
        view.layer.shadowOpacity = 0.05
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 4
    }

    
}

// MARK: - UITableViewDataSource & Delegate implementation
extension DiaryVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        footer.backgroundColor = .clear
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DiaryHeader.identifier) as! DiaryHeader
        header.title.text = "2:28"
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: DiaryCell.identifier, for: indexPath) as? DiaryCell
            else { return UITableViewCell() }
        cell.setup(data: dataToDisplay[indexPath.row])
        return cell
    }

    
}

extension DiaryVC: DiaryDisplayLogic {
    func display(data: [DiaryCellModel]) {
        dataToDisplay.removeAll()
        dataToDisplay.append(contentsOf: data)
        tableView.reloadData()
    }
}

// MARK: - Date -> String
extension Date {
  func asString(style: DateFormatter.Style) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = style
    return dateFormatter.string(from: self)
  }
}
