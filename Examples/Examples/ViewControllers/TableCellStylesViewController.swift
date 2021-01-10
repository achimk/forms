import UIKit
import Forms

fileprivate enum Style: CaseIterable {
    case `default`
    case subtitle
    case value
    case valueAlt
    
    var identifier: String {
        switch self {
        case .default: return "default"
        case .subtitle: return "subtitle"
        case .value: return "value"
        case .valueAlt: return "valueAlt"
        }
    }
    
    var title: String {
        return "Title"
    }
    
    var details: String {
        return "Details"
    }
}

class TableCellStylesViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    private func setupView() {
        title = "Table Cell Styles"
    }
    
    private func setupTableView() {
        tableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: Style.default.identifier)
        tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: Style.subtitle.identifier)
        tableView.register(ValueTableViewCell.self, forCellReuseIdentifier: Style.value.identifier)
        tableView.register(ValueAltTableViewCell.self, forCellReuseIdentifier: Style.valueAlt.identifier)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Style.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let style = Style.allCases[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: style.identifier, for: indexPath)
        cell.textLabel?.text = style.title
        cell.detailTextLabel?.text = style.details
        return cell
    }

}
