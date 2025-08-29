//
//  FileEmoji.swift
//  emoji-list
//
//  Created by Armin Briegel on 2025-08-29.
//

import Foundation

enum FileEmoji: String {
  case application = "🧑‍💻"
  case directory = "📁"
  case executable = "🚀"
  case file = "📄"
  case link = "🔗"
  case volume = "💾"

  var string: String { rawValue }

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
    } else {
      .file
    }
  }
}
