//
//  ViewController.swift
//  Student Central v2
//
//  Created by Adarsh Goura on 1/27/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelStack1: [UIButton]!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        label.currentAttributedTitle?
        
        let deviceType = UIDevice.current.model
        
        if deviceType == "iPad" {
            print("hello")
            // iPad
            for i in labelStack1 {
//                let renderer = UIGraphicsImageRenderer(size: CGSize(width: 100, height: 100))
//                let image = i.imageView!.image!
//                i.imageView!.frame = CGRect(origin: i.center, size: CGSize(width: 50, height: 50))
//                let resizedImage = renderer.image { context in image.draw(in: CGRect(origin: .zero, size: CGSize(width: 50, height: 50))) }
//                i.titleLabel!.font = .systemFont(ofSize: 26)
//                i.setImage(resizedImage.withRenderingMode(.alwaysTemplate), for: .normal)
                
//                i.setPreferredSymbolConfiguration(.init(pointSize: 10), forImageIn: .normal)
                
                i.imageView!.contentMode = .scaleAspectFit;
            }
            
        }
        else if deviceType == "iPhone" {
            print("hello2")
            // iPhone
//            label.decreaseSize(10)
            for i in labelStack1 {
                
                i.titleLabel!.font = .systemFont(ofSize: 14)
                let renderer = UIGraphicsImageRenderer(size: CGSize(width: 60, height: 60))
                let image = i.imageView!.image!
                let resizedImage = renderer.image { context in image.draw(in: CGRect(origin: .zero, size: CGSize(width: 60, height: 60))) }
                i.setImage(resizedImage.withRenderingMode(.alwaysTemplate), for: .normal)

            }
            
            
        }
        
    }


}

