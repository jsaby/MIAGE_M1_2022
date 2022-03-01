//
//  CollectionViewController.swift
//  Demo
//
//  Created by Julie Saby on 12/11/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.isUserInteractionEnabled = true
		
		let layout = UICollectionViewFlowLayout()
		layout.minimumLineSpacing = 10
		layout.minimumInteritemSpacing = 10
		layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
		collectionView.collectionViewLayout = layout
		layout.scrollDirection = .horizontal
		
		collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
	}
	
	//MARK: --UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewFlowLayout
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
		cell.configure(indexPath.row)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = UIScreen.main.bounds.size.width
		return CGSize(width: (width - 10 - 20) / 3, height: 200)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("la")
	}
	
}

