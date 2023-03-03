//
//  WelcomeViewController.swift
//  Student Central v2
//
//  Created by Varshith Peddi on 2/21/23.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var holderView: UIView!
    
    let scrollView = UIScrollView()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 7
        pageControl.pageIndicatorTintColor = UIColor(red: 176/255.0, green: 3/255.0, blue: 0/255.0, alpha: 1.0)
        pageControl.currentPageIndicatorTintColor = .black
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        // Do any additional setup after loading the view.
    }
    
    @objc private func pageControlDidChange(_ sender: UIPageControl){
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 10, y: 720, width: view.frame.size.width-20, height: 70)
        configure()
    }
    
    private func configure() {
        // set up scrollview
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        
        let titles = ["Welcome", "Maps", "Schedule", "Contact", "Quick Links", "Student Help", "Calendar"]
        
        let taglines = ["CHS Student Central will be a centralized app for all students. The\n app contains almost everything someone could wish for as a student at \nCoppell High School.", "Access both the map layout of the school inside and the map layout\n of things outside the school such as the football field, parking lot, and\n much more.", "View both your class schedule and shuttle schedule (if applicable).", "Use this section as an easy way to contact your teachers, counselors, \nand admins of Coppell High School", "This section of the app has all the frequently visited sites that students tend\n to use. It is a quick and easy way to access websites such as HAC, Clever,\n KCBY, Sidekick, and many more", "Use this section of the app if you or another student is in distress. You can\n request basic humanitarian aid such as food, shelter, or medical help. You \ncan also request services such as family support, and a lot of counseling.", "Use this to view the daily Coppell High School Calendar."]
        
        for x in 0..<7 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * (holderView.frame.size.width), y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            
            //Title, Image, Button, and Description
            let label = UILabel(frame: CGRect(x: 10, y: 350, width: pageView.frame.size.width-20, height: 120))
            
            let imageView = UIImageView(frame: CGRect(x: 75, y: 65, width: pageView.frame.size.width-150, height: pageView.frame.size.height - 500))
            
            let button = UIButton(frame: CGRect(x: 100, y: 630, width: pageView.frame.size.width-200, height: 50))
            
            let skipButton = UIButton(frame: CGRect(x: 900, y: 25, width: pageView.frame.size.width-900, height: 50))
            
            let description = UILabel(frame: CGRect(x: 10, y: 470, width: pageView.frame.size.width-20, height: 120))
            
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica-Bold", size: 36)
            pageView.addSubview(label)
            label.text = titles[x]
            
            description.textAlignment = .center
            description.font = UIFont(name: "Helvetica", size: 28)
            pageView.addSubview(description)
            description.text = taglines[x]
            description.numberOfLines = 3
            
            imageView.contentMode = .scaleAspectFit
            
            if (x == 0){
                imageView.image = UIImage(named: "Onboarding_1")
            } else if (x == 1){
                imageView.image = UIImage(systemName: "map.fill")
                let config = UIImage.SymbolConfiguration(paletteColors: [UIColor(red: 176/255.0, green: 3/255.0, blue: 0/255.0, alpha: 1.0)])
                imageView.preferredSymbolConfiguration = config
            } else if (x == 2){
                imageView.image = UIImage(systemName: "list.bullet.rectangle.portrait.fill")
                let config = UIImage.SymbolConfiguration(paletteColors: [UIColor(red: 176/255.0, green: 3/255.0, blue: 0/255.0, alpha: 1.0)])
                imageView.preferredSymbolConfiguration = config
            } else if (x == 3){
                imageView.image = UIImage(systemName: "person.fill")
                let config = UIImage.SymbolConfiguration(paletteColors: [UIColor(red: 176/255.0, green: 3/255.0, blue: 0/255.0, alpha: 1.0)])
                imageView.preferredSymbolConfiguration = config
            } else if (x == 4){
                imageView.image = UIImage(systemName: "safari.fill")
                let config = UIImage.SymbolConfiguration(paletteColors: [UIColor(red: 176/255.0, green: 3/255.0, blue: 0/255.0, alpha: 1.0)])
                imageView.preferredSymbolConfiguration = config
            } else if (x == 5){
                imageView.image = UIImage(systemName: "cross.circle.fill")
                let config = UIImage.SymbolConfiguration(paletteColors: [UIColor(red: 176/255.0, green: 3/255.0, blue: 0/255.0, alpha: 1.0)])
                imageView.preferredSymbolConfiguration = config
            } else if (x == 6){
                imageView.image = UIImage(systemName: "calendar")
                let config = UIImage.SymbolConfiguration(paletteColors: [UIColor(red: 176/255.0, green: 3/255.0, blue: 0/255.0, alpha: 1.0)])
                imageView.preferredSymbolConfiguration = config
            }
            
            pageView.addSubview(imageView)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.setTitle("Next", for: .normal)
            if (x == 6){
                button.setTitle("Get Started", for: .normal)
            }
            button.layer.cornerRadius = 10
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            button.tag = x + 1
            pageView.addSubview(button)
            
            pageView.addSubview(imageView)
            skipButton.setTitleColor(.systemBlue, for: .normal)
            skipButton.setTitle("Skip", for: .normal)
            skipButton.titleLabel?.font =  UIFont(name: "Helvetica", size: 30)
            
            skipButton.layer.cornerRadius = 10
            skipButton.addTarget(self, action: #selector(didTapButton2(_:)), for: .touchUpInside)
            pageView.addSubview(skipButton)
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
        Core.shared.setIsNotNewUser()
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
 
