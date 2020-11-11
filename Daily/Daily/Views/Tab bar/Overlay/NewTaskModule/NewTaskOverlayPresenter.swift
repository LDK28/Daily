//
//  NewTaskOverlayPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

protocol NewTaskOverlayPresentationLogic {
	func present(data: NewTaskOverlayDataSource, in tableView: UITableView)
}

class NewTaskOverlayPresenter {
	weak var view: NewTaskOverlayDisplayLogic?
	
	init(view: NewTaskOverlayDisplayLogic) {
		self.view = view
	}
}


// MARK: - Presenter Protocol
extension NewTaskOverlayPresenter: NewTaskOverlayPresentationLogic {
	func present(data: NewTaskOverlayDataSource, in tableView: UITableView) {
		var viewData = [[UITableViewCell]]()
		let numberOfSectionViewModels = data.sectionViewModels.count
		for sectionViewModelIndex in 0 ..< numberOfSectionViewModels {
			viewData.append([])
			let sectionViewModels = data.sectionViewModels[sectionViewModelIndex]
			let numberOfCellViewModels = sectionViewModels.cellViewModels.count
			for cellViewModelIndex in 0 ..< numberOfCellViewModels {
				let indexPath: IndexPath = .init(row: cellViewModelIndex, section: sectionViewModelIndex)
				let currentCellViewModel = sectionViewModels.cellViewModels[cellViewModelIndex]
				switch sectionViewModels.type {
				case .dateAndTime:
					switch currentCellViewModel.cellType {
					case .newTaskDate:
						if let dateCell = tableView.dequeueReusableCell(
							withIdentifier: DailyNewTaskDateCell.cellIdentifier,
							for: indexPath) as? DailyNewTaskDateCell {
								dateCell.viewModel = currentCellViewModel
								dateCell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
								dateCell.selectedBackgroundView?.layer.maskedCorners = dateCell.layer.maskedCorners
								viewData[sectionViewModelIndex].append(dateCell)
						}
					case .time:
						if let timeCell = tableView.dequeueReusableCell(
							withIdentifier: DailyTimeCell.cellIdentifier,
							for: indexPath) as? DailyTimeCell {
								timeCell.viewModel = currentCellViewModel
								timeCell.layer.maskedCorners = sectionViewModels.cellViewModels.count > 2 ? [] : [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
								viewData[sectionViewModelIndex].append(timeCell)
						}
					case .timePicker:
						if let timePickerCell = tableView.dequeueReusableCell(
							withIdentifier: DailyTimePickerCell.cellIdentifier,
							for: indexPath) as? DailyTimePickerCell {
								timePickerCell.viewModel = nil
								timePickerCell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
								viewData[sectionViewModelIndex].append(timePickerCell)
						}
					default:
						viewData[sectionViewModelIndex].append(UITableViewCell()) //if we accidentally put a wrong item in dateAndTime model
					}
				case .remindAlert:
					if let remindCell = tableView.dequeueReusableCell(
						withIdentifier: DailyRemindCell.cellIdentifier,
						for: indexPath) as? DailyRemindCell {
							remindCell.viewModel = currentCellViewModel
							viewData[sectionViewModelIndex].append(remindCell)
					}
				case .repeatSelector:
					if let repeatCell = tableView.dequeueReusableCell(
						withIdentifier: DailyRepeatCell.cellIdentifier,
						for: indexPath) as? DailyRepeatCell {
							repeatCell.viewModel = currentCellViewModel
							repeatCell.accessoryType = .disclosureIndicator
							viewData[sectionViewModelIndex].append(repeatCell)
					}
				}
			}
		}
		view?.display(cells: viewData)
	}
}
