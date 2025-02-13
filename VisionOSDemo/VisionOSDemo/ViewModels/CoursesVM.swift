//
//  CoursesVM.swift
//  VisionOSDemo
//

import SwiftUI

@Observable
final class CoursesVM {
    let interactor: Interactor
    
    var courses: [Course]
    
    var selection: Course?
    
    init(interactor: Interactor = DataInteractor()) {
        self.interactor = interactor
        do {
            courses = try interactor.loadCourse()
        } catch {
            courses = []
        }
    }
}
