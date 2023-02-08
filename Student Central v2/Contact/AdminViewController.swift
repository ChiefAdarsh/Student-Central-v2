
import UIKit

class PrincipalContactsTableViewController: UITableViewController {
    var backTitle: String!
    
    override func viewDidLoad() {
        
        
        
        createAdmins()
        super.viewDidLoad()
        
            
        }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return principalList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrincipalCell", for: indexPath)

        // Configure the cell...

        let label = cell.viewWithTag(1000) as! UILabel
        let image = cell.viewWithTag(1234) as! UIImageView
        let subtitle = cell.viewWithTag(2468) as! UILabel
        
        for i in 0...(principalList.count - 1) {
            if indexPath.row == i {
                label.text = principalList[i].fullName
                image.image = UIImage(named: principalList[i].imgStr!)
                subtitle.text = principalList[i].adminTypeDetailed
                cell.accessoryType = .disclosureIndicator
            }
        }
        // End of new code block
        return cell
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        

        tableView.deselectRow(at: indexPath, animated: true)
        
        for i in 0...(principalList.count - 1) {
            if indexPath[1] == i {
                selectedAdmin = principalList[i]
                print(selectedAdmin.fullName)
                let targetViewController = storyboard!.instantiateViewController(withIdentifier: "adminInfoInSchool") as! AdminInfoViewController
                self.navigationController?.showDetailViewController(targetViewController, sender: self)
            }
            
        }
    }
}
