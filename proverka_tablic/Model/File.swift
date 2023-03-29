import Foundation



class Task{
   var name : String
   var img : String
    var isDone : Bool
    init(name: String,image :String){
        self.name = name
        self.img = image
        self.isDone = false
    }
}

var taskList : [Task] = []      // массив
