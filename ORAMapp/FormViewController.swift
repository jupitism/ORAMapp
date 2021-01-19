//
//  FormViewController.swift
//  ORAMapp
//
//  Created by mac on 2021/1/11.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
//    pickerview
    @IBOutlet weak var sizePickerText: UITextField!
    @IBOutlet weak var amountPickerText: UITextField!
    
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

    
    
//    tableview
    let titleArray = ["填報人","人孔所在區域","人孔所在路段","人孔編碼序號","填報項目"]
    let contentArray = ["中華電信","中路地區","中山路一段","A10021","前視圖A1"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "pipeInfoCell")
        cell.textLabel?.text = titleArray[indexPath.row]
        cell.detailTextLabel?.text = contentArray[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.textColor = .systemGreen
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtn(_ sender: UIButton) {
        if let sizeInputText = sizePickerText.text, let amountInputText = amountPickerText.text {
            if sizeInputText == "" || amountInputText == "" {
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
