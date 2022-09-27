//
//  ViewController.swift
//  BooksApp
//
//  Created by Mina Namlı on 21.09.2022.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    var books = [Books]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSize(view: view)
        view.backgroundColor = UIColor(red: 0.56, green: 0.88, blue: 0.96, alpha: 1.00)
        setUI()
    
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0.01 * screenHeight, left: 0.03 * screenWidth, bottom: 0 * screenHeight, right: 0.03 * screenWidth)
        layout.itemSize = CGSize(width: screenWidth / 2.2 , height: screenHeight / 3 )
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0.12 * screenHeight, width: 1 * screenWidth , height: 0.92 * screenHeight), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = true
        collectionView.allowsMultipleSelection = true
        collectionView.register(BooksCell.self, forCellWithReuseIdentifier: BooksCell.booksCell)
        collectionView.backgroundColor = UIColor(red: 0.56, green: 0.88, blue: 0.96, alpha: 1.00)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        
        
        APIHandler().getBooksData(completion: { bookArr in
               DispatchQueue.main.async {
                   self.books = APIHandler().bookArr
                   print((bookArr.count))
                   print((self.books.count))
                   collectionView.reloadData()
               }
        })
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BooksCell.booksCell, for: indexPath) as! BooksCell
        cell.bookName.text = books[indexPath.row].name
        cell.bookArtistName.text = books[indexPath.row].artistName
        cell.bookDate.text = books[indexPath.row].releaseDate as? String
        cell.bookImage.image = books[indexPath.row].image!
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \(indexPath.row)")
    }
    
    func setUI() {
        let topView = UIView()
        topView.backgroundColor = UIColor(red: 0.96, green: 0.57, blue: 0.85, alpha: 1.00)
        topView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 0.12 * screenHeight)
        topView.layer.cornerRadius = 13
        view.addSubview(topView)
        
        let titleLabel = UILabel()
        titleLabel.text = "Books"
        titleLabel.frame = CGRect(x: 0, y: 0.05 * screenHeight, width: screenWidth, height: 0.06 * screenHeight)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        view.addSubview(titleLabel)

    }
}



