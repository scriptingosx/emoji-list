//
//  URL-Extensions.swift
//  emoji-list
//
//  Created by Armin Briegel on 2025-08-29.
//

import Foundation
import UniformTypeIdentifiers

extension URL {
  var isDirectory: Bool {
    (try? resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true
  }

  var isExecutable: Bool {
    (try? resourceValues(forKeys: [.isExecutableKey]))?.isExecutable == true
  }

  var isSymbolicLink: Bool {
    (try? resourceValues(forKeys: [.isSymbolicLinkKey]))?.isSymbolicLink == true
  }

  var isAliasFile: Bool {
    (try? resourceValues(forKeys: [.isAliasFileKey]))?.isAliasFile == true
  }

  var isApplication: Bool {
    (try? resourceValues(forKeys: [.isApplicationKey]))?.isApplication == true
  }

  var isPackage: Bool {
    (try? resourceValues(forKeys: [.isPackageKey]))?.isPackage == true
  }

  var isVolume: Bool {
    (try? resourceValues(forKeys: [.isVolumeKey]))?.isVolume == true
  }

  var isHidden: Bool {
    (try? resourceValues(forKeys: [.isHiddenKey]))?.isHidden == true
  }

  var contentType: UTType? {
    (try? resourceValues(forKeys: [.contentTypeKey]))?.contentType
  }

  var fileExists: Bool {
    (try? checkResourceIsReachable()) ?? false
  }

  var contents: [String] {
    guard isDirectory else { return [] }
    return (try? FileManager.default.contentsOfDirectory(atPath: path)) ?? []
  }
}
