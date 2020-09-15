//
//  SKYSearchDataManager.swift
//  Skyeng
//
//  Created by Kirill Shalankin on 15.09.2020.
//  Copyright © 2020 Kirill Shalankin. All rights reserved.
//

import UIKit

class SKYSearchDataManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Public vars & lets
    
    var view: SKYSearchViewController?
    
    
    // MARK: - Private vars & lets
    
    private var data: [APIResponse.SKYWord] = []
    
    
    // MARK: - Data
    
    public func configure(data: [APIResponse.SKYWord]) {
        self.data.removeAll()
        self.data += data
    }
    
    public func removeData() {
        data.removeAll()
    }
    
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SKYResultCell.cellIdentifier(), for: indexPath) as! SKYResultCell
        
        let word = data[indexPath.row]
        guard let meaning = word.meanings.first else { return cell }
        cell.configure(word: word.text, meaningText: meaning.translation.text)
        
        return cell
    }
    
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return SKYResultCell.cellHeight()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
