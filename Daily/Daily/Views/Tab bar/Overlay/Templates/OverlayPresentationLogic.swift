//
//  OverlayPresentationLogic.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit

class OverlayPresenter {
	internal weak var view: OverlayDisplayLogic?
	internal weak var tableView: UITableView?
	internal let dataSource: OverlayDataSource
	
	init(view: OverlayDisplayLogic, dataSource: OverlayDataSource) {
		self.view = view
		self.dataSource = dataSource
		if let tableView = (view as? OverlayVC)?.tableView {
			self.tableView = tableView
		}
	}
}

extension OverlayPresenter: OverlayPresentationLogic {
	func updateDateAndTimeSection(atIndex section: Int, afterCellOfType cellType: DailyCellType) {
		guard cellType == .optionalDate || cellType == .time else { return }
		guard let previousRow = dataSource.sectionViewModels[section].cellViewModels.firstIndex(where: { cellViewModel in
			cellViewModel.cellType == cellType
		}) else { return }
		
		if cellType == .time {
			if dataSource.isAssignedToTime {
				view?.cellsToDisplay[section][previousRow].sharpCorners()
				insertCellViewModel(at: IndexPath(row: previousRow + 1, section: section), cellWithType: .timePicker)
				return
			} else {
				view?.cellsToDisplay[section][previousRow].roundBottomCorners(cornerRadius: 10)
			}
		} else {
			if let dataSource = dataSource as? NewProjectOverlayDataSource {
				if dataSource.isAssignedToDate {
					insertCellViewModel(at: IndexPath(row: previousRow + 1, section: section), cellWithType: .datePicker)
					return
				}
			}
		}
		
		deleteCell(at: IndexPath(row: previousRow + 1, section: section))
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
				view?.cellsToDisplay[indexPath.section].insert(datePickerCell, at: indexPath.row)
			}
		} else {
			if let timePickerCell = tableView?.dequeueReusableCell(withIdentifier: DailyTimePickerCell.cellIdentifier) as? DailyTimePickerCell {
				view?.cellsToDisplay[indexPath.section].insert(timePickerCell, at: indexPath.row)
				view?.cellsToDisplay[indexPath.section][indexPath.row].roundBottomCorners(cornerRadius: 10)
			}
		}
		view?.insert(at: indexPath)
	}
	
	private func deleteCell(at indexPath: IndexPath) {
		dataSource.sectionViewModels[indexPath.section].cellViewModels.remove(at: indexPath.row)
		view?.cellsToDisplay[indexPath.section].remove(at: indexPath.row)
		view?.delete(at: indexPath)
	}
}

extension OverlayPresenter {
	func present(data: OverlayDataSource) {
		guard let view = view else { return }
		view.cellsToDisplay.removeAll()
		let numberOfSectionViewModels = data.sectionViewModels.count
		view.cellsToDisplay.reserveCapacity(numberOfSectionViewModels)
		for sectionViewModelIndex in 0 ..< numberOfSectionViewModels {
			view.cellsToDisplay.append([])
			let currentSectionViewModel = data.sectionViewModels[sectionViewModelIndex]
			let numberOfCellViewModelsInSection = currentSectionViewModel.cellViewModels.count
			view.cellsToDisplay[sectionViewModelIndex].reserveCapacity(numberOfCellViewModelsInSection)
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
									view.cellsToDisplay[sectionViewModelIndex].append(dateCell)
								}
							}
					case .requiredDate:
						if let dateCell = tableView?.dequeueReusableCell(withIdentifier: DailyRequiredDateCell.cellIdentifier) as? DailyRequiredDateCell {
							dateCell.viewModel = currentCellViewModel
							dateCell.roundTopCorners(cornerRadius: 10)
							view.cellsToDisplay[sectionViewModelIndex].append(dateCell)
						}
					case .datePicker:
						if let datePickerCell = tableView?.dequeueReusableCell(withIdentifier: DailyDatePickerCell.cellIdentifier) as? DailyDatePickerCell {
							datePickerCell.viewModel = nil
							view.cellsToDisplay[sectionViewModelIndex].append(datePickerCell)
						}
					case .time:
						if let timeCell = tableView?.dequeueReusableCell(withIdentifier: DailyTimeCell.cellIdentifier) as? DailyTimeCell {
							timeCell.viewModel = currentCellViewModel
							if cellViewModelIndex == numberOfCellViewModelsInSection - 1 {
								timeCell.roundBottomCorners(cornerRadius: 10)
							} else {
								timeCell.layer.maskedCorners = []
							}
							view.cellsToDisplay[sectionViewModelIndex].append(timeCell)
						}
					case .timePicker:
						if let timePickerCell = tableView?.dequeueReusableCell(withIdentifier: DailyTimePickerCell.cellIdentifier) as? DailyTimePickerCell {
							timePickerCell.viewModel = nil
							timePickerCell.roundBottomCorners(cornerRadius: 10)
							view.cellsToDisplay[sectionViewModelIndex].append(timePickerCell)
						}
					default:
						view.cellsToDisplay[sectionViewModelIndex].append(DailyCell())
					}
				case .teamProject:
					if let teamProjectCell = tableView?.dequeueReusableCell(withIdentifier: DailyTeamProjectCell.cellIdentifier, for: indexPath) as? DailyTeamProjectCell {
						teamProjectCell.viewModel = currentCellViewModel
						teamProjectCell.roundCorners(cornerRadius: 10)
						view.cellsToDisplay[sectionViewModelIndex].append(teamProjectCell)
					}
				case .remindAlert:
					if let remindCell = tableView?.dequeueReusableCell(
						withIdentifier: DailyRemindCell.cellIdentifier,
						for: indexPath) as? DailyRemindCell {
							remindCell.viewModel = currentCellViewModel
							remindCell.roundCorners(cornerRadius: 10)
						view.cellsToDisplay[sectionViewModelIndex].append(remindCell)
					}
				case .repeatSelector:
					if let repeatCell = tableView?.dequeueReusableCell(
						withIdentifier: DailyRepeatCell.cellIdentifier,
						for: indexPath) as? DailyRepeatCell {
							repeatCell.viewModel = currentCellViewModel
							repeatCell.roundCorners(cornerRadius: 10)
							repeatCell.accessoryType = .disclosureIndicator
						view.cellsToDisplay[sectionViewModelIndex].append(repeatCell)
					}
				default:
					view.cellsToDisplay[sectionViewModelIndex].append(DailyCell())
				}
			}
		}
		view.displayCells()
	}
}
