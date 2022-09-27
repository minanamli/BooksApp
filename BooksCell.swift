//
//  BooksCell.swift
//  BooksApp
//
//  Created by Mina Namlı on 21.09.2022.
//

import UIKit

class BooksCell: UICollectionViewCell {
 
    static let booksCell = "BooksCell"
    
    
    var bookName = UILabel()
    var bookArtistName = UILabel()
    var bookDate = UILabel()
    var bookImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultSize(view: contentView)
        addSubview()
        setView()
        setConstraits()
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubview(){
        contentView.addSubview(bookImage)
        contentView.addSubview(bookName)
        contentView.addSubview(bookArtistName)
        contentView.addSubview(bookImage)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
    }
       
    private func setView(){
        
        bookImage.clipsToBounds = true
        bookImage.layer.masksToBounds = true
        bookImage.frame = self.bounds
        bookImage.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        bookName.textColor = .black
        bookName.textAlignment = .center

        bookArtistName.textColor = .black
        bookArtistName.textAlignment = .center

        bookDate.textColor = .black
        bookDate.textAlignment = .center
       
    }
    

    
    private func setConstraits(){
    
        bookImage.frame = CGRect(x: 25, y:  13, width:  130, height:  150)
        bookName.frame = CGRect(x: 23, y:  168, width:  130, height: 14)
        bookArtistName.frame = CGRect(x: 23, y:  185, width:  130, height: 13)
        bookDate.frame = CGRect(x: 23, y:  193, width:  130, height: 60)

    }
}
