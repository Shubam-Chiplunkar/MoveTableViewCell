//
//  ViewController.swift
//  MoveTableViewCell
//
//  Created by mayank ranka on 09/05/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mytableView : UITableView!
    var sortButton  : UIButton!
    var dataArray : [String] = ["Virat Kholi", "Rohit Sharma", "Shubham Chiplunkar", "Ajinkya Rahane", "MS Dhoni"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let rootVc = SecViewController()
//        let navC = UINavigationController(rootViewController: rootVc)
//        navC.modalPresentationStyle = .fullScreen
//        present(navC, animated: true)
        self.navigationItem.title = "Team"
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortButtonClicked))
        
        loadTableview()
    }
    @objc func sortButtonClicked(){
        if mytableView.isEditing {
            mytableView.isEditing = false
        }else
        {
            mytableView.isEditing = true
        }
    }
    func loadTableview(){
        mytableView = UITableView()
        mytableView.translatesAutoresizingMaskIntoConstraints = false
        mytableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        mytableView.delegate = self
        mytableView.dataSource = self
        view.addSubview(mytableView)
        
        NSLayoutConstraint.activate([
           mytableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           mytableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
           mytableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           mytableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        dataArray.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        let movedName = dataArray[sourceIndexPath.row]
        dataArray.remove(at: sourceIndexPath.row)
        dataArray.insert(movedName, at: destinationIndexPath.row)
        
        mytableView.reloadData()
    }


}

