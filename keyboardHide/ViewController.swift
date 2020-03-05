//
//  ViewController.swift
//  keyboardHide
//
//  Created by Enamul on 3/5/20.
//  Copyright © 2020 HaqueIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var txtPickerTextField: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var third_textfield: UITextField!
    
    //Array declare
    let pickerArray = ["Select Options","Bangladesh","India","Pakistan","USA"]
    var selectedRow = 0;
    
    let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Don't forget to initialize pickerview delegate & datasource
        
        txtPickerTextField.delegate = self
        txtName.delegate = self
        third_textfield.delegate = self
        
        picker.delegate = self
        picker.dataSource = self
        
        
        
        txtPickerTextField.inputView = picker
        
        
        txtPickerTextField.text  = pickerArray[0] as! String
        //Done Button function called
        doneButton();
        
        //Key borad dismiss
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    public func numberOfComponents(in pickerView:  UIPickerView) -> Int  {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    public func pickerView(_pickerView:UIPickerView,numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row;
        txtPickerTextField.text = pickerArray[row]
        self.view.endEditing(false)
    }
    
    //begin  Doen Button function
    func doneButton(){
        
        let pickerView = picker
        pickerView.backgroundColor = .white
        pickerView.showsSelectionIndicator = true
        
        var toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.bordered, target: self, action: "donePicker")
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.bordered, target: self, action: "canclePicker")
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        txtPickerTextField.inputView = pickerView
        txtPickerTextField.inputAccessoryView = toolBar
        
        
    }
    
    
    @objc func donePicker() {
        self.txtPickerTextField.text = pickerArray[selectedRow]
        txtPickerTextField.resignFirstResponder()
    }
    
    @objc func canclePicker() {
        txtPickerTextField.resignFirstResponder()
    }
    //End  Doen Button function
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        
        
    }
}
