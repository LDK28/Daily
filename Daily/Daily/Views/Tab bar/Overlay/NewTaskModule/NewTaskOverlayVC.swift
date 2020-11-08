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
		titleLabel.styleOverlayLabel(text: "Make new task")
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
			default:
				return UITableViewCell() //if we accidentally put a wrong item in dateAndTime model
			}
				
		default:
			if let cell = tableView.dequeueReusableCell(withIdentifier: DailyOrdinaryCell.cellIdentifier, for: indexPath) as? DailyOrdinaryCell {
				cell.component = item.components[indexPath.row]
				if item.type == .repeatSelector {
					cell.accessoryType = .disclosureIndicator
				}
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
