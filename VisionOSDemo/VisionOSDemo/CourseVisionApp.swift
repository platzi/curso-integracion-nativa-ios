//
//  CourseVisionApp.swift
//  VisionOSDemo
//

import SwiftUI

@main
struct CourseVisionApp: App {
    @State var coursesVM = CoursesVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(coursesVM)
        }
        WindowGroup(id: "poster") {
            if let selection = coursesVM.selection {
                CoursePoster(course: selection)
            }
        }
        .defaultSize(CGSize(width: 200, height: 200))
    }
}
