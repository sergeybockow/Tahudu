// 
//  SettingsViewController.swift
//  Tahudu
//

import Foundation
import UIKit

struct SettingsItem {
    let title: String
    let icon: String
    let detailText: String?
    let accessibilityIdentifier: String?
    
    let action: () -> Void
    
    var cellStyle: UITableViewCell.CellStyle {
        return detailText == nil ? .default : .value1
    }
}

struct SettingsSection {
    let headerTitle: String?
    let settingItems: [SettingsItem]
}
    
class SettingsViewController: UITableViewController {
    
    private var sections: [SettingsSection] = []
    
    override func loadView() {
        super.loadView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGroupedBackground
        tableView.tableFooterView = UIView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingsCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sections = [
            SettingsSection(
                headerTitle: "General",
                settingItems: [
                    SettingsItem(
                        title: "Language",
                        icon: "textFormat",
                        detailText: nil,
                        accessibilityIdentifier: "SettingsCell_language",
                        action: { self.openSystemSettings() }
                    ),
                    SettingsItem(
                        title: "Country",
                        icon: "globe",
                        detailText: "United Arab Emirates",
                        accessibilityIdentifier: "SettingsCell_country",
                        action: { self.showCountrySelectionScreen() }
                    ),
                    SettingsItem(
                        title: "Notifications",
                        icon: "app.badge",
                        detailText: nil,
                        accessibilityIdentifier: "SettingsCell_notifications",
                        action: { self.showNotificationScreen() }
                    ),
                ]
            ),
            SettingsSection(
                headerTitle: "About",
                settingItems: [
                    SettingsItem(
                        title: "About",
                        icon: "info.circle",
                        detailText: nil,
                        accessibilityIdentifier: "SettingsCell_about",
                        action: { self.showAboutScreen() }
                    ),
                    SettingsItem(
                        title: "Feedback",
                        icon: "text.bubble",
                        detailText: nil,
                        accessibilityIdentifier: "SettnigsCell_feedback",
                        action: { self.showFeedbackScreen() }
                    )
                ]
            )
        ]
    }
    
    override func numberOfSections(in _: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].settingItems.count
    }
    
    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].settingItems[indexPath.row]
        
        let cell = UITableViewCell(style: item.cellStyle, reuseIdentifier: nil)
        
        cell.textLabel?.text = item.title
        cell.imageView?.image = UIImage(systemName: item.icon)
        cell.detailTextLabel?.text = item.detailText
        cell.accessibilityIdentifier = item.accessibilityIdentifier
        
        cell.backgroundColor = .systemBackground
        cell.selectionStyle = .default
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.textColor = .label
        cell.textLabel?.textAlignment = .natural
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = sections[indexPath.section].settingItems[indexPath.row]
        item.action()
    }
}

// ===============================

/// NO NEED TO TUOCH THIS!!!
extension SettingsViewController {
    private func openSystemSettings() {
        print(#function)
    }

    private func showCountrySelectionScreen() {
        print(#function)
    }

    private func showNotificationScreen() {
        print(#function)
    }

    private func showAboutScreen() {
        print(#function)
    }

    private func showFeedbackScreen() {
        print(#function)
    }
}
