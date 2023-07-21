//
//  MainView.swift
//  UnitUITestEx
//
//  Created by KeenKim on 2023/07/21.
//

import UIKit

class MainView: UIView {
    // MARK: - Properties
    let verticalStackView = UIStackView()
    let resultLabel = UILabel()
    let textField = UITextField()
    let saveButton = UIButton()
    let toggleSwitch = UISwitch()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addSubviews()
        setAccessibilityIDs()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }
    
    // MARK: - Setup
    /// UI 요소들의 속성 설정
    func setup() {
        self.backgroundColor = .white
        verticalStackView.spacing = 8
        verticalStackView.axis = .vertical
        resultLabel.font = .systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        
        // toggle on: textField에 입력한 문장을 `/`을 기준으로 끊어 인삿말을 만듦. (ex. "철수/16" -> "안녕? 나는 철수고 16살이야. 잘 부탁해!")
        if toggleSwitch.isOn {
            resultLabel.text = "입력한 이름/나이를 기반으로 인삿말을 만들어줍니다."
            textField.placeholder = "이름/나이"
            saveButton.setTitle("인삿말 만들기", for: .normal)
            saveButton.backgroundColor = .systemGreen
        } else {
            // toggle off: textField에 입력한 단어를 resultLabel에 그대로 보여줌
            resultLabel.text = "버튼을 누르면 입력창에 입력한 단어가 이곳에 보여집니다."
            textField.placeholder = "단어를 입력해주세요"
            saveButton.setTitle("저장하기", for: .normal)
            saveButton.backgroundColor = .systemRed
        }
    }
    
    /// UITest 시 element를 식별할 수 있도록 id 부여
    func setAccessibilityIDs() {
        toggleSwitch.isAccessibilityElement = true
        resultLabel.isAccessibilityElement = true
        textField.isAccessibilityElement = true
        saveButton.isAccessibilityElement = true
        toggleSwitch.accessibilityIdentifier = "toggle_switch"
        resultLabel.accessibilityIdentifier = "result_label"
        textField.accessibilityIdentifier = "text_input_field"
        saveButton.accessibilityIdentifier = "save_button"
    }
    
    /// 하위뷰에 추가
    func addSubviews() {
        self.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(toggleSwitch)
        verticalStackView.addArrangedSubview(resultLabel)
        verticalStackView.addArrangedSubview(textField)
        verticalStackView.addArrangedSubview(saveButton)
        
        [verticalStackView, resultLabel, textField, saveButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    /// 제약조건 설정
    func setConstraints() {
        verticalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        verticalStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
}
