//
//  TabBarVCViewController.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//
import UIKit
import FirebaseAuth

class DailyTabBarController: TabBarControllerWithMiddleButton {
	let plusButton = PlusButton()
	
	let blackoutView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .dailyPlusButtonBlackoutColor
		return view
	}()
	
	let newProjectButton = AddButton(title: "New project", symbolName: "doc.on.doc")
	let newTaskButton = AddButton(title: "New task", symbolName: "paperclip")
	let newNoteButton = AddButton(title: "New note", symbolName: "highlighter")
	
	let addButtonsStackView = UIStackView()
	
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
		setupBlackoutView()
		setupAddButtonsVerticalStackView()
		
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
		plusButton.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
	}
	
	@objc func plusButtonPressed() {
		plusButton.isPressedToShowOverlay.toggle()
		
		if plusButton.isPressedToShowOverlay {
			addButtonsStackView.isHidden = false //show stack
			blackoutView.isHidden = false //blackout the background
			UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
				self.blackoutView.alpha = 1 //and show it with animation
			}
		} else {
			UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
				self.addButtonsStackView.isHidden = true
				self.blackoutView.alpha = 0
			}) { _ in
				self.blackoutView.isHidden = true
			}
		}
	}
	
	@objc func didTapNewNoteButton() {
		addButtonsStackView.isHidden = true
		
	}
	
	@objc func didTapNewTaskButton() {
		addButtonsStackView.isHidden = true
	}
	
	@objc func didTapNewProjectButton() {
		addButtonsStackView.isHidden = true
	}
	
	func showOverlay(overlay: UIView) {
		
	}
	
	func hideOverlay(overlay: UIView) {
		
	}
	
	func setupAddButtonsVerticalStackView() {
		addButtonsStackView.isHidden = true
		NSLayoutConstraint.activate([
			addButtonsStackView.bottomAnchor.constraint(equalTo: plusButton.safeAreaLayoutGuide.topAnchor, constant: -20),
			addButtonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
			
		])
		
	}
	
	func setupBlackoutView() {
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
