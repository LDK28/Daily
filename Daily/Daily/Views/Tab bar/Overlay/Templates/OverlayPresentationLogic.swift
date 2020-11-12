//
//  OverlayPresentationLogic.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit

func fillCells(from data: OverlayDataSource, in tableView: UITableView?) -> [[UITableViewCell]] {
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
				case .newProjectDate:
					if let dateCell = tableView?.dequeueReusableCell(withIdentifier: DailyNewProjectDateCell.cellIdentifier) as? DailyNewProjectDateCell {
						dateCell.viewModel = currentCellViewModel
						dateCell.roundTopCorners(cornerRadius: 10)
						viewData[sectionViewModelIndex].append(dateCell)
					}
				case .newTaskDate:
					if let dateCell = tableView?.dequeueReusableCell(withIdentifier: DailyNewTaskDateCell.cellIdentifier) as? DailyNewTaskDateCell {
						dateCell.viewModel = currentCellViewModel
						dateCell.roundTopCorners(cornerRadius: 10)
						viewData[sectionViewModelIndex].append(dateCell)
					}
				case .datePicker:
					if let datePickerCell = tableView?.dequeueReusableCell(withIdentifier: DailyDatePickerCell.cellIdentifier) as? DailyDatePickerCell {
						datePickerCell.viewModel = nil
						viewData[sectionViewModelIndex].append(datePickerCell)
					}
				case .time:
					if let timeCell = tableView?.dequeueReusableCell(withIdentifier: DailyTimeCell.cellIdentifier) as? DailyTimeCell {
						timeCell.viewModel = currentCellViewModel
						timeCell.switcher.isOn = data.isAssignedToTime
						if cellViewModelIndex == currentSectionViewModel.cellViewModels.count - 1 {
							timeCell.roundBottomCorners(cornerRadius: 10)
						}
						viewData[sectionViewModelIndex].append(timeCell)
					}
				case .timePicker:
					if let timePickerCell = tableView?.dequeueReusableCell(withIdentifier: DailyTimePickerCell.cellIdentifier) as? DailyTimePickerCell {
						timePickerCell.viewModel = nil
						timePickerCell.roundBottomCorners(cornerRadius: 10)
						viewData[sectionViewModelIndex].append(timePickerCell)
					}
				default:
					viewData[sectionViewModelIndex].append(UITableViewCell())
				}
			case .teamProject:
				if let teamProjectCell = tableView?.dequeueReusableCell(withIdentifier: DailyTeamProjectCell.cellIdentifier, for: indexPath) as? DailyTeamProjectCell {
					teamProjectCell.viewModel = currentCellViewModel
					teamProjectCell.roundCorners(cornerRadius: 10)
					viewData[sectionViewModelIndex].append(teamProjectCell)
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
			default:
				viewData[sectionViewModelIndex].append(UITableViewCell())
			}
		}
	}
	return viewData
}
