//
//  NewTaskOverlayPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

protocol NewTaskOverlayPresentationLogic {
	func present(data: NewTaskOverlayDataSource)
}

class NewTaskOverlayPresenter {
	weak var view: NewTaskOverlayDisplayLogic?
	weak var tableView: UITableView?
	
	init(view: NewTaskOverlayDisplayLogic) {
		self.view = view
		if let tableView = (view as? NewTaskOverlayVC)?.tableView {
			self.tableView = tableView
		}
	}
}


// MARK: - Presenter Protocol
extension NewTaskOverlayPresenter: NewTaskOverlayPresentationLogic {
	func present(data: NewTaskOverlayDataSource) {
		var viewData = [[UITableViewCell]]()
		let numberOfSectionViewModels = data.sectionViewModels.count
		viewData.reserveCapacity(numberOfSectionViewModels)
		for sectionViewModelIndex in 0 ..< numberOfSectionViewModels {
			viewData.append([])
			let currentSectionViewModel = data.sectionViewModels[sectionViewModelIndex]
			let numberOfCellViewModelsInSection = currentSectionViewModel.cellViewModels.count
			viewData[sectionViewModelIndex].reserveCapacity(numberOfCellViewModelsInSection)
			for cellViewModelIndex in 0 ..< numberOfCellViewModelsInSection {
				let indexPath: IndexPath = .init(row: cellViewModelIndex, section: sectionViewModelIndex)
				let currentCellViewModel = currentSectionViewModel.cellViewModels[cellViewModelIndex]
				switch currentSectionViewModel.type {
				case .dateAndTime:
					switch currentCellViewModel.cellType {
					case .newTaskDate:
						if let dateCell = tableView?.dequeueReusableCell(
							withIdentifier: DailyNewTaskDateCell.cellIdentifier,
							for: indexPath) as? DailyNewTaskDateCell {
								dateCell.viewModel = currentCellViewModel
								dateCell.roundTopCorners(cornerRadius: 10)
								viewData[sectionViewModelIndex].append(dateCell)
						}
					case .time:
						if let timeCell = tableView?.dequeueReusableCell(
							withIdentifier: DailyTimeCell.cellIdentifier,
							for: indexPath) as? DailyTimeCell {
								timeCell.viewModel = currentCellViewModel
								timeCell.switcher.isOn = data.isAssignedToTime
								if cellViewModelIndex == currentSectionViewModel.cellViewModels.count - 1 {
									timeCell.roundBottomCorners(cornerRadius: 10)
								}
								viewData[sectionViewModelIndex].append(timeCell)
						}
					case .timePicker:
						if let timePickerCell = tableView?.dequeueReusableCell(
							withIdentifier: DailyTimePickerCell.cellIdentifier,
							for: indexPath) as? DailyTimePickerCell {
								timePickerCell.viewModel = nil
							timePickerCell.roundBottomCorners(cornerRadius: 10)
								viewData[sectionViewModelIndex].append(timePickerCell)
						}
					default:
						viewData[sectionViewModelIndex].append(UITableViewCell()) //if we accidentally put a wrong item in dateAndTime model
					}
				case .remindAlert:
					if let remindCell = tableView?.dequeueReusableCell(
						withIdentifier: DailyRemindCell.cellIdentifier,
						for: indexPath) as? DailyRemindCell {
							remindCell.viewModel = currentCellViewModel
							remindCell.roundCorners(cornerRadius: 10)
							viewData[sectionViewModelIndex].append(remindCell)
					}
				case .repeatSelector:
					if let repeatCell = tableView?.dequeueReusableCell(
						withIdentifier: DailyRepeatCell.cellIdentifier,
						for: indexPath) as? DailyRepeatCell {
							repeatCell.viewModel = currentCellViewModel
							repeatCell.roundCorners(cornerRadius: 10)
							repeatCell.accessoryType = .disclosureIndicator
							viewData[sectionViewModelIndex].append(repeatCell)
					}
				}
			}
		}
		view?.display(cells: viewData)
	}
}
