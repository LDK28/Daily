//
//  NewTaskOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

protocol  NewTaskOverlayDisplayLogic: class {
	func display(data: NewTaskOverlayDataSource)
}

class NewTaskOverlayVC: OverlayTemplateVC {
	var interactor: NewTaskOverlayBusinessLogic?
	var cellItemsToDisplay: NewTaskOverlayDataSource?
	
	override func loadView() {
		super.loadView()
		
		styleElements()
		
		configureTableView()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		/*
			This is an initial state of the VIP cycle. Once our view appears and gets loaded we start this cycle for the first time: VIEW calls INTERACTOR -> it does something or nothing with our DATASOURCE -> then DATASOURCE is sent to PRESENTER that prepares our raw data for our VIEW to show -> VIEW recieves rendered DATASOURCE and shows contents accordingly
		
			However, in our case DailyDataSource is not affected by any of the VIP cycle members, because the content that table view shows in this module is static and has no requests to a server or something else. Therefore, our DATASOURCE merely gets transfered from one VIP member to another, but it is inevitable
		
			In addition, we will have methods that will be called from table view (e.g. didSelectRowAt to expand time and date calendar). At this point, VIP cycle will become really handy
		*/
		
		interactor?.fetchCells()
    }
	
	
	override func styleElements() {
		super.styleElements()
		titleLabel.styleOverlayLabel(text: "Add new task")
	}
}


// MARK: - Table View Delegate and DataSource

extension NewTaskOverlayVC {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		//items represent an array of section
		return cellItemsToDisplay?.items.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		//each section in the array of items has definite amount of cells
		return cellItemsToDisplay?.items[section].rowCount ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let item = cellItemsToDisplay?.items[indexPath.section] else {
			return  UITableViewCell()
		}
		//External switch (aka section types)
		switch item.type {
		case .dateAndTime:
			let component = item.components[indexPath.row]
			
			//Internal switch (aka date or time precisely)
			switch component.cellType {
			case .newTaskDate:
				if let dateCell = tableView.dequeueReusableCell(withIdentifier: DailyNewTaskDateCell.cellIdentifier) as? DailyNewTaskDateCell {
					dateCell.component = component
					dateCell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
					return dateCell
			}
			case .time:
				if let timeCell = tableView.dequeueReusableCell(withIdentifier: DailyTimeCell.cellIdentifier) as? DailyTimeCell {
					timeCell.component = component
					timeCell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
					return timeCell
				}
			case .timePicker:
				if let timePickerCell = tableView.dequeueReusableCell(withIdentifier: DailyTimePickerCell.cellIdentifier) as? DailyTimePickerCell {
					timePickerCell.component = nil
					timePickerCell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
					return timePickerCell
				}
			default:
				return UITableViewCell() //if we accidentally put a wrong item in dateAndTime model
			}
		case .remindAlert:
			if let cell = tableView.dequeueReusableCell(withIdentifier: DailyRemindCell.cellIdentifier, for: indexPath) as? DailyRemindCell {
				cell.component = item.components[indexPath.row]
				cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
				return cell
			}
		case .repeatSelector:
			if let cell = tableView.dequeueReusableCell(withIdentifier: DailyRepeatCell.cellIdentifier, for: indexPath) as? DailyRepeatCell {
				cell.component = item.components[indexPath.row]
				cell.accessoryType = .disclosureIndicator
				cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
				return cell
			}
		}
		return UITableViewCell() //of none of the cases have been implemented
	}
}

// MARK: - View Protocol

extension NewTaskOverlayVC: NewTaskOverlayDisplayLogic {
	func display(data: NewTaskOverlayDataSource) {
		cellItemsToDisplay = data
		tableView.reloadData()
	}
}
