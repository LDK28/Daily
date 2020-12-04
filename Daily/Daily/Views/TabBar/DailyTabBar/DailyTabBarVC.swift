//
//  DailyTabBarVC.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

final class DailyTabBarVC: TabBarControllerWithMiddleButton {
	var interactor: DailyTabBarBusinessLogic?
	var router: (DailyTabBarRoutingLogic & DailyTabBarDataPassing)?
  
	private let plusButton = PlusButton()
	private let blackoutView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .dailyPlusButtonBlackoutColor
		return view
	}()
	private var overlayViewContoller: UIViewController? = nil
	private let newProjectButton = AddButton(title: "New project", symbolName: "doc.on.doc")
	private let newTaskButton = AddButton(title: "New task", symbolName: "paperclip")
	private let newNoteButton = AddButton(title: "New note", symbolName: "highlighter")
	private let addButtonsStackView = UIStackView()
	
	override func loadView() {
		super.loadView()
		configureAndStyleUI()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		newProjectButton.addTarget(self, action: #selector(didTapNewProjectButton), for: .touchUpInside)
		newTaskButton.addTarget(self, action: #selector(didTapNewTaskButton), for: .touchUpInside)
		newNoteButton.addTarget(self, action: #selector(didTapNewNoteButton), for: .touchUpInside)
		plusButton.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
		
		NotificationCenter.default.addObserver(self, selector: #selector(didTapPlusButton), name: Notification.Name("Close Overlay"), object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(didTapAddNoteButton), name: Notification.Name("New note"), object: nil)

	}
	
	@objc func didTapAddNoteButton() {
		didTapPlusButton()
		didTapNewNoteButton()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		interactor?.checkUserLoginStatus()
	}
	
	@objc func changeItemView(to selectedIndex: Int) {
		tabBarController?.selectedIndex = selectedIndex
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
	
	func showOverlay(overlay: UIViewController) {
		addButtonsStackView.isHidden = true
		overlayViewContoller = overlay
		if let overlay = overlayViewContoller {
			add(overlay)
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
	
	func animatePlusButtonChange() {
		UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: { [weak self] in
			guard let self = self else { return }
			self.plusButton.isSelected.toggle()
			if self.plusButton.isSelected {
				//self.plusButton.imageView?.transform = CGAffineTransform(rotationAngle: .pi / 2)
				self.addButtonsStackView.isHidden = false
				self.blackoutView.isHidden = false
				self.blackoutView.alpha = 1
				self.addButtonsStackView.frame.origin.y -= 20
				self.addButtonsStackView.alpha = 1
			} else {
				//self.plusButton.imageView?.transform = CGAffineTransform(rotationAngle: 0)
				self.overlayViewContoller?.remove()
				self.overlayViewContoller = nil
				self.addButtonsStackView.frame.origin.y += 15
				self.addButtonsStackView.alpha = 0
				self.blackoutView.alpha = 0
			}
		}) { [weak self] _ in
			guard let self = self else { return }
			if !self.plusButton.isSelected {
				self.addButtonsStackView.frame.origin.y += 5
				self.blackoutView.isHidden = true
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
		blackoutView.isHidden = true
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
