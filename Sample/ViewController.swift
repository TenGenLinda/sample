//
//  ViewController.swift
//  Sample
//
//  Created by Yuriy Scherbanovskiy on 07.07.2023.
//

import Cocoa

class ViewController: NSViewController, NSTextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textDidChange(_ notification: Notification) {
        if let document = self.view.window?.windowController?.document as? Document
        {
            document.updateText(self.representedObject as! String)
        }
    }
}

