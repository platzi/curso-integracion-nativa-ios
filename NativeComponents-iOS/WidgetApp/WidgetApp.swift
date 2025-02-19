//
//  WidgetApp.swift
//  WidgetApp
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct WidgetAppEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        HStack {
            Image("deadpool")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 5) {
                Text("Deadpool & Wolverine")
                    .font(.headline)
                    .bold()
                    .lineLimit(1)
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                        .font(.caption)
                }
                Text("Deadpool is offered a place in the MCU by the Time Variance Authority (TVA), but instead recruits a version of Wolverine to save his universe. Deadpool kidnaps another version of Wolverine, but Paradox banishes both Deadpool and Wolverine. Deadpool and Wolverine must then team up to defeat Cassandra Nova, a supervillain who wants to destroy all timelines.")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(3)
            }
        }
    }
}

struct WidgetApp: Widget {
    let kind: String = "WidgetApp"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                WidgetAppEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                WidgetAppEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    WidgetApp()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
