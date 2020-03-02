//
//  ViewController.swift
//  AES256Test
//
//  Created by Jeonggyu Park on 02/03/2020.
//  Copyright © 2020 Jeonggyu Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
let plainText: String = "암호화될 평문입니다."
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
      
            let encryptedText = AES256Manager.encrypt(string: plainText)
            print("encrypted text: " + encryptedText)
            
           
            print("decrypted text: " + AES256Manager.decrypt(encoded: encryptedText))
     
        
    }


}

