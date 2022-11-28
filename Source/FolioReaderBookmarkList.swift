//
//  FolioReaderBookmarkList.swift
//  NFolioReaderKit
//
//  Created by Abdullah Shahid on 26/11/2022.
//

import UIKit

class FolioReaderBookmarkList: UITableViewController {
    
    var rowTapped: ((Int)->())?
    var rowDeleted: ((Int)->())?
    
    var bookmarks: [Bookmark]? {
        didSet {
            noDataLabel.isHidden = !(bookmarks ?? []).isEmpty
            tableView.reloadData()
        }
    }
    
    fileprivate var readerConfig: FolioReaderConfig
    fileprivate var folioReader: FolioReader
    
    private let noDataLabel = UILabel()
    
    init(folioReader: FolioReader, readerConfig: FolioReaderConfig) {
        self.readerConfig = readerConfig
        self.folioReader = folioReader
        
        super.init(style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init with coder not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        configureNoDataLabel()
        
        guard let bookId = (self.folioReader.readerContainer?.book.name as NSString?)?.deletingPathExtension else {
            self.bookmarks = []
            return
        }
    }
    
    private func configureTableView() {
        // Register cell classes
        self.tableView.register(FolioReaderBookmarkListCell.self, forCellReuseIdentifier: kReuseCellIdentifier)
        self.tableView.separatorInset = UIEdgeInsets.zero
        self.tableView.backgroundColor = self.folioReader.isNight(self.readerConfig.nightModeMenuBackground, self.readerConfig.menuBackgroundColor)
        self.tableView.separatorColor = self.folioReader.isNight(self.readerConfig.nightModeSeparatorColor, self.readerConfig.menuSeparatorColor)
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 50
    }
    
    private func configureNoDataLabel() {
        noDataLabel.text = "No Bookmarks"
        noDataLabel.textColor = .lightGray
        noDataLabel.isHidden = true
        
        view.addSubview(noDataLabel)
        noDataLabel.translatesAutoresizingMaskIntoConstraints = false
        noDataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noDataLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarks?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kReuseCellIdentifier, for: indexPath) as! FolioReaderBookmarkListCell
        cell.bookmarkName = bookmarks?[indexPath.row].name
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowTapped?(indexPath.row)
        self.dismiss()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            rowDeleted?(indexPath.row)
        }
    }
    
    // MARK: - Handle rotation transition
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        tableView.reloadData()
    }
}
