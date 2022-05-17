//
//  FeedbackController.swift
//  WeGoTrip
//
//  Created by ilshat on 13.05.2022.
//

import UIKit

class FeedbackController: UIViewController {
    
    lazy var mainView: FeedbackView = {
        let view = FeedbackView(delegate: self)
        view.reload()
        return view
    }()
    
    var viewModel: FeedbackViewModel

    //TODO: Abstraze
    init(with viewModel: FeedbackViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.setQuestions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


extension FeedbackController: FeedbackViewDelegate {
    func nextButtonDidPressed() {
        //
    }
    
    func skipButtonDidPressed() {
        //
    }
    
}
