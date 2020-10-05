import UIKit
import PlaygroundSupport
import AVFoundation

public class StoryIntro: UIView {
    
    var backgroundImage = UIImageView()
    var monkey = UIImageView()
    var otherMonkey = UIImageView()
    var conversationLabel = UILabel()
    var conversationImage = UIImageView()
    var countConversation = 0
    var countNews = 0
    var nextButton = UIButton(type: .custom)
    var backButton = UIButton(type: .custom)
    var continueButton = UIButton()
    var new1 = UIImageView()
    var new2 = UIImageView()
    var new3 = UIImageView()
    var new4 = UIImageView()
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        showScreen()
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("NOT working the Public Init Coder")
    }
    
    func showScreen() {
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        self.backgroundColor = .white
        
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 768, height: 520)
        backgroundImage.image = UIImage(named: "backgrounds/background2.jpg")
        self.addSubview(backgroundImage)
        
        monkey.frame = CGRect(x: 800, y: 0, width: 170, height: 350)
        monkey.image = UIImage(named: "EraseGame/flyMonkey.png")
        self.addSubview(monkey)
        
        Timer.scheduledTimer(timeInterval: 3.00, target: self, selector: #selector(nextConversation), userInfo: nil, repeats: false)
        
        UIView.animate(withDuration: 3){
            self.monkey.frame.origin.x = 470
        }
    }
    
    @objc func nextConversation(){
        switch countConversation {
        case 0:
            conversationImage.frame = CGRect(x: 150, y: 100, width: 300, height: 130)
            conversationImage.image = UIImage(named: "conversations/twelves.png")
            self.addSubview(conversationImage)
            countConversation += 1
            showNextButton()
        case 1:
            conversationImage.removeFromSuperview()
            conversationImage.image = UIImage(named: "conversations/conversation2.png")
            self.addSubview(conversationImage)
            
            countConversation += 1
            showBackButton()
        case 2:
            conversationImage.removeFromSuperview()
            conversationImage.image = UIImage(named: "conversations/conversation3.png")
            self.addSubview(conversationImage)
            countConversation += 1
        case 3:
            conversationImage.removeFromSuperview()
            nextButton.removeFromSuperview()
            backButton.removeFromSuperview()
            monkey.removeFromSuperview()
            Timer.scheduledTimer(timeInterval: 0.50, target: self, selector: #selector(showNews), userInfo: nil, repeats: false)
            Timer.scheduledTimer(timeInterval: 2.00, target: self, selector: #selector(showNews), userInfo: nil, repeats: false)
            Timer.scheduledTimer(timeInterval: 3.50, target: self, selector: #selector(showNews), userInfo: nil, repeats: false)
            Timer.scheduledTimer(timeInterval: 5.00, target: self, selector: #selector(showNews), userInfo: nil, repeats: false)
            Timer.scheduledTimer(timeInterval: 6.00, target: self, selector: #selector(showNextButton), userInfo: nil, repeats: false)
            countConversation += 1
        case 4:
            new1.removeFromSuperview()
            new2.removeFromSuperview()
            new3.removeFromSuperview()
            new4.removeFromSuperview()
            otherMonkey.frame = CGRect(x: 300, y: 250, width: 170, height: 200)
            otherMonkey.image = UIImage(named: "EraseGame/sadMonkey.png")
            self.addSubview(otherMonkey)
            conversationImage.image = UIImage(named: "conversations/conversation4.png")
            conversationImage.frame = CGRect(x: 150, y: 150, width: 300, height: 80)
            self.addSubview(conversationImage)
            nextButton.removeFromSuperview()
            showContinueButton()
            countConversation += 1
        default:
            nextScreen()
        }
    }
    
    @objc func showNews(){
        switch countNews {
        case 0:
            new1.image = UIImage(named: "conversations/amazon.jpg")
            new1.frame = CGRect(x: 10, y: 10, width: 200, height: 400)
            self.addSubview(new1)
            countNews += 1
        case 1:
            new2.image = UIImage(named: "conversations/BrumadinhoNY.jpeg")
            new2.frame = CGRect(x: 470, y: 50, width: 300, height: 300)
            self.addSubview(new2)
            countNews += 1
        case 2:
            new3.image = UIImage(named: "conversations/Mariana.png")
            new3.frame = CGRect(x: 200, y: 300, width: 300, height: 200)
            self.addSubview(new3)
            countNews += 1
        case 3:
            new4.image = UIImage(named: "conversations/amazon2.jpg")
            new4.frame = CGRect(x: 250, y: 0, width: 200, height: 300)
            self.addSubview(new4)
            countNews += 1
        default:
            new1.removeFromSuperview()
            new2.removeFromSuperview()
            new3.removeFromSuperview()
        }
    }
    
    @objc func showContinueButton(){
        
        let startImage = UIImage(named: "buttons/yesButton.png")
        continueButton.frame = CGRect(x: 500, y: 430, width: 250, height: 60)
        continueButton.setImage(startImage, for: .normal)
        continueButton.imageView?.contentMode = .scaleAspectFit
        self.addSubview(continueButton)
        
        continueButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
    }
    
    @objc func touchBack(){
        if countConversation > 2 {
            countConversation -= 2
            nextConversation()
        } else {
            countConversation -= 2
            nextConversation()
            backButton.removeFromSuperview()
        }
    }
    
    @objc func showNextButton() {
        let startImage = UIImage(named: "buttons/nextbutton.png")
        nextButton.frame = CGRect(x: 550, y: 430, width: 150, height: 50)
        nextButton.setImage(startImage, for: .normal)
        nextButton.imageView?.contentMode = .scaleAspectFit
        self.addSubview(nextButton)
        
        nextButton.addTarget(self, action: #selector(nextConversation), for: .touchUpInside)
    }
    
    @objc func showBackButton() {
        let startImage = UIImage(named: "buttons/backButton.png")
        backButton.frame = CGRect(x: 50, y: 430, width: 150, height: 50)
        backButton.setImage(startImage, for: .normal)
        backButton.imageView?.contentMode = .scaleAspectFit
        self.addSubview(backButton)
        
        backButton.addTarget(self, action: #selector(touchBack), for: .touchUpInside)
    }
    
    @objc func nextScreen() {
        self.removeFromSuperview()
        
        let goNext = DragGame(scene: self)
        PlaygroundPage.current.liveView = goNext
    }
}

