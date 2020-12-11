//
//  SplashViewController.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//

import UIKit

class SpashScreenVC: UIViewController {
	let imageView = UIImageView()
	
	override func loadView() {
		super.loadView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(named: "Background")
		imageView.contentMode = .scaleAspectFill
		
		view.addSubview(imageView)
		
		NSLayoutConstraint.activate([
			imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			imageView.topAnchor.constraint(equalTo: view.topAnchor),
			imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .dailyMainBackgroundColor
	}
	
	override func viewDidAppear(_ animated: Bool) {
		UIView.animate(withDuration: 1, animations: {
			self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
			self.imageView.alpha = 0
		})
	}
}
