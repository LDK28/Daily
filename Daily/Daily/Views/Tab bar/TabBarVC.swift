//
//  TabBarVCViewController.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//
import UIKit
import FirebaseAuth

class TabBarVC: UITabBarController {
	let plusButton = PlusButton()
	
	let plusButtonBlackout: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .dailyPlusButtonBlackoutColor
		return view
	}()
	
	let newProjectButton = AddButton(title: "Новый проект", symbolName: "doc.on.doc")
	let newTaskButton = AddButton(title: "Новая задача", symbolName: "paperclip")
	let newNoteButton = AddButton(title: "Новая заметка", symbolName: "highlighter")
	
	let addButtonsStackView = UIStackView()
	
	override func loadView() {
		super.loadView()
		
		/*
		
			View Hierachy: Tab Bar -> Blackout Layer -> Button -> Overlay -> The rest of view components
		
		*/
		
		addButtonsStackView.addArrangedSubview(newProjectButton)
		addButtonsStackView.addArrangedSubview(newNoteButton)
		addButtonsStackView.addArrangedSubview(newTaskButton)
		
		view.addSubview(plusButtonBlackout)
		view.addSubview(plusButton)
		view.addSubview(addButtonsStackView)
		
		createTabBar()
		setupBlackoutForPlusButton()
		setupPlusButton()
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
		
		plusButton.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
	}
	
	@objc func plusButtonPressed() {
		//HOW TO ANIMATE AN IMAGE CHANGE IN THIS BUTTON?
		plusButton.toggleImage()
		addButtonsStackView.isHidden.toggle()

		if plusButtonBlackout.isHidden {
			plusButtonBlackout.isHidden.toggle()
			UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
				self.plusButtonBlackout.alpha = 1
			}
		} else {
			UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
				self.plusButtonBlackout.alpha = 0
			}) { _ in
				self.plusButtonBlackout.isHidden.toggle()
			}
		}
	}
	
	func setupAddButtonsVerticalStackView() {
		addButtonsStackView.isHidden = true
		NSLayoutConstraint.activate([
			addButtonsStackView.bottomAnchor.constraint(equalTo: plusButton.safeAreaLayoutGuide.topAnchor, constant: -20),
			addButtonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
			
		])
		
	}
	
	func setupBlackoutForPlusButton() {
		plusButtonBlackout.isHidden = true
		plusButtonBlackout.alpha = 0
		NSLayoutConstraint.activate([
			plusButtonBlackout.topAnchor.constraint(equalTo: view.topAnchor),
			plusButtonBlackout.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -tabBar.frame.height),
			plusButtonBlackout.widthAnchor.constraint(equalTo: view.widthAnchor),
		])
	}
	
	func setupPlusButton() {
		
		let multiplier: CGFloat = 1.2
		let size = tabBar.frame.size.height * multiplier
		
		NSLayoutConstraint.activate([
			plusButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
			plusButton.centerYAnchor.constraint(equalTo: tabBar.safeAreaLayoutGuide.topAnchor, constant: -5),
			plusButton.heightAnchor.constraint(equalToConstant: size),
			plusButton.widthAnchor.constraint(equalTo: plusButton.heightAnchor)
		])
		
	}
	
	func styleElements() {
		
		addButtonsStackView.styleStackView(spacing: 10, axis: .vertical)
	}
	
	func createTabBar() {

		let styling = tabBar
		styling.isTranslucent = false
		styling.tintColor = .dailyTabBarSelectedItemColor
		styling.unselectedItemTintColor = .dailyTabBarItemColor
		styling.barTintColor = .dailyTabBarColor
		let systemFontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
		UITabBarItem.appearance().setTitleTextAttributes(systemFontAttributes, for: .normal)

	
		self.viewControllers = [createDiaryNC(), createIdeasNC(), createCalendarNC(), createProfileNC()]
	}
	
	func createDiaryNC() -> UINavigationController {
	
		let diaryVC = DiaryVC()
		diaryVC.title = nil
		diaryVC.tabBarItem = UITabBarItem(title: "Diary", image: UIImage(systemName: "note.text.badge.plus"), tag: 0)
		let diaryNavigationController =  UINavigationController(rootViewController: diaryVC)
		diaryNavigationController.setNavigationBarHidden(true, animated: false)
		return diaryNavigationController
		
	}

	func createIdeasNC() -> UINavigationController {
		let ideasVC = IdeasVC()
		ideasVC.title = nil
		ideasVC.tabBarItem = UITabBarItem(title: "Ideas", image: UIImage(systemName: "note"), tag: 1)
		let ideaNavigationController = UINavigationController(rootViewController: ideasVC)
		ideaNavigationController.setNavigationBarHidden(true, animated: false)
		return ideaNavigationController
	}

	func createCalendarNC() -> UINavigationController {
		let calendarVC = CalendarVC()
		calendarVC.title = nil
		calendarVC.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar.circle.fill"), tag: 2)
		let calendarNavigationController = UINavigationController(rootViewController: calendarVC)
		calendarNavigationController.setNavigationBarHidden(true, animated: false)
		return calendarNavigationController
	}
	
	func createProfileNC() -> UINavigationController {
		let userInfoVC = UserInfoVC()
		userInfoVC.title = nil
		userInfoVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 3)
		let profileNavigationController = UINavigationController(rootViewController: userInfoVC)
		profileNavigationController.setNavigationBarHidden(true, animated: false)
		return profileNavigationController
	}
	

}
