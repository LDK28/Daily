//
//  TabBarVCViewController.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//
import UIKit
import FirebaseAuth

class DailyTabBarController: TabBarControllerWithMiddleButton {
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
		
		/*
		
			View Hierachy: Tab Bar -> Blackout Layer -> Button -> Overlay -> The rest of view components
		
		*/
		
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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if Auth.auth().currentUser == nil {
			let navController = UINavigationController(rootViewController: LoginVC())
			navController.modalPresentationStyle = .fullScreen
			self.present(navController, animated: true, completion: nil)
		}
		
		newProjectButton.addTarget(self, action: #selector(didTapNewProjectButton), for: .touchUpInside)
		newTaskButton.addTarget(self, action: #selector(didTapNewTaskButton), for: .touchUpInside)
		newNoteButton.addTarget(self, action: #selector(didTapNewNoteButton), for: .touchUpInside)
		plusButton.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
		
		NotificationCenter.default.addObserver(self, selector: #selector(didTapPlusButton), name: Notification.Name("Close Overlay"), object: nil)
	}
	
	@objc func didTapPlusButton() {
		plusButton.isPressedToShowOverlay.toggle()
		
		if plusButton.isPressedToShowOverlay {
			addButtonsStackView.isHidden = false //show stack
			blackoutView.isHidden = false //blackout the background
			
			UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
				self.blackoutView.alpha = 1 //and show it with animation
				self.addButtonsStackView.frame.origin.y -= 20
				self.addButtonsStackView.alpha = 1
			}
		} else {
			UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
				self.overlayViewContoller?.remove()
				self.overlayViewContoller = nil
				self.addButtonsStackView.frame.origin.y += 15
				self.addButtonsStackView.alpha = 0
				self.blackoutView.alpha = 0
			}) { _ in
				self.addButtonsStackView.frame.origin.y += 5
				self.blackoutView.isHidden = true
				self.addButtonsStackView.isHidden = true
			}
		}
	}
	
	@objc func didTapNewNoteButton() {
		showOverlay(overlay: NewNoteOverlayModule.build())
	}
	
	@objc func didTapNewTaskButton() {
		showOverlay(overlay: NewTaskOverlayModule.build())
	}
	
	@objc func didTapNewProjectButton() {
		showOverlay(overlay: NewProjectOverlayModule.build())
	}
	
	func showOverlay(overlay: UIViewController) {
		addButtonsStackView.isHidden = true
		overlayViewContoller = overlay
		if let overlay = overlayViewContoller {
			add(overlay, highestElementInTabBar: plusButton)
		}
	}
	
	
	func configureAddButtonsVerticalStackView() {
		addButtonsStackView.isHidden = true
		NSLayoutConstraint.activate([
			addButtonsStackView.bottomAnchor.constraint(equalTo: plusButton.safeAreaLayoutGuide.topAnchor),
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
