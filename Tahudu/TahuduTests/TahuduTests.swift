//
//  TahuduTests.swift
//  TahuduTests
//

import XCTest
@testable import Tahudu

final class TahuduTests: XCTestCase {
    
    func testSettingsSectionsCount() {
        let vc = SettingsViewController(style: .insetGrouped)
        vc.loadViewIfNeeded()
        
        // проверяем что секций 2
        XCTAssertEqual(vc.numberOfSections(in: vc.tableView), 2)
    }
    
    func testSettingsFirstSectionItemsCount() {
        let vc = SettingsViewController(style: .insetGrouped)
        vc.loadViewIfNeeded()
        
        // проверяем что в первой секции 3 пункта
        XCTAssertEqual(vc.tableView(vc.tableView, numberOfRowsInSection: 0), 3)
    }
    
    func testMockDataCount() {
        let properties = Property.mockData()
        
        // проверяем что есть 4 объекта
        XCTAssertEqual(properties.count, 4)
    }
    
    func testMockDataHasImages() {
        let properties = Property.mockData()
        
        // проверяем что у каждого объекта есть картинки
        properties.forEach { property in
            XCTAssertFalse(property.imageURLs.isEmpty)
        }
    }
    
    func testSettingsSecondSectionItemsCount() {
        let vc = SettingsViewController(style: .insetGrouped)
        vc.loadViewIfNeeded()
        
        // проверяем что во второй секции 2 пункта
        XCTAssertEqual(vc.tableView(vc.tableView, numberOfRowsInSection: 1), 2)
    }
}
