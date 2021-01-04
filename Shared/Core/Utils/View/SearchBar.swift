//
//  SearchBar.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import SwiftUI

struct SearchBar<Content: View>: UIViewControllerRepresentable {
  
  @Binding var text: String
  var content: () -> Content
  
  func makeUIViewController(context: Context) -> UINavigationController {
    let navigationController = UINavigationController(rootViewController: context.coordinator.rootViewController)
    navigationController.navigationBar.prefersLargeTitles = true
    navigationController.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
    
    context.coordinator.searchController.searchBar.delegate = context.coordinator
    
    return navigationController
  }
  
  func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    context.coordinator.update(content: content())
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(content: content(), searchText: $text)
  }
  
  class Coordinator: NSObject, UISearchBarDelegate {
    @Binding var text: String
    let rootViewController: UIHostingController<Content>
    let searchController = UISearchController(searchResultsController: nil)
    
    init(content: Content, searchText: Binding<String>) {
      rootViewController = UIHostingController(rootView: content)
      searchController.searchBar.autocapitalizationType = .none
      searchController.obscuresBackgroundDuringPresentation = false
      rootViewController.navigationItem.searchController = searchController
      
      _text = searchText
    }
    
    func update(content: Content) {
      rootViewController.rootView = content
      rootViewController.view.setNeedsDisplay()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      text = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
      text = ""
    }
  }
}
