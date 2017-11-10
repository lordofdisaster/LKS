//
//  LoginViewController.swift
//  LKS
//
//  Created by Edgar Skobichevskiy on 10/11/2017.
//  Copyright © 2017 Serhii Kyrychenko. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var juryNameTextField: UITextField!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func actionButtonForJury(_ sender: Any) {
    }
    
    @IBAction func actionButtonForAdmin(_ sender: Any) {
        if loginTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: loginTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                if user != nil
                {
                    print("You've successfully logged in")
                }
                else
                {
                    if let localError = error?.localizedDescription {
                        print(localError)
                    } else { print ("Undefined error") }
                }
            })
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
