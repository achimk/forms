import UIKit
import Forms

fileprivate enum Sample: CaseIterable {
    case baseStyles
    
    var title: String {
        switch self {
        case .baseStyles:
            return "Base styles"
        }
    }
    
    var details: String {
        switch self {
        case .baseStyles:
            return ""
        }
    }
}

class SamplesViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    private func setupView() {
        title = "Samples"
    }
    
    private func setupTableView() {
        tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var viewController: UIViewController?
        let sample = Sample.allCases[indexPath.row]
        switch sample {
        case .baseStyles:
            viewController = TableCellStylesViewController()
        }
        
        if let viewController = viewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sample.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sample = Sample.allCases[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = sample.title
        cell.detailTextLabel?.text = sample.details
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
