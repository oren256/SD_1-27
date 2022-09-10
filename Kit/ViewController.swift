//
//  ViewController.swift
//  Kit
//
//  Created by  DNS on 03.09.2022.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createTextField()
        self.createButton()
        
    }
    
    //MARK: - Method
    func createTextField() {
        self.textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        self.textField.center = self.view.center
        self.textField.borderStyle = UITextField.BorderStyle.roundedRect
        self.textField.placeholder = "Enter text to share"
        self.textField.delegate = self
        self.view.addSubview(self.textField)
    }
    
    func createButton() {
        self.buttonShare = UIButton(type: .roundedRect)
        self.buttonShare.frame = CGRect(x: 50, y: 350, width: 280, height: 44)
        self.buttonShare.setTitle("Расшарить", for: .normal)
        self.buttonShare.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        self.view.addSubview(buttonShare)
    }
    
    @objc func handleShare(paramSender: Any) {
        let text = self.textField.text
        
        if text?.count == 0 {
            let myMessage = "Сначало введите текст, потом нажмите кнопку"
            let alertControler = UIAlertController(title: nil, message: myMessage, preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel)
            alertControler.addAction(action)
            self.present(alertControler, animated: true)
        }
        
        self.activityViewController = UIActivityViewController(activityItems: [self.textField.text ?? "nil"], applicationActivities: nil)
        self.present(self.activityViewController!, animated: true)
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        
        return true
    }

}

