//
//  OverlayPresentationLogic.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit

class OverlayPresenter {
	private weak var view: OverlayDisplayLogic?
	private weak var tableView: UITableView?
	private let dataSource: OverlayDataSource
	
	init(view: OverlayDisplayLogic, dataSource: OverlayDataSource) {
		self.view = view
		self.dataSource = dataSource
		if let tableView = (view as? OverlayVC)?.tableView {
			self.tableView = tableView
		}
	}
}

extension OverlayPresenter: OverlayPresentationLogic {
	func updateTimePickerCell(atSection section: Int) {
		guard let view = view else { return }
		if dataSource.isAssignedToTime {
			dataSource.sectionViewModels[section].cellViewModels.append(
				DailyCellViewModel(title: nil,
								   icon: nil,
								   cellType: .timePicker,
								   isToggable: false,
								   isSelectable: false)
			)
			if let timePickerCell = tableView?.dequeueReusableCell(withIdentifier: DailyTimePickerCell.cellIdentifier) as? DailyTimePickerCell{
				timePickerCell.roundBottomCorners(cornerRadius: 10)
				view.cellsToDisplay[section].append(timePickerCell)
				
				let lastRow = view.cellsToDisplay[section].count - 1
				let previousRow = lastRow - 1
				view.cellsToDisplay[section][previousRow].sharpCorners()
				view.insert(at: IndexPath(row: lastRow, section: section))
			}
		} else {
			dataSource.sectionViewModels[section].cellViewModels.removeLast()
			let lastRow = view.cellsToDisplay[section].count - 1
			let previousRow = lastRow - 1
			view.cellsToDisplay[section][previousRow].roundBottomCorners(cornerRadius: 10)
			view.cellsToDisplay[section].remove(at: lastRow)
			view.delete(at: IndexPath(row: lastRow, section: section))
		}
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
						view.cellsToDisplay[sectionViewModelIndex].append(UITableViewCell())
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
					view.cellsToDisplay[sectionViewModelIndex].append(UITableViewCell())
				}
			}
		}
		view.displayCells()
	}
}



















//func fillCells(from data: OverlayDataSource, in tableView: UITableView?) -> [[UITableViewCell]] {
//	var viewData = [[UITableViewCell]]()
//	let numberOfSectionViewModels = data.sectionViewModels.count
//	viewData.reserveCapacity(numberOfSectionViewModels)
//	for sectionViewModelIndex in 0 ..< numberOfSectionViewModels {
//		viewData.append([])
//		let currentSectionViewModel = data.sectionViewModels[sectionViewModelIndex]
//		let numberOfCellViewModelsInSection = currentSectionViewModel.cellViewModels.count
//		viewData[sectionViewModelIndex].reserveCapacity(numberOfCellViewModelsInSection)
//		for cellViewModelIndex in 0 ..< numberOfCellViewModelsInSection {
//			let indexPath: IndexPath = .init(row: cellViewModelIndex, section: sectionViewModelIndex)
//			let currentCellViewModel = currentSectionViewModel.cellViewModels[cellViewModelIndex]
//			switch currentSectionViewModel.type {
//			case .dateAndTime:
//				switch currentCellViewModel.cellType {
//				case .optionalDate:
//					if let dateCell = tableView?.dequeueReusableCell(withIdentifier: DailyOptionalDateCell.cellIdentifier) as? DailyOptionalDateCell {
//							if let data = data as? NewProjectOverlayDataSource {
//								dateCell.switcher.isOn = data.isAssignedToDate
//								dateCell.viewModel = currentCellViewModel
//								dateCell.roundTopCorners(cornerRadius: 10)
//								viewData[sectionViewModelIndex].append(dateCell)
//							}
//						}
//				case .requiredDate:
//					if let dateCell = tableView?.dequeueReusableCell(withIdentifier: DailyRequiredDateCell.cellIdentifier) as? DailyRequiredDateCell {
//						dateCell.viewModel = currentCellViewModel
//						dateCell.roundTopCorners(cornerRadius: 10)
//						viewData[sectionViewModelIndex].append(dateCell)
//					}
//				case .datePicker:
//					if let datePickerCell = tableView?.dequeueReusableCell(withIdentifier: DailyDatePickerCell.cellIdentifier) as? DailyDatePickerCell {
//						datePickerCell.viewModel = nil
//						viewData[sectionViewModelIndex].append(datePickerCell)
//					}
//				case .time:
//					if let timeCell = tableView?.dequeueReusableCell(withIdentifier: DailyTimeCell.cellIdentifier) as? DailyTimeCell {
//						timeCell.viewModel = currentCellViewModel
//						timeCell.switcher.isOn = data.isAssignedToTime
//						if cellViewModelIndex == numberOfCellViewModelsInSection - 1 {
//							timeCell.roundBottomCorners(cornerRadius: 10)
//						} else {
//							timeCell.layer.maskedCorners = []
//						}
//						viewData[sectionViewModelIndex].append(timeCell)
//					}
//				case .timePicker:
//					if let timePickerCell = tableView?.dequeueReusableCell(withIdentifier: DailyTimePickerCell.cellIdentifier) as? DailyTimePickerCell {
//						timePickerCell.viewModel = nil
//						timePickerCell.roundBottomCorners(cornerRadius: 10)
//						viewData[sectionViewModelIndex].append(timePickerCell)
//					}
//				default:
//					viewData[sectionViewModelIndex].append(UITableViewCell())
//				}
//			case .teamProject:
//				if let teamProjectCell = tableView?.dequeueReusableCell(withIdentifier: DailyTeamProjectCell.cellIdentifier, for: indexPath) as? DailyTeamProjectCell {
//					teamProjectCell.viewModel = currentCellViewModel
//					teamProjectCell.roundCorners(cornerRadius: 10)
//					viewData[sectionViewModelIndex].append(teamProjectCell)
//				}
//			case .remindAlert:
//				if let remindCell = tableView?.dequeueReusableCell(
//					withIdentifier: DailyRemindCell.cellIdentifier,
//					for: indexPath) as? DailyRemindCell {
//						remindCell.viewModel = currentCellViewModel
//						remindCell.roundCorners(cornerRadius: 10)
//						viewData[sectionViewModelIndex].append(remindCell)
//				}
//			case .repeatSelector:
//				if let repeatCell = tableView?.dequeueReusableCell(
//					withIdentifier: DailyRepeatCell.cellIdentifier,
//					for: indexPath) as? DailyRepeatCell {
//						repeatCell.viewModel = currentCellViewModel
//						repeatCell.roundCorners(cornerRadius: 10)
//						repeatCell.accessoryType = .disclosureIndicator
//						viewData[sectionViewModelIndex].append(repeatCell)
//				}
//			default:
//				viewData[sectionViewModelIndex].append(UITableViewCell())
//			}
//		}
//	}
//	return viewData
//}
