import Foundation
import UIKit

class DiaryVC: MainVC {
    
    internal var headerLabel = UILabel()
    internal var subheaderLabel = UILabel()
    internal let tableView = UITableView(frame: CGRect.zero, style: .grouped)
    
    var dataToDisplay = [DiaryCellModel]()
    private var interactor: DiaryBusinessLogic?

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
