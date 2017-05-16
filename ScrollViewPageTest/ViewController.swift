//
//  ViewController.swift
//  ScrollViewPageTest
//
//  Created by Alfred Choi on 2017-05-14.
//  Copyright © 2017 Alfred Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource  {
    
    let scrollView = UIScrollView()
    var collectionView: UICollectionView!
    
    var lastContentOffset: CGFloat!
    var currentIndex = 7;
    var content: [String] = []
    var contentColors: [UIColor] = [UIColor.red, UIColor.blue, UIColor.green]
    var page1 = PageViewController()
    var page2 = PageViewController()
    var page3 = PageViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for index in 0...9 {
            content.append("page \(index)")
        }
        
//        navigationController?.isNavigationBarHidden = true
        self.automaticallyAdjustsScrollViewInsets = false
        setupCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCollectionView(){
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let navbarHeight = navigationController!.navigationBar.frame.size.height
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.itemSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height - navbarHeight - statusBarHeight)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        collectionView.isPagingEnabled = true
        self.view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentColors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let tableView = UITableView()
        cell.backgroundColor = contentColors[indexPath.row]
        cell.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: cell.contentView.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: cell.contentView.rightAnchor).isActive = true
        return cell
    }
    
//    func setupScrolView(){
//        let width = self.view.frame.width
//        
//        scrollView.delegate = self
//
//        self.view.addSubview(self.scrollView)
//        self.scrollView.isPagingEnabled = true
//        self.scrollView.showsHorizontalScrollIndicator = false
//        self.scrollView.showsVerticalScrollIndicator = false
//        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
//        self.scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        self.scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        self.scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        self.scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        let scrollWidth: CGFloat  = 3 * width
//        let scrollHeight: CGFloat  = self.view.frame.size.height
//        self.scrollView.contentSize = CGSize(width: scrollWidth, height: scrollHeight);
//        
//        loadPage(index: currentIndex - 1, page: 0)
//        loadPage(index: currentIndex, page: 1)
//        loadPage(index: currentIndex + 1, page: 2)
//        
//        self.addChildViewController(page1)
//        self.scrollView.addSubview(page1.view)
//        page1.didMove(toParentViewController: self)
//        
//        self.addChildViewController(page2)
//        self.scrollView.addSubview(page2.view)
//        page2.didMove(toParentViewController: self)
//        
//        self.addChildViewController(page3)
//        self.scrollView.addSubview(page3.view)
//        page3.didMove(toParentViewController: self)
//        
//        var frame = page2.view.frame
//        frame.origin.x = width
//        page2.view.frame = frame
//        
//        frame = page2.view.frame
//        frame.origin.x = width * 2
//        page3.view.frame = frame
//        
//        scrollView.setContentOffset(CGPoint(x: width, y: 0), animated: false)
//
//    }
    
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        self.lastContentOffset = scrollView.contentOffset.x;
//    }
//    
//    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        
//        if self.lastContentOffset == nil {
//            return
//        }
//        
//        if self.lastContentOffset > scrollView.contentOffset.x {
//            if currentIndex == 1 {
//                return
//            }
//            
//            loadPage(index: currentIndex, page: 2)
//            currentIndex = currentIndex - 1
//            loadPage(index: currentIndex, page: 1)
//            loadPage(index: currentIndex - 1, page: 0)
//            scrollView.setContentOffset(CGPoint(x: self.view.frame.width, y: 0), animated: false)
//        } else if self.lastContentOffset < scrollView.contentOffset.x {
//            if currentIndex >= content.count - 2 {
//                return
//            }
//            
//            loadPage(index: currentIndex, page: 0)
//            currentIndex = currentIndex + 1
//            loadPage(index: currentIndex, page: 1)
//            loadPage(index: currentIndex + 1, page: 2)
//            scrollView.setContentOffset(CGPoint(x: self.view.frame.width, y: 0), animated: false)
//        }
//    }
//    
//    func loadPage(index: Int, page: Int) {
//        switch (page){
//        case 0:
//            page1.pageLabel.text = content[index]
//            break
//        case 1:
//            page2.pageLabel.text = content[index]
//            break
//        case 2:
//            page3.pageLabel.text = content[index]
//            break
//        default:
//            break
//        }
//    }
}

