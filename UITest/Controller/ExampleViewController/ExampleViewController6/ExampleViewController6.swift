import UIKit
import x3Core
import x3UI

class ExampleViewController6: UIX3CustomViewController {
    @IBOutlet private weak var tableView: UIX3TableView?

    override func setupView() {
        super.setupView()
        self.tableView?.tableViewDelegate = self
        self.load()
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    private func load() {
        let _URL = DEBUG_URL,
            _params = TestRequestParams(value1: "value1", value2: "value2", value3: "value3")
        DataController.userName = "user"
        DataController.password = "pass"
//        showWaitView(title: "\("Load data".localized)...")
        showWaitView()
//        let _ = DataController().alamofireSend(_URL, method: Config.Methods.mainMenu, params: _params, dataType: MainMenuDataResult.self) { _result, _data in
        let _ = DataController().alamofireSend(_URL, method: Config.Methods.mainMenu, params: _params, dataType: MainMenuDataResult.self) { _result, _data in
            if _result.isSuccess, let _data = _data as? MainMenuDataResult {
                self.tableView?.items = _data
            } else {
                self.tableView?.items = nil
            }
            hideWaitView()
        }
    }
}
extension ExampleViewController6: UIX3TableViewDelegate {
    private func handleRowClick(sender: ExampleTableViewRow6?) {
        guard let _item = sender?.item else { return }
        switch Int(_item.code) {
        case 1: self.handleShowPinPad()
        default: self.view.makeToast("Cell click: \(_item.caption)")
        }
    }
    func tableView(setupFor tableView: UIX3TableView) {
        tableView.registerNib(ExampleTableViewRow6.self)
        tableView.registerNibForHeaderFooterView(ExampleTableViewHeaderView6.self)
    }
    func tableView(_ tableView: UIX3TableView, rowForSection section: Int) -> UITableViewCell.Type {
        return ExampleTableViewRow6.self
    }
    func tableView(_ tableView: UIX3TableView, heightForTableRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    func tableView(_ tableView: UIX3TableView, indexPath: IndexPath, tableCellDidLoad cell: UITableViewCell?) {
        cell?.selectionStyle = .none
        if let _cell = cell as? ExampleTableViewRow6 {
            _cell.item = (self.tableView?.items?.section(indexPath.section) as? MainMenuDataSection)?.item(indexPath.row)
            _cell.onRowClick = { [weak self] _obj in
                self?.handleRowClick(sender: _obj as? ExampleTableViewRow6)
            }
        }
    }

    func tableView(headerViewFor tableView: UIX3TableView) -> UIX3CustomTableHeaderFooterView.Type {
        return ExampleTableViewHeaderView6.self
    }
    func tableView(_ tableView: UIX3TableView, heightForTableHeaderInSection section: Int) -> CGFloat {
        return 52.0
    }
    func tableView(_ tableView: UIX3TableView, section: Int, tableHeaderDidLoad view: UIView?) {
        if let _item: MainMenuDataSection = tableView.items?.section(section), let _view = view as? ExampleTableViewHeaderView6 {
            _view.caption?.text = _item.caption
        }
    }
}

extension ExampleViewController6 {
    private func handleShowPinPad() {
        
    }
}
