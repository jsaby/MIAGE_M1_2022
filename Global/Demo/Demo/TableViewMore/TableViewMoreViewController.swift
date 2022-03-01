//
//  TableViewMoreViewController.swift
//  Demo
//
//  Created by Julie Saby on 11/03/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import UIKit

class TableViewMoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var customTableView: UITableView!
	
	var refreshControl = UIRefreshControl()
	
	let datasA: [String] = ["11h10", "12h20", "13h30"]
	let datasB: [String] = ["11h15", "12h25", "13h35", "13h45"]
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		customTableView.delegate = self
		customTableView.dataSource = self
		
		refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
		refreshControl.addTarget(self, action: #selector(TableViewMoreViewController.loadDatas), for: UIControl.Event.valueChanged)
		customTableView.addSubview(refreshControl)
    }
	
	@objc func loadDatas() {
		refreshControl.beginRefreshing()
		DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
			self.refreshControl.endRefreshing()
		}
	}

	//MARK: - Events Table View
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return datasA.count
		}
		
		return datasB.count
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
		let cell = customTableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! DataTableViewCell
		let text = indexPath.section == 0 ? datasA[indexPath.row] : datasB[indexPath.row]
		cell.titleLabel.text = text
		return cell
	}
}
