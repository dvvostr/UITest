import x3Core
import x3UI
import UIKit

@IBDesignable @objc public class HomeViewController: UIX3CustomViewController {
    @IBOutlet public weak var tableView: UITableView?

    private let _items: [(index: Int, name: String, imageName: String)] = [
        (1, "Buttons", Config.Images.IMAGE_ICONDOC),
        (2, "GUI", Config.Images.IMAGE_ICONUSER),
        (3, "Input Form", Config.Images.IMAGE_ICONADD),
        (4, "Data", Config.Images.IMAGE_ICONBAG),
        (5, "Alerts", Config.Images.IMAGE_ICONBOX),
        (6, "TableView & Custom view", Config.Images.IMAGE_ICONAB),
        (7, "Example 7", Config.Images.IMAGE_ICONPIN),
        (8, "Example 8", Config.Images.IMAGE_ICONUSER),
        (9, "Change PIN", Config.Images.IMAGE_ICONLOCK)
    ]
// MARK: - Initialization
    public override func viewDidLoad() {
        UIApplication.shared.statusBarUIView?.backgroundColor = Config.Colors.tint
        super.viewDidLoad()
    }
    
    public override func setupView() {
        super.setupView()
        self.setupTableView()
        self.navigationController?.navigationBar.backgroundColor = Config.Colors.background
        self.navigationItem.leftBarButtonItem = nil
//        self.navigationController?.navigationBar.addBorders(edges: .bottom, color: Config.Colors.colorBorderDark)
    }

    

    // MARK: - Navigation
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView(){
        self.tableView?.separatorColor = UIColor.clear
        self.tableView?.registerNib(HomeControllerTableViewCell.self)
    }
    //----- CELLS -----//
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self._items.count)
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let _cell: HomeControllerTableViewCell = tableView.dequeueReusableCellForIndexPath(indexPath)
        let _item = self._items[indexPath.row]
        _cell.item = _item
        _cell.delegate = self
        return _cell
    }
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
//**********************************************//
// MARK: - ******* UICustomHomeControllerTableCellDelegate *******
extension HomeViewController: UICustomHomeControllerTableCellDelegate {
    public func cellClick(sender: Any?) {
        var _class: UIX3CustomViewController.Type? = nil, _obj: UIX3CustomViewController?
        guard let _cell = sender as? HomeControllerTableViewCell else { return }
        switch _cell.item?.index ?? -1 {
        case 1: _class = ExampleViewController1.self
        case 2: _class = ExampleViewController2.self
        case 3: _class = ExampleViewController3.self
        case 4: _class = ExampleViewController4.self
        case 5: _class = ExampleViewController5.self
        case 6: _class = ExampleViewController6.self
        case 7: _class = ExampleViewController7.self
        case 8: break
        case 9: _class = ProfileDetailViewController.self
        default: self.showAlert(title: "Error", message: "Unknown action type", buttonTitle: "OK")
        }
        guard let _class = _class else { return }
        if _class.nibExists {
            _obj = _class.fromNib()
        } else {
            _obj = _class.init()
        }
        guard let _vc = _obj else { return }
        switch _cell.item?.index {
        case 2: _vc.captionText = "John Doe\nABC - 2345"
        default: _vc.captionText = _cell.item?.name.localized.uppercased() ?? "<?>"
        }
        
        self.navigationController?.pushViewController(_vc, animated: true)
    }
    
}
extension HomeViewController{
    public override func deviceRotateEvent(orientation: UIDeviceOrientation, isLandscape: Bool) {
        UIView.animate(withDuration: 0.3, animations: {
            UIApplication.shared.statusBarUIView?.backgroundColor = isLandscape ? UIColor.clear : Config.Colors.tint
        })
    }
}

extension HomeViewController: UIX3CustomViewControllerDelegate {
    
}
