//
//  Onboarding-v2ViewController.swift
//  Student Central v2
//
//  Created by Omesh Reddy Sana on 4/26/23.
//

import UIKit

class Onboarding_v2ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backButton: UIButton!
    
    var num = 0
    
    let images = ["Onboarding_1.jpeg", "map.fill", "list.bullet.rectangle.portrait.fill", "person.fill", "safari.fill", "cross.circle.fill", "calendar.jpeg"]
    let titles = ["Welcome", "Maps", "Schedule", "Contact", "Quick Links", "Student Help", "Calendar"]
    
    let taglines = ["CHS Student Central will be a centralized app for all students. The app contains almost everything someone could wish for as a student at Coppell High School.", "Access both the map layout of the school inside and the map layout of things outside the school such as the football field, parking lot, and much more.", "View both your class schedule and shuttle schedule (if applicable).", "Use this section as an easy way to contact your teachers, counselors, and admins of Coppell High School.", "This section of the app has all the frequently visited sites that students tend to use. It is a quick and easy way to access websites such as HAC, Clever, KCBY, Sidekick, and many more.", "Use this section of the app if you or another student is in distress. You can request basic humanitarian aid such as food, shelter, or medical help. You can also request services such as family support, and a lot of counseling.", "Use this to view the daily Coppell High School Calendar."]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 36)
        descriptionLabel.font = UIFont(name: "Helvetica", size: 22)
        skipButton.setTitleColor(.systemBlue, for: .normal)
        skipButton.setTitle("Skip", for: .normal)
        skipButton.titleLabel?.font =  UIFont(name: "Helvetica", size: 35)
        skipButton.layer.cornerRadius = 10
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .black
        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.cornerRadius = 10
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = .black
        backButton.setTitle("Back", for: .normal)
        backButton.layer.cornerRadius = 10
        
        backButton.isHidden = true
        
        imageView.image = UIImage(named: images[0])
        titleLabel.text = titles[0]
        descriptionLabel.text = taglines[0]
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if num != 0{
            backButton.isHidden = false
        }
        
        if num <= images.count - 1{
            num += 1
            if num == 6{
                imageView.image = UIImage(named: images[num])
                nextButton.setTitle("Get Started", for: .normal)
                
            }
            else if num > 6{
                dismiss(animated: true, completion: nil)

            }
            else
            {
                imageView.image = UIImage(systemName: images[num])
                nextButton.setTitle("Next", for: .normal)
                
            }
            
            if num != 0{
                backButton.isHidden = false
            }
            if num == 0{
                backButton.isHidden = true
                imageView.image = UIImage(named: images[num])
            }
            titleLabel.text = titles[num]
            descriptionLabel.text = taglines[num]
            pageControl.currentPage = num
            if (num == 6)
            {
                num += 1
            }
            //num += 1
        }
        else{
            
//            if (num == 7 && backButton.isEnabled){
//                print("hello")
//                num -= 1
//            }
//            else{
//                dismiss(animated: true, completion: nil)
//            }
            Core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        num -= 1
        if (num == 6)
        {
            num -= 1
        }
        if num <= images.count - 1{
            //num -= 1
            backButton.isHidden = false
            if (num == 0){
                imageView.image = UIImage(named: images[num])
            }
            else if (num == 6){
                imageView.image = UIImage(named: images[num])
                nextButton.setTitle("Get Started", for: .normal)
            }
            else
            {
                imageView.image = UIImage(systemName: images[num])
            }
            
            titleLabel.text = titles[num]
            descriptionLabel.text = taglines[num]
            pageControl.currentPage = num
            num -= 1
            if (num == 0){
                backButton.isHidden = true

            }
        }
        
        
    }
    
    @IBAction func skipButton(_ sender: Any) {
        Core.shared.setIsNotNewUser()
        dismiss(animated: true, completion: nil)
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
