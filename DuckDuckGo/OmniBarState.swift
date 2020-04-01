//
//  OmniBarState.swift
//  DuckDuckGo
//
//  Copyright © 2019 DuckDuckGo. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation
import Core

enum OmniBarLeftAccesory {
    case none
    case privacyGrade
    case loupe
}

enum OmniBarRightAccessory {
    case none
    case clear
    case cancel
    case refresh
}

protocol OmniBarState {
    var leftAccessory: OmniBarLeftAccesory { get }
    var rightAccessory: OmniBarRightAccessory { get }
    
    var showLeftSeparator: Bool { get }
    var showRightSeparator: Bool { get }
    
    var showLock: Bool { get }
    
    var clearTextOnStart: Bool { get }
    var showCancel: Bool { get }
    var showBackground: Bool { get }
    var showMenu: Bool { get }
    var showSettings: Bool { get }
    var name: String { get }
    var onEditingStoppedState: OmniBarState { get }
    var onEditingStartedState: OmniBarState { get }
    var onTextClearedState: OmniBarState { get }
    var onTextEnteredState: OmniBarState { get }
    var onBrowsingStartedState: OmniBarState { get }
    var onBrowsingStoppedState: OmniBarState { get }
}

struct HomeEmptyEditingState: OmniBarState {
    var clearTextOnStart = true
    var leftAccessory: OmniBarLeftAccesory = .loupe
    var rightAccessory: OmniBarRightAccessory = .none
    
    var showLeftSeparator = false
    var showRightSeparator = false
    
    let showLock = false
    
    let showBackground = false
    let showMenu = false
    let showSettings = false
    let showCancel: Bool = true
    var name: String { return Type.name(self) }
    var onEditingStoppedState: OmniBarState { return HomeNonEditingState() }
    var onEditingStartedState: OmniBarState { return self }
    var onTextClearedState: OmniBarState { return self }
    var onTextEnteredState: OmniBarState { return HomeTextEditingState() }
    var onBrowsingStartedState: OmniBarState { return BrowsingNonEditingState() }
    var onBrowsingStoppedState: OmniBarState { return self }
}

struct HomeTextEditingState: OmniBarState {
    var clearTextOnStart = false
    var leftAccessory: OmniBarLeftAccesory = .loupe
    var rightAccessory: OmniBarRightAccessory = .clear
    
    var showLeftSeparator = false
    var showRightSeparator = false
    
    let showLock = false
    
    let showBackground = false
    let showMenu = false
    let showSettings = false
    let showCancel: Bool = true
    var name: String { return Type.name(self) }
    var onEditingStoppedState: OmniBarState { return HomeNonEditingState() }
    var onEditingStartedState: OmniBarState { return self }
    var onTextClearedState: OmniBarState { return HomeEmptyEditingState() }
    var onTextEnteredState: OmniBarState { return self }
    var onBrowsingStartedState: OmniBarState { return BrowsingNonEditingState() }
    var onBrowsingStoppedState: OmniBarState { return HomeEmptyEditingState() }
}

struct HomeNonEditingState: OmniBarState {
    var clearTextOnStart = true
    var leftAccessory: OmniBarLeftAccesory = .loupe
    var rightAccessory: OmniBarRightAccessory = .none
    
    var showLeftSeparator = false
    var showRightSeparator = false
    
    let showLock = false
    
    let showBackground = true
    let showMenu = false
    let showSettings = true
    let showCancel: Bool = false
    var name: String { return Type.name(self) }
    var onEditingStoppedState: OmniBarState { return self }
    var onEditingStartedState: OmniBarState { return HomeEmptyEditingState() }
    var onTextClearedState: OmniBarState { return HomeEmptyEditingState() }
    var onTextEnteredState: OmniBarState { return HomeTextEditingState() }
    var onBrowsingStartedState: OmniBarState { return BrowsingNonEditingState() }
    var onBrowsingStoppedState: OmniBarState { return HomeNonEditingState() }
}

struct BrowsingEmptyEditingState: OmniBarState {
    var clearTextOnStart = true
    var leftAccessory: OmniBarLeftAccesory = .loupe
    var rightAccessory: OmniBarRightAccessory = .none
    
    var showLeftSeparator = false
    var showRightSeparator = false
    
    let showLock = false
    
    let showBackground = false
    let showMenu = false
    let showSettings = false
    let showCancel: Bool = true
    var name: String { return Type.name(self) }
    var onEditingStoppedState: OmniBarState { return BrowsingNonEditingState() }
    var onEditingStartedState: OmniBarState { return self }
    var onTextClearedState: OmniBarState { return self }
    var onTextEnteredState: OmniBarState { return BrowsingTextEditingState() }
    var onBrowsingStartedState: OmniBarState { return self }
    var onBrowsingStoppedState: OmniBarState { return HomeEmptyEditingState() }
}

struct BrowsingTextEditingState: OmniBarState {
    var clearTextOnStart = false
    var leftAccessory: OmniBarLeftAccesory = .none
    var rightAccessory: OmniBarRightAccessory = .clear
    
    var showLeftSeparator = false
    var showRightSeparator = false
    
    let showLock = false
    
    let showBackground = false
    let showMenu = false
    let showSettings = false
    let showCancel: Bool = true
    var name: String { return Type.name(self) }
    var onEditingStoppedState: OmniBarState { return BrowsingNonEditingState() }
    var onEditingStartedState: OmniBarState { return self }
    var onTextClearedState: OmniBarState { return BrowsingEmptyEditingState() }
    var onTextEnteredState: OmniBarState { return self }
    var onBrowsingStartedState: OmniBarState { return self }
    var onBrowsingStoppedState: OmniBarState { return HomeEmptyEditingState() }
}

struct BrowsingNonEditingState: OmniBarState {
    var clearTextOnStart = false
    var leftAccessory: OmniBarLeftAccesory = .privacyGrade
    var rightAccessory: OmniBarRightAccessory = .refresh
    
    var showLeftSeparator = true
    var showRightSeparator = true
    
    let showLock = true
    
    let showBackground = true
    let showMenu = true
    let showSettings = false
    let showCancel: Bool = false
    var name: String { return Type.name(self) }
    var onEditingStoppedState: OmniBarState { return self }
    var onEditingStartedState: OmniBarState { return BrowsingTextEditingState() }
    var onTextClearedState: OmniBarState { return BrowsingEmptyEditingState() }
    var onTextEnteredState: OmniBarState { return BrowsingTextEditingState() }
    var onBrowsingStartedState: OmniBarState { return self }
    var onBrowsingStoppedState: OmniBarState { return HomeNonEditingState() }
}
