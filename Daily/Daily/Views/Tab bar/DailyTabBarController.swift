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
	private var rotationAngle: CGFloat = 0
	
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
		
		newProjectButton.addTarget(self, action: #selector(didTapNewProjectButton), for: .touchUpInside)
		newTaskButton.addTarget(self, action: #selector(didTapNewTaskButton), for: .touchUpInside)
		newNoteButton.addTarget(self, action: #selector(didTapNewNoteButton), for: .touchUpInside)
		plusButton.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
		
		NotificationCenter.default.addObserver(self, selector: #selector(didTapPlusButton), name: Notification.Name("Close Overlay"), object: nil)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		if Auth.auth().currentUser == nil {
			let navController = UINavigationController(rootViewController: LoginVC())
			navController.modalPresentationStyle = .fullScreen
			self.present(navController, animated: true, completion: nil)
		}
	}
	@objc func didTapPlusButton() {
		UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: { [self] in
			plusButton.isSelected.toggle()
			if plusButton.isSelected {
				plusButton.transform = CGAffineTransform(rotationAngle: .pi / 2)
				addButtonsStackView.isHidden = false //show stack
				blackoutView.isHidden = false //blackout the background
				blackoutView.alpha = 1 //and show it with animation
				addButtonsStackView.frame.origin.y -= 20
				addButtonsStackView.alpha = 1
			} else {
				plusButton.transform = CGAffineTransform(rotationAngle: 0)
				overlayViewContoller?.remove()
				overlayViewContoller = nil
				addButtonsStackView.frame.origin.y += 15
				addButtonsStackView.alpha = 0
				blackoutView.alpha = 0
			}
		}) { [self] _ in
			if !plusButton.isSelected {
				addButtonsStackView.frame.origin.y += 5
				blackoutView.isHidden = true
				addButtonsStackView.isHidden = true
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
