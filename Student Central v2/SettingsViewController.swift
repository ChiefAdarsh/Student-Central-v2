//
//  Settings.swift
//  Student Central
//
//  Created by Adarsh Goura on 11/28/22.
//

import UIKit

var item = "About"

class SettingsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingItem", for: indexPath)

        // Configure the cell...

        let label = cell.viewWithTag(1000) as! UILabel
        if indexPath.row == 0 {
        label.text = "About"
        } else if indexPath.row == 1 {
        label.text = "Privacy Policy"
        } else if indexPath.row == 2 {
        label.text = "Feedback"
        }
        // End of new code block
        return cell
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath[1]) {
        case 0:
            print("About")
//            item = "The CHS Student Central app gives you a personalized view of everything you need for school. Get all of your school information in one place. Students Can: - Look at campus news and information - Open school map to navigate around campus - View class schedule for A, B and C days - View the calendar for the school year - Contact their counselors and teachers - Access essential student links such as HAC - Request additional support if needed"
            var targetViewController = storyboard!.instantiateViewController(withIdentifier: "aboutAppSetting") as! UIViewController
            self.navigationController?.showDetailViewController(targetViewController, sender: self)
//            goToSetting()
        case 1:
            print("Privacy Policy")
            var targetViewController = storyboard!.instantiateViewController(withIdentifier: "privacyPolicySetting") as! UIViewController
            self.navigationController?.showDetailViewController(targetViewController, sender: self)
//            goToSetting()
        case 2:
            if let url = NSURL(string: "https://docs.google.com/forms/d/e/1FAIpQLSel5iC-jWClDbLSMDC7oVhpWa5kK19a9CjBesdcst5EkPxbaA/viewform"){
                UIApplication.shared.open(url as URL)
            }
            print("Feedback")
            item = "Feedback"
            
        default:
            print("error")
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
