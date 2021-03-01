//
//  DrawShape.swift
//  drawing
//
//  Created by Richard Quinlivan on 3/1/21.
//

import UIKit

class DrawShape: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
         print("draw")
        let bounds = self.bounds
        let context = UIGraphicsGetCurrentContext()
        
        self.backgroundColor = UIColor.red
        print("red")
        //CGContext
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        touches.forEach{t.location(in: <#T##UIView?#>) in
//            print("touch at ", )
//        }
//    }
    

}
