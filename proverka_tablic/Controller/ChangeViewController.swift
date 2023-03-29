//
//  ChangeViewController.swift
//  proverka_tablic
//
//  Created by user on 16.03.2023.
//

import UIKit

class ChangeViewController: UIViewController {

    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtUrl: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func rechange(_ sender: Any) {
        var newN = txtName.text!
        var newU = txtUrl.text!
        if newN.isEmpty || newU.isEmpty{
            let alert = UIAlertController(title: "ошибка", message: "Url или ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            taskList.removeAll()
            let newTask = Task(name: newN, image: newU)
            taskList.append(newTask)
            if let nVC = storyboard?.instantiateViewController(withIdentifier: "main") as? TableViewController{
            nVC.modalPresentationStyle = .fullScreen
            self.present(nVC, animated: true, completion: nil)
        }
    }
}
    
    @IBAction func back(_ sender: Any) {
        if let nVC = storyboard?.instantiateViewController(withIdentifier: "main") as? TableViewController{
        nVC.modalPresentationStyle = .fullScreen
        self.present(nVC, animated: true, completion: nil)
        }
    }
    
    
    

}
