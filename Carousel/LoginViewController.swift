//
//  LoginViewController.swift
//  Carousel
//
//  Created by Jisi Guo on 2/10/16.
//  Copyright © 2016 Jisi Guo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var signinScrollView: UIScrollView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var fieldParentView: UIView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidden = true
        
        signinScrollView.contentSize = signinScrollView.frame.size
        signinScrollView.contentInset.bottom = 100
        signinScrollView.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backTap(sender: UIButton) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func signinButtonTap(sender: UIButton) {
        
        let alertController = UIAlertController(title: "Sign In Failed", message: "Incorrect email or password.", preferredStyle: .Alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        
        
        let alertEmailController = UIAlertController(title: "Email Required", message: "Please enter your email address.", preferredStyle: .Alert)
        
        // add the OK action to the alert controller
        alertEmailController.addAction(OKAction)
        
        
        self.activityIndicator.hidden = false
        self.activityIndicator.startAnimating()
        self.signinButton.selected = true
        
        if self.emailField.text == "jisiguo@gmail.com" && self.passwordField.text == "password" {
            delay(2, closure: { () -> () in
                print("woohoo")
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.signinButton.selected = false
                
                self.performSegueWithIdentifier("signinSegue", sender: nil)
            })
        } else if self.emailField.text == ""{
            self.presentViewController(alertEmailController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
                self.activityIndicator.hidden = true
            }
        } else {
            delay(2, closure: { () -> () in
                print("wrong mang")
                
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.signinButton.selected = false
                
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            })
        }

    }
    
    func keyboardWillShow(notification: NSNotification!) {
        print("keyboardWillShow")
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        signinScrollView.contentOffset.y = signinScrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
