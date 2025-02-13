//
//  CoursePoster.swift
//  VisionOSDemo
//

import SwiftUI

struct CoursePoster: View {
    let course: Course
    
    var body: some View {
        AsyncImage(url: course.poster) { image in
            image
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } placeholder: {
            Image(systemName: "video")
                .resizable()
                .scaledToFit()
                .padding()
                .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
}
