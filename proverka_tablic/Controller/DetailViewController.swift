import UIKit



class DetailViewController: UIViewController {

    
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskImg: UIImageView!
    
    var task : Task!
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName.text = task.name
        let url = URL(string: task.img)
        let data = try? Data(contentsOf: url!)
        taskImg.image = UIImage(data: data!)
        
        
    }
    @IBAction func back(_ sender: Any) {
        
        if let newvc = storyboard?.instantiateViewController(withIdentifier: "main") as? TableViewController{
            newvc.modalPresentationStyle = .fullScreen
            
            self.present(newvc,animated: true,completion: nil)
        }
    }
    
    @IBAction func done(_ sender: Any) {
        if task.isDone != true{
            let alert = UIAlertController(title: "вы уверены", message: "вы уверены что хотите это сделать?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "да", style: .default, handler: { action in
                self.task.isDone = true
                    let alert = UIAlertController(title: "удалить?", message: " Хотите ли вы удалить эту заметку?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "да" , style: .default,handler: { action in
                    taskList.remove(at: self.index)
                    //task.name.remove(at: taskList.index)
                    self.back(sender)
                }))
                alert.addAction(UIAlertAction(title: "нет", style: .default, handler: {action in
                    if let nvc = self.storyboard?.instantiateViewController(withIdentifier: "main") as? TableViewController{
                        nvc.modalPresentationStyle = .fullScreen
                        self.present(nvc,animated: true,completion: nil)
                    }
                }))
                    self.present(alert, animated: true, completion: nil)
            }))
        alert.addAction(UIAlertAction(title: "нет", style: .cancel,handler: { action in
            if let nvc = self.storyboard?.instantiateViewController(withIdentifier: "main") as? TableViewController{
                nvc.modalPresentationStyle = .fullScreen
                self.present(nvc,animated: true,completion: nil)
            }
        }))
            self.present(alert, animated: true, completion: nil)
            }
        else if task.isDone == true{
            let alert = UIAlertController(title: "ошибка", message: "вы уже выполнили это задание", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
        }
    
    
}

/*
 self.task.isDone = true
 self.back(sender)
 */
