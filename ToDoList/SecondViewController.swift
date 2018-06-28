//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Шынар Торехан on 28/06/2018.
//  Copyright © 2018 Shynar Torekhan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var kidCategory: UIButton!
    @IBOutlet weak var cartCategory: UIButton!
    @IBOutlet weak var phoneCategory: UIButton!
    @IBOutlet weak var planeCategory: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var taskField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsArray = [kidCategory, cartCategory, phoneCategory, planeCategory]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var image = ""
    var buttonsArray = [UIButton]()
    @IBAction func planeButton(_ sender: Any) {
        for button in buttonsArray{
            button.isSelected = false
        }
        image = "plane"
        planeCategory.isSelected = true
    }
    @IBAction func cartButton(_ sender: Any) {
        for button in buttonsArray{
            button.isSelected = false
        }
        image = "cart"
        cartCategory.isSelected = true
    }
    @IBAction func phoneButton(_ sender: Any) {
        for button in buttonsArray{
            button.isSelected = false
        }
        image = "phone"
        phoneCategory.isSelected = true
    }
    @IBAction func kidButton(_ sender: Any) {
        for button in buttonsArray{
            button.isSelected = false
        }
        image = "kid"
        kidCategory.isSelected = true
    }
   
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd"
        let date = timeFormatter.string(from: datePicker.date)
        let task = taskField.text!
        toDoList[p].append(ToDoTask(category: image, title: task, date: date))
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
