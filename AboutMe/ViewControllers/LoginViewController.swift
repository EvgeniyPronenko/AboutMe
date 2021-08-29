//
//  ViewController.swift
//  AboutMe
//
//  Created by Евгений on 29.08.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    let user = User.getUser()
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.welcomeUser = user
    }
    
    @IBAction func forgotUserNamePressed() {
        showAlert(
            with: "Oooops!",
            and: "Your name is User 🤪",
            cleanPasswordField: false
        )
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlert(
            with: "Oooops!",
            and: "Your password is Password",
            cleanPasswordField: false
        )
    }
    
    @IBAction func logInPressed() {
        if userNameTextField.text != user.login || passwordTextField.text != user.password {
            showAlert(
                with: "Invalid login or password",
                and: "Please, enter correct login and password",
                cleanPasswordField: true
            )
        }
    }
    
    private func showAlert(
        with title: String,
        and message: String,
        cleanPasswordField: Bool
    ){
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if cleanPasswordField {
                self.passwordTextField.text = ""
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInPressed()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}



