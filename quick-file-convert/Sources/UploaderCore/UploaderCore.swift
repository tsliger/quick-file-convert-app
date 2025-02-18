//
//  UploaderCore.swift
//  quick-file-convert
//
//  Created by thomas sliger on 2/17/25.
//
import ComposableArchitecture
import Foundation

struct File: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var ext: String
    var type: String
    var fullPath: URL?
 }

@Reducer
struct Uploader {
    @ObservableState
     struct State: Equatable {
         var files: [File] = []
     }
     enum Action {
         case addFile(URL)
         case test
    }
    
     var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .addFile(let url):
                addToFiles(state: &state, url: url)
                return .none
            case .test:
                debugPrint("hit test")
                return .none
            }
        }
    }
    
    func parseFile(url: URL) -> File {
        let fileName = url.deletingPathExtension().lastPathComponent
        let fileExtension = url.pathExtension.lowercased()
        var fileType: String = ""
        
        switch fileExtension {
        case "png", "jpg", "jpeg", "gif", "webp":
            fileType = "Image"
            break
        default:
            break
        }
        
        return File(name: fileName, ext: fileExtension, type: fileType,  fullPath: url)
    }
    
    func addToFiles(state: inout State, url: URL) {
        let file = parseFile(url: url)
        state.files.append(file)
        
        for file in state.files {
            debugPrint(file.name, file.ext, file.type)
        }
    }
}
