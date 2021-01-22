//
//  FormViewController.swift
//  ORAMapp
//
//  Created by mac on 2021/1/11.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
//    pickerview
    @IBOutlet weak var sizePickerText: UITextField!
    @IBOutlet weak var amountPickerText: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    
    let sizeArray = ["2英吋","3英吋","4英吋","4英吋-D34","4英吋-D40","5英吋","6英吋"]
    let amountArray = ["0條","1條","2條","3條","4條","5條"]
    
    var sizePickerView = UIPickerView()
    var amountPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sizePickerText.inputView = sizePickerView
        amountPickerText.inputView = amountPickerView
        
        sizePickerView.delegate = self
        amountPickerView.delegate = self
        
        sizePickerView.tag = 1
        amountPickerView.tag = 2
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return sizeArray.count
        case 2:
            return amountArray.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return sizeArray[row]
        case 2:
            return amountArray[row]
        default:
            return "無資料"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            sizePickerText.text = sizeArray[row]
            sizePickerText.resignFirstResponder()
        case 2:
            amountPickerText.text = amountArray[row]
            amountPickerText.resignFirstResponder()
        default:
            return
        }
    }
    
    // 帶入JSON解析後的變數，變成全域變數？給sendBtn用
    func getValue() {
        var pipeType = sizePickerText.text
        var pipeCount = amountPickerText.text
        var leadTube = lengthTextField.text
    }

    
    @IBAction func closeBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtn(_ sender: UIButton) {
        if let pipeType = sizePickerText.text, let pipeCount = amountPickerText.text, let leadTube = lengthTextField.text {
            if pipeType == "" || pipeCount == "" || leadTube == "" {
                // 沒點選，跳警告
                let myAlert = UIAlertController(title: "無資料輸入", message: "請在輸入框填入資料", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "確認", style: .default, handler: nil)
                myAlert.addAction(okAction)
                present(myAlert, animated: true, completion: nil)
            } else {
                // 換場景
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBOutlet weak var sendBtnChanged: UIButton!
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
