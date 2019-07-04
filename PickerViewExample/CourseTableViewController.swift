//
//  CourseTableViewController.swift
//  PickerViewExample
//
//  Created by moxDroid on 2019-07-03.
//  Copyright © 2019 moxDroid. All rights reserved.
//

import UIKit

class CourseTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblCourseList: UITableView!
   
     var courseArray = ["Android Fundamentals", "iOS Fundamentals", "Swift Programming", "Database Design", "Programming in Java", "Web Development in PHP", "Machine Learning", "Data Analytics with R", "Learn Ruby - The Hard Way", "Data Structures in C++"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tblCourseList.delegate = self
        self.tblCourseList.dataSource = self
        
        self.tblCourseList.register(UITableViewCell.self, forCellReuseIdentifier: "cellCourse")
        
        self.tblCourseList.separatorStyle = .singleLine
        self.tblCourseList.separatorColor = .blue
        self.tblCourseList.separatorInset = .zero
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Create UIImageView
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        //Assigne Image
        let image = UIImage(named: "Lion")
        imageView.image = image
        
        //Assign ImageView to titleView
        navigationItem.titleView = imageView
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.courseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: "cellCourse", for: indexPath)
        
        cell.textLabel?.text = self.courseArray[indexPath.row]
        cell.detailTextLabel?.text = "I am in detailed label"
        cell.imageView?.image = UIImage(named: "Tiger")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.courseArray[indexPath.row])
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
