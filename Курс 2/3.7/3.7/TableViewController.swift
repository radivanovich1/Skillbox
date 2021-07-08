//
//  TableViewController.swift
//  3.7
//
//  Created by Дмитрий Радиванович on 16.06.21.
//

import UIKit
import Bond

class TableViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    let forRandom = MutableObservableArray(["Александр", "Дмитрий", "Никита", "Сергей","Анастасия","Анна","Яна    ","Мария","Алина","Сергей","Андрей","Максим","Артём","Алексей","Иван","Илья","Ольга","Елена","Татьяна","Полина"])
    var names = MutableObservableArray(["Александр", "Дмитрий", "Никита", "Сергей","Анастасия","Анна","Яна    ","Мария","Алина","Сергей","Андрей","Максим","Артём","Алексей","Иван","Илья","Ольга","Елена","Татьяна","Полина"])

    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.reactive.text.ignoreNils().map{ _ in self.names.collection}.debounce(for: 2, queue: DispatchQueue.main).bind(to: names)
        names.filterCollection{if self.searchTextField.reactive.text.value == "" {
            return true
        }
        else {
            return $0.contains(self.searchTextField.text!)
        }
            
        }.map{$0}.bind(to: tableView){ (dataSource, indexPath, tableView) ->
            UITableViewCell in
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.nameLabel.text = dataSource[indexPath.row]
        return cell
    }
        names.map{_ in if self.names.count > 0{
            return true
        }
        else{
            return false
        }
        
        }.bind(to: removeButton.reactive.isEnabled)
       
       
        
        //задание 6
//        
//        addButton.reactive.tap.observeNext{
//            self.someFunc()
//        }
     //-------
//        let a = A()
//        let b = A()
//        a.field = b
//        b.field = a
    //------
//        f = {
//            self.someFunc()
//        }
        
    }
    var f: (()->())?
    
    func someFunc(){
        print("!!!")
    }
    
    @IBAction func add(_ sender: Any) {
        names.insert(forRandom[Int.random(in: 0...19)], at: 0)
    }
    
    @IBAction func remove(_ sender: Any) {
        names.removeLast()
    }
    
}
class A{
    var field: A?
    
}

