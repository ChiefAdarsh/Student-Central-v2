//
//  WelcomeViewController.swift
//  Student Central v2
//
//  Created by Varshith Peddi on 2/21/23.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var holderView: UIView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var description1: UILabel!
    @IBOutlet var button: UIButton!
    @IBOutlet var skipButton: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    



    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        view.addSubview(pageControl)
        // Do any additional setup after loading the view.
        configure()
    }

    @objc private func pageControlDidChange(_ sender: UIPageControl){
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
        
    }

     
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    private func configure() {
        // set up scrollview
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        
        let titles = ["Welcome", "Maps", "Schedule", "Contact", "Quick Links", "Student Help", "Calendar"]
        
        let taglines = ["CHS Student Central will be a centralized app for all students. The app contains almost everything someone could wish for as a student at Coppell High School.", "Access both the map layout of the school inside and the map layout of things outside the school such as the football field, parking lot, and much more.", "View both your class schedule and shuttle schedule (if applicable).", "Use this section as an easy way to contact your teachers, counselors, and admins of Coppell High School", "This section of the app has all the frequently visited sites that students tend to use. It is a quick and easy way to access websites such as HAC, Clever, KCBY, Sidekick, and many more", "Use this section of the app if you or another student is in distress. You can request basic humanitarian aid such as food, shelter, or medical help. You can also request services such as family support, and a lot of counseling.", "Use this to view the daily Coppell High School Calendar."]
        
        for x in 0..<7 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * (holderView.frame.size.width), y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            
            //Title, Image, Button, and Description
            let label2 = UILabel(frame: label.frame)
            
            let imageView2 = UIImageView(frame: imageView.frame)
            
            let button2 = UIButton(frame: button.frame)
            
            let skipButton2 = UIButton(frame: skipButton.frame)
            
            let description2 = UILabel(frame: description1.frame)
            
            label2.textAlignment = .center
            label2.font = UIFont(name: "Helvetica-Bold", size: 36)
            pageView.addSubview(label2)
            label2.text = titles[x]
            
            description2.textAlignment = .center
            description2.font = UIFont(name: "Helvetica", size: 28)
            pageView.addSubview(description2)
            description2.text = taglines[x]
            description2.numberOfLines = 3
            
            imageView2.contentMode = .scaleAspectFit
            
            if (x == 0){
                imageView2.image = UIImage(named: "Onboarding_1")
            } else if (x == 1){
                imageView2.image = UIImage(systemName: "map.fill")
                let config = UIImage.SymbolConfiguration(paletteColors: [UIColor(red: 176/255.0, green: 3/255.0, blue: 0/255.0, alpha: 1.0)])
                imageView2.preferredSymbolConfiguration = config
            } else if (x == 2){
                imageView2.image = UIImage(systemName: "list.bullet.rectangle.portrait.fill")
                let config = UIImage.SymbolConfiguration(paletteColors: [UIColor(red: 176/255.0, green: 3/255.0, blue: 0/255.0, alpha: 1.0)])
                imageView2.preferredSymbolConfiguration = config
            } else if (x == 3){
                imageView2.image = UIImage(systemName: "person.fill")
                let config = UIImage.SymbolConfiguration(paletteColors: [UIColor(red: 176/255.0, green: 3/255.0, blue: 0/255.0, alpha: 1.0)])
                imageView2.preferredSymbolConfiguration = config
            } else if (x == 4){
                imageView2.image = UIImage(systemName: "safari.fill")
                let config = UIImage.SymbolConfiguration(paletteColors: [UIColor(red: 176/255.0, green: 3/255.0, blue: 0/255.0, alpha: 1.0)])
                imageView2.preferredSymbolConfiguration = config
            } else if (x == 5){
                imageView2.image = UIImage(systemName: "cross.circle.fill")
                let config = UIImage.SymbolConfiguration(paletteColors: [UIColor(red: 176/255.0, green: 3/255.0, blue: 0/255.0, alpha: 1.0)])
                imageView2.preferredSymbolConfiguration = config
            } else if (x == 6){
                imageView2.image = UIImage(systemName: "calendar")
                let config = UIImage.SymbolConfiguration(paletteColors: [UIColor(red: 176/255.0, green: 3/255.0, blue: 0/255.0, alpha: 1.0)])
                imageView2.preferredSymbolConfiguration = config
            }
            
            pageView.addSubview(imageView2)
            button2.setTitleColor(.white, for: .normal)
            button2.backgroundColor = .black
            button2.setTitle("Next", for: .normal)
            if (x == 6){
                button2.setTitle("Get Started", for: .normal)
            }
            button2.layer.cornerRadius = 10
            button2.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            button2.tag = x + 1
            pageView.addSubview(button2)
            
            pageView.addSubview(imageView2)
            skipButton2.setTitleColor(.systemBlue, for: .normal)
            skipButton2.setTitle("Skip", for: .normal)
            skipButton2.titleLabel?.font =  UIFont(name: "Helvetica", size: 30)
            
            skipButton2.layer.cornerRadius = 10
            skipButton2.addTarget(self, action: #selector(didTapButton2(_:)), for: .touchUpInside)
            pageView.addSubview(skipButton2)
        }
        scrollView.contentSize = CGSize(width: holderView.frame.size.width * 3, height: 0)
        scrollView.isPagingEnabled = true

    }
    
    @objc func didTapButton(_ button:UIButton) {
        
        guard button.tag < 7 else{
            //dismiss
           Core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
            return
        }
        //scroll to next page
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }

    @objc func didTapButton2(_ button:UIButton) {
        //dismiss
//        Core.shared.setIsNotNewUser()
        dismiss(animated: true, completion: nil)
        return
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

extension WelcomeViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
 
}
 
