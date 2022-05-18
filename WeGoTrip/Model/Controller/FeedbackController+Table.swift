//
//  FeedbackController+Table.swift
//  WeGoTrip
//
//  Created by ilshat on 15.05.2022.
//

import UIKit

extension FeedbackController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getQuestions().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = viewModel.getQuestions()[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        if let confCell = cell as? QuestionSliderCell {
            confCell.configure(with: cellModel)
        }
        
        return cell
    }
    
}

extension FeedbackController: UITableViewDelegate {
}

