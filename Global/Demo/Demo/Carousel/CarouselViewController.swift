//
//  CarouselViewController.swift
//  Demo
//
//  Created by Julie Saby on 12/11/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import UIKit

class CarouselViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
	
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var pageControl: UIPageControl!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		let layout = UICollectionViewFlowLayout()
		layout.minimumLineSpacing = 0
		layout.minimumInteritemSpacing = 0
		layout.sectionInset = UIEdgeInsets.zero
		collectionView.collectionViewLayout = layout
		layout.scrollDirection = .horizontal
		
		collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
	}
	
	@IBAction func pageControltapped(_ sender: Any) {
		guard let pageControl = sender as? UIPageControl else { return }
		let selectedPage = pageControl.currentPage
		collectionView.scrollToItem(at: IndexPath(row: selectedPage, section: 0), at: .left, animated: true)
	}
	
	//MARK: --UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewFlowLayout
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		let count = 5
		
		pageControl.numberOfPages = count
		pageControl.isHidden = !(count > 1)
		
		return count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
		cell.configure(indexPath.row)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = UIScreen.main.bounds.size.width
		return CGSize(width: (width - 20), height: 300)
	}
	
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		pageControl.currentPage = indexPath.item
	}
	
	//MARK: --UIScrollViewDelegate
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
	   let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
	   let index = scrollView.contentOffset.x / witdh
	   let roundedIndex = round(index)
	   self.pageControl.currentPage = Int(roundedIndex)
   }
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

		pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
	}

	func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {

		pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
	}
}

