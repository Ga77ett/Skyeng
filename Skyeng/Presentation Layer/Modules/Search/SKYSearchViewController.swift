//
//  SKYSearchViewController.swift
//  Skyeng
//
//  Created Kirill Shalankin on 15.09.2020.
//  Copyright © 2020 Kirill Shalankin. All rights reserved.
//
//  Template generated by Kirill Shalankin
//

import UIKit

class SKYSearchViewController: UITableViewController, SKYSearchViewInput, UISearchBarDelegate {

    // MARK: - Public vars & lets
    
	var output: SKYSearchViewOutput?
    var dataManager: SKYSearchDataManager?
    
    
    // MARK: - Private vars & lets
    
    lazy private var searchBar: UISearchBar = UISearchBar(frame: .zero)
    
    
    // MARK: - Init

	required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        SKYSearchAssembly.createModule(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupInitialState()
        output?.viewDidLoad()
    }
    
    private func setupInitialState() {
        setupTableView()
        setupSearchBar()
        setupToolbar()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: SKYResultCell.cellNibName(), bundle: nil),
                           forCellReuseIdentifier: SKYResultCell.cellIdentifier())
        
        tableView.tableFooterView = UIView()
        tableView.delegate = dataManager
        tableView.dataSource = dataManager
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        
        searchBar.placeholder = "Введите слово..."
        searchBar.setImage(UIImage.init(named: ""), for: .bookmark, state: .normal)
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = navigationController?.navigationBar.barTintColor
        searchBar.tintColor = self.view.tintColor
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "Отменить"
        let attributes:[NSAttributedString.Key:Any] = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .semibold)
        ]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes(attributes, for: .normal)
        
        navigationItem.titleView = searchBar
    }
    
    func setupToolbar() {
        let toolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolbar.barStyle = .default
        toolbar.items = [UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil),
                         UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(doneDidTapped))]
        toolbar.sizeToFit()
        searchBar.inputAccessoryView = toolbar
    }
    
    @objc func doneDidTapped() {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    
    // MARK: - UISearchBarDelegate
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
        
        DispatchQueue.main.async {
            self.dataManager?.removeData()
            self.tableView.reloadData()
        }
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else { return }
        
        if (text.count > 0) {
            DispatchQueue.global().async {
                self.output?.textDidChange(text: text)
            }

        } else {
            DispatchQueue.main.async {
                self.dataManager?.removeData()
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - SKYSearchViewInput
    
    func configure(data: [APIResponse.SKYWord]) {
        DispatchQueue.main.async {
            self.dataManager?.configure(data: data)
            self.tableView.reloadData()
        }
    }

}
