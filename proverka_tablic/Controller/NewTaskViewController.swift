import UIKit

class NewTaskViewController: UIViewController {

    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var img: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func add(_ sender: Any) {
        
        let taskName = name.text!
        let imgUrl = img.text!
        
        if taskName.isEmpty || imgUrl.isEmpty{
            let alert = UIAlertController(title: "error", message: "имя или url не должны быть пустыми", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let newTask = Task(name: taskName, image: imgUrl)
            taskList.append(newTask)
            
            if let newvc = storyboard?.instantiateViewController(withIdentifier: "main") as? TableViewController{
                newvc.modalPresentationStyle = .fullScreen
                
                self.present(newvc,animated: true,completion: nil)
            }
            
        }
        
    }
    
    


}
