//
//  TableViewController.swift
//  ORAMapp
//
//  Created by mac on 2021/1/12.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var pipeData:[PipeData] = [
        PipeData(number: "A1", company: "遠傳電信", size: "4英吋", amount: "3條", status: "尚未申報"),
        PipeData(number: "A2", company: "中華電信", size: "4英吋-D40", amount: "1條", status: "待審核"),
        PipeData(number: "A3", company: "北健有線", size: "2英吋", amount: "1條", status: "待審核"),
        PipeData(number: "B1", company: "何技師", size: "3英吋", amount: "1條", status: "待審核"),
        PipeData(number: "B2", company: "中華電信", size: "5英吋", amount: "2條", status: "待審核"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pipeData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PipeDataTableViewCell

//        cell.textLabel?.text = pipeDataArray[indexPath.row]
        cell.numberLabel.text = pipeData[indexPath.row].number
        cell.companyLabel.text = pipeData[indexPath.row].company
        cell.sizeLabel.text = pipeData[indexPath.row].size
        cell.amountLabel.text = pipeData[indexPath.row].amount
        cell.statusLabel.text = pipeData[indexPath.row].status

        return cell
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FormViewController {
            let controller = segue.destination as! FormViewController
            let btn = controller.sendBtnChanged
            btn?.setTitle("save", for: .normal)
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
