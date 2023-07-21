//
//  ViewController.swift
//  UnitUITestEx
//
//  Created by KeenKim on 2023/07/21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Property
    let mainView = MainView()
    
    // MARK: - View Life Cycle
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAction()
    }
    
    // MARK: - Setup
    func setAction() {
        mainView.toggleSwitch.addTarget(self, action: #selector(onSwitchClicked), for: .valueChanged)
        mainView.saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
    }
    
    // MARK: - ETC
    func clearTextField() {
        mainView.textField.text = ""
    }
    
    func makeIntroduction() {
        let inputText = mainView.textField.text
        
        if let inputs = inputText?.components(separatedBy: "/"), // `/`를 기준으로 쪼개기
           inputs.count == 2, // inputs가 2개인지 체크
           let age = Int(inputs[1]) { // 1번째 요소는 나이이므로 숫자로 형변환 되는지 확인
            let name = inputs[0]
            mainView.resultLabel.text = "안녕? 나는 \(name)고 \(age)살이야. 잘 부탁해!"
        } else {
            mainView.resultLabel.text = "입력값이 올바르지 않습니다. 다시 시도해주세요."
        }
        
        clearTextField()
    }
    
    func copyToLabel() {
        let inputText = mainView.textField.text
        mainView.resultLabel.text = inputText
        clearTextField()
    }
    
    // MARK: - Action
    @objc func onSwitchClicked() {
        mainView.setup()
    }
    
    @objc func saveButtonClicked() {
        if mainView.toggleSwitch.isOn {
            makeIntroduction()
        } else {
            copyToLabel()
        }
    }
}

