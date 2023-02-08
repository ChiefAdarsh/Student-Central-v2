//
//  TeacherViewController.swift
//  Student Central v2
//
//  Created by Adarsh Goura on 2/7/23.
//

import UIKit
import MessageUI

class TeacherViewController: UIViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    @IBOutlet var sv: UIStackView!
    @IBOutlet var teacher1Label: UILabel!
    @IBOutlet var mail1Label: UILabel!
    @IBOutlet var teacher2Label: UILabel!
    @IBOutlet var mail2Label: UILabel!
    @IBOutlet var teacher3Label: UILabel!
    @IBOutlet var mail3Label: UILabel!
    @IBOutlet var teacher4Label: UILabel!
    @IBOutlet var mail4Label: UILabel!
    @IBOutlet var teacher5Label: UILabel!
    @IBOutlet var mail5Label: UILabel!
    @IBOutlet var teacher6Label: UILabel!
    @IBOutlet var mail6Label: UILabel!
    @IBOutlet var teacher7Label: UILabel!
    @IBOutlet var mail7Label: UILabel!
    @IBOutlet var teacher8Label: UILabel!
    @IBOutlet var mail8Label: UILabel!
    
    var teacherLabels: [UILabel?] {
        return [
            teacher1Label,
            teacher2Label,
            teacher3Label,
            teacher4Label,
            teacher5Label,
            teacher6Label,
            teacher7Label,
            teacher8Label
        ]
    }
    
    var teacherMails: [UILabel?] {
        return [
            mail1Label,
            mail2Label,
            mail3Label,
            mail4Label,
            mail5Label,
            mail6Label,
            mail7Label,
            mail8Label
        ]
    }
    
    func rotation() {
        let size = UIScreen.main.bounds.size
        if size.height < size.width {
            sv.axis = .horizontal
            sv.spacing = 66
            teacher1Label.font = .systemFont(ofSize: 35, weight: .bold)
            mail1Label.font = .systemFont(ofSize: 20, weight: .bold)
            teacher2Label.font = .systemFont(ofSize: 35, weight: .bold)
            mail2Label.font = .systemFont(ofSize: 20, weight: .bold)
            teacher3Label.font = .systemFont(ofSize: 35, weight: .bold)
            mail3Label.font = .systemFont(ofSize: 20, weight: .bold)
            teacher4Label.font = .systemFont(ofSize: 35, weight: .bold)
            mail4Label.font = .systemFont(ofSize: 20, weight: .bold)
            teacher5Label.font = .systemFont(ofSize: 35, weight: .bold)
            mail5Label.font = .systemFont(ofSize: 20, weight: .bold)
            teacher6Label.font = .systemFont(ofSize: 35, weight: .bold)
            mail6Label.font = .systemFont(ofSize: 20, weight: .bold)
            teacher7Label.font = .systemFont(ofSize: 35, weight: .bold)
            mail7Label.font = .systemFont(ofSize: 20, weight: .bold)
            teacher8Label.font = .systemFont(ofSize: 35, weight: .bold)
            mail8Label.font = .systemFont(ofSize: 20, weight: .bold)
        } else {
            sv.axis = .vertical
            sv.spacing = 0
            teacher1Label.font = .systemFont(ofSize: 20, weight: .bold)
            mail1Label.font = .systemFont(ofSize: 15, weight: .bold)
            teacher2Label.font = .systemFont(ofSize: 20, weight: .bold)
            mail2Label.font = .systemFont(ofSize: 15, weight: .bold)
            teacher3Label.font = .systemFont(ofSize: 20, weight: .bold)
            mail3Label.font = .systemFont(ofSize: 15, weight: .bold)
            teacher4Label.font = .systemFont(ofSize: 20, weight: .bold)
            mail4Label.font = .systemFont(ofSize: 15, weight: .bold)
            teacher5Label.font = .systemFont(ofSize: 20, weight: .bold)
            mail5Label.font = .systemFont(ofSize: 15, weight: .bold)
            teacher6Label.font = .systemFont(ofSize: 20, weight: .bold)
            mail6Label.font = .systemFont(ofSize: 15, weight: .bold)
            teacher7Label.font = .systemFont(ofSize: 20, weight: .bold)
            mail7Label.font = .systemFont(ofSize: 15, weight: .bold)
            teacher8Label.font = .systemFont(ofSize: 20, weight: .bold)
            mail8Label.font = .systemFont(ofSize: 15, weight: .bold)
        }
        
//        let navCtr = (self.storyboard!.instantiateViewController(withIdentifier: "navCtr") as! UINavigationController)
//        let controllers = navCtr.viewControllers
//        if size.height < size.width {
//            print(controllers)
//            if let vc = controllers[controllers.count-1] as? TeacherViewController {
//                print("here")
//                vc.removeFromParent()
//            }
//            print(navCtr.viewControllers)
//
//            let lvc = self.storyboard!.instantiateViewController(withIdentifier: "LandscapeVC") as! TeacherViewController
//            navCtr.pushViewController(lvc, animated: true)
//        } else {
//            if let vc = controllers[controllers.count-1] as? TeacherViewController {
//                vc.removeFromParent()
//            }
//
//            let pvc = self.storyboard!.instantiateViewController(withIdentifier: "portraitViewController") as! TeacherViewController
//            navCtr.pushViewController(pvc, animated: true)
//        }
    }
    
    // Change layout of in and out of school buttons to vertical
    // or horizontal based on device orientation
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        rotation()
    }
    
    @IBOutlet weak var mailOne: UILabel!
    @IBOutlet weak var mailTwo: UILabel!
    @IBOutlet weak var mailThree: UILabel!
    @IBOutlet weak var mailFour: UILabel!
    @IBOutlet weak var mailFive: UILabel!
    @IBOutlet weak var mailSix: UILabel!
    @IBOutlet weak var mailSeven: UILabel!
    @IBOutlet weak var mailEight: UILabel!
    
    var archiveURLs: [URL] = []
    
    let documentsDirectory =
       FileManager.default.urls(for: .documentDirectory,
       in: .userDomainMask).first!
    
    struct Teacher: Codable {
        let name: String
        let email: String
    }
    
    @IBAction func buttonOne(_ sender: UIButton) {
        guard teacher1Label.text! != "TEACHER #1" else {
            let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 1st period teacher first and last name", preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.placeholder = "Enter Teacher First and Last Name"
            }
            let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
                let textField = alertController.textFields![0] as UITextField
                let txt = textField.text!.lowercased()
                guard let _ = txt.firstIndex(of: " ") else {
                    let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                    alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                    self.present(alertController2, animated: true, completion: nil)
                    return
                }
                
                self.teacher1Label.text = txt.capitalized
                let index = txt.index(after: txt.firstIndex(of: " ")!)
                self.mailOne.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
                
                let newTeacher = Teacher(name: self.teacher1Label.text!, email: self.mailOne.text!)
                let jsonEncoder = JSONEncoder()
                if let jsonData = try? jsonEncoder.encode(newTeacher),
                    let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                    
                    try? jsonData.write(to: self.archiveURLs[0],
                       options: .noFileProtection)
                }
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
            
            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        if MFMailComposeViewController.canSendMail() {
            let message = MFMailComposeViewController()
            message.mailComposeDelegate = self
            let mailTo = mailOne.text!
            message.setToRecipients([mailTo])
            present(message, animated: true, completion: nil)
            
        } else {
            let alertController = UIAlertController(title: "Mail Not Enabled", message: "Your device is not configured to send email", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonTwo(_ sender: UIButton) {
        guard teacher2Label.text! != "TEACHER #2" else {
            let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 2nd period teacher first and last name", preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.placeholder = "Enter Teacher First and Last Name"
            }
            let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
                let textField = alertController.textFields![0] as UITextField
                let txt = textField.text!.lowercased()
                guard let _ = txt.firstIndex(of: " ") else {
                    let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                    alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                    self.present(alertController2, animated: true, completion: nil)
                    return
                }
                
                self.teacher2Label.text = txt.capitalized
                let index = txt.index(after: txt.firstIndex(of: " ")!)
                self.mailTwo.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
                
                let newTeacher = Teacher(name: self.teacher2Label.text!, email: self.mailTwo.text!)
                let jsonEncoder = JSONEncoder()
                if let jsonData = try? jsonEncoder.encode(newTeacher),
                    let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                    
                    try? jsonData.write(to: self.archiveURLs[1],
                       options: .noFileProtection)
                }
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
            
            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        if MFMailComposeViewController.canSendMail() {
            let message = MFMailComposeViewController()
            message.mailComposeDelegate = self
            let mailTo = mailTwo.text!
            message.setToRecipients([mailTo])
            present(message, animated: true, completion: nil)
            
        } else {
            let alertController = UIAlertController(title: "Mail Not Enabled", message: "Your device is not configured to send email", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonThree(_ sender: UIButton) {
        guard teacher3Label.text! != "TEACHER #3" else {
            let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 3rd period teacher first and last name", preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.placeholder = "Enter Teacher First and Last Name"
            }
            let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
                let textField = alertController.textFields![0] as UITextField
                let txt = textField.text!.lowercased()
                guard let _ = txt.firstIndex(of: " ") else {
                    let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                    alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                    self.present(alertController2, animated: true, completion: nil)
                    return
                }
                
                self.teacher3Label.text = txt.capitalized
                let index = txt.index(after: txt.firstIndex(of: " ")!)
                self.mailThree.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
                
                let newTeacher = Teacher(name: self.teacher3Label.text!, email: self.mailThree.text!)
                let jsonEncoder = JSONEncoder()
                if let jsonData = try? jsonEncoder.encode(newTeacher),
                    let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                                    
                    try? jsonData.write(to: self.archiveURLs[2], options: .noFileProtection)
                }
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
            
            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        if MFMailComposeViewController.canSendMail() {
            let message = MFMailComposeViewController()
            message.mailComposeDelegate = self
            let mailTo = mailThree.text!
            message.setToRecipients([mailTo])
            present(message, animated: true, completion: nil)
            
        } else {
            let alertController = UIAlertController(title: "Mail Not Enabled", message: "Your device is not configured to send email", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonFour(_ sender: UIButton) {
        guard teacher4Label.text! != "TEACHER #4" else {
            let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 4th period teacher first and last name", preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.placeholder = "Enter Teacher First and Last Name"
            }
            let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
                let textField = alertController.textFields![0] as UITextField
                let txt = textField.text!.lowercased()
                guard let _ = txt.firstIndex(of: " ") else {
                    let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                    alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                    self.present(alertController2, animated: true, completion: nil)
                    return
                }
                
                self.teacher4Label.text = txt.capitalized
                let index = txt.index(after: txt.firstIndex(of: " ")!)
                self.mailFour.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
                
                let newTeacher = Teacher(name: self.teacher4Label.text!, email: self.mailFour.text!)
                let jsonEncoder = JSONEncoder()
                if let jsonData = try? jsonEncoder.encode(newTeacher),
                    let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                                    
                    try? jsonData.write(to: self.archiveURLs[3], options: .noFileProtection)
                }
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
            
            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        if MFMailComposeViewController.canSendMail() {
            let message = MFMailComposeViewController()
            message.mailComposeDelegate = self
            let mailTo = mailFour.text!
            message.setToRecipients([mailTo])
            present(message, animated: true, completion: nil)
            
        } else {
            let alertController = UIAlertController(title: "Mail Not Enabled", message: "Your device is not configured to send email", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonFive(_ sender: UIButton) {
        guard teacher5Label.text! != "TEACHER #5" else {
            let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 5th period teacher first and last name", preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.placeholder = "Enter Teacher First and Last Name"
            }
            let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
                let textField = alertController.textFields![0] as UITextField
                let txt = textField.text!.lowercased()
                guard let _ = txt.firstIndex(of: " ") else {
                    let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                    alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                    self.present(alertController2, animated: true, completion: nil)
                    return
                }
                
                self.teacher5Label.text = txt.capitalized
                let index = txt.index(after: txt.firstIndex(of: " ")!)
                self.mailFive.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
                
                let newTeacher = Teacher(name: self.teacher5Label.text!, email: self.mailFive.text!)
                let jsonEncoder = JSONEncoder()
                if let jsonData = try? jsonEncoder.encode(newTeacher),
                    let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                                    
                    try? jsonData.write(to: self.archiveURLs[4], options: .noFileProtection)
                }
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
            
            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        if MFMailComposeViewController.canSendMail() {
            let message = MFMailComposeViewController()
            message.mailComposeDelegate = self
            let mailTo = mailFive.text!
            message.setToRecipients([mailTo])
            present(message, animated: true, completion: nil)
            
        } else {
            let alertController = UIAlertController(title: "Mail Not Enabled", message: "Your device is not configured to send email", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonSix(_ sender: UIButton) {
        guard teacher6Label.text! != "TEACHER #6" else {
            let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 6th period teacher first and last name", preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.placeholder = "Enter Teacher First and Last Name"
            }
            let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
                let textField = alertController.textFields![0] as UITextField
                let txt = textField.text!.lowercased()
                guard let _ = txt.firstIndex(of: " ") else {
                    let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                    alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                    self.present(alertController2, animated: true, completion: nil)
                    return
                }
                
                self.teacher6Label.text = txt.capitalized
                let index = txt.index(after: txt.firstIndex(of: " ")!)
                self.mailSix.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
                
                let newTeacher = Teacher(name: self.teacher6Label.text!, email: self.mailSix.text!)
                let jsonEncoder = JSONEncoder()
                if let jsonData = try? jsonEncoder.encode(newTeacher),
                    let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                                    
                    try? jsonData.write(to: self.archiveURLs[5], options: .noFileProtection)
                }
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
            
            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        if MFMailComposeViewController.canSendMail() {
            let message = MFMailComposeViewController()
            message.mailComposeDelegate = self
            let mailTo = mailSix.text!
            message.setToRecipients([mailTo])
            present(message, animated: true, completion: nil)
            
        } else {
            let alertController = UIAlertController(title: "Mail Not Enabled", message: "Your device is not configured to send email", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonSeven(_ sender: UIButton) {
        guard teacher7Label.text! != "TEACHER #7" else {
            let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 7th period teacher first and last name", preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.placeholder = "Enter Teacher First and Last Name"
            }
            let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
                let textField = alertController.textFields![0] as UITextField
                let txt = textField.text!.lowercased()
                guard let _ = txt.firstIndex(of: " ") else {
                    let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                    alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                    self.present(alertController2, animated: true, completion: nil)
                    return
                }
                
                self.teacher7Label.text = txt.capitalized
                let index = txt.index(after: txt.firstIndex(of: " ")!)
                self.mailSeven.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
                
                let newTeacher = Teacher(name: self.teacher7Label.text!, email: self.mailSeven.text!)
                let jsonEncoder = JSONEncoder()
                if let jsonData = try? jsonEncoder.encode(newTeacher),
                    let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                                    
                    try? jsonData.write(to: self.archiveURLs[6], options: .noFileProtection)
                }
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
            
            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        if MFMailComposeViewController.canSendMail() {
            let message = MFMailComposeViewController()
            message.mailComposeDelegate = self
            let mailTo = mailSeven.text!
            message.setToRecipients([mailTo])
            present(message, animated: true, completion: nil)
            
        } else {
            let alertController = UIAlertController(title: "Mail Not Enabled", message: "Your device is not configured to send email", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonEight(_ sender: UIButton) {
        guard teacher8Label.text! != "TEACHER #8" else {
            let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 8th period teacher first and last name", preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.placeholder = "Enter Teacher First and Last Name"
            }
            let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
                let textField = alertController.textFields![0] as UITextField
                let txt = textField.text!.lowercased()
                guard let _ = txt.firstIndex(of: " ") else {
                    let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                    alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                    self.present(alertController2, animated: true, completion: nil)
                    return
                }
                
                self.teacher8Label.text = txt.capitalized
                let index = txt.index(after: txt.firstIndex(of: " ")!)
                self.mailEight.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
                
                let newTeacher = Teacher(name: self.teacher8Label.text!, email: self.mailEight.text!)
                let jsonEncoder = JSONEncoder()
                if let jsonData = try? jsonEncoder.encode(newTeacher),
                    let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                                    
                    try? jsonData.write(to: self.archiveURLs[7], options: .noFileProtection)
                }
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
            
            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        if MFMailComposeViewController.canSendMail() {
            let message = MFMailComposeViewController()
            message.mailComposeDelegate = self
            let mailTo = mailEight.text!
            message.setToRecipients([mailTo])
            self.present(message, animated: true, completion: nil)
            
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
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view3: UIView!
    @IBOutlet var view4: UIView!
    @IBOutlet var view5: UIView!
    @IBOutlet var view6: UIView!
    @IBOutlet var view7: UIView!
    @IBOutlet var view8: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<8 {
            archiveURLs.append(documentsDirectory.appendingPathComponent("teacher\(i + 1)")
               .appendingPathExtension("plist"))
            
            let jsonDecoder = JSONDecoder()
            if let retrievedData = try? Data(contentsOf: archiveURLs[i]),
                let decodedData = try?
               jsonDecoder.decode(Teacher.self,
               from: retrievedData) {
                print(decodedData)
                
                teacherLabels[i]!.text = decodedData.name
                teacherMails[i]!.text = decodedData.email
            }
        }

        rotation()
        let tapGesture1 = UILongPressGestureRecognizer(target: self, action: #selector(handleTap1(sender:)))
        tapGesture1.numberOfTouchesRequired = 1
        tapGesture1.minimumPressDuration = 0.5
        view1.addGestureRecognizer(tapGesture1)
        
        let tapGesture2 = UILongPressGestureRecognizer(target: self, action: #selector(handleTap2(sender:)))
        tapGesture2.numberOfTouchesRequired = 1
        tapGesture2.minimumPressDuration = 0.5
        view2.addGestureRecognizer(tapGesture2)
        
        let tapGesture3 = UILongPressGestureRecognizer(target: self, action: #selector(handleTap3(sender:)))
        tapGesture3.numberOfTouchesRequired = 1
        tapGesture3.minimumPressDuration = 0.5
        view3.addGestureRecognizer(tapGesture3)
        
        let tapGesture4 = UILongPressGestureRecognizer(target: self, action: #selector(handleTap4(sender:)))
        tapGesture4.numberOfTouchesRequired = 1
        tapGesture4.minimumPressDuration = 0.5
        view4.addGestureRecognizer(tapGesture4)
        
        let tapGesture5 = UILongPressGestureRecognizer(target: self, action: #selector(handleTap5(sender:)))
        tapGesture5.numberOfTouchesRequired = 1
        tapGesture5.minimumPressDuration = 0.5
        view5.addGestureRecognizer(tapGesture5)
        
        let tapGesture6 = UILongPressGestureRecognizer(target: self, action: #selector(handleTap6(sender:)))
        tapGesture6.numberOfTouchesRequired = 1
        tapGesture6.minimumPressDuration = 0.5
        view6.addGestureRecognizer(tapGesture6)
        
        let tapGesture7 = UILongPressGestureRecognizer(target: self, action: #selector(handleTap7(sender:)))
        tapGesture7.numberOfTouchesRequired = 1
        tapGesture7.minimumPressDuration = 0.5
        view7.addGestureRecognizer(tapGesture7)
        
        let tapGesture8 = UILongPressGestureRecognizer(target: self, action: #selector(handleTap8(sender:)))
        tapGesture8.numberOfTouchesRequired = 1
        tapGesture8.minimumPressDuration = 0.5
        view8.addGestureRecognizer(tapGesture8)
        
        // Do any additional setup after loading the view.
    }
    @objc func handleTap1(sender: UILongPressGestureRecognizer) {
        let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 1st period teacher first and last name", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Enter Teacher First and Last Name"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let textField = alertController.textFields![0] as UITextField
            let txt = textField.text!.lowercased()
            guard let _ = txt.firstIndex(of: " ") else {
                let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                self.present(alertController2, animated: true, completion: nil)
                return
            }
            
            self.teacher1Label.text = txt.capitalized
            let index = txt.index(after: txt.firstIndex(of: " ")!)
            self.mailOne.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
            
            let newTeacher = Teacher(name: self.teacher1Label.text!, email: self.mailOne.text!)
            let jsonEncoder = JSONEncoder()
            if let jsonData = try? jsonEncoder.encode(newTeacher),
                let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
                
                try? jsonData.write(to: self.archiveURLs[0],
                   options: .noFileProtection)
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        }
    
    @objc func handleTap2(sender: UILongPressGestureRecognizer) {
        let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 2nd period teacher first and last name", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Enter Teacher First and Last Name"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let textField = alertController.textFields![0] as UITextField
            let txt = textField.text!.lowercased()
            guard let _ = txt.firstIndex(of: " ") else {
                let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                self.present(alertController2, animated: true, completion: nil)
                return
            }
            
            self.teacher2Label.text = txt.capitalized
            let index = txt.index(after: txt.firstIndex(of: " ")!)
            self.mailTwo.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
            
            let newTeacher = Teacher(name: self.teacher2Label.text!, email: self.mailTwo.text!)
            let jsonEncoder = JSONEncoder()
            if let jsonData = try? jsonEncoder.encode(newTeacher),
                let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
                
                try? jsonData.write(to: self.archiveURLs[1],
                   options: .noFileProtection)
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        }
    
    @objc func handleTap3(sender: UILongPressGestureRecognizer) {
        let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 3rd period teacher first and last name", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Enter Teacher First and Last Name"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let textField = alertController.textFields![0] as UITextField
            let txt = textField.text!.lowercased()
            guard let _ = txt.firstIndex(of: " ") else {
                let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                self.present(alertController2, animated: true, completion: nil)
                return
            }
            
            self.teacher3Label.text = txt.capitalized
            let index = txt.index(after: txt.firstIndex(of: " ")!)
            self.mailThree.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
            
            let newTeacher = Teacher(name: self.teacher3Label.text!, email: self.mailThree.text!)
            let jsonEncoder = JSONEncoder()
            if let jsonData = try? jsonEncoder.encode(newTeacher),
                let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
                
                try? jsonData.write(to: self.archiveURLs[2],
                   options: .noFileProtection)
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        }
    
    @objc func handleTap4(sender: UILongPressGestureRecognizer) {
        let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 4th period teacher first and last name", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Enter Teacher First and Last Name"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let textField = alertController.textFields![0] as UITextField
            let txt = textField.text!.lowercased()
            guard let _ = txt.firstIndex(of: " ") else {
                let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                self.present(alertController2, animated: true, completion: nil)
                return
            }
            
            self.teacher4Label.text = txt.capitalized
            let index = txt.index(after: txt.firstIndex(of: " ")!)
            self.mailFour.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
            
            let newTeacher = Teacher(name: self.teacher4Label.text!, email: self.mailFour.text!)
            let jsonEncoder = JSONEncoder()
            if let jsonData = try? jsonEncoder.encode(newTeacher),
                let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
                
                try? jsonData.write(to: self.archiveURLs[3],
                   options: .noFileProtection)
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        }
    
    @objc func handleTap5(sender: UILongPressGestureRecognizer) {
        let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 5th period teacher first and last name", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Enter Teacher First and Last Name"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let textField = alertController.textFields![0] as UITextField
            let txt = textField.text!.lowercased()
            guard let _ = txt.firstIndex(of: " ") else {
                let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                self.present(alertController2, animated: true, completion: nil)
                return
            }
            
            self.teacher5Label.text = txt.capitalized
            let index = txt.index(after: txt.firstIndex(of: " ")!)
            self.mailFive.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
            
            let newTeacher = Teacher(name: self.teacher5Label.text!, email: self.mailFive.text!)
            let jsonEncoder = JSONEncoder()
            if let jsonData = try? jsonEncoder.encode(newTeacher),
                let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
                
                try? jsonData.write(to: self.archiveURLs[4],
                   options: .noFileProtection)
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        }
    
    @objc func handleTap6(sender: UILongPressGestureRecognizer) {
        let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 6th period teacher first and last name", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Enter Teacher First and Last Name"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let textField = alertController.textFields![0] as UITextField
            let txt = textField.text!.lowercased()
            guard let _ = txt.firstIndex(of: " ") else {
                let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                self.present(alertController2, animated: true, completion: nil)
                return
            }
            
            self.teacher6Label.text = txt.capitalized
            let index = txt.index(after: txt.firstIndex(of: " ")!)
            self.mailSix.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
            
            let newTeacher = Teacher(name: self.teacher6Label.text!, email: self.mailSix.text!)
            let jsonEncoder = JSONEncoder()
            if let jsonData = try? jsonEncoder.encode(newTeacher),
                let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
                
                try? jsonData.write(to: self.archiveURLs[5],
                   options: .noFileProtection)
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        }
    
    @objc func handleTap7(sender: UILongPressGestureRecognizer) {
        let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 7th period teacher first and last name", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Enter Teacher First and Last Name"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let textField = alertController.textFields![0] as UITextField
            let txt = textField.text!.lowercased()
            guard let _ = txt.firstIndex(of: " ") else {
                let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                self.present(alertController2, animated: true, completion: nil)
                return
            }
            
            self.teacher7Label.text = txt.capitalized
            let index = txt.index(after: txt.firstIndex(of: " ")!)
            self.mailSeven.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
            
            let newTeacher = Teacher(name: self.teacher7Label.text!, email: self.mailSeven.text!)
            let jsonEncoder = JSONEncoder()
            if let jsonData = try? jsonEncoder.encode(newTeacher),
                let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
                
                try? jsonData.write(to: self.archiveURLs[6],
                   options: .noFileProtection)
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        }
    
    @objc func handleTap8(sender: UILongPressGestureRecognizer) {
        let alertController = UIAlertController(title: "Teacher Name", message: "Please enter your 8th period teacher first and last name", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Enter Teacher First and Last Name"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let textField = alertController.textFields![0] as UITextField
            let txt = textField.text!.lowercased()
            guard let _ = txt.firstIndex(of: " ") else {
                let alertController2 = UIAlertController(title: "Invalid Teacher Name", message: "Please enter a valid teacher name", preferredStyle: .alert)
                alertController2.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
                self.present(alertController2, animated: true, completion: nil)
                return
            }
            
            self.teacher8Label.text = txt.capitalized
            let index = txt.index(after: txt.firstIndex(of: " ")!)
            self.mailEight.text = String(txt[txt.startIndex]) + txt[index..<txt.endIndex] + "@coppellisd.com"
            
            let newTeacher = Teacher(name: self.teacher8Label.text!, email: self.mailEight.text!)
            let jsonEncoder = JSONEncoder()
            if let jsonData = try? jsonEncoder.encode(newTeacher),
                let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
                
                try? jsonData.write(to: self.archiveURLs[7],
                   options: .noFileProtection)
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
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
