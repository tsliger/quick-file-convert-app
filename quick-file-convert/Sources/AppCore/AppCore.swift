//
//  AppCore.swift
//  quick-file-convert
//
//  Created by thomas sliger on 2/17/25.
//
//
import ComposableArchitecture
import Foundation

@Reducer
public enum QuickFileConvert {
//    case addFile(URL)
    case convertFile
    case conversionCompleted
   
    public static var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .convertFile:
                return .none
                
            case .conversionCompleted:
                return .none
                
            default:
                return .none
            }
        }
    }
}
extension QuickFileConvert.State: Equatable {}
