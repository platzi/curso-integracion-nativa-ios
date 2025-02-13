//
//  Interactor.swift
//  VisionOSDemo
//

import Foundation

protocol Interactor {
    func loadCourse() throws -> [Course]
}

struct DataInteractor: Interactor {
    func loadCourse() throws -> [Course] {
        guard let url = Bundle.main.url(forResource: "platziDB", withExtension: "json") else { return [] }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Course].self, from: data)
    }
}
