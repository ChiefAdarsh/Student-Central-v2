//
//  ViewControllerMEEE.swift
//  funn
//
//  Created by Rushil Patel on 2/7/23.
//

import UIKit

class HelpViewController: UIViewController {
    

    var wordd : String = ""
    
    let deviceType = UIDevice.current.model

    
    
    @IBOutlet var stackView: UIStackView!
    @IBOutlet weak var chekchek: UIButton!
    @IBOutlet weak var FamilyButton: UIButton!
    @IBOutlet weak var DomesticButton: UIButton!
    @IBOutlet weak var SpecialtyButton: UIButton!
    @IBOutlet weak var DrugButton: UIButton!
    @IBOutlet weak var EatingButton: UIButton!
    @IBOutlet weak var CounselButton: UIButton!
    @IBOutlet weak var CrisisButton: UIButton!
    @IBOutlet weak var InoutButton: UIButton!
    @IBOutlet var bropLEASE: UIButton!
    
    @IBOutlet weak var ShelterButton: UIButton!
    @IBOutlet var labelStack1: [UIButton]!
    
    
    @IBAction func chekcheckTap(_ sender: Any) {
        wordd = "Psychiatrists"
        ViewControllerResPage.category = "Psychiatrists"
    }
    @IBAction func CrisisTap(_ sender: Any) {
        wordd = "Crisis Lines"
        ViewControllerResPage.category = "Crisis Lines"
    }
    
    @IBAction func bropLEASETap(_ sender: Any) {
        wordd = "Support Groups and Resources"
        ViewControllerResPage.category = "Support Groups and Resources"
    }
    
    @IBAction func shelterTap(_ sender: Any) {
        wordd = "Shelter"
        ViewControllerResPage.category = "Shelter"
    }
    
    @IBAction func InoutTap(_ sender: Any) {
        wordd = "Inpatient/Outpatient Mental Health Facilities"
        ViewControllerResPage.category = "Inpatient/Outpatient Mental Health Facilities"
    }
    
    @IBAction func CounselingTap(_ sender: Any) {
        wordd = "Counseling Centers"
        ViewControllerResPage.category = "Counseling Centers"
    }
    
    @IBAction func EatingTap(_ sender: Any) {
        wordd = "Eating Disorders"
        ViewControllerResPage.category = "Eating Disorders"
    }
    
    @IBAction func DrugTap(_ sender: Any) {
        wordd = "Drug and Alcohol Abuse"
        ViewControllerResPage.category = "Drug and Alcohol Abuse"
    }
    @IBAction func SpecialtyTap(_ sender: Any) {
        wordd = "Specialty Counseling"
        ViewControllerResPage.category = "Specialty Counseling"
    }
    
    @IBAction func domesticTap(_ sender: Any) {
        wordd = "Domestic Violence"
        ViewControllerResPage.category = "Domestic Violence"
    }
    
    @IBAction func familyTap(_ sender: Any) {
        wordd = "Family Assistance"
        ViewControllerResPage.category = "Family Assistance"
    }
    @IBAction func housingTap(_ sender: Any) {
        wordd = "Housing"
        ViewControllerResPage.category = "Housing"
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordd = ""
        if deviceType == "iPhone" {
            InoutButton.titleLabel!.font = .systemFont(ofSize: 14)
            // iPhone
        }
        
        
        let size = UIScreen.main.bounds.size
        if size.height < size.width {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let _ = stackView else { return }
        
        if UIDevice.current.orientation.isLandscape {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if let nextViewController = segue.destination as? ViewControllerResPage {
//                nextViewController.order = wordd
//            }
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
