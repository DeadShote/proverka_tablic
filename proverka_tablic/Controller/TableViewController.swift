import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    

    
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCellid") as! TaskTableViewCell
        
        
        let elemnet = taskList[indexPath.row]
        
        let url = URL(string: elemnet.img)
        let data = try? Data(contentsOf: url!)
        cell.img.image = UIImage(data:data!)
        

        cell.label.text = elemnet.name
        if elemnet.isDone == true{
            cell.label.textColor = UIColor.green
        }
        else{
            cell.label.textColor = UIColor.red
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.performSegue(withIdentifier: "segue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        if segue.identifier == "segue"{
            let taskClickedIndex = table.indexPathForSelectedRow!
            let taskClicked = taskList[taskClickedIndex.row]
            
            let detail = segue.destination as! DetailViewController
            
            detail.index = taskClickedIndex.row
            detail.task = taskClicked
        }
    }
    

    
}
