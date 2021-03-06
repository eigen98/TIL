//
//  ViewController.swift
//  TodoList
//
//  Created by JeongMin Ko on 2022/02/18.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController( title : "할일 등록", message: nil, preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task( title : title, done : false)
            self?.tasks.append(task)
            self?.tableView.reloadData() // 갱신
            
        })
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil )
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: {
            textFild in textFild.placeholder = "할일을 입력해주세요."
        })
        self.present(alert, animated:  true, completion: nil)
    }
}

extension ViewController : UITableViewDataSource {
    //각 섹션에 표시할 행의 개수 -> 하나의 섹션에 할일 표시
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        return cell
    }
    
    
}
