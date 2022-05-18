//
//  QuestionInputCell.swift
//  WeGoTrip
//
//  Created by ilshat on 17.05.2022.
//

import UIKit

class QuestionInputCell: UITableViewCell {
    
    let type: QType = .textInput
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Localizables.q5
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let inputTextField: UITextField = {
        let view = UITextField()
        view.placeholder = Localizables.questionPlaceholer
        view.sizeToFit()
        view.textAlignment = .left
        view.font = .systemFont(ofSize: 18)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public methods
    public func configure(with question: Questions) {
        titleLabel.text = question.question
    }
    
    //MARK: - Private methods
    private func setupSubviews() {
        [
            titleLabel,
            inputTextField
        ].forEach{(addSubview($0))}
    }
    
    private func setupConstraints() {
                
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.left.equalToSuperview()
        }
        
        inputTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.right.equalToSuperview().offset(-12)
            make.left.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-4)
        }
    }
    
   
}
