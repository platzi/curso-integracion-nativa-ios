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
        
    }
}
