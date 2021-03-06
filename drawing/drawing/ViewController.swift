//
//  ViewController.swift
//  drawing
//
//  Created by Richard Quinlivan on 3/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var time : UILabel!
    
    var numTime = 0

    @IBOutlet weak var drawShape : DrawShape!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.default)
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeTimer), userInfo: nil, repeats: true)
    }

    @objc func update(){
        drawShape.update()
    }
    
    
    @objc func changeTimer() {
        numTime += 1
        
        if(numTime % 5 == 0){
            drawShape.speed += 1
        }
        if(drawShape.playingGame){
            time.text = String(numTime + 1)
        }
    }
    
    @IBAction func restartGame(){
        numTime = 0
        time.text = "0"
        drawShape.restartGame()
    }

}

