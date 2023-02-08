//
//  ViewControllerMEEE.swift
//  funn
//
//  Created by Rushil Patel on 2/7/23.
//

import UIKit

class HelpViewController: UIViewController {
    var wordd : String = ""
    
    @IBOutlet weak var PsychButton: UIButton!
    @IBOutlet weak var SupportButton: UIButton!
    @IBOutlet weak var FamilyButton: UIButton!
    @IBOutlet weak var DomesticButton: UIButton!
    @IBOutlet weak var SpecialtyButton: UIButton!
    @IBOutlet weak var DrugButton: UIButton!
    @IBOutlet weak var EatingButton: UIButton!
    @IBOutlet weak var CounselButton: UIButton!
    @IBOutlet weak var CrisisButton: UIButton!
    @IBOutlet weak var InoutButton: UIButton!
    
    @IBAction func CrisisTap(_ sender: Any) {
        wordd = "Crisis Lines"
    }
    
    @IBAction func InoutTap(_ sender: Any) {
        wordd = "Inpatient/Outpatient Mental Health Facilities"
    }
    
    @IBAction func CounselingTap(_ sender: Any) {
        wordd = "Counseling Centers"
    }
    
    @IBAction func EatingTap(_ sender: Any) {
        wordd = "Eating Disorders"
    }
    
    @IBAction func DrugTap(_ sender: Any) {
        wordd = "Drug and Alcohol Abuse"
    }
    @IBAction func SpecialtyTap(_ sender: Any) {
        wordd = "Specialty Counseling"
    }
    
    @IBAction func domesticTap(_ sender: Any) {
        wordd = "Domestic Violence"
    }
    @IBAction func psychTap(_ sender: Any) {
        wordd = "Psychiatrists"
    }
    @IBAction func familyTap(_ sender: Any) {
        wordd = "Family Assistance"
    }
    
    @IBAction func supportTap(_ sender: Any) {
        wordd = "Support Groups and Resources"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordd = ""
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if let nextViewController = segue.destination as? ViewControllerResPage {
                    nextViewController.order = wordd
                }
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