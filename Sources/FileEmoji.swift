//
//  FileEmoji.swift
//  emoji-list
//
//  Created by Armin Briegel on 2025-08-29.
//

import Foundation
import UniformTypeIdentifiers

enum FileEmoji: Int {
  static let defaultMap: String = "🧑‍💻📁🚀📄🔗💾🖼️📦🎥📝🛠️"

  case application
  case directory
  case executable
  case file
  case link
  case volume
  case image
  case installer
  case movie
  case text
  case code

  func string(withMap map: String) -> String {
    return String(map[rawValue])
  }

  static func emoji(for url: URL) -> FileEmoji {
    if url.isSymbolicLink {
      .link
    } else if url.isApplication {
      .application
    } else if url.isVolume {
      .volume
    } else if url.isDirectory {
      .directory
    } else if url.isExecutable {
      .executable
    } else if url.contentType?.conforms(to: .image) ?? false {
      .image
    } else if url.contentType?.conforms(to: .movie) ?? false {
      .movie
    } else if url.contentType?.conforms(to: .text) ?? false {
      .text
    } else if url.contentType?.conforms(to: .sourceCode) ?? false {
      .code
    } else if url.contentType?.conforms(to: UTType("com.apple.installer-package-archive")!) ?? false {
      .installer
    }
    else {
      .file
    }
  }
}
