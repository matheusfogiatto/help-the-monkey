import UIKit
import PlaygroundSupport
import AVFoundation

public class StartIntro: UIView {
    
    
    var backgroundImage = UIImageView()
    var logo = UIImageView()
    let welcomeLabel = UILabel()
    let continueButton = UIButton()
    static var audioPlayer: AVAudioPlayer?
    
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        showScreen()
        
        continueButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("NOT working the Public Init Coder")
    }
    
    func showScreen() {
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 768, height: 520)
        backgroundImage.image = UIImage(named: "backgrounds/background2.jpg")
        self.addSubview(backgroundImage)
        
        logo.frame = CGRect(x: 200, y: 100, width: 333, height: 232)
        logo.image = UIImage(named: "StartIntro/newLogo.png")
        self.addSubview(logo)
        
        let startImage = UIImage(named: "buttons/continueButton.png")
        continueButton.frame = CGRect(x: 260, y: 380, width: 250, height: 60)
        continueButton.setImage(startImage, for: .normal)
        continueButton.imageView?.contentMode = .scaleAspectFit
        self.addSubview(continueButton)
        
        do {
            if let fileURL = Bundle.main.path(forResource: "music/More-Monkey-Island-Band_Looping", ofType: "mp3") {
                let audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
                
                audioPlayer.numberOfLoops = -1
                audioPlayer.play()
                
                StartIntro.audioPlayer = audioPlayer
                

            } else {
                print("No file with specified name exists")
            }
        } catch let error {
            print("Can't play the audio file failed with an error \(error.localizedDescription)")
        }
        
        
    }
    
    @objc func nextScreen() {
        self.removeFromSuperview()
        
        let goNext = StoryIntro(scene: self)
        PlaygroundPage.current.liveView = goNext
    }
}
