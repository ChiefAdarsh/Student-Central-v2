//
//  CallAdmin.swift
//  Student Central
//
//  Created by Ashwin Indurti on 12/5/22.
//

import UIKit
import SafariServices
import MessageUI
import Foundation

class CounselorContactsTableViewController: UITableViewController, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {
    var backTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAdmins()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return counselorList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CounselorCell", for: indexPath)

        // Configure the cell...

        let label = cell.viewWithTag(2000) as! UILabel
        let image = cell.viewWithTag(1357) as! UIImageView
        let subtitle = cell.viewWithTag(1111) as! UILabel
        
        for i in 0...(counselorList.count - 1) {
            if indexPath.row == i {
                label.text = counselorList[i].fullName
                image.image = UIImage(named: counselorList[i].imgStr!)
                subtitle.text = counselorList[i].adminTypeDetailed
                cell.accessoryType = .disclosureIndicator
            }
        }
        // End of new code block
        return cell
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        for i in 0...(counselorList.count - 1) {
            if indexPath[1] == i {
                selectedAdmin = counselorList[i]
                print(selectedAdmin.fullName)
                var targetViewController = storyboard!.instantiateViewController(withIdentifier: "adminInfoInSchool") as! AdminInfoViewController
                self.navigationController?.showDetailViewController(targetViewController, sender: self)
//                self.navigationController?.pushViewController(targetViewController, animated: true)
            }
        }
    }
}

class AdminInfoViewController: UIViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    var backTitle: String!
    //@IBOutlet var stackView: UIStackView!
    
//    func rotation() {
//        let size = UIScreen.main.bounds.size
//        if size.height < size.width {
//            stackView.axis = .horizontal
//            stackView.spacing = 66
//        } else {
//            stackView.axis = .vertical
//            stackView.spacing = 0
//        }
//    }
    
//    @IBOutlet var EmailBtn: UIButton!
    @IBOutlet var AdminLbl: UILabel!
    @IBOutlet var AdminPic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("full name: \"\(selectedAdmin.fullName)\"")
        print("image: \"\(selectedAdmin.imgStr!)\"")
        AdminLbl.text = "\(selectedAdmin.fullName), \(selectedAdmin.adminTypeDetailed)"
        AdminPic.image = UIImage(named: selectedAdmin.imgStr!)
        //rotation()
        // Do any additional setup after loading the view.
        
        // Keyboard move up and down when UI Text Field is clicked
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
//    @IBAction func email(_ sender: Any) {
//        if MFMailComposeViewController.canSendMail() {
//            let message = MFMailComposeViewController()
//            message.delegate = self
//            let mailTo = AdminLbl.text!
//
//            let index = mailTo.index(after: mailTo.firstIndex(of: " ")!)
//            let address = String(mailTo[mailTo.startIndex]) + mailTo[index..<mailTo.endIndex] + "@coppellisd.com"
//            //print(address)
//            message.setToRecipients([address])
//            present(UINavigationController(rootViewController: message), animated: true)
//
//        } else {
//            let alertController = UIAlertController(title: "Mail Not Enabled", message: "Your device is not configured to send email", preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
//            present(alertController, animated: true, completion: nil)
//        }
//        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//            controller.dismiss(animated: true)
//        }
//    }
    @IBOutlet var requestInp: UITextField!
    
    @IBAction func requestButPress(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            let message = MFMailComposeViewController()
            message.mailComposeDelegate = self
            let address = selectedAdmin.email
//
//            let index = mailTo.index(after: mailTo.firstIndex(of: " ")!)
//            let address = String(mailTo[mailTo.startIndex]) + mailTo[index..<mailTo.endIndex] + "@coppellisd.com"
            //print(address)
            message.setToRecipients([address])
            message.setMessageBody("Student Request: \n \(requestInp.text!)", isHTML: false)
            present(message, animated: true)
            
        } else {
            let alertController = UIAlertController(title: "Mail Not Enabled", message: "Your device is not configured to send email", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
        switch result{
        case .sent:
            print("sent")
        case .saved:
            print("saved")
        case .failed:
            print("failed")
        case .cancelled:
            print("cancelled")
        default:
            break
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        print("Hello")
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height-0.5 * requestInp.frame.height

            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

}

class RequestItemsViewController: UIViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet var NavTtl: UINavigationItem!
    @IBOutlet var RequestTxt: UITextView!
    @IBOutlet var RequestBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        NavTtl.title = "Requesting an item from \(selectedAdmin.fullName)"
        // Do any additional setup after loading the view.
    }
    @IBAction func request(_ sender: Any) {
        let email = selectedAdmin.email
        //let subject = currentUser.fullName + " Item Request"
        let body = RequestTxt.text!
         
        // WHOEVER IS DOING THE CODE FOR THIS, MAKE IT COMPOSE AN EMAIL WITH THE BODY, SUBJECT, AND EMAIL
        // IDK HOW TO DO THAT BUT WHOEVER DID IT ON THE REPORT AN ISSUE FOR TEACHER APP DO IT HERE AGAIN
        
        
    }

}



// MARK: Resources

var numberStart = "214496"

var adminList: [Admin] = []
var principalList: [Admin] = []
var counselorList: [Admin] = []
var emergencyContactsList: [String] = ["Principal: Laura Springer                      6110", "Associate Principal: Melissa Arnold    6122", "Lead Counselor: Ann Cinelli                 6112", "Coppell Police Department                 972-304-3600", "Dallas Police Department                    214-744-4444", "Irving Police Department                     972-723-1010", "Lewisville Police Department              972-219-3600", "Child Protective Services                     800-252-5400", "Dallas County Mobile Crisis                 866-260-8000"]

var selectedAdmin: Admin = Admin(imgStr: "", adminType: AdminType.Counselor, lastName: "", firstName: "", username: "", callExt: 0, adminTypeDetailed: "")

enum AdminType {
    case Principal
    case Counselor
}

class Admin {
    
    var adminType: AdminType
    var adminTypeDetailed: String
    var lastName: String
    var firstName: String
    var username: String
    var callExt: Int
    var imgStr: String?
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    var number: Int {
        return Int(numberStart + String(callExt))!
    }
    
    var email: String {
        return username + "@coppellisd.com"
    }
    
    var callLink: String {
        return "https://teams.microsoft.com/l/call/0/0?users=\(email)"
    }
    
    init(imgStr: String?, adminType: AdminType, lastName: String, firstName: String, username: String, callExt: Int, adminTypeDetailed: String) {
        self.adminType = adminType
        self.lastName = lastName
        self.firstName = firstName
        self.username = username
        self.callExt = callExt
        self.adminTypeDetailed = adminTypeDetailed
        if imgStr != nil {
            self.imgStr = imgStr!
        } else {
            self.imgStr = "Blank_crop"
        }
    }
    
}

func createAdmins() {
    
    adminList.removeAll()
    principalList.removeAll()
    counselorList.removeAll()
    
    // PRINCIPALS

    var admin = Admin(imgStr: "Springer_crop", adminType: AdminType.Principal, lastName: "Springer", firstName: "Laura", username: "lspringer", callExt: 6104, adminTypeDetailed: "Principal")
    adminList.append(admin)
    
    admin = Admin(imgStr: "Porter_crop", adminType: AdminType.Principal, lastName: "Porter", firstName: "Zane", username: "zporter", callExt: 0, adminTypeDetailed: "Assistant Principal")
    adminList.append(admin)

    admin = Admin(imgStr: "Kimball_crop", adminType: AdminType.Principal, lastName: "Kimball", firstName: "Sorelle", username: "skimball", callExt: 0, adminTypeDetailed: "Assistant Principal (Students: A - Da) / Campus Behavior Coordinator")
    adminList.append(admin)

    admin = Admin(imgStr: "Helpenstill_crop", adminType: AdminType.Principal, lastName: "Helpenstill", firstName: "Justin", username: "jhelpenstill", callExt: 0, adminTypeDetailed: "Assistant Principal (Students: Db-J) / Campus Behavior Coordinator")
    adminList.append(admin)

    admin = Admin(imgStr: "Hussey_crop", adminType: AdminType.Principal, lastName: "Hussey", firstName: "Brian", username: "bhussey", callExt: 0, adminTypeDetailed: "Assistant Principal (Students: Sd-Z) / Campus Behavior Coordinator")
    adminList.append(admin)

    admin = Admin(imgStr: "Ogbeide_crop", adminType: AdminType.Principal, lastName: "Ogbeide", firstName: "Veronica", username: "vogbeide", callExt: 6123, adminTypeDetailed: "Assistant Principal (Students: N-Sc) / Campus Behavior Coordinator")
    adminList.append(admin)

    admin = Admin(imgStr: "Lowry_crop", adminType: AdminType.Principal, lastName: "Lowry", firstName: "Colleen", username: "clowry", callExt: 0, adminTypeDetailed: "Assistant Principal (Students: K-M) / Campus Behavior Coordinator")
    adminList.append(admin)
    
//    admin = Admin(imgStr: nil, adminType: AdminType.Principal, lastName: "Yakubovsky", firstName: "Michael", username: "myakubovsky", callExt: 6237, adminTypeDetailed: "STEM Teacher")
//    adminList.append(admin)

    // COUNSELORS

    

    admin = Admin(imgStr: "Abreu_crop", adminType: AdminType.Counselor, lastName: "Abreu", firstName: "Cheryl", username: "cabreu", callExt: 6132, adminTypeDetailed: "Counselor (A-Cham)")
    adminList.append(admin)

    admin = Admin(imgStr: "McMillin_crop", adminType: AdminType.Counselor, lastName: "McMillin", firstName: "Laura", username: "lmcmillin", callExt: 6106, adminTypeDetailed: "Counselor (Chan-Gox)")
    adminList.append(admin)

    admin = Admin(imgStr: "Kennington_crop", adminType: AdminType.Counselor, lastName: "Kennington", firstName: "Michael", username: "mkennington", callExt: 6133, adminTypeDetailed: "Counselor (Goy-Kiv)")
    adminList.append(admin)
    
    admin = Admin(imgStr: "Crumpton_crop", adminType: AdminType.Counselor, lastName: "Crumpton", firstName: "Heather", username: "hcrumpton", callExt: 6135, adminTypeDetailed: "Counselor (Kiw-Nah)")
    adminList.append(admin)

    admin = Admin(imgStr: "Oh_crop", adminType: AdminType.Counselor, lastName: "Oh", firstName: "Lindsey", username: "loh", callExt: 6136, adminTypeDetailed: "Counselor (Nal-Roc)")
    adminList.append(admin)
    
    admin = Admin(imgStr: "Cinelli_crop", adminType: AdminType.Counselor, lastName: "Cinelli", firstName: "Ann", username: "acinelli", callExt: 6112, adminTypeDetailed: "Lead Counselor (Rod-Som)")
    adminList.append(admin)

    admin = Admin(imgStr: "Tremethick_crop", adminType: AdminType.Counselor, lastName: "Tremethick", firstName: "Keith", username: "ktremethick", callExt: 6131, adminTypeDetailed: "Counselor (Son-Z)")
    adminList.append(admin)

    

    // Sort
    
    for admin in adminList {
        if admin.adminType == AdminType.Principal {
//            print("Principal \(admin.fullName)")
            principalList.append(admin)
        } else if admin.adminType == AdminType.Counselor {
//            print("Counselor \(admin.fullName)")
            counselorList.append(admin)
        } else {
            print(admin.fullName)
        }
    }

}

func findAdmin(username: String) -> Admin {
    createAdmins()
    for admin in adminList {
        if admin.username == username {
            return admin
        }
    }
    return Admin(imgStr: "AA", adminType: AdminType.Counselor, lastName: "NA", firstName: "NA", username: "NA", callExt: 0, adminTypeDetailed: "NA")
}
