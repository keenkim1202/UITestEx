//
//  UnitUITestExUITests.swift
//  UnitUITestExUITests
//
//  Created by KeenKim on 2023/07/21.
//

import XCTest

/// - NOTE: UITest는 항상 완벽하지 않음.
/// 제대로 작성한 듯해도 에러가 발생하는 경우가 종종있음. (ex. accessibilityIdentifier를 지정해줬음에도 query chain에서 해당 항목을 찾지 못함)
/// 아래는 간단한 UITest의 예제.

extension XCUIElement {
    /// `UISwitch`가 on 상태이면 `true`를 리턴
    var isOn: Bool {
        (value as? String) == "1"
    }
}

final class UnitUITestExUITests: XCTestCase {
    /// When `toggleSwitch` is off
    func testCopyToLabel() throws {
        // 앱 실행
        let app = XCUIApplication()
        app.launch()
        
        // 1) toggle off 확인
        let toggle = app.switches["toggle_switch"]
        
        XCTAssertFalse(toggle.isOn)

        // 2) textField에 "hello" 라고 입력
        let textField = app.textFields["text_input_field"]
        textField.tap()
        textField.typeText("hello")
        
        // 3) saveButton을 tap
        let saveButton = app.buttons["save_button"]
        saveButton.tap()
        
        // 4) resultLabel에 1번에서 입력한 "hello"가 적혀있는지 확인
        let resultLabel = app.staticTexts["result_label"]
        XCTAssertEqual(resultLabel.label, "hello")
    }
    
    /// When `toggleSwitch` is on
    func testMakeIntroduction() throws {
        // 앱 실행
        let app = XCUIApplication()
        app.launch()
        
        // 1) toggle on 확인
        let toggle = app.switches["toggle_switch"]
        toggle.tap()
        XCTAssertTrue(toggle.isOn)
        
        // 2) textField에 "철수/16" 라고 입력
        let textField = app.textFields["text_input_field"]
        textField.tap()
        textField.typeText("철수/16")
        
        // 2) saveButton을 tap
        let saveButton = app.buttons["save_button"]
        saveButton.tap()
        
        // 3) resultLabel에 1번에서 입력한 "철수/16"을 바탕으로 "안녕? 나는 철수고 16살이야. 잘 부탁해!" 라고 뜨는지 확인
        let resultLabel = app.staticTexts["result_label"]
        XCTAssertEqual(resultLabel.label, "안녕? 나는 철수고 16살이야. 잘 부탁해!")
    }
}
