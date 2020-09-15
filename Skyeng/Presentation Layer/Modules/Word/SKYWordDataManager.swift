//
//  SKYWordDataManager.swift
//  Skyeng
//
//  Created by Kirill Shalankin on 15.09.2020.
//  Copyright © 2020 Kirill Shalankin. All rights reserved.
//

import UIKit

class SKYWordDataManager: NSObject, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Public vars & lets
    
    var word: APIResponse.SKYWord?
    
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let meaning = word?.meanings else { return 0 }
        return meaning.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SKYMeaningCell.cellIdentifier(), for: indexPath)
            as! SKYMeaningCell
            
        guard let meaning = word?.meanings[indexPath.row] else { return cell }
        cell.configure(urlString: meaning.previewUrl, text: meaning.translation.text)
        
        return cell
    }
    
    
    // MARK: - UITableViewDelegat
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SKYMeaningCell.cellHeight()
    }
    
}
