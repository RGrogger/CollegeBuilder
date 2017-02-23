//
//  DetailViewController.swift
//  CollegeBuilder
//
//  Created by Ryan Grogger on 2/14/17.
//  Copyright © 2017 Ryan Grogger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    
    var collegeDetail:CollegeClass!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myImageView.image = collegeDetail.image
        nameTextField.text = collegeDetail.name
        locationTextField.text = collegeDetail.location
        enrollmentTextField.text = collegeDetail.enrollment
    }
    
    @IBAction func save(_ sender: Any)
    {
        collegeDetail.image = myImageView.image
        collegeDetail.name = nameTextField.text!
        collegeDetail.location = locationTextField.text!
        collegeDetail.enrollment = enrollmentTextField.text!
    }
    
    
}
