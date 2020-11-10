//
//  NewProjectOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

protocol NewProjectOverlayDisplayLogic: class {
	func display(data: NewProjectOverlayDataSource)
}


class NewProjectOverlayVC: OverlayTemplateVC {
	
	var interactor: NewProjectOverlayBusinessLogic?
	var cellItemsToDisplay: NewProjectOverlayDataSource?
	
	override func loadView() {
		super.loadView()
		
		styleElements()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		interactor?.fetchCells()
	}
	
	
	override func styleElements() {
		super.styleElements()
		titleLabel.styleOverlayLabel(text: "Create new project")
	}

}

extension NewProjectOverlayVC {
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
			case .newProjectDate:
				if let dateCell = tableView.dequeueReusableCell(withIdentifier: DailyNewProjectDateCell.cellIdentifier) as? DailyNewProjectDateCell {
					dateCell.component = component
					dateCell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
					return dateCell
			}
			case .datePicker:
				if let timePickerCell = tableView.dequeueReusableCell(withIdentifier: DailyDatePickerCell.cellIdentifier) as? DailyDatePickerCell {
					timePickerCell.component = nil
					timePickerCell.layer.maskedCorners = []
					return timePickerCell
				}
			case .time:
				if let timeCell = tableView.dequeueReusableCell(withIdentifier: DailyTimeCell.cellIdentifier) as? DailyTimeCell {
					timeCell.component = component
					timeCell.layer.maskedCorners = item.components.count > 2 ? [] : [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
					return timeCell
				}
			case .timePicker:
				if let timePickerCell = tableView.dequeueReusableCell(withIdentifier: DailyTimePickerCell.cellIdentifier) as? DailyTimePickerCell {
					timePickerCell.component = component
					timePickerCell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
					return timePickerCell
				}
			default:
				return UITableViewCell()
			}
				
		case .teamProject:
			if let cell = tableView.dequeueReusableCell(withIdentifier: DailyTeamProjectCell.cellIdentifier, for: indexPath) as? DailyTeamProjectCell {
				cell.component = item.components[indexPath.row]
				return cell
			}
		}
		
		return UITableViewCell() //of none of the cases have been implemented
	}
}

extension  NewProjectOverlayVC: NewProjectOverlayDisplayLogic {
	func display(data: NewProjectOverlayDataSource) {
		cellItemsToDisplay = data
		tableView.reloadData()
	}
}
