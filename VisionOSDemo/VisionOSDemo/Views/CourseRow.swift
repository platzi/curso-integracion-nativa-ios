//
//  CourseRow.swift
//  VisionOSDemo
//

import SwiftUI

struct CourseRow: View {
    let course: Course
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(course.title)
            Text(course.teacher)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .tag(course)
    }
}

#Preview {
    
}
