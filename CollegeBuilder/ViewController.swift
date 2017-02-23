//
//  ViewController.swift
//  CollegeBuilder
//
//  Created by Ryan Grogger on 2/7/17.
//  Copyright © 2017 Ryan Grogger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    
    var myCollegeObject:[CollegeClass] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myCollegeObject.append(CollegeClass(Name: "Bradley", Location: "Peoria", Enrollment: "5482", Image: UIImage(named:"Bradley")!))
        
        myCollegeObject.append(CollegeClass(Name: "Valparaiso", Location: "Valparaiso", Enrollment: "4540", Image: UIImage(named:"Valpo")!))
        
        myCollegeObject.append(CollegeClass(Name: "U of I", Location: "Urbana", Enrollment: "44,087", Image: UIImage(named:"U of I")!))
    }
    
    
    @IBAction func addButtonTapped(_ sender: Any)
    {
        let alert = UIAlertController(title: "Add college", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (collegeTextField) in
            collegeTextField.placeholder = "Add name here"
        }
        alert.addTextField { (locationTextField) in
            locationTextField.placeholder = "Add location here"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let nameTextField = alert.textFields?[0]
            let locationTextField = alert.textFields?[1]
            
            self.myCollegeObject.append(CollegeClass(Name: (nameTextField?.text)!, Location: (nameTextField?.text)!))
            self.myTableView.reloadData()
        }
        
        alert.addAction(addAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myCollegeObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = myCollegeObject[indexPath.row].name
        cell.detailTextLabel?.text = myCollegeObject[indexPath.row].location
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == .delete)
        {
            myCollegeObject.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailView = segue.destination as! DetailViewController
        var selectedRow = myTableView.indexPathForSelectedRow?.row
        
        detailView.collegeDetail = myCollegeObject[selectedRow!]
    }
}











