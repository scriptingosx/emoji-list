// emoji-list
//
// list directory contents using emoji
//
// Armin Briegel - 2025
//
// Permission is granted to use this code in any way you want.
// Credit would be nice, but not obligatory.
// Provided "as is", without warranty of any kind, express or implied.


// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import Foundation
import ArgumentParser

@main
struct emoji_list: ParsableCommand {
  // MARK: configuration

  static let configuration = CommandConfiguration(
    commandName: "emoji-list",
    abstract: "list directory contents using emoji",
    version: "0.2"
  )

  // MARK: flags

  @Flag(
    name: [.customShort("a"), .customLong("all")],
    help: ArgumentHelp(
      "include hidden items",
      discussion: "Uses the same logic for hidden files as Finder, which includes files starting with a dot (.), but also includes files with the hidden flag, such as ~/Library/."
    )
  )
  var showAll = false

  @Flag(
    name: [.customShort("b"), .customLong("bundles")],
    help: "list contents of bundles and packages"
  )
  var showBundles = false

  @Flag(
    name: .customLong("no-recursion"),
    help: "disable recursive listing of directories"
  )
  var noRecursion = false

  @Flag(
    name: .shortAndLong,
    help: "reverse the order of the sort"
  )
  var reverseSort = false

  // MARK: argument

  @Argument(
    help: ArgumentHelp("path to list", valueName: "path"),
    completion: .file()
  )
  var paths: [String] = ["."]


  // MARK: functions

  func spaces(_ count: Int) -> String {
    "".padding(toLength: count, withPad: " ", startingAt: 0)
  }

  func emoji(for url: URL) -> String {
    FileEmoji.emoji(for: url).string
  }

  func printItem(_ path: String, relativeTo parent: URL, indent: Int) {
    let url = URL(fileURLWithPath: path, relativeTo: parent)
    guard url.fileExists else { return }

    if url.isHidden && !showAll { return }

    print("\(spaces(indent * 3))\(emoji(for: url)) \(path)")

    if !noRecursion && url.isDirectory && (!url.isPackage || showBundles) {
      printItems(url.contents, relativeTo: url, indent: indent + 1)
    }
  }

  func printItems(_ paths: [String], relativeTo parent: URL, indent: Int) {
    // sort the items
    let sorted = paths.sorted { $0.localizedCompare($1) == (reverseSort ? .orderedDescending : .orderedAscending) }
    for path in sorted {
      printItem(path, relativeTo: parent, indent: indent)
    }
  }

  // MARK: run

  func run() {
    for (index, path) in paths.enumerated() {
      let cwd = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
      let url = URL(fileURLWithPath: path, relativeTo: cwd)

      if url.isDirectory {
        if paths.count > 1 {
          printItem(path, relativeTo: cwd, indent: 0)
        } else {
          printItems(url.contents, relativeTo: url,indent: 0)
        }
      } else {
        printItem(path, relativeTo: url, indent: 0)
      }

      // only print empty line between items
      if index < paths.count - 1 { print() }
    }
  }
}
