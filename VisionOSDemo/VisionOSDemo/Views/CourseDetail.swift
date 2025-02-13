//
//  CourseDetail.swift
//  VisionOSDemo
//

import SwiftUI

struct CourseDetail: View {
    @Environment(\.openWindow) private var open
    let course: Course
    
    var body: some View {
        ScrollView {
            HStack(alignment: .top) {
                VStack {
                    AsyncImage(url: course.poster) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 350, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } placeholder: {
                        Image(systemName: "image")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .frame(width: 150, height: 250)
                            .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Button {
                        open(id: "poster")
                    } label: {
                        Text("Mostrar poster")
                    }
                    Text(course.teacher)
                        .font(.title)
                        .padding(.top, 30)
                    RatingBar(rating: course.score)
                }
                
                VStack(alignment: .leading) {
                    Text(course.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom)
                    Text(course.level)
                        .font(.subheadline)
                        .padding(.bottom)
                    Text("Descripción")
                        .fontWeight(.bold)
                        .padding(.bottom)
                    Text(course.description)
                        .padding(.bottom)
                    Text("Contenido")
                        .fontWeight(.bold)
                        .padding(.bottom)
                    Text(course.syllabus)
                }
                .padding(.leading)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationTitle(course.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

struct RatingBar: View {
    var rating: Double
    let maxRating: Int = 5
    let starSize: CGFloat = 40

    var body: some View {
        HStack {
            ForEach(1...maxRating, id: \.self) { index in
                Image(systemName: starType(for: Double(index)))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: starSize, height: starSize)
                    .foregroundColor(.yellow)
                    
            }
        }
    }

    private func starType(for starIndex: Double) -> String {
        if rating >= starIndex {
            return "star.fill"
        } else if rating + 0.5 >= starIndex {
            return "star.leadinghalf.filled"
        } else {
            return "star"
        }
    }
}
#Preview {
    NavigationStack {
    }
}
