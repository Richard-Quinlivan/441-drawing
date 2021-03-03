//
//  DrawShape.swift
//  drawing
//
//  Created by Richard Quinlivan on 3/1/21.
//

import UIKit

class DrawShape: UIView {
    
    var leftEdge:Int = 0
    var rightEdge:Int = Int(UIScreen.main.bounds.size.width)
    var topEdge:Int = 0
    var bottomEdge:Int = Int(UIScreen.main.bounds.size.height)

    var drawX = 0
    var drawY = 0
    
    var dx = 2
    var dy = 2
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let color:UIColor = UIColor.blue
        let drect = CGRect(x:drawX, y:drawY, width:40, height:60)
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
        UIColor.blue.set()
        UIRectFill(drect)
        print("DrawRect called")
        
    }
    @objc func update(){
        print("DrawShape update")
        drawX += dx
        drawY += dy
        
        if(drawX >= rightEdge || drawX <= leftEdge){
            drawX = -drawX
        }
        if(drawY >= bottomEdge || drawY <= topEdge){
            drawY = -drawY
        }
        
        
        
        setNeedsDisplay()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            let point = t.location(in: self)
            
            drawX = Int(point.x)
            drawY = Int(point.y)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            let point = t.location(in: self)
            
            drawX = Int(point.x)
            drawY = Int(point.y)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            let point = t.location(in: self)
            
            drawX = Int(point.x)
            drawY = Int(point.y)
        }
    }
    

}
