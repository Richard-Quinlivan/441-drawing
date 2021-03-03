//
//  ViewController.swift
//  drawing
//
//  Created by Richard Quinlivan on 3/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawShape : DrawShape!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.default)
    }

    @objc func update(){
        print("update")
        drawShape.update()
    }
}

