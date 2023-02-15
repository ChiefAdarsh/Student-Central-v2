import UIKit

class LinksViewController: UIViewController {

    @IBOutlet var mySchoolBucks: UIButton!
    @IBOutlet var KCBY: UIButton!
    @IBOutlet var Sidekick: UIButton!
    @IBOutlet var lunchMenu: UIButton!
    @IBOutlet var helpDesk: UIButton!
    @IBOutlet var homeAccessCenter: UIButton!
    @IBOutlet var Clever: UIButton!
    @IBOutlet var coppellISD: UIButton!
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var labelStack1: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let size = UIScreen.main.bounds.size
        if(size.height < size.width) {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
        
        let deviceType = UIDevice.current.model
        if deviceType == "iPad" {
            print("hello")
            // iPad
            Clever.titleLabel!.font = .systemFont(ofSize: 130)
            
            
        }
        else if deviceType == "iPhone" {
            print("hello2")
            Clever.titleLabel!.font = .systemFont(ofSize: 70)
            // iPhone
            for i in labelStack1 {
                let renderer = UIGraphicsImageRenderer(size: CGSize(width: 80, height: 80))
                let image = i.imageView!.image!
                let resizedImage = renderer.image { context in image.draw(in: CGRect(origin: .zero, size: CGSize(width: 80, height: 80))) }
                i.setImage(resizedImage.withRenderingMode(.alwaysTemplate), for: .normal)

            }
            
            
        }

    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let _ = stackView else { return }
        
        let size = UIScreen.main.bounds.size
        if(size.height < size.width) {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
        
    }

    @IBAction func schoolBucksLink(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.myschoolbucks.com")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func KCBYLink(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.kcbycoppell.com")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func MediaLink(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://coppellstudentmedia.com/tag/sidekick-newspaper/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func menuLink(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://coppellisd.nutrislice.com/menu/coppell-high-school")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func helpDeskLink(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://cisdsupport.freshservice.com/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func hacLink(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://hac.coppellisd.com")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func cleverLink(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://clever.com")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func cisdLink(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.coppellisd.com")! as URL, options: [:], completionHandler: nil)
    }

        // Do any additional setup after loading the view.

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
