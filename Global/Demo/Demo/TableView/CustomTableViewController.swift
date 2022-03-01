//
//  CustomTableViewController.swift
//  Demo
//
//  Created by Julie Saby on 09/03/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import UIKit

enum DataVC: String {
	case map = "Map"
	case geoloc = "Geolocation"
	case animation = "Animations"
	case tableViewWithHeader = "TableView with header"
	case collectionView = "CollectionView scroll horizontal"
	case carousel = "Carousel with CollectionView"
	case webservice = "Webservice"
	case avatar = "Avatar"
	case imagePicker = "Image Picker"
}

class CustomTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var customTableView: UITableView!

	let datas: [DataVC] = [.map, .geoloc, .animation, .tableViewWithHeader, .collectionView, .carousel, .webservice, .avatar, .imagePicker]
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		customTableView.delegate = self
		customTableView.dataSource = self
    }

	//MARK: - Events Table View
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return datas.count
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let titleView = UIView()
		
		let titleLabel = UILabel()
		titleLabel.text = "Titre de section"
		titleView.addSubview(titleLabel)
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		
		titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 20).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: 20).isActive = true
		titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor, constant: 10).isActive = true
		titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10).isActive = true
		titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
		
		return titleView
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 60
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let deaultCell = UITableViewCell()
		
		let cell = customTableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! DataTableViewCell
		cell.titleLabel.text = datas[indexPath.row].rawValue
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let data = datas[indexPath.row]
		pushViewController(data)
		
		customTableView.deselectRow(at: indexPath, animated: true)
	}
	
	func pushViewController(_ dataVC: DataVC) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		var nextViewController: UIViewController!
		
		switch dataVC {
		case .map:
			nextViewController = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
		case .geoloc:
			nextViewController = storyboard.instantiateViewController(withIdentifier: "GeolocationViewController") as! GeolocationViewController
		case .animation:
			nextViewController = storyboard.instantiateViewController(withIdentifier: "AnimationsViewController") as! AnimationsViewController
		case .tableViewWithHeader:
			nextViewController = storyboard.instantiateViewController(withIdentifier: "TableViewMoreViewController") as! TableViewMoreViewController
		case .collectionView:
			nextViewController = storyboard.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
		case .carousel:
			nextViewController = storyboard.instantiateViewController(withIdentifier: "CarouselViewController") as! CarouselViewController
		case .webservice:
			nextViewController = storyboard.instantiateViewController(withIdentifier: "WebServiceViewController") as! WebServiceViewController
		case .avatar:
			nextViewController = storyboard.instantiateViewController(withIdentifier: "AvatarViewController") as! AvatarViewController
		case .imagePicker:
			nextViewController = storyboard.instantiateViewController(withIdentifier: "ImagePickerViewController") as! ImagePickerViewController
		}
		
		self.navigationController?.pushViewController(nextViewController, animated: true)
	}
}
