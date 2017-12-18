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
    
    @IBAction func actionButtonForJury(_ sender: Any)
    {
        if juryNameTextField.text != "" {
            Auth.auth().signInAnonymously(completion: {(user, error) in
                if user != nil
                {
                    print("You've successfully logged in")
                    FBManager.shared.juryName = self.juryNameTextField.text!
                    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    let ViewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "JuryVC") as UIViewController
                    self.present(ViewController, animated: true, completion: nil)
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
    
    @IBAction func actionButtonForAdmin(_ sender: Any)
    {
        if loginTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: loginTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                if user != nil
                {
                    print("You've successfully logged in")
                    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    let adminViewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "AdminViewController") as UIViewController
                    self.present(adminViewController, animated: true, completion: nil)
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
        FBManager.shared.getAllJuryNames { (result) in 
            print(result)
        }
        // Do any additional setup after loading the view.
    }
}
