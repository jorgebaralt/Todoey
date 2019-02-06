//
//  CategoryViewController.swift
//  Todoeym
//
//  Created by Jorge Baralt on 2/6/19.
//  Copyright © 2019 Jorge Baralt. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categoriesArray = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
    //MARK: table view datasource mthods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categoriesArray[indexPath.row].name
        return cell
    }
    //MARK: Table view Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // navigate to item table view controller
        performSegue(withIdentifier: "goToItems", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        // make sure there is something selected
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory = categoriesArray[indexPath.row]
        }
        
    }
    
    //MARK: Data manipulation methods

    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: ({ (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }))
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text
            
            self.categoriesArray.append(newCategory)
            self.saveCategories()
            
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
    //MARK: - save and load data
    func saveCategories(){
        
        do{
            try context.save()
        }catch{
            print("Error saving context \(error)")
        }
    }
    
    // function with params, and default, in case that nothing is passed
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()){
        // requires to specify data type
        do{
            categoriesArray = try context.fetch(request)
        }catch{
            print("Error fetching data from context \(error)")
        }
        tableView.reloadData()
    }
    
}
