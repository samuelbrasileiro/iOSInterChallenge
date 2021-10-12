import UIKit

/// A Generic TableViewController that contains generic cells with codable data
class ItemTableViewController<ItemType, CellType>: UITableViewController, 
                                                    GenericTableViewController, CellConfigurationDelegate
where CellType: ItemCell<ItemType>, ItemType: Codable {
    
    // MARK: - Attributes 
    var viewModel = TableViewModel<ItemType>()
    weak var coordinator: MainCoordinator?
    
    // MARK: - Initializers 
    init(itemId: Int? = nil) {
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.setURL(itemId: itemId)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        tableView.register(CellType.self, forCellReuseIdentifier: viewModel.getCellIdentifier())
        
        self.setItems()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    func selectionFunction(item: ItemType) { }
    
    func cellConfigurationCompletion(cell: CellType, at row: Int) { }
    
    // MARK: - TableViewDelegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getItemsCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: viewModel.getCellIdentifier(), for: indexPath) as? CellType else {
            return UITableViewCell()
        }
        if let item = self.viewModel.getItem(at: indexPath.row) {
        
            cell.setData(item: item)
            cellConfigurationCompletion(cell: cell, at: indexPath.row)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = self.viewModel.getItem(at: indexPath.row) {
            selectionFunction(item: item)
        }
    }
    
}
