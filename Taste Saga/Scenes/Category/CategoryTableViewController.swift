//
//  CategoryTableViewController.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 3/7/24.
//

import UIKit

class CategoryTableViewController: UIViewController {

    let options = ["COOKIES", "BREAD", "CEREALS", "CONDIMENTS AND SAUCES", "DESSERTS", "DRINKS", "MAIN COURSE", "PANCAKE", "PREPS", "PRESERVE", "SALAD", "SANDWICHES", "SIDE DISH", "SOUP", "STARTER", "SWEETS"]
    private var index: Int?
    
    @IBOutlet weak var categoryTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "CATEGORIES"
        categoryTableview.delegate = self
        categoryTableview.dataSource = self
       
    }
}
extension CategoryTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableview.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        
        cell.categoryCell.text = options[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let categoryVC = storyboard.instantiateViewController(withIdentifier: "CategoryViewController") as? CategoryViewController {
            categoryVC.typeSearched = options[indexPath.row]
            navigationController?.pushViewController(categoryVC, animated: true)
            
        }
    }

    
    
}
