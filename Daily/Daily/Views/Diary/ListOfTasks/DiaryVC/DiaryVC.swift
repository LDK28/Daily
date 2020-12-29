import Foundation
import UIKit

class DiaryVC: MainVC {
    
    internal var headerLabel = UILabel()
    internal var subheaderLabel = UILabel()
    internal let tableView = UITableView(frame: CGRect.zero, style: .grouped)
    
    var dataToDisplay = [DiaryCellViewModel]()
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
        let interactor = DiaryInteractor(presenter: presenter)
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
        configureNavigationController()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchLatestData()
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DiaryHeader.identifier) as! DiaryHeader
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        header.title.text = formatter.string(from: dataToDisplay[section].time ?? Date())
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: DiaryCell.identifier, for: indexPath) as? DiaryCell
            else { return UITableViewCell() }
        cell.setup(data: dataToDisplay[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let EditTaskViewController = EditTaskModule.build()
        EditTaskViewController.modalPresentationStyle = .fullScreen
        EditTaskViewController.router?.integrateTaskInModule(DiaryBackendModel.init(copiedModel: dataToDisplay[indexPath.section]), index: indexPath.section)
        navigationController?.pushViewController(EditTaskViewController, animated: true)
    }
}

extension DiaryVC: DiaryDisplayLogic {
    func display(data: [DiaryCellViewModel]) {
        dataToDisplay.removeAll()
        dataToDisplay.append(contentsOf: data)
        tableView.reloadData()
    }
}
