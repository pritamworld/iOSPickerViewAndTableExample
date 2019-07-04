//
//  ViewController.swift
//  PickerViewExample
//
//  Created by moxDroid on 2019-07-03.
//  Copyright © 2019 moxDroid. All rights reserved.
//

import UIKit

enum PickerType:Int {
    case COLLEGE = 0
    case COURSE = 1
}

class ViewController: UIViewController
{
    @IBOutlet weak var txtCollegeName: UITextField!
    
    @IBOutlet weak var txtCourseName: UITextField!
    @IBOutlet weak var lblCourseName: UILabel!
    @IBOutlet weak var pickerCourseName: UIPickerView!
    var courseArray = ["Android Fundamentals", "iOS Fundamentals", "Swift Programming", "Database Design", "Programming in Java", "Web Development in PHP", "Machine Learning", "Data Analytics with R", "Learn Ruby - The Hard Way", "Data Structures in C++"]
    
    var collegeName = ["Canadore College", "Seneca College", "Northern College", "Sheridan College", "Durham College"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.pickerCourseName.delegate = self
        self.pickerCourseName.dataSource = self
        
        self.txtCollegeName.delegate = self
        self.txtCourseName.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Create UIImageView
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        //Assigne Image
        let image = UIImage(named: "Tiger")
        imageView.image = image
        
        //Assign ImageView to titleView
        navigationItem.titleView = imageView
    }
}

extension ViewController:UIPickerViewDelegate
{
    //Set the Value for each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return self.courseArray[row]
        if (component == PickerType.COLLEGE.rawValue){
            return self.collegeName[row]
        }else{
            return self.courseArray[row]
        }
        
    }
    
    //Fetch the selected values
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //self.lblCourseName.text = self.courseArray[row]
        
        let strCollegeName = self.collegeName[pickerView.selectedRow(inComponent: PickerType.COLLEGE.rawValue)]
        let strCourseName = self.courseArray[pickerView.selectedRow(inComponent: PickerType.COURSE.rawValue)]
        
        self.lblCourseName.text = "\(strCollegeName) - \(strCourseName)"
    }
}

extension ViewController:UIPickerViewDataSource
{
    
    //No of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //No. of items in picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == PickerType.COLLEGE.rawValue{
            return self.collegeName.count
        }else{
            return self.courseArray.count
        }
    }
}

extension ViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if !textField.text!.isEmpty
        {
            if textField.tag == 0
            {
                self.collegeName.append(textField.text!)
            }else if textField.tag == 1
            {
                 self.courseArray.append(textField.text!)
            }
            
            textField.resignFirstResponder()
            self.pickerCourseName.reloadComponent(textField.tag)
        }
        return true
    }
}

