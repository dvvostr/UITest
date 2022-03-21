import UIKit
import x3UI

@IBDesignable open class UX3CustomInput: UIX3TextField {
    
    open override func setupView() {
        super.setupView()
        self.borderStyle = UITextField.BorderStyle.roundedRect
        self.autocorrectionType = UITextAutocorrectionType.no
        self.keyboardType = UIKeyboardType.default
        self.returnKeyType = UIReturnKeyType.default
        self.clearButtonMode = UITextField.ViewMode.whileEditing;
        self.isSecureTextEntry = false
        self.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    }
}
