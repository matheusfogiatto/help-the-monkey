import UIKit
import PlaygroundSupport
import AVFoundation

public class EraseGame : UIView {
    
    let backgroundImage = UIImageView()
    
    // Clean City imageviews
    let cleanCity1 = UIImageView()
    let cleanCity2 = UIImageView()
    let cleanCity3 = UIImageView()
    let cleanCity4 = UIImageView()
    let cleanCity5 = UIImageView()
    let cleanCity6 = UIImageView()
    let cleanCity7 = UIImageView()
    let cleanCity8 = UIImageView()
    let cleanCity9 = UIImageView()
    let cleanCity10 = UIImageView()
    
    //Polluted City UIButtons
    let pollutedCity1 = UIButton(type: .custom)
    let pollutedCity2 = UIButton(type: .custom)
    let pollutedCity3 = UIButton(type: .custom)
    let pollutedCity4 = UIButton(type: .custom)
    let pollutedCity5 = UIButton(type: .custom)
    let pollutedCity6 = UIButton(type: .custom)
    let pollutedCity7 = UIButton(type: .custom)
    let pollutedCity8 = UIButton(type: .custom)
    let pollutedCity9 = UIButton(type: .custom)
    let pollutedCity10 = UIButton(type: .custom)
    
    //Others
    let instruction = UIButton(type: .custom)
    var count = 0
    let bird = UIImageView()
    let bird2 = UIImageView()
    let bird3 = UIImageView()
    let bird4 = UIImageView()
    let bird5 = UIImageView()
    let conversation = UIImageView()
    let tree = UIImageView()
    let ecocar = UIImageView()
    let monkey = UIImageView()
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 390, width: 1000, height: 520))
        
        setupView()
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("NOT working the Public Init Coder")
    }
    
    func setupView(){
        self.frame = CGRect(x: 0, y: 0, width: 1000, height: 520)
        
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 768, height: 520)
        backgroundImage.backgroundColor = .white
        self.addSubview(backgroundImage)
        
        cleanCity1.frame = CGRect(x: 0, y: 0, width: 153, height: 260)
        cleanCity1.image = UIImage(named: "EraseGame/cleanCity copy.jpg")
        self.addSubview(cleanCity1)
        
        cleanCity2.frame = CGRect(x: 153, y: 0, width: 153, height: 260)
        cleanCity2.image = UIImage(named: "EraseGame/cleanCity copy 2.jpg")
        self.addSubview(cleanCity2)

        cleanCity3.frame = CGRect(x: 306, y: 0, width: 153, height: 260)
        cleanCity3.image = UIImage(named: "EraseGame/cleanCity copy 3.jpg")
        self.addSubview(cleanCity3)

        cleanCity4.frame = CGRect(x: 458, y: 0, width: 153, height: 260)
        cleanCity4.image = UIImage(named: "EraseGame/cleanCity copy 4.jpg")
        self.addSubview(cleanCity4)

        cleanCity5.frame = CGRect(x: 611, y: 0, width: 157, height: 260)
        cleanCity5.image = UIImage(named: "EraseGame/cleanCity copy 5.jpg")
        self.addSubview(cleanCity5)
        
        cleanCity6.frame = CGRect(x: 0, y: 260, width: 153, height: 260)
        cleanCity6.image = UIImage(named: "EraseGame/cleanCity copy 6.jpg")
        self.addSubview(cleanCity6)
        
        cleanCity7.frame = CGRect(x: 153, y: 260, width: 153, height: 260)
        cleanCity7.image = UIImage(named: "EraseGame/cleanCity copy 7.jpg")
        self.addSubview(cleanCity7)
        
        cleanCity8.frame = CGRect(x: 306, y: 260, width: 153, height: 260)
        cleanCity8.image = UIImage(named: "EraseGame/cleanCity copy 8.jpg")
        self.addSubview(cleanCity8)
        
        cleanCity9.frame = CGRect(x: 458, y: 260, width: 153, height: 260)
        cleanCity9.image = UIImage(named: "EraseGame/cleanCity copy 9 test.jpg")
        self.addSubview(cleanCity9)
        
        cleanCity10.frame = CGRect(x: 611, y: 260, width: 157, height: 260)
        cleanCity10.image = UIImage(named: "EraseGame/cleanCity copy 10 test.jpg")
        self.addSubview(cleanCity10)
        
        let startImage1 = UIImage(named: "EraseGame/pollutedCity copy.jpg")
        pollutedCity1.frame = CGRect(x: 0, y: 0, width: 153, height: 260)
        pollutedCity1.setImage(startImage1, for: .normal)
        pollutedCity1.imageView?.contentMode = .scaleToFill
        pollutedCity1.adjustsImageWhenHighlighted = false
        self.addSubview(pollutedCity1)
        pollutedCity1.addTarget(self, action: #selector(eraseImage(sender:)), for: .touchUpInside)
        
        let startImage2 = UIImage(named: "EraseGame/pollutedCity copy 2.jpg")
        pollutedCity2.frame = CGRect(x: 153, y: 0, width: 153, height: 260)
        pollutedCity2.setImage(startImage2, for: .normal)
        pollutedCity2.imageView?.contentMode = .scaleToFill
        pollutedCity2.adjustsImageWhenHighlighted = false
        self.addSubview(pollutedCity2)
        pollutedCity2.addTarget(self, action: #selector(eraseImage(sender:)), for: .touchUpInside)
        
        let startImage3 = UIImage(named: "EraseGame/pollutedCity copy 3.jpg")
        pollutedCity3.frame = CGRect(x: 306, y: 0, width: 153, height: 260)
        pollutedCity3.setImage(startImage3, for: .normal)
        pollutedCity3.imageView?.contentMode = .scaleToFill
        pollutedCity3.adjustsImageWhenHighlighted = false
        self.addSubview(pollutedCity3)
        pollutedCity3.addTarget(self, action: #selector(eraseImage(sender:)), for: .touchUpInside)
        
        let startImage4 = UIImage(named: "EraseGame/pollutedCity copy 4.jpg")
        pollutedCity4.frame = CGRect(x: 458, y: 0, width: 153, height: 260)
        pollutedCity4.setImage(startImage4, for: .normal)
        pollutedCity4.imageView?.contentMode = .scaleToFill
        pollutedCity4.adjustsImageWhenHighlighted = false
        self.addSubview(pollutedCity4)
        pollutedCity4.addTarget(self, action: #selector(eraseImage(sender:)), for: .touchUpInside)
        
        let startImage5 = UIImage(named: "EraseGame/pollutedCity copy 5.jpg")
        pollutedCity5.frame = CGRect(x: 611, y: 0, width: 158, height: 260)
        pollutedCity5.setImage(startImage5, for: .normal)
        pollutedCity5.imageView?.contentMode = .scaleToFill
        pollutedCity5.adjustsImageWhenHighlighted = false
        self.addSubview(pollutedCity5)
        pollutedCity5.addTarget(self, action: #selector(eraseImage(sender:)), for: .touchUpInside)
        
        let startImage6 = UIImage(named: "EraseGame/pollutedCity copy 6.jpg")
        pollutedCity6.frame = CGRect(x: 0, y: 260, width: 153, height: 260)
        pollutedCity6.setImage(startImage6, for: .normal)
        pollutedCity6.imageView?.contentMode = .scaleToFill
        pollutedCity6.adjustsImageWhenHighlighted = false
        self.addSubview(pollutedCity6)
        pollutedCity6.addTarget(self, action: #selector(eraseImage(sender:)), for: .touchUpInside)
        
        let startImage7 = UIImage(named: "EraseGame/pollutedCity copy 7.jpg")
        pollutedCity7.frame = CGRect(x: 153, y: 260, width: 153, height: 260)
        pollutedCity7.setImage(startImage7, for: .normal)
        pollutedCity7.imageView?.contentMode = .scaleToFill
        pollutedCity7.adjustsImageWhenHighlighted = false
        self.addSubview(pollutedCity7)
        pollutedCity7.addTarget(self, action: #selector(eraseImage(sender:)), for: .touchUpInside)
        
        let startImage8 = UIImage(named: "EraseGame/pollutedCity copy 8.jpg")
        pollutedCity8.frame = CGRect(x: 306, y: 260, width: 153, height: 260)
        pollutedCity8.setImage(startImage8, for: .normal)
        pollutedCity8.imageView?.contentMode = .scaleToFill
        pollutedCity8.adjustsImageWhenHighlighted = false
        self.addSubview(pollutedCity8)
        pollutedCity8.addTarget(self, action: #selector(eraseImage(sender:)), for: .touchUpInside)
        
        let startImage9 = UIImage(named: "EraseGame/pollutedCity copy 9.jpg")
        pollutedCity9.frame = CGRect(x: 458, y: 260, width: 153, height: 260)
        pollutedCity9.setImage(startImage9, for: .normal)
        pollutedCity9.imageView?.contentMode = .scaleToFill
        pollutedCity9.adjustsImageWhenHighlighted = false
        self.addSubview(pollutedCity9)
        pollutedCity9.addTarget(self, action: #selector(eraseImage(sender:)), for: .touchUpInside)
        
        let startImage10 = UIImage(named: "EraseGame/pollutedCity copy 10.jpg")
        pollutedCity10.frame = CGRect(x: 611, y: 260, width: 158, height: 260)
        pollutedCity10.setImage(startImage10, for: .normal)
        pollutedCity10.imageView?.contentMode = .scaleToFill
        pollutedCity10.adjustsImageWhenHighlighted = false
        self.addSubview(pollutedCity10)
        pollutedCity10.addTarget(self, action: #selector(eraseImage(sender:)), for: .touchUpInside)
        
        let startImageInstruction = UIImage(named: "conversations/instruc.png")
        instruction.frame = CGRect(x: 0, y: 0, width: 768, height: 520)
        instruction.setImage(startImageInstruction, for: .normal)
        instruction.imageView?.contentMode = .scaleAspectFill
        instruction.adjustsImageWhenHighlighted = false
        self.addSubview(instruction)
        instruction.addTarget(self, action: #selector(hideInstruction), for: .touchUpInside)
    }
    
    @objc func playBirds(go: Double, back: Double){
        bird.frame = CGRect(x: go, y: 5, width: 32.4, height: 18)
        self.addSubview(bird)
        animateBird(bird: bird)
        UIView.animateKeyframes(withDuration: 15, delay: 0, options: .autoreverse, animations: {
            self.bird.frame.origin.x = CGFloat(back)
        }, completion: { _ in
            self.playagain()
        })
        
        bird2.frame = CGRect(x: go, y: 80, width: 32.4, height: 18)
        self.addSubview(bird2)
        animateBird(bird: bird2)
        UIView.animateKeyframes(withDuration: 13, delay: 0, options: .autoreverse, animations: {
            self.bird2.frame.origin.x = CGFloat(back)
        }, completion: nil)
        
        bird3.frame = CGRect(x: go, y: 130, width: 32.4, height: 18)
        self.addSubview(bird3)
        animateBird(bird: bird3)
        UIView.animateKeyframes(withDuration: 12, delay: 0, options: .autoreverse, animations: {
            self.bird3.frame.origin.x = CGFloat(back)
        }, completion: nil)
        
        bird4.frame = CGRect(x: back, y: 180, width: 32.4, height: 18)
        self.addSubview(bird4)
        animateBird(bird: bird4)
        UIView.animateKeyframes(withDuration: 11, delay: 0, options: .autoreverse, animations: {
            self.bird4.frame.origin.x = CGFloat(go)
        }, completion: nil)
        
        bird5.frame = CGRect(x: back, y: 40, width: 32.4, height: 18)
        self.addSubview(bird5)
        animateBird(bird: bird5)
        UIView.animateKeyframes(withDuration: 14, delay: 0, options: .autoreverse, animations: {
            self.bird5.frame.origin.x = CGFloat(go)
        }, completion: nil)
    }
    
    func playagain(){
        playBirds(go: -50, back: 800)
    }
    
    @objc func animateBird(bird: UIImageView){
        let image1 = UIImage(named: "EraseGame/firstBird.png")!
        let image2 = UIImage(named: "EraseGame/secondBird.png")!
        
        bird.animationImages = [image1, image2]
        bird.animationDuration = 0.6
        bird.animationRepeatCount = Int.max
        bird.startAnimating()
    }
    
    @objc func hideInstruction(){
        instruction.removeFromSuperview()
    }
    
    @objc func eraseImage(sender: UIButton) {
        sender.removeFromSuperview()
        count += 1
        if count == 10 {
            conversation.frame = CGRect(x: 100, y: 100, width: 560, height: 80)
            conversation.image = UIImage(named: "conversations/finalConversation.png")
            self.addSubview(conversation)
            
            playBirds(go: -50, back: 800)
            
            ecocar.frame = CGRect(x: 800, y: 365, width: 90, height: 83)
            ecocar.image = UIImage(named: "EraseGame/ecocar.png")
            self.addSubview(ecocar)
            
            animate(ecocar: ecocar)
            
            tree.frame = CGRect(x: 178, y: 300, width: 100, height: 210)
            tree.image = UIImage(named: "EraseGame/arvore.png")
            self.addSubview(tree)
            
            monkey.frame = CGRect(x: 450, y: 380, width: 100, height: 130)
            self.addSubview(monkey)
            let image1 = UIImage(named: "EraseGame/finalMonkey1.png")!
            let image2 = UIImage(named: "EraseGame/finalMonkey2.png")!
            
            monkey.animationImages = [image1, image2]
            monkey.animationDuration = 1
            monkey.animationRepeatCount = Int.max
            monkey.startAnimating()
        }
    }
    
    func animate(ecocar: UIImageView) {
        var aux = 0
        UIView.animate(withDuration: 9, animations: {
            ecocar.frame.origin.x = -120
        }) { _ in
            ecocar.transform = CGAffineTransform.init(scaleX: -1, y: 1)
            aux += 1
            UIView.animate(withDuration: 9, animations: {
                ecocar.frame.origin.x = 800
            }) { _ in
                ecocar.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.animate(ecocar: ecocar)
            }
        }
    }
}
