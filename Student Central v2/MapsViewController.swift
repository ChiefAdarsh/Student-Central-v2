//
//  Maps.swift
//  Student Central
//
//  Created by Adarsh Goura on 11/28/22.
//

import UIKit

class MapsViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pick1: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollView()
        imageView.image = UIImage(named:"Inside Map-1")
        
    }
    
    func setUpScrollView() {
        scrollView.delegate = self
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    @IBAction func SegeValueChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            imageView.image = UIImage(named:"Inside Map-1")
        }
        if sender.selectedSegmentIndex == 1{
            imageView.image = UIImage(named:"Outside Map-1")
        }
        
    }

}

