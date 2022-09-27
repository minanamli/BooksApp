//
//  APIHandler.swift
//  BooksApp
//
//  Created by Mina Namlı on 26.09.2022.
//

import Foundation
import UIKit

class APIHandler {
    
    var bookArr = [Books]()

    func getBooksData(completion: @escaping ([Books]) -> ()){
        
        let bookUrl = "https://rss.applemarketingtools.com/api/v2/us/books/top-free/50/books.json"
        guard let url = URL(string: bookUrl) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data , response , error) in

            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                return
            }
            print("Response status: \(response.statusCode)")
            
                guard let data = data else {return }
                
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: [] ) as? [String: Any] {
                    
                        DispatchQueue.main.async { [self] in
                            
                            let feed = json["feed"] as! [String:Any]
                            let results = feed["results"] as! [[String:Any]]
                            for result in results {
                                var newBook = Books()
                                if let name = result["name"]{
                                    if let artistName = result["artistName"]{
                                        if let releaseDate = result["releaseDate"]{
                                            if let imageUrl = result["artworkUrl100"]{
                                                self.downloadImage(from: URL(string: imageUrl as! String)!, completion: { image in
                                                    if image == nil{
                                                        print("error")
                                                    }else{
                                                        newBook.image = image
                                                    }
                                                })
                                                    
                                                newBook.name = (name as! String)
                                                newBook.artistName = (artistName as! String)
                                                newBook.releaseDate = (releaseDate as! String)
    //                                                newBook.artworkUrl100 = (imageUrl as! String)
                                                self.bookArr.append(newBook)
                                                print(bookArr.count)

                                        }
                                    }
                                }
                            }
                        }
            }
                    }
                    completion(self.bookArr)
         } catch{
           print(error)
       }
                
        }
        task.resume()
    }

    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }

    func downloadImage(from url: URL, completion : @escaping (_ image : UIImage?)-> ()){
         var image = UIImage()
         getData(from: url) { data, response, error in
             guard let data = data, error == nil else {
                 completion(nil)
                 return }
             DispatchQueue.main.async() { [weak self] in

                 image = UIImage(data: data)!
                 completion(image)
             }
         }
     }

}
