//
//  ViewController.swift
//  Homework6.2.28
//
//  Created by Daniil Lebedev on 01.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - IBOutlets
    
    @IBOutlet var UserNameTextField: UITextField!
    @IBOutlet var PasswordTextField: UITextField!
    
    @IBOutlet var LoginButton: UIButton!
    
    let userName = "admin"
    let password = "admin"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super .touchesBegan(touches, with: event)
//    }  //не понимаю, как работает тут переопределение. Нашел другой метод.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let logoutVC = segue.destination as? WelcomeViewController else { return }
        logoutVC.userName = userName
    }
    // MARK: - privat
    
    private func checkUserNameTextField(){
        guard let username = UserNameTextField.text, !username.isEmpty else{
            showAlert(with: "Please", and: "Enter Username")
            return
        }
    }
    private func checkPasswordTextField(){
        guard let password = PasswordTextField.text, !password.isEmpty else{
            showAlert(with: "Please", and: "Enter password")
            return
        }
    }
    private func checkUserNameCorrect(){
        guard userName == UserNameTextField.text else{
            showAlert(with: "oops", and: "Wrong User Name \n or Password")
            self.PasswordTextField.text = ""
            return
        }
    }
    private func checkPasswordCorrect(){
        guard password == PasswordTextField.text else{
            showAlert(with: "oops", and: "Wrong User Name \n or Password")
            self.PasswordTextField.text = ""
            return
        }
    }
    
    //MARK: - IB Actions
    @IBAction func loginAction(_ sender: UIButton) {
        checkUserNameTextField()
        checkPasswordTextField()
        checkUserNameCorrect()
        checkPasswordCorrect()
    }
    @IBAction func UserNameAlertAction() {
        showAlert(with: "Username", and: "admin")
    }
    @IBAction func PasswordAlertAction() {
        showAlert(with: "Password", and: "admin")
    }
    @IBAction func unwind(for segue: UIStoryboardSegue){
        guard segue.source is WelcomeViewController else { return }
        UserNameTextField.text = ""
        PasswordTextField.text = ""
    }

    @IBAction func hiddenKeyboard(_ sender: Any) {
        UserNameTextField.resignFirstResponder()
        PasswordTextField.resignFirstResponder()
    } //вариант по скрытию клавиатуры, подсмотренный в интернете:)
    
}

//MARK: - Alert Controllers
extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
