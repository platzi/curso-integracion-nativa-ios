//
//  ContentView.swift
//  VisionOSDemo
//

import SwiftUI

struct ContentView: View {
    @Environment(CoursesVM.self) private var coursesVM
    
    var body: some View {
        @Bindable var bvm = coursesVM
        
        NavigationSplitView {
            List(selection: $bvm.selection) {
                ForEach(coursesVM.courses) { course in
                    CourseRow(course: course)
                }
            }
            .navigationTitle("Courses")
        } detail: {
            if let selection = coursesVM.selection {
                CourseDetail(course: selection)
            } else {
                ContentUnavailableView("Nunca pares de aprender",
                                       image: "platzi", description: Text("Selecciona un curso de la izquierda"))
            }
        }
    }
}

#Preview {
}
