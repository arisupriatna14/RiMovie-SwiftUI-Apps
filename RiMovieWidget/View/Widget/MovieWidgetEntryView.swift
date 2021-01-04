//
//  MovieWidgetEntryView.swift
//  RiMovieWidgetExtension
//
//  Created by Ari Supriatna on 23/12/20.
//

import SwiftUI

struct MovieWidgetEntryView: View {
  
  let entry: MovieEntry
  @Environment(\.widgetFamily) var family
  
  var body: some View {
    switch family {
    case .systemSmall:
      EmptyView()
    case .systemMedium:
      MovieWidgetMedium(entry: entry)
    case .systemLarge:
      MovieWidgetLarge(entry: entry)
    @unknown default:
      EmptyView()
    }
  }
}

struct MovieWidgetEntryView_Previews: PreviewProvider {
  static var previews: some View {
    MovieWidgetEntryView(entry: .stub)
  }
}
