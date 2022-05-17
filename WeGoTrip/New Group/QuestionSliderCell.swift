//
//  QuestionSliderCell.swift
//  WeGoTrip
//
//  Created by ilshat on 16.05.2022.
//

import Foundation
import UIKit

class QuestionSliderCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Localizables.q1
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let smileLabel: UILabel = {
        let label = UILabel()
        label.text = "😐"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private let sliderLabel: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 5
        return slider
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
        smileLabel.text = question.smile
    }
    
    //MARK: - Private methods
    private func setupSubviews() {
        [
            titleLabel,
            sliderLabel,
            smileLabel
        ].forEach{(addSubview($0))}
    }
    
    private func setupConstraints() {
                
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.left.equalToSuperview()
        }
        
        smileLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(-12)
            make.left.equalTo(titleLabel.snp.right).offset(2)
        }
        
        sliderLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.right.equalToSuperview().offset(-12)
            make.left.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-4)
        }
    }
    
   
}
