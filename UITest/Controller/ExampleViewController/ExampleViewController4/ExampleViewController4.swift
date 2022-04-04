import UIKit
import x3Core
import x3UI
import x3CustomUI1
import Alamofire

class ExampleViewController4: UIX3CustomViewController {
    @IBOutlet private weak var button1: UX3CustomButton?
    @IBOutlet private weak var button2: UX3CustomButton?
    @IBOutlet private weak var button3: UX3CustomButton?
    @IBOutlet private weak var button4: UX3CustomButton?
    @IBOutlet private weak var buttonCancel: UX3CustomButton?

    override func setupView() {
        super.setupView()
        self.initializeButton(button: self.button1, caption: "Post method error")
        self.initializeButton(button: self.button2, caption: "Post default")
        self.initializeButton(button: self.button3, caption: "Post menu")
        self.initializeButton(button: self.button4, caption: "Wrapper view 1")
        self.buttonCancel?.normalBackgroundColor = UIColor.clear
        self.buttonCancel?.normalForegroundColor = Config.Colors.tint
        self.buttonCancel?.normalBorderColor = UIColor.clear
        self.buttonCancel?.selectedBackgroundColor = UIColor.clear
        self.buttonCancel?.selectedForegroundColor = Config.Colors.textGray
        self.buttonCancel?.selectedBorderColor = UIColor.clear
        self.buttonCancel?.setTitle("Back".localized, for: .normal)
        self.buttonCancel?.addTarget(self, action: #selector(self.handleButtonClick(sender:)), for: .touchUpInside)
    }
    override func invalidate() {
        super.invalidate()
        
    }
    
    
    private func initializeButton(button: UX3CustomButton?, caption: String) {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = button?.title(for: .normal)
            configuration.titlePadding = 0
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 36, bottom: 12, trailing: 36)
            button?.configuration = configuration
        } else {
            button?.contentEdgeInsets = UIEdgeInsets(top: 12, left: 36, bottom: 12, right: 36)
        }
        button?.normalBackgroundColor = Config.Colors.tint
        button?.normalForegroundColor = Config.Colors.background
        button?.normalBorderColor = Config.Colors.tint
        button?.selectedBackgroundColor = Config.Colors.tintLight
        button?.selectedForegroundColor = Config.Colors.tint
        button?.selectedBorderColor = Config.Colors.tint
        button?.setTitle(caption.localized.uppercased(), for: .normal)
        button?.cornerRadius = -1
        button?.addTarget(self, action: #selector(self.handleButtonClick(sender:)), for: .touchUpInside)
    }
    @objc private func handleButtonClick(sender: Any?) {
        guard let _btn = sender as? UX3CustomButton else { return }
        switch _btn {
        case self.button1: postAlamofireErrorData()            
        case self.button2: postAlamofireDefaultData()
        case self.button3: postAlamofireMenuData()
        case self.button4: break
        case self.buttonCancel: self.navigationController?.popViewController(animated: true)
        default: break;
            
        }
    }
}

extension ExampleViewController4: UX3TextControlDelegate {
    private func postAlamofireErrorData() {
        let _URL = DEBUG_URL,
            _params = TestRequestParams(value1: "value1", value2: "value2", value3: "value3")
        
        DataController.userName = "user"
        DataController.password = "pass"

        let _ = DataController().alamofireSend(_URL, method: Config.Methods.Error, params: _params, dataType: TestDataResult.self) { _result, _data in
            if _result.isSuccess {
                ShowAlertView("Success".uppercased(), message: "Where must write OK message", buttons: [.ok])
            } else {
                ShowAlertView("Error".localized.uppercased(), message: _result.errorText ?? "Unassigned error", buttons: [.ok]);
            }
        }
    }
    private func postAlamofireDefaultData() {
        let _URL = DEBUG_URL,
            _params = TestRequestParams(value1: "value1", value2: "value2", value3: "value3")
        
        DataController.userName = "user"
        DataController.password = "pass"

        let _ = DataController().alamofireSend(_URL, method: Config.Methods.Default, params: _params, dataType: TestDataResult.self) { _result, _data in
            if _result.isSuccess, let _data = _data as? TestDataResult {
                ShowAlertView(message: "Resived \(_data.items.count) items.", buttons: [.ok])
            } else {
                ShowAlertView(message: _result.errorText?.localized ?? "Unassigned error".localized, buttons: [.ok])
            }
        }
    }
    private func postAlamofireMenuData() {
        let _URL = DEBUG_URL,
            _params = TestRequestParams(value1: "value1", value2: "value2", value3: "value3")
        
        DataController.userName = "user"
        DataController.password = "pass"
        
//        let _ = DataController().alamofireSend(_URL, method: Config.Methods.mainMenu, params: _params, dataType: MainMenuDataResult.self) { _result, _data in
        let _ = DataController().alamofireSend(_URL, method: Config.Methods.mainMenu, params: _params, dataType: MainMenuDataResult.self) { _result, _data in
            if _result.isSuccess, let _data = _data as? MainMenuDataResult {
                ShowAlertView(message: "Resived \(_data.items.count) items.", buttons: [.ok])
            } else {
                ShowAlertView(message: _result.errorText?.localized ?? "Unassigned error".localized, buttons: [.ok])
            }
        }
    }
}
