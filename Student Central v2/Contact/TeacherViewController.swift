//
//  Contact Counselor.swift
//  Student Central
//
//  Created by Adarsh Goura on 11/28/22.
//

import UIKit
import MessageUI

var idfkatp = true
var isSelected = false
var selectedTeacher = ""
var selectedTeacherEmail = ""

class CounselorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func rotation() {
        
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
    
    @IBOutlet var CButton: UIButton!
    @IBOutlet var AButton: UIButton!
    
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
    
    @IBAction func CounselorButton(_ sender: Any) {
        var targetViewController = storyboard!.instantiateViewController(withIdentifier: "cscreen") as! UIViewController
               self.navigationController?.pushViewController(targetViewController, animated: true)
    }
    
    @IBAction func AdminButton(_ sender: Any) {
        var targetViewController = storyboard!.instantiateViewController(withIdentifier: "prince") as! UIViewController
                self.navigationController?.pushViewController(targetViewController, animated: true)
    }
    @IBAction func buttonOne(_ sender: UIButton) {
        Task { @MainActor in
            guard teacher1Label.text! != "TEACHER #1" else {
                func searchForTeacher() async {
                    var targetViewController = await storyboard!.instantiateViewController(withIdentifier: "teacherSearchTable") as! TeacherSearchViewController
                    await self.navigationController?.showDetailViewController(targetViewController, sender: self)
                    
//                    try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
                    while isSelected == false {
                        // Do nothing
                    }
                }
                print("Pushed")
                await searchForTeacher()

                if isSelected {
                    self.teacher1Label.text = selectedTeacher
                    if let i = teacherNames.firstIndex(of: selectedTeacher) {
                        self.mailOne.text = teacherEmails[i]
                    } else {
                        self.mailOne.text = "Error"
                    }
                    
                    let newTeacher = Teacher(name: self.teacher1Label.text!, email: self.mailOne.text!)
                    let jsonEncoder = JSONEncoder()
                    if let jsonData = try? jsonEncoder.encode(newTeacher),
                       let jsonString = String(data: jsonData, encoding: .utf8) {
                        print(jsonString)

                        try? jsonData.write(to: self.archiveURLs[0], options: .noFileProtection)
                    }
                } else {
                    self.mailOne.text = "There's been an error, please hold to try again"
                }

                isSelected = false
                
                
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
    }
    
    @IBAction func buttonTwo(_ sender: UIButton) {
        Task { @MainActor in
            guard teacher2Label.text! != "TEACHER #2" else {
                func searchForTeacher() async {
                    var targetViewController = await storyboard!.instantiateViewController(withIdentifier: "teacherSearchTable") as! TeacherSearchViewController
                    await self.navigationController?.showDetailViewController(targetViewController, sender: self)
                    
//                    try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
                    while isSelected == false {
                        // Do nothing
                    }
                }
                print("Pushed")
                await searchForTeacher()

                if isSelected {
                    self.teacher2Label.text = selectedTeacher
                    if let i = teacherNames.firstIndex(of: selectedTeacher) {
                        self.mailTwo.text = teacherEmails[i]
                    } else {
                        self.mailTwo.text = "Error"
                    }
                    
                    let newTeacher = Teacher(name: self.teacher2Label.text!, email: self.mailTwo.text!)
                    let jsonEncoder = JSONEncoder()
                    if let jsonData = try? jsonEncoder.encode(newTeacher),
                       let jsonString = String(data: jsonData, encoding: .utf8) {
                        print(jsonString)

                        try? jsonData.write(to: self.archiveURLs[1], options: .noFileProtection)
                    }
                } else {
                    self.mailTwo.text = "There's been an error, please hold to try again"
                }

                isSelected = false
                
                
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
    }
    
    @IBAction func buttonThree(_ sender: UIButton) {
        Task { @MainActor in
            guard teacher3Label.text! != "TEACHER #3" else {
                func searchForTeacher() async {
                    var targetViewController = await storyboard!.instantiateViewController(withIdentifier: "teacherSearchTable") as! TeacherSearchViewController
                    await self.navigationController?.showDetailViewController(targetViewController, sender: self)
                    
//                    try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
                    while isSelected == false {
                        // Do nothing
                    }
                }
                print("Pushed")
                await searchForTeacher()

                if isSelected {
                    self.teacher3Label.text = selectedTeacher
                    if let i = teacherNames.firstIndex(of: selectedTeacher) {
                        self.mailThree.text = teacherEmails[i]
                    } else {
                        self.mailThree.text = "Error"
                    }
                    
                    let newTeacher = Teacher(name: self.teacher3Label.text!, email: self.mailThree.text!)
                    let jsonEncoder = JSONEncoder()
                    if let jsonData = try? jsonEncoder.encode(newTeacher),
                       let jsonString = String(data: jsonData, encoding: .utf8) {
                        print(jsonString)

                        try? jsonData.write(to: self.archiveURLs[2], options: .noFileProtection)
                    }
                } else {
                    self.mailThree.text = "There's been an error, please hold to try again"
                }

                isSelected = false
                
                
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
    }
    
    @IBAction func buttonFour(_ sender: UIButton) {
        Task { @MainActor in
            guard teacher4Label.text! != "TEACHER #4" else {
                func searchForTeacher() async {
                    var targetViewController = await storyboard!.instantiateViewController(withIdentifier: "teacherSearchTable") as! TeacherSearchViewController
                    await self.navigationController?.showDetailViewController(targetViewController, sender: self)
                    
//                    try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
                    while isSelected == false {
                        // Do nothing
                    }
                }
                print("Pushed")
                await searchForTeacher()

                if isSelected {
                    self.teacher4Label.text = selectedTeacher
                    if let i = teacherNames.firstIndex(of: selectedTeacher) {
                        self.mailFour.text = teacherEmails[i]
                    } else {
                        self.mailFour.text = "Error"
                    }
                    
                    let newTeacher = Teacher(name: self.teacher4Label.text!, email: self.mailFour.text!)
                    let jsonEncoder = JSONEncoder()
                    if let jsonData = try? jsonEncoder.encode(newTeacher),
                       let jsonString = String(data: jsonData, encoding: .utf8) {
                        print(jsonString)

                        try? jsonData.write(to: self.archiveURLs[3], options: .noFileProtection)
                    }
                } else {
                    self.mailFour.text = "There's been an error, please hold to try again"
                }

                isSelected = false
                
                
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
    }
    
    @IBAction func buttonFive(_ sender: UIButton) {
        Task { @MainActor in
            guard teacher5Label.text! != "TEACHER #5" else {
                func searchForTeacher() async {
                    var targetViewController = await storyboard!.instantiateViewController(withIdentifier: "teacherSearchTable") as! TeacherSearchViewController
                    await self.navigationController?.showDetailViewController(targetViewController, sender: self)
                    
//                    try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
                    while isSelected == false {
                        // Do nothing
                    }
                }
                print("Pushed")
                await searchForTeacher()

                if isSelected {
                    self.teacher5Label.text = selectedTeacher
                    if let i = teacherNames.firstIndex(of: selectedTeacher) {
                        self.mailFive.text = teacherEmails[i]
                    } else {
                        self.mailFive.text = "Error"
                    }
                    
                    let newTeacher = Teacher(name: self.teacher5Label.text!, email: self.mailFive.text!)
                    let jsonEncoder = JSONEncoder()
                    if let jsonData = try? jsonEncoder.encode(newTeacher),
                       let jsonString = String(data: jsonData, encoding: .utf8) {
                        print(jsonString)

                        try? jsonData.write(to: self.archiveURLs[4], options: .noFileProtection)
                    }
                } else {
                    self.mailFive.text = "There's been an error, please hold to try again"
                }

                isSelected = false
                
                
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
    }
    
    @IBAction func buttonSix(_ sender: UIButton) {
        Task { @MainActor in
            guard teacher6Label.text! != "TEACHER #6" else {
                func searchForTeacher() async {
                    var targetViewController = await storyboard!.instantiateViewController(withIdentifier: "teacherSearchTable") as! TeacherSearchViewController
                    await self.navigationController?.showDetailViewController(targetViewController, sender: self)
                    
//                    try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
                    while isSelected == false {
                        // Do nothing
                    }
                }
                print("Pushed")
                await searchForTeacher()

                if isSelected {
                    self.teacher6Label.text = selectedTeacher
                    if let i = teacherNames.firstIndex(of: selectedTeacher) {
                        self.mailSix.text = teacherEmails[i]
                    } else {
                        self.mailSix.text = "Error"
                    }
                    
                    let newTeacher = Teacher(name: self.teacher6Label.text!, email: self.mailSix.text!)
                    let jsonEncoder = JSONEncoder()
                    if let jsonData = try? jsonEncoder.encode(newTeacher),
                       let jsonString = String(data: jsonData, encoding: .utf8) {
                        print(jsonString)

                        try? jsonData.write(to: self.archiveURLs[5], options: .noFileProtection)
                    }
                } else {
                    self.mailSix.text = "There's been an error, please hold to try again"
                }

                isSelected = false
                
                
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
    }
    
    @IBAction func buttonSeven(_ sender: UIButton) {
        Task { @MainActor in
            guard teacher7Label.text! != "TEACHER #7" else {
                func searchForTeacher() async {
                    var targetViewController = await storyboard!.instantiateViewController(withIdentifier: "teacherSearchTable") as! TeacherSearchViewController
                    await self.navigationController?.showDetailViewController(targetViewController, sender: self)
                    
//                    try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
                    while isSelected == false {
                        // Do nothing
                    }
                }
                print("Pushed")
                await searchForTeacher()

                if isSelected {
                    self.teacher7Label.text = selectedTeacher
                    if let i = teacherNames.firstIndex(of: selectedTeacher) {
                        self.mailSeven.text = teacherEmails[i]
                    } else {
                        self.mailSeven.text = "Error"
                    }
                    
                    let newTeacher = Teacher(name: self.teacher7Label.text!, email: self.mailSeven.text!)
                    let jsonEncoder = JSONEncoder()
                    if let jsonData = try? jsonEncoder.encode(newTeacher),
                       let jsonString = String(data: jsonData, encoding: .utf8) {
                        print(jsonString)

                        try? jsonData.write(to: self.archiveURLs[6], options: .noFileProtection)
                    }
                } else {
                    self.mailSeven.text = "There's been an error, please hold to try again"
                }

                isSelected = false
                
                
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
    }
    
    @IBAction func buttonEight(_ sender: UIButton) {
        Task { @MainActor in
            guard teacher8Label.text! != "TEACHER #8" else {
                func searchForTeacher() async {
                    var targetViewController = await storyboard!.instantiateViewController(withIdentifier: "teacherSearchTable") as! TeacherSearchViewController
                    await self.navigationController?.showDetailViewController(targetViewController, sender: self)
                    
//                    try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
                    while isSelected == false {
                        // Do nothing
                    }
                }
                print("Pushed")
                await searchForTeacher()

                if isSelected {
                    self.teacher8Label.text = selectedTeacher
                    if let i = teacherNames.firstIndex(of: selectedTeacher) {
                        self.mailEight.text = teacherEmails[i]
                    } else {
                        self.mailEight.text = "Error"
                    }
                    
                    let newTeacher = Teacher(name: self.teacher8Label.text!, email: self.mailEight.text!)
                    let jsonEncoder = JSONEncoder()
                    if let jsonData = try? jsonEncoder.encode(newTeacher),
                       let jsonString = String(data: jsonData, encoding: .utf8) {
                        print(jsonString)

                        try? jsonData.write(to: self.archiveURLs[7], options: .noFileProtection)
                    }
                } else {
                    self.mailEight.text = "There's been an error, please hold to try again"
                }

                isSelected = false
                
                
                return
            }
            
            if MFMailComposeViewController.canSendMail() {
                let message = MFMailComposeViewController()
                message.mailComposeDelegate = self
                let mailTo = mailEight.text!
                message.setToRecipients([mailTo])
                present(message, animated: true, completion: nil)
                
            } else {
                let alertController = UIAlertController(title: "Mail Not Enabled", message: "Your device is not configured to send email", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .default))
                present(alertController, animated: true, completion: nil)
            }
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
        print("omg it work")
        print(archiveURLs[0])
        let newTeacher = Teacher(name: "TEACHER #1", email: "teacher1@coppellisd.com")
        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(newTeacher),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
            
            try? jsonData.write(to: self.archiveURLs[0],
                                options: .noFileProtection)
        }
        self.viewDidLoad()
    }
    
    @objc func handleTap2(sender: UILongPressGestureRecognizer) {
        print("omg it work")
        print(archiveURLs[1])
        let newTeacher = Teacher(name: "TEACHER #2", email: "teacher2@coppellisd.com")
        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(newTeacher),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
            
            try? jsonData.write(to: self.archiveURLs[1],
                                options: .noFileProtection)
        }
        self.viewDidLoad()
    }
    
    @objc func handleTap3(sender: UILongPressGestureRecognizer) {
        print("omg it work")
        print(archiveURLs[2])
        let newTeacher = Teacher(name: "TEACHER #3", email: "teacher3@coppellisd.com")
        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(newTeacher),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
            
            try? jsonData.write(to: self.archiveURLs[2],
                                options: .noFileProtection)
        }
        self.viewDidLoad()
    }
    
    @objc func handleTap4(sender: UILongPressGestureRecognizer) {
        print("omg it work")
        print(archiveURLs[3])
        let newTeacher = Teacher(name: "TEACHER #4", email: "teacher4@coppellisd.com")
        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(newTeacher),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
            
            try? jsonData.write(to: self.archiveURLs[3],
                                options: .noFileProtection)
        }
        self.viewDidLoad()
    }
    
    @objc func handleTap5(sender: UILongPressGestureRecognizer) {
        print("omg it work")
        print(archiveURLs[4])
        let newTeacher = Teacher(name: "TEACHER #5", email: "teacher5@coppellisd.com")
        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(newTeacher),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
            
            try? jsonData.write(to: self.archiveURLs[4],
                                options: .noFileProtection)
        }
        self.viewDidLoad()
    }
    
    @objc func handleTap6(sender: UILongPressGestureRecognizer) {
        print("omg it work")
        print(archiveURLs[5])
        let newTeacher = Teacher(name: "TEACHER #6", email: "teacher6@coppellisd.com")
        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(newTeacher),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
            
            try? jsonData.write(to: self.archiveURLs[5],
                                options: .noFileProtection)
        }
        self.viewDidLoad()
    }
    
    @objc func handleTap7(sender: UILongPressGestureRecognizer) {
        print("omg it work")
        print(archiveURLs[6])
        let newTeacher = Teacher(name: "TEACHER #7", email: "teacher7@coppellisd.com")
        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(newTeacher),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
            
            try? jsonData.write(to: self.archiveURLs[6],
                                options: .noFileProtection)
        }
        self.viewDidLoad()
    }
    
    @objc func handleTap8(sender: UILongPressGestureRecognizer) {
        print("omg it work")
        print(archiveURLs[7])
        let newTeacher = Teacher(name: "TEACHER #8", email: "teacher8@coppellisd.com")
        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(newTeacher),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
            
            try? jsonData.write(to: self.archiveURLs[7],
                                options: .noFileProtection)
        }
        self.viewDidLoad()
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

class TeacherSearchViewController: UITableViewController {

    @IBOutlet var searchBar: UISearchBar!
    var filteredData = [String]()
    var searched = false
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
        if searched {
            return filteredData.count
        } else {
            return teacherNames.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teacherSearchCell", for: indexPath)

        // Configure the cell...
        if searched {
            for i in 0...(filteredData.count - 1) {
                if indexPath.row == i {
                    cell.textLabel?.text = filteredData[i]
                }
            }
        } else {
            for i in 0...(teacherNames.count - 1) {
                if indexPath.row == i {
                    cell.textLabel?.text = teacherNames[i]
                }
            }
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if searched {
            for i in 0...(filteredData.count - 1) {
                if indexPath[1] == i {
                    selectedTeacher = filteredData[i]
                }
            }
        } else {
            for i in 0...(teacherNames.count - 1) {
                if indexPath[1] == i {
                    selectedTeacher = teacherNames[i]
                }
            }
        }
        self.dismiss(animated: true)
        isSelected = true
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

extension TeacherSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            print(searchText)
            filteredData = []
//            filteredData = teacherNames.filter({$0.lowercased().uppercased().contains(searchText.uppercased().lowercased())})
            for name in teacherNames {
                if name.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(name)
                }
            }
            print(filteredData)
        }
        searched = true
        tableView.reloadData()
    }
}
