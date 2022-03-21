import UIKit
import x3Core
import x3UI
import x3CustomUI1

class ExampleViewController4: UIX3CustomViewController {
    private lazy var _view1: UIX3CustomView? = {
        let _view = UIX3CustomView()
        let _input = UIX3TextField()
        _view.addSubview(_input)
        _input.fillSuperview()
        _input.textControlDelegate = self
        _input.placeholder = "Input here".localized
        _input.leftButtonType = .icon
        _input.leftButtonViewMode = .always
        _input.leftButtonImage = Config.Images.iconPlaceholder
        _input.leftButtonLeftOffset = 8
        _input.rightButtonType = .clear
        _input.rightButtonViewMode = .always
        _input.rightButtonImage = Config.Images.iconClose
        _input.rightButtonRightOffset = 4
        _input.rightButtonImageOffset = 0
        return _view
    }()
    @IBOutlet private weak var textInput1: UIX3CaptionView? {
        didSet {
            self.textInput1?.font = Config.Fonts.NotoSansRegular(size: 14)
            self.textInput1?.captionInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
            self.textInput1?.viewInsets = UIEdgeInsets(top: 8, left: 16, bottom: 16, right: 16)
            self.textInput1?.caption = "Заголовок элемента"
            self.textInput1?.view = self._view1
            self.textInput1?.backgroundColor = Config.Colors.backgroundGray
            self.textInput1?.layer.cornerRadius = 8
        }
    }
    @IBOutlet private weak var captionTextField1: UIX3CaptionTextField? {
        didSet {
            self.captionTextField1?.rightButtonType = .clear
            self.captionTextField1?.rightButtonViewMode = .always
            self.captionTextField1?.rightButtonImage = Config.Images.iconClose
            self.captionTextField1?.rightButtonRightOffset = 4
            self.captionTextField1?.rightButtonImageOffset = 0
            self.captionTextField1?.placeholderFont = Config.Fonts.NotoSansRegular(size: 12)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ExampleViewController4: UX3TextControlDelegate {}
