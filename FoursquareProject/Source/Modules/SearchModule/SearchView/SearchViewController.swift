//
//  ThirdViewController.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 3/19/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var enterTextField: UITextField!
    @IBOutlet private weak var chooseRadiusTextField: UITextField!
    @IBOutlet private weak var chooseRadiusLabel: UILabel!

    // MARK: - Property
    var output: SearchViewOutputProtocol?
    var dataSource: SearchDataSource?
    
    // MARK: - Life Cycle View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        dataSource?.delegate = self
        output?.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        coordinator = Coordinator(navigationController!)
        tableView.refreshControl = myRefreshControl
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setupTextFields()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        output?.viewWillAppear()
    }

    let myRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        let title = NSLocalizedString("Wait a second", comment: "")
        refreshControl.attributedTitle = NSAttributedString(string: title)
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()

    @objc func refresh(sender: UIRefreshControl) {
        tableView.reloadData()
        sender.endRefreshing()
    }
}

// MARK: - Tapping
extension SearchViewController: Tapping {
    func didTap(stringId: String) {
        coordinator?.routeToInformation(stringId)
    }
}

// MARK: - SearchViewInputProtocol
extension SearchViewController: SearchViewInputProtocol {

    func reloadData() {
        tableView.reloadData()
    }

    func showDefaultValueChooseTF(_ value: String) {
        chooseRadiusTextField.text = value
    }

    func showChangeValue(query: String) {

        if enterTextField.text == "" {
            enterTextField.text = query
            output?.viewOnTextfieldValueChange(query, radius: chooseRadiusTextField.text)
        } else {
            output?.viewOnTextfieldValueChange(enterTextField.text, radius: chooseRadiusTextField.text)
        }

        output?.searchCellStatesClean()
        tableView.reloadData()
    }

    func isEmptyTextField() -> Bool? {
        return output?.viewIsEmptyTextFields(enterTextField.text, chooseRadiusTFtext: chooseRadiusTextField.text) ?? false
    }
}

// MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return output?.viewIsEditTF(textField.text, string: string, isEdit: chooseRadiusTextField.isEditing) ?? false
    }
}

// MARK: - Methods
private extension SearchViewController {

    private func setupTableView() {
        dataSource = SearchDataSource(tableView: tableView)
        dataSource?.dataSourceOutput = output as? SearchDatasourceProtocol
        tableView.setupUITableView()
    }

    private func setupTextFields() {
        enterTextField.delegate = self
        chooseRadiusTextField.delegate = self

        if enterTextField.text == "" {
            enterTextField.becomeFirstResponder()
        }
    }
}

// MARK: - Actions
private extension SearchViewController {

    @IBAction private func onChangeValueRadius(_ textField: UITextField) {
        showChangeValue(query: textField.text ?? "")
    }

    @IBAction private func changeValuePlace(_ sender: UITextField) {
        showChangeValue(query: sender.text ?? "")
    }
}
