//
//  NewProjectOverlayPresener.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit


protocol NewProjectOverlayPresentationLogic {
	func present(data: NewProjectOverlayDataSource, in tableView: UITableView)
}

class NewProjectOverlayPresenter {
	weak var view: NewProjectOverlayDisplayLogic?

	init(view: NewProjectOverlayDisplayLogic) {
		self.view = view
	}
}


// MARK: - Presenter Protocol
extension NewProjectOverlayPresenter: NewProjectOverlayPresentationLogic {
	func present(data: NewProjectOverlayDataSource, in tableView: UITableView) {
		
		var viewData = [[UITableViewCell]]()
		let numberOfSectionViewModels = data.sectionViewModels.count
		for sectionViewModelIndex in 0 ..< numberOfSectionViewModels {
			viewData.append([])
			let currentSectionViewModel = data.sectionViewModels[sectionViewModelIndex]
			let numberOfCellViewModels = currentSectionViewModel.cellViewModels.count
			for cellViewModelIndex in 0 ..< numberOfCellViewModels {
				let indexPath: IndexPath = .init(row: cellViewModelIndex, section: sectionViewModelIndex)
				let currentCellViewModel = currentSectionViewModel.cellViewModels[cellViewModelIndex]
				switch currentSectionViewModel.type {
				case .dateAndTime:
					switch currentCellViewModel.cellType {
					case .newProjectDate:
						if let dateCell = tableView.dequeueReusableCell(withIdentifier: DailyNewProjectDateCell.cellIdentifier) as? DailyNewProjectDateCell {
							dateCell.viewModel = currentCellViewModel
							dateCell.roundTopCorners(cornerRadius: 10)
							viewData[sectionViewModelIndex].append(dateCell)
						}
					case .datePicker:
						if let datePickerCell = tableView.dequeueReusableCell(withIdentifier: DailyDatePickerCell.cellIdentifier) as? DailyDatePickerCell {
							datePickerCell.viewModel = nil
							viewData[sectionViewModelIndex].append(datePickerCell)
						}
					case .time:
						if let timeCell = tableView.dequeueReusableCell(withIdentifier: DailyTimeCell.cellIdentifier) as? DailyTimeCell {
							timeCell.viewModel = currentCellViewModel
							if cellViewModelIndex == currentSectionViewModel.cellViewModels.count - 1 {
								timeCell.roundBottomCorners(cornerRadius: 10)
							}
							viewData[sectionViewModelIndex].append(timeCell)
						}
					case .timePicker:
						if let timePickerCell = tableView.dequeueReusableCell(withIdentifier: DailyTimePickerCell.cellIdentifier) as? DailyTimePickerCell {
							timePickerCell.viewModel = nil
							timePickerCell.roundBottomCorners(cornerRadius: 10)
							viewData[sectionViewModelIndex].append(timePickerCell)
						}
					default:
						viewData[sectionViewModelIndex].append(UITableViewCell())
					}
				case .teamProject:
					if let teamProjectCell = tableView.dequeueReusableCell(withIdentifier: DailyTeamProjectCell.cellIdentifier, for: indexPath) as? DailyTeamProjectCell {
						teamProjectCell.viewModel = currentCellViewModel
						teamProjectCell.roundCorners(cornerRadius: 10)
						viewData[sectionViewModelIndex].append(teamProjectCell)
					}
				}
			}
		}
		view?.display(cells: viewData)
	}
}
