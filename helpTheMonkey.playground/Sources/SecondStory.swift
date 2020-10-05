import UIKit
import PlaygroundSupport
import AVFoundation

public class SecondStory: UIView {
    
    var backgroundImage = UIImageView()
    var monkey = UIImageView()
    var nextButton = UIButton(type: .custom)
    var selectiveCollection = UIImageView()
    var conversationImage = UIImageView()
    var countConversation = 0
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        showScreen()
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("NOT working the Public Init Coder")
    }
    
    func showScreen() {
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 768, height: 520)
        backgroundImage.image = UIImage(named: "backgrounds/background2.jpg")
        self.addSubview(backgroundImage)
        
        monkey.frame = CGRect(x: 20, y: 320, width: 170, height: 200)
        monkey.image = UIImage(named: "EraseGame/infoMonkey.png")
        self.addSubview(monkey)
        
        selectiveCollection.frame = CGRect(x: 150, y: 20, width: 600, height: 400)
        selectiveCollection.image = UIImage(named: "conversations/select.png")
        self.addSubview(selectiveCollection)
        
        let startImage = UIImage(named: "buttons/nextbutton.png")
        nextButton.frame = CGRect(x: 550, y: 430, width: 150, height: 50)
        nextButton.setImage(startImage, for: .normal)
        nextButton.imageView?.contentMode = .scaleAspectFit
        self.addSubview(nextButton)
        
        nextButton.addTarget(self, action: #selector(nextConversation), for: .touchUpInside)
    }
    
    @objc func nextConversation(){
        if countConversation == 0 {
            monkey.removeFromSuperview()
            monkey.image = UIImage(named: "EraseGame/sadMonkey.png")
            self.addSubview(monkey)
            selectiveCollection.removeFromSuperview()
            
            conversationImage.frame = CGRect(x: 200, y: 200, width: 300, height: 130)
            conversationImage.image = UIImage(named: "conversations/secondConversation2.png")
            self.addSubview(conversationImage)
            
            nextButton.removeFromSuperview()
            let anotherImage = UIImage(named: "buttons/yesButton.png")
            nextButton.setImage(anotherImage, for: .normal)
            nextButton.imageView?.contentMode = .scaleAspectFit
            self.addSubview(nextButton)
            
            countConversation += 1
        }else {
            nextScreen()
        }
    }
    
    @objc func nextScreen() {
        self.removeFromSuperview()
        
        let goNext = EraseGame(scene: self)
        PlaygroundPage.current.liveView = goNext
    }
}
