//
//  MiniPlaceVC.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/4/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import UIKit

final class MiniPlaceVC: UIViewController {

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var datePikerTextField: UITextField!

    // MARK: - Property
    private var presenter = MiniPlacePresenter()
    private let datePicker = UIDatePicker()
    private let formatter = DateFormatter()
    private let toolbar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        showDatePicker()
        setupSearchBar()
        setupTableView()
        hideKeyboardForTap()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MiniPlaceVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.minivenuesCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableView.identifierTableCell(), for: indexPath)
        cell.textLabel?.text = presenter.minivenueState(at: indexPath.row).name
        tableView.separatorColor = .lightGray
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let stringId = presenter.minivenueState(at: indexPath.row).identifier
        navigationController?.pushViewController(InformationAssembly.createInformationModule(identifier: stringId), animated: true)
    }
}

// MARK: - UISearchBarDelegate 
extension MiniPlaceVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        guard let searchString = searchBar.text else { return }

        presenter.fetchMiniPlaces(dataString: dateString(), query: searchString)
        presenter.minivenuesClean()
        tableView.reloadData()
    }
}

// MARK: - DatePicker
private extension MiniPlaceVC {
    
    private func showDatePicker() {
        datePicker.datePickerMode = .date
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onDoneDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(onCancelDatePicker))

        toolbar.sizeToFit()
        toolbar.setItems([doneButton, spaceButton, cancelButton], animated: false)
        
        datePikerTextField.inputAccessoryView = toolbar
        datePikerTextField.inputView = datePicker
    }
    
    @objc private func onDoneDatePicker() {
        datePikerTextField.text = dateString()
        searchBarSearchButtonClicked(searchBar)
        endEditing()
    }
    
    @objc private func onCancelDatePicker() {
        endEditing()
    }

    private func dateString() -> String {
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: datePicker.date)
    }
}

// MARK: - Setup
private extension MiniPlaceVC {

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        tableView.separatorColor = .clear
    }

    private func setupSearchBar() {
        searchBar.delegate = self
    }
}

// MARK: - ReloadDataDelegate
extension MiniPlaceVC: ReloadDataDelegate {

    func reloadData() {

        DispatchQueue.main.async { [weak self] in

            guard let strongSelf = self else { return }

            strongSelf.tableView.reloadData()
        }
    }
}
