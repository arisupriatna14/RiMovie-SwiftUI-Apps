//
//  RiMovieWidget.swift
//  RiMovieWidget
//
//  Created by Ari Supriatna on 23/12/20.
//

import WidgetKit
import SwiftUI

@main
struct RiMovieWidget: Widget {
  let kind: String = "RiMovieWidget"
  
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: MovieProvider()) { entry in
      MovieWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("Upcoming")
    .description("Keep watching the latest movies that will be released soon.")
    .supportedFamilies([.systemMedium, .systemLarge])
  }
}

struct RiMovieWidget_Previews: PreviewProvider {
  static var previews: some View {
    MovieWidgetEntryView(entry: .stub)
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
