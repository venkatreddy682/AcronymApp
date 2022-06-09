//
//  AcronymsViewController.swift
//  SystemTest
//
//  Created by apple on 09/06/22.
//

import UIKit

class AcronymsViewController: UIViewController {

    @IBOutlet weak var acronymsTableView: UITableView!
    var abbreviationsDataArray : [Abbreviation]?
    @IBOutlet weak var searchBar: UISearchBar!
    lazy var viewModel = AcronymViewModel()
    
    // MARK: LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI() {
        self.title = "Acronyms"
        acronymsTableView.estimatedRowHeight = 100
        acronymsTableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: ServiceCall Method
extension AcronymsViewController {
    
    func getAcronymAbbreviations(searchString: String) {
        let params = "sf=\(searchString)"
        viewModel.callgetAcronymsAPI(params: params, delegate: self) {[weak self] responseArray, error in
            self?.abbreviationsDataArray = responseArray
            if self?.abbreviationsDataArray?.count ?? 0 > 0 {
                self?.acronymsTableView.backgroundView = nil
            } else {
                self?.acronymsTableView.setNoDataPlaceholder("No Acronyms found")
            }
            DispatchQueue.main.async {
                self?.acronymsTableView.reloadData()
            }
        }
    }
}


// MARK: UICollectionView, DataSource Methods
extension AcronymsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        abbreviationsDataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AcronymsTableCell.className, for: indexPath) as? AcronymsTableCell else { return UITableViewCell() }
        if let abbreviationObj = abbreviationsDataArray?[indexPath.item] {
          cell.setAcronymsData(data: abbreviationObj, indexpath: indexPath)
        }
        return cell
    }
}


// MARK: Acronym SearchBar delegates
extension AcronymsViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let searchText = searchBar.text, !searchText.isEmpty {
            getAcronymAbbreviations(searchString: searchText)
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            abbreviationsDataArray?.removeAll()
            acronymsTableView.reloadData()
        }
    }
}
