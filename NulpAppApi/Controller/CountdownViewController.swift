
import UIKit
import AVFoundation

class CountdownViewController: UIViewController {
    let controllerNetworkManager: NetworkManager = NetworkManager()
    var seconds = 30
    var timer = Timer()
//    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func slider(_ sender: UISlider)
    {
        seconds = Int(sender.value)
        label.text = String(seconds) + " Seconds"
    }
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBAction func start(_ sender: AnyObject)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CountdownViewController.counter), userInfo: nil, repeats: true)
        
        sliderOutlet.isHidden = true
//        startOutlet.isHidden = true
    }
    
    @objc func counter()
    {
        seconds -= 1
        label.text = String(seconds) + " Seconds"
        
        if (seconds == 0)
        {
            timer.invalidate()
            controllerNetworkManager.getData()
//            audioPlayer.play()
        }
    }
    
    @IBOutlet weak var stopOutlet: UIButton!
    @IBAction func stop(_ sender: AnyObject)
    {
        timer.invalidate()
        seconds = 30
        sliderOutlet.setValue(30, animated: true)
        label.text = "30 Seconds"
        
//        audioPlayer.stop()
        
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
    }
    
    @IBAction func pause(_ sender: Any) {
        
        timer.invalidate()
    }
    
    override func viewDidLoad()
    {
        
        startOutlet.layer.borderColor = UIColor.white.cgColor
        startOutlet.layer.borderWidth = 1.0
        startOutlet.layer.cornerRadius = 5.0
        
        stopOutlet.layer.borderColor = UIColor.white.cgColor
        stopOutlet.layer.borderWidth = 1.0
        stopOutlet.layer.cornerRadius = 5.0
        
//        backOutlet.layer.borderColor = UIColor.white.cgColor
//        backOutlet.layer.borderWidth = 1.0
//        backOutlet.layer.cornerRadius = 5.0
        
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 5.0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var backOutlet: UIButton!
    
    
}
