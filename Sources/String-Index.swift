//
//  File.swift
//  emoji-list
//
//  Created by Armin Briegel on 2025-09-09.
//

import Foundation

extension String {
  subscript(_ characterIndex: Int) -> Character {
    return self[index(startIndex, offsetBy: characterIndex)]
  }
}
