//
//  OverlayPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class OverlayPresenter: OverlayDataStore {
	internal weak var tableView: UITableView?
	weak var viewController: OverlayDisplayLogic? {
		didSet {
			if let tableView =  (viewController as? OverlayVC)?.tableView {
				self.tableView = tableView
			}
		}
	}
	var dataSource = OverlayDataSource(sectionViewModels: [])
	
	
	func getFirstIndexOfRow(atSection section: Int, withType type: DailyCellType) -> Int? {
		dataSource.sectionViewModels[section].cellViewModels.firstIndex(where: { cellViewModel in
			cellViewModel.cellType == type
		})
	}
}

extension OverlayPresenter: OverlayPresentationLogic {
	
	func updateTimeInTimeCell(atSection section: Int) {
		guard let timeCellIndex = getFirstIndexOfRow(atSection: section, withType: .time) else { return }
		guard let timeCell = viewController?.cellsToDisplay[section][timeCellIndex] as? DailyTimeCell else { return }
		timeCell.time = dataSource.assignedTime
		viewController?.update(at: IndexPath(row: timeCellIndex, section: section))
	}
	
	func updateDateAndTimeSection(atIndex section: Int, afterCellOfType cellType: DailyCellType) {
		guard cellType == .optionalDate || cellType == .time else { return }
		guard let previousRow = getFirstIndexOfRow(atSection: section, withType: cellType) else { return }
		let rowToUpdate = previousRow + 1
		
		if cellType == .time {
			if dataSource.isAssignedToTime {
				viewController?.cellsToDisplay[section][previousRow].sharpCorners()
				insertCellViewModel(at: IndexPath(row: rowToUpdate, section: section), cellWithType: .timePicker)
				return
			} else {
				viewController?.cellsToDisplay[section][previousRow].roundBottomCorners(cornerRadius: 10)
				(viewController?.cellsToDisplay[section][previousRow] as? DailyTimeCell)?.time = nil
			}
		} else {
			if let dataSource = dataSource as? NewProjectOverlayDataSource {
				if dataSource.isAssignedToDate {
					insertCellViewModel(at: IndexPath(row: rowToUpdate, section: section), cellWithType: .datePicker)
					return
				} else {
					(viewController?.cellsToDisplay[section][previousRow] as? DailyOptionalDateCell)?.date = nil
				}
			}
		}
		deleteCell(at: IndexPath(row: rowToUpdate, section: section))
	}
	
	private func insertCellViewModel(at indexPath: IndexPath, cellWithType cellType: DailyCellType) {
		let newCellViewModel = DailyCellViewModel(title: nil,
												  icon: nil,
												  cellType: cellType,
												  isToggable: false,
												  isSelectable: false)
		dataSource.sectionViewModels[indexPath.section].cellViewModels.insert(newCellViewModel, at: indexPath.row)
		if cellType == .datePicker {
			if let datePickerCell = tableView?.dequeueReusableCell(withIdentifier: DailyDatePickerCell.cellIdentifier) as? DailyDatePickerCell {
				viewController?.cellsToDisplay[indexPath.section].insert(datePickerCell, at: indexPath.row)
				(viewController?.cellsToDisplay[indexPath.section][indexPath.row - 1] as? DailyOptionalDateCell)?.date = datePickerCell.dateAndTime
			}
		} else {
			if let timePickerCell = tableView?.dequeueReusableCell(withIdentifier: DailyTimePickerCell.cellIdentifier) as? DailyTimePickerCell {
				viewController?.cellsToDisplay[indexPath.section].insert(timePickerCell, at: indexPath.row)
				(viewController?.cellsToDisplay[indexPath.section][indexPath.row - 1] as? DailyTimeCell)?.time = timePickerCell.dateAndTime
				viewController?.cellsToDisplay[indexPath.section][indexPath.row].roundBottomCorners(cornerRadius: 10)
			}
		}
		viewController?.insert(at: indexPath)
	}
	
	private func deleteCell(at indexPath: IndexPath) {
		dataSource.sectionViewModels[indexPath.section].cellViewModels.remove(at: indexPath.row)
		viewController?.cellsToDisplay[indexPath.section].remove(at: indexPath.row)
		viewController?.delete(at: indexPath)
	}
}

extension OverlayPresenter {
	func present(data: OverlayDataSource) {
		guard let viewController = viewController else { return }
		viewController.cellsToDisplay.removeAll()
		let numberOfSectionViewModels = data.sectionViewModels.count
		viewController.cellsToDisplay.reserveCapacity(numberOfSectionViewModels)
		for sectionViewModelIndex in 0 ..< numberOfSectionViewModels {
			viewController.cellsToDisplay.append([])
			let currentSectionViewModel = data.sectionViewModels[sectionViewModelIndex]
			let numberOfCellViewModelsInSection = currentSectionViewModel.cellViewModels.count
			viewController.cellsToDisplay[sectionViewModelIndex].reserveCapacity(numberOfCellViewModelsInSection)
			for cellViewModelIndex in 0 ..< numberOfCellViewModelsInSection {
				let indexPath: IndexPath = .init(row: cellViewModelIndex, section: sectionViewModelIndex)
				let currentCellViewModel = currentSectionViewModel.cellViewModels[cellViewModelIndex]
				switch currentSectionViewModel.type {
				case .dateAndTime:
					switch currentCellViewModel.cellType {
					case .optionalDate:
						if let dateCell = tableView?.dequeueReusableCell(withIdentifier: DailyOptionalDateCell.cellIdentifier) as? DailyOptionalDateCell {
								if let data = data as? NewProjectOverlayDataSource {
									dateCell.switcher.isOn = data.isAssignedToDate
									dateCell.viewModel = currentCellViewModel
									dateCell.roundTopCorners(cornerRadius: 10)
									viewController.cellsToDisplay[sectionViewModelIndex].append(dateCell)
								}
							}
					case .requiredDate:
						if let dateCell = tableView?.dequeueReusableCell(withIdentifier: DailyRequiredDateCell.cellIdentifier) as? DailyRequiredDateCell {
							dateCell.viewModel = currentCellViewModel
							dateCell.roundTopCorners(cornerRadius: 10)
							viewController.cellsToDisplay[sectionViewModelIndex].append(dateCell)
						}
					case .datePicker:
						if let datePickerCell = tableView?.dequeueReusableCell(withIdentifier: DailyDatePickerCell.cellIdentifier) as? DailyDatePickerCell {
							datePickerCell.viewModel = nil
							viewController.cellsToDisplay[sectionViewModelIndex].append(datePickerCell)
						}
					case .time:
						if let timeCell = tableView?.dequeueReusableCell(withIdentifier: DailyTimeCell.cellIdentifier) as? DailyTimeCell {
							timeCell.viewModel = currentCellViewModel
							if cellViewModelIndex == numberOfCellViewModelsInSection - 1 {
								timeCell.roundBottomCorners(cornerRadius: 10)
							} else {
								timeCell.layer.maskedCorners = []
							}
							viewController.cellsToDisplay[sectionViewModelIndex].append(timeCell)
						}
					case .timePicker:
						if let timePickerCell = tableView?.dequeueReusableCell(withIdentifier: DailyTimePickerCell.cellIdentifier) as? DailyTimePickerCell {
							timePickerCell.viewModel = nil
							timePickerCell.roundBottomCorners(cornerRadius: 10)
							viewController.cellsToDisplay[sectionViewModelIndex].append(timePickerCell)
						}
					default:
						viewController.cellsToDisplay[sectionViewModelIndex].append(DailyCell())
					}
				case .teamProject:
					if let teamProjectCell = tableView?.dequeueReusableCell(withIdentifier: DailyTeamProjectCell.cellIdentifier, for: indexPath) as? DailyTeamProjectCell {
						teamProjectCell.viewModel = currentCellViewModel
						teamProjectCell.roundCorners(cornerRadius: 10)
						viewController.cellsToDisplay[sectionViewModelIndex].append(teamProjectCell)
					}
				case .remindAlert:
					if let remindCell = tableView?.dequeueReusableCell(
						withIdentifier: DailyRemindCell.cellIdentifier,
						for: indexPath) as? DailyRemindCell {
							remindCell.viewModel = currentCellViewModel
							remindCell.roundCorners(cornerRadius: 10)
						viewController.cellsToDisplay[sectionViewModelIndex].append(remindCell)
					}
				case .repeatSelector:
					if let repeatCell = tableView?.dequeueReusableCell(
						withIdentifier: DailyRepeatCell.cellIdentifier,
						for: indexPath) as? DailyRepeatCell {
							repeatCell.viewModel = currentCellViewModel
							repeatCell.roundCorners(cornerRadius: 10)
							repeatCell.accessoryType = .disclosureIndicator
						viewController.cellsToDisplay[sectionViewModelIndex].append(repeatCell)
					}
				default:
					viewController.cellsToDisplay[sectionViewModelIndex].append(DailyCell())
				}
			}
		}
		viewController.displayCells()
	}
}

