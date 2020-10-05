import UIKit
import PlaygroundSupport
import AVFoundation

public class DragGame: UIView {
    
    var scoreLabel = UILabel()
    var scoreNumber = 0
    
    // Glass, Paper and Plastic
    var backgroundImage = UIImageView()
    var helpGame = UIImageView()
    var glassTrash = UIImageView() //Green
    var paperTrash = UIImageView() //Yellow
    var metalTrash = UIImageView() // Red
    var plasticTrash = UIImageView() //Blue
    
    // Trashs
    var paper: UIImageView? = UIImageView()
    var paper2: UIImageView? = UIImageView()
    var metal: UIImageView? = UIImageView()
    var metal2: UIImageView? = UIImageView()
    var glass: UIImageView? = UIImageView()
    var plastic: UIImageView? = UIImageView()
    
    var yeah = UIImageView()
    var no = UIImageView()
    var continueButton = UIButton()
    var congrats = UIImageView()
    var instruction = UIButton(type: .custom)
    
    
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
        backgroundImage.image = UIImage(named: "backgrounds/cidade2.jpg")
        self.addSubview(backgroundImage)
        
        helpGame.frame = CGRect(x: 10, y: 10, width: 550, height: 40)
        helpGame.image = UIImage(named: "Draggame/helpGame2.png")
        self.addSubview(helpGame)
        
        scoreLabel.text = "\(scoreNumber) / 6"
        scoreLabel.textColor = .black
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 30)
        scoreLabel.textAlignment = .center
        scoreLabel.frame = CGRect(x: 650, y: 10, width: 100, height: 50)
        self.addSubview(scoreLabel)
        
        glassTrash.frame = CGRect(x: 5, y: 400, width: 80, height: 120)
        glassTrash.image = UIImage(named: "Draggame/glassContainer.png")
        self.addSubview(glassTrash)
        
        paperTrash.frame = CGRect(x: 95, y: 400, width: 80, height: 120)
        paperTrash.image = UIImage(named: "Draggame/PaperContainer.png")
        self.addSubview(paperTrash)
        
        metalTrash.frame = CGRect(x: 595, y: 400, width: 80, height: 120)
        metalTrash.image = UIImage(named: "Draggame/metalContainer.png")
        self.addSubview(metalTrash)
        
        plasticTrash.frame = CGRect(x: 685, y: 400, width: 80, height: 120)
        plasticTrash.image = UIImage(named: "Draggame/plasticContainer.png")
        self.addSubview(plasticTrash)
        
        
        paper?.frame = CGRect(x: 200, y: 310, width: 50, height: 50)
        paper?.image = UIImage(named: "Draggame/paper.png")
        paper?.isUserInteractionEnabled = true
        if let paper = paper {
            self.addSubview(paper)
        }
        
        paper2?.frame = CGRect(x: 350, y: 360, width: 50, height: 50)
        paper2?.image = UIImage(named: "Draggame/paper.png")
        paper2?.isUserInteractionEnabled = true
        if let paper2 = paper2 {
            self.addSubview(paper2)
        }
        
        
        metal2?.frame = CGRect(x: 270, y: 450, width: 50, height: 30)
        metal2?.image = UIImage(named: "Draggame/metal.png")
        metal2?.isUserInteractionEnabled = true
        if let metal2 = metal2 {
            self.addSubview(metal2)
        }
        
        
        plastic?.frame = CGRect(x: 400, y: 480, width: 50, height: 30)
        plastic?.image = UIImage(named: "Draggame/plastic.png")
        plastic?.isUserInteractionEnabled = true
        if let plastic = plastic {
            self.addSubview(plastic)
        }
        
        
        metal?.frame = CGRect(x: 480, y: 400, width: 50, height: 30)
        metal?.image = UIImage(named: "Draggame/metal.png")
        metal?.isUserInteractionEnabled = true
        if let metal = metal {
            self.addSubview(metal)
        }
        
        
        glass?.frame = CGRect(x: 240, y: 400, width: 50, height: 25)
        glass?.image = UIImage(named: "Draggame/glass.png")
        glass?.isUserInteractionEnabled = true
        if let glass = glass {
            self.addSubview(glass)
        }
        
        yeah.image = UIImage(named: "Draggame/yeah.png")
        no.image = UIImage(named: "Draggame/Noo.png")
        congrats.image = UIImage(named: "conversations/congrats.png")
        congrats.frame = CGRect(x: 170, y: 100, width: 400, height: 80)
        no.frame = CGRect(x: 170, y: 100, width: 400, height: 80)
        
        let startImageInstruction = UIImage(named: "Draggame/instruction.png")
        instruction.frame = CGRect(x: 0, y: 0, width: 768, height: 520)
        instruction.setImage(startImageInstruction, for: .normal)
        instruction.imageView?.contentMode = .scaleAspectFill
        instruction.adjustsImageWhenHighlighted = false
        self.addSubview(instruction)
        instruction.addTarget(self, action: #selector(hideInstruction), for: .touchUpInside)
    }
    
    @objc func hideInstruction(){
        instruction.removeFromSuperview()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if let paper = paper,  paper.frame.contains(location) {
                paper.center = location
            } else if let metal = metal,  metal.frame.contains(location) {
                metal.center = location
            } else if let glass = glass,  glass.frame.contains(location) {
                glass.center = location
            } else if let plastic = plastic, plastic.frame.contains(location) {
                plastic.center = location
            } else if let paper2 = paper2, paper2.frame.contains(location) {
                paper2.center = location
            } else if let metal2 = metal2, metal2.frame.contains(location) {
                metal2.center = location
            }
        }
    }
    
    @objc func checkingForMatch() -> Int {
        
        var aux = 0
        
        if let paper = paper, paper.frame.intersects(paperTrash.frame) {
            paper.removeFromSuperview()
            paper.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            self.paper = nil
            scoreNumber += 1
            scoreLabel.removeFromSuperview()
            scoreLabel.text = "\(scoreNumber) / 6"
            self.addSubview(scoreLabel)
            
            aux = 1
        } else {
            paper?.frame = CGRect(x: 200, y: 310, width: 50, height: 50)
        }
        
        if let metal = metal, metal.frame.intersects(metalTrash.frame) {
            metal.removeFromSuperview()
            metal.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            self.metal = nil
            scoreNumber += 1
            scoreLabel.removeFromSuperview()
            scoreLabel.text = "\(scoreNumber) / 6"
            self.addSubview(scoreLabel)
            
            aux = 1
        } else {
            metal?.frame = CGRect(x: 480, y: 400, width: 50, height: 30)
        }
        
        if let glass = glass, glass.frame.intersects(glassTrash.frame) {
            glass.removeFromSuperview()
            glass.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            self.glass = nil
            scoreNumber += 1
            scoreLabel.removeFromSuperview()
            scoreLabel.text = "\(scoreNumber) / 6"
            self.addSubview(scoreLabel)
            
            aux = 1
        } else {
            glass?.frame = CGRect(x: 240, y: 400, width: 50, height: 25)
        }
        
        if let plastic = plastic, plastic.frame.intersects(plasticTrash.frame) {
            plastic.removeFromSuperview()
            plastic.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            self.plastic = nil
            scoreNumber += 1
            scoreLabel.removeFromSuperview()
            scoreLabel.text = "\(scoreNumber) / 6"
            self.addSubview(scoreLabel)
            
            aux = 1
        } else {
            plastic?.frame = CGRect(x: 400, y: 480, width: 50, height: 30)
        }
        
        if let paper2 = paper2, paper2.frame.intersects(paperTrash.frame) {
            paper2.removeFromSuperview()
            paper2.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            self.paper2 = nil
            scoreNumber += 1
            scoreLabel.removeFromSuperview()
            scoreLabel.text = "\(scoreNumber) / 6"
            self.addSubview(scoreLabel)
            
            aux = 1
        } else {
            paper2?.frame = CGRect(x: 350, y: 360, width: 50, height: 50)
        }
        
        if let metal2 = metal2, metal2.frame.intersects(metalTrash.frame) {
            metal2.removeFromSuperview()
            metal2.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            self.metal2 = nil
            scoreNumber += 1
            scoreLabel.removeFromSuperview()
            scoreLabel.text = "\(scoreNumber) / 6"
            self.addSubview(scoreLabel)
            
            aux = 1
        } else {
            metal2?.frame = CGRect(x: 270, y: 450, width: 50, height: 30)
        }
        
        if scoreNumber == 6 {
            let startImage = UIImage(named: "buttons/continueButton.png")
            continueButton.frame = CGRect(x: 280, y: 250, width: 192, height: 80)
            continueButton.setImage(startImage, for: .normal)
            continueButton.imageView?.contentMode = .scaleAspectFit
            self.addSubview(continueButton)
            
            self.addSubview(congrats)
            
            UIView.animate(withDuration: 0.8, delay: 0, options: [.repeat,.autoreverse], animations: {
                self.congrats.alpha = 0.0
            }, completion: nil)

            
            continueButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        }
        
        return aux
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if let paper = paper, paper.frame.contains(location) {
                paper.center = location
            } else if let metal = metal, metal.frame.contains(location) {
                metal.center = location
            } else if let glass = glass, glass.frame.contains(location) {
                glass.center = location
            } else if let plastic = plastic, plastic.frame.contains(location) {
                plastic.center = location
            } else if let paper2 = paper2, paper2.frame.contains(location) {
                paper2.center = location
            } else if let metal2 = metal2, metal2.frame.contains(location) {
                metal2.center = location
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let aux = checkingForMatch()
        
        if aux == 1 {
            for touch in touches {
                let location = touch.location(in: self)
                yeah.frame = CGRect(x: Double(location.x)-60, y: Double(location.y)-60, width: 87, height: 58)
                self.addSubview(yeah)
                Timer.scheduledTimer(timeInterval: 1.00, target: self, selector: #selector(hideYeah), userInfo: nil, repeats: false)
            }
        }else if scoreNumber != 6 {
            for touch in touches {
                let location = touch.location(in: self)
                no.frame = CGRect(x: Double(location.x)-60, y: Double(location.y)-60, width: 87, height: 58)
                self.addSubview(no)
                Timer.scheduledTimer(timeInterval: 1.00, target: self, selector: #selector(hideNo), userInfo: nil, repeats: false)
            }
        }
    }
    
    @objc func hideYeah() {
        yeah.removeFromSuperview()
    }
    
    @objc func hideNo() {
        no.removeFromSuperview()
    }
    
    @objc func nextScreen() {
        self.removeFromSuperview()
        
        let goNext = SecondStory(scene: self)
        PlaygroundPage.current.liveView = goNext
    }
}


