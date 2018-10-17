import UIKit
protocol MyProtocol {
    func setResultOfBusinessLogic(valueSent: String)
}

class SecondViewController: UIViewController {
    var delegate:MyProtocol?
    @IBOutlet weak var tableView: UITableView!
    fileprivate let viewModel = SecondViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Perform some business logic. Anything!
        let firstName = "Hai Le"
        let lastName = "Pham"
        let fullName = firstName + " " + lastName
        delegate?.setResultOfBusinessLogic(valueSent: fullName)
        
        tableView?.dataSource = viewModel
        tableView?.estimatedRowHeight = 150
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.register(TopTableViewCell.nib, forCellReuseIdentifier: TopTableViewCell.identifier)
        tableView?.register(MidTableViewCell.nib, forCellReuseIdentifier: MidTableViewCell.identifier)
        tableView?.register(BottomTableViewCell.nib, forCellReuseIdentifier: BottomTableViewCell.identifier)

    }


}
