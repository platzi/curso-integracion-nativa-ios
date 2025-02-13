//
//  Course.swift
//  VisionOSDemo
//

import Foundation

struct Course: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let description: String
    let syllabus: String
    let level: String
    let teacher: String
    let score: Double
    let poster: URL
}
