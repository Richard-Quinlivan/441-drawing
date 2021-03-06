//
//  DrawShape.swift
//  drawing
//
//  Created by Richard Quinlivan on 3/1/21.
//

import UIKit

class DrawShape: UIView {
    
    @IBOutlet var gameOverLabel:UILabel!
    @IBOutlet var timeLastedLabel:UILabel!
    @IBOutlet var YouLastedLabel:UILabel!
    @IBOutlet var time:UILabel!
    @IBOutlet var playAgainButton:UIButton!
    
    
    let leftEdge:Int = 0
    let rightEdge:Int = Int(UIScreen.main.bounds.size.width)
    let topEdge:Int = 0
    let bottomEdge:Int = Int(UIScreen.main.bounds.size.height)

    var drawX:Double = 0
    var drawY:Double = 0
    
    var gotoX:Double = 0
    var gotoY:Double = 0
    
    var dx:Double = 2
    var dy:Double = 2
    
    var speed:Double = 5
    var lastTouch:CGPoint = CGPoint(x:-50, y:-50)
    var playingGame:Bool = true
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let color:UIColor = UIColor.blue
        let drect = CGRect(x:drawX, y:drawY, width:40, height:40)
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
        bpath.fill()
    }

    
    @objc func update(){
        if(playingGame){
            if(drawX > gotoX){
                drawX += -dx
            }
            else if (drawX < gotoX){
                drawX += dx
            }
            if(drawY > gotoY){
                drawY += -dy
            }
            
            else if(drawY < gotoY){
                drawY += dy
            }
            
            if(abs(Double(lastTouch.x) - drawX + Double(lastTouch.y) - drawY) <= 1){
                gameOver()
            }
            print(lastTouch)
            setNeedsDisplay()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            let point = t.location(in: self)
            
            gotoX = Double(point.x)
            gotoY = Double(point.y)
            
            let width = drawX - gotoX
            let length = drawY - gotoY

            let hypotenuse:Double = (length * length + width * width).squareRoot()
            dx = abs(drawX - gotoX)/(hypotenuse / speed)
            dy = abs(drawY - gotoY)/(hypotenuse / speed)
            
            lastTouch = point
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            let point = t.location(in: self)
            
            gotoX = Double(point.x)
            gotoY = Double(point.y)
            
            let width = drawX - gotoX
            let length = drawY - gotoY

            let hypotenuse:Double = (length * length + width * width).squareRoot()
            dx = abs(drawX - gotoX)/(hypotenuse / speed)
            dy = abs(drawY - gotoY)/(hypotenuse / speed)
            
            lastTouch = point
        }
    }
    
    func gameOver(){
        playingGame = false
        gameOverLabel.isHidden = false
        timeLastedLabel.isHidden = false
        YouLastedLabel.isHidden = false
        playAgainButton.isHidden = false
        timeLastedLabel.text = time.text! + " seconds!"
    }
    
    func restartGame(){
        playingGame = true
        gameOverLabel.isHidden = true
        timeLastedLabel.isHidden = true
        YouLastedLabel.isHidden = true
        playAgainButton.isHidden = true
        time.text = "0"
        lastTouch = CGPoint(x:-50, y:-50)
    }
}
