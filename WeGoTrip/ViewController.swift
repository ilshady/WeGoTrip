//
//  ViewController.swift
//  WeGoTrip
//
//  Created by ilshat on 12.05.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let buttonView: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = button.frame.height/2
        button.backgroundColor = .blue
        button.setTitle("Оставить отзыв", for: .normal)
        button.addTarget(ViewController.self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
    }

    func setupSubviews() {
        view.addSubview(buttonView)
        
        buttonView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    @objc func buttonAction() {
        let vc = FeedbackController(with: FeedbackViewModel(questionType: .questions1))
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
