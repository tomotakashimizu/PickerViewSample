//
//  ViewController.swift
//  PickerViewSample
//
//  Created by 清水智貴 on 2019/12/25.
//  Copyright © 2019 tomotaka.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // PickerViewを設定するためのTextFieldを準備
    @IBOutlet weak var pickerTextField: UITextField!
    
    // PickerViewの選択肢（今は数字だがなんでも入れてOK）
    var pickOption: [String] = ["1", "2", "3", "4", "5"]
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerTextField.delegate = self
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerTextField.inputView = pickerView
        
        
        // 以下のコードでpickerViewにボタンをつける
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelPicker))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        pickerTextField.inputAccessoryView = toolBar
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // PickerViewの選択肢の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = pickOption[row]
    }
    
    
    
    // pickerViewにボタンをつけるために設定
    @objc func donePicker (sender:UIBarButtonItem) {
        pickerTextField.resignFirstResponder()
    }
    
    @objc func cancelPicker (sender:UIBarButtonItem) {
        pickerTextField.resignFirstResponder()
        pickerTextField.text = ""
    }


}

