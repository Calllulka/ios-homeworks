//
//  InfoViewController.swift
//  TestOne
//
//  Created by Alexander on 15.02.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    var button = CustomButton(title: "press ME", color: .systemBlue, titleColor: .black)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(button)
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        button.action = {
            self.addUIAlert()
        }
    }
    
    @objc func addUIAlert(){
        let alert = UIAlertController(title: "This is Alert", message: "You bwstTester", preferredStyle: .alert)
        let actionOne = UIAlertAction(title: "Hello", style: .default) {_ in
            print("Hello")
        }
        let actionTwo = UIAlertAction(title: "Goodbye", style: .default) {_ in
            print("Goodbye")
        }
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        
        present(alert, animated: true, completion: nil)
    }
}

