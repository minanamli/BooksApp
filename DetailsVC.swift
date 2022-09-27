//
//  DetailsVC.swift
//  BooksApp
//
//  Created by Mina Namlı on 21.09.2022.
//

import UIKit

class SearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

      var tableView = UITableView()
      let searchBar = UISearchBar()
       
      var nameArr = [Books().name] as? String
      var filtered: [String]!
    
      override func viewDidLoad() {
        super.viewDidLoad()
         
          defaultSize(view: view)
          view.backgroundColor = .white
          searchBar.sizeToFit()
          searchBar.delegate = self
//          filtered = nameArr
          
          navigationController?.navigationBar.barTintColor = .lightGray
          navigationController?.navigationBar.prefersLargeTitles = true
          navigationItem.title = "Users"
          navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButton))

        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.rowHeight = 50
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = CGRect(x: 0, y: 0.15 * screenHeight, width: 1 * screenWidth , height: 0.9 * screenHeight)
        view.addSubview(tableView)
          
      }
       
    @objc func searchButton(){
        navigationItem.titleView = searchBar
        searchBar.showsCancelButton = false
        searchBar.placeholder = "search.."
        navigationItem.rightBarButtonItem = nil
        searchBar.becomeFirstResponder()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            cell.textLabel?.text = filtered[indexPath.row]
            return cell

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
     }

}

extension SearchVC : UISearchBarDelegate{
    
    func searchBar( _ searchBar: UISearchBar, textDidChange searchText: String) {
//        filtered = []
        
        if searchText == ""{
            searchBar.endEditing(true)
//            filtered = nameArr
            self.tableView.reloadData()

        } else {
//            filtered = nameArr.filter({$0.contains(searchText) })
            self.tableView.reloadData()
        }
    }
    
 
    
}
