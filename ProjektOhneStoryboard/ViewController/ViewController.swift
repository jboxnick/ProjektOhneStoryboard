//
//  ViewController.swift
//  ProjektOhneStoryboard
//
//  Created by Julian on 22.05.21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    //MARK: - Properties
    
    private let cellReuseIdentifier = "Cell"
    private var names: [String] = ["Julian", "Tobias"]

    //MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupTableView()
        setupNavigationBar()

    }
    
    //MARK: - Setup Functions
    
    private func setupViews() {
        
        view.addSubview(tableView)
        title = "Tabelle"
    }
    
    private func setupTableView() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let tableViewConstraints: [NSLayoutConstraint] = [
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
        
        tableView.register(PersonCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupNavigationBar() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(createNewEntry))
    }
    
    //MARK: - Helper Functions
    
    private func addNewName(newName name: String) {
        
        self.names.append(name)
        tableView.reloadData()
    }
    
    //MARK: - @objc Functions
    
    @objc func createNewEntry() {
        
        let alertController = UIAlertController(title: "Neuen Eintrag erstellen", message: nil, preferredStyle: .alert)
        alertController.view.tintColor = .black
        alertController.addTextField { (textField) in
            textField.placeholder = "Vorname eingeben"
        }
        let createAction = UIAlertAction(title: "Erstellen", style: .default) { (action) in
            let firstTextField = alertController.textFields![0] as UITextField
            guard let text = firstTextField.text else { return }
            self.addNewName(newName: text)
        }
        let cancelAction = UIAlertAction(title: "Abbrechen", style: .destructive, handler: nil)
        alertController.addAction(createAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! PersonCell
        cell.configure(_text: names[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedName = names[indexPath.row]
        
        let destinationVC = DestinationViewController(_name: selectedName)
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
