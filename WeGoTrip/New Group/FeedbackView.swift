//
//  FeedbackView.swift
//  WeGoTrip
//
//  Created by ilshat on 13.05.2022.
//

import UIKit

protocol FeedbackViewInterface {
    var delegate: FeedbackViewDelegate? { get set }
    var questionViews: [FeedbackView] { get set }
}

protocol FeedbackViewDelegate: AnyObject, UITableViewDataSource, UITableViewDelegate {
    func nextButtonDidPressed()
    func skipButtonDidPressed()
}

final public class FeedbackView: UIView {
    
    weak var delegate: FeedbackViewDelegate?
    
    private let profilePic: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "npsThumb")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.text = Localizables.firstPageTitle
        title.backgroundColor = .yellow
        title.numberOfLines = 2
        title.textAlignment = .right
        title.font = .boldSystemFont(ofSize: 20)
        return title
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.backgroundColor = .red
        view.separatorStyle = .none
        view.isScrollEnabled = false
        view.dataSource = delegate
        view.delegate = delegate
        return view
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Далее", for: .normal)
        //button.addTarget(self, action: .nextButtonAction, for: .touchUpInside)
        button.isEnabled = false
        
        return button
    }()
    
    private lazy var skipButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Пропустить", for: .normal)
        //button.addTarget(self, action: .skipButtonAction, for: .touchUpInside)
        
        return button
    }()

    
    init(delegate: FeedbackViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        setupSubveiws()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func reload() {
        tableView.reloadData()
    }
    
    private func setupSubveiws() {
        [
            profilePic,
            titleLabel,
            tableView,
            nextButton,
            skipButton
        ].forEach({addSubview($0)})
        
        [
            QuestionSliderCell.self,
        ].forEach({tableView.register($0, forCellReuseIdentifier: "Cell")})
    }
    
    private func setupConstraints() {
        
        profilePic.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(profilePic.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(298)
        }
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
        skipButton.snp.makeConstraints { make in
            make.top.equalTo(nextButton.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-40)
        }
    }
}
