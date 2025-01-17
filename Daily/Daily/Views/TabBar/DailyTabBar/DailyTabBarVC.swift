//
//  DailyTabBarVC.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

protocol TabBarModuleChangedDelegate: AnyObject {
	func openNotes()
	func openProjects()
	func openDiary()
}

final class DailyTabBarVC: TabBarControllerWithMiddleButton, TabBarModuleChangedDelegate {
	var interactor: DailyTabBarBusinessLogic?
	var router: (DailyTabBarRoutingLogic & DailyTabBarDataPassing)?
	weak var coordinator: DailyCoordinator?
	
	private let plusButton = PlusButton()
	
	private let blackoutView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .dailyPlusButtonBlackoutColor
		return view
	}()
	
	private var overlayViewContoller: UIViewController? = nil
	
	private let newProjectButton = AddButton(title: "New project",
											 symbolName: "doc.on.doc")
	
	private let newTaskButton = AddButton(title: "New task",
										  symbolName: "paperclip")
	
	private let newNoteButton = AddButton(title: "New note",
										  symbolName: "highlighter")
	
	private let addButtonsStackView = UIStackView()
	
	override func loadView() {
		super.loadView()
		configureAndStyleUI()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		newProjectButton.addTarget(self,
								   action: #selector(didTapNewProjectButton),
								   for: .touchUpInside)
		newTaskButton.addTarget(self,
								action: #selector(didTapNewTaskButton),
								for: .touchUpInside)
		
		newNoteButton.addTarget(self,
								action: #selector(didTapNewNoteButton),
								for: .touchUpInside)
		plusButton.addTarget(self,
							 action: #selector(didTapPlusButton),
							 for: .touchUpInside)
		
		NotificationCenter.default.addObserver(self,
											   selector: #selector(didTapPlusButton),
											   name: Notification.Name("Close Overlay"),
											   object: nil)
		
		NotificationCenter.default.addObserver(self,
											   selector: #selector(didTapAddNoteButton),
											   name: Notification.Name("New note"),
											   object: nil)
		
		NotificationCenter.default.addObserver(self,
											   selector: #selector(turnOnBlackout),
											   name: Notification.Name("Turn on blackout"),
											   object: nil)
		
		NotificationCenter.default.addObserver(self,
											   selector: #selector(turnOffBlackout),
											   name: Notification.Name("Turn off blackout"),
											   object: nil)

	}
	
	@objc func didTapAddNoteButton() {
		didTapPlusButton()
		didTapNewNoteButton()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
	
	@objc func didTapPlusButton() {
		UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
		animatePlusButtonChange()
	}
	
	@objc func didTapNewNoteButton() {
		newNoteButton.tapAnimation { [weak self] in
			guard let self = self else { return }
			self.showOverlay(overlay: NewNoteOverlayModule.build())
		}
	}
	
	@objc func didTapNewTaskButton() {
		newTaskButton.tapAnimation { [weak self] in
			guard let self = self else { return }
			self.showOverlay(overlay: NewTaskOverlayModule.build())
		}
	}
	
	@objc func didTapNewProjectButton() {
		newProjectButton.tapAnimation { [weak self] in
			guard let self = self else { return }
			self.showOverlay(overlay: NewProjectOverlayModule.build())
		}
	}
	
	func showOverlay(overlay: OverlayVC) {
		addButtonsStackView.isHidden = true
		overlay.delegate = self
		overlayViewContoller = overlay
		if let overlay = overlayViewContoller {
			add(overlay)
		}
	}
	
	func openNotes() {
		ordinaryTransition(to: NotesModule.build(), with: 1)
	}
	
	func openProjects() {
		ordinaryTransition(to: ProjectsModule.build(), with: 1)
	}
	
	func openDiary() {
		ordinaryTransition(to: DiaryVC(), with: 0)
	}
	
	fileprivate func ordinaryTransition(to viewController: UIViewController, with index: Int) {
		if let navigationController = self.viewControllers?[index] as? UINavigationController {
			didTapPlusButton()
			navigationController.popToRootViewController(animated: false)
			self.selectedIndex = index
			navigationController.pushViewController(viewController, animated: true)
		}
	}
}

extension DailyTabBarVC: DailyTabBarDisplayLogic {
	func askRouterToNavigateToLoginScreen() {
		router?.navigateToLoginScreen()
	}
}

// MARK: - UI Configuration and Animation
extension DailyTabBarVC {
	@objc func turnOnBlackout() {
		self.blackoutView.alpha = 1
	}
	
	@objc func turnOffBlackout() {
		self.blackoutView.alpha = 0
	}
	
	func animatePlusButtonChange() {
		UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: { [weak self] in
			guard let self = self else { return }
			self.plusButton.isSelected.toggle()
			if self.plusButton.isSelected {
				self.addButtonsStackView.isHidden = false
				self.turnOnBlackout()
				self.addButtonsStackView.frame.origin.y -= 20
				self.addButtonsStackView.alpha = 1
			} else {
				self.overlayViewContoller?.remove()
				self.overlayViewContoller = nil
				self.addButtonsStackView.frame.origin.y += 15
				self.addButtonsStackView.alpha = 0
				self.turnOffBlackout()
			}
		}) { [weak self] _ in
			guard let self = self else { return }
			if !self.plusButton.isSelected {
				self.addButtonsStackView.frame.origin.y += 5
				self.addButtonsStackView.isHidden = true
			}
		}
	}
	
	func configureAndStyleUI() {
		addButtonsStackView.addArrangedSubview(newProjectButton)
		addButtonsStackView.addArrangedSubview(newNoteButton)
		addButtonsStackView.addArrangedSubview(newTaskButton)
		
		view.addSubview(blackoutView)
		view.addSubview(plusButton)
		view.addSubview(addButtonsStackView)
		
		layoutMiddleButton(button: plusButton)
		configureBlackoutView()
		configureAddButtonsVerticalStackView()
		
		styleElements()
		
	}
	
	func configureAddButtonsVerticalStackView() {
		addButtonsStackView.isHidden = true
		NSLayoutConstraint.activate([
			addButtonsStackView.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: -5),
			addButtonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
			
		])
	}
	
	func configureBlackoutView() {
		blackoutView.alpha = 0
		NSLayoutConstraint.activate([
			blackoutView.topAnchor.constraint(equalTo: view.topAnchor),
			blackoutView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -tabBar.frame.height),
			blackoutView.widthAnchor.constraint(equalTo: view.widthAnchor),
		])
	}
	
	func styleElements() {
		addButtonsStackView.styleStackView(spacing: 10, axis: .vertical)
	}
}
