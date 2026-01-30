//
//  Buttons.swift
//  SwiftCraft
//
//  Created by Michael Mueller on 1/30/26.
//

extension SCAppearance {
    
    public struct Buttons {
        private var _primary: ButtonAppearance?
        private var _secondary: ButtonAppearance?
        private var _tertiary: ButtonAppearance?
        private var _outline: ButtonAppearance?

        public var primary: ButtonAppearance {
            get { _primary ?? ButtonAppearance.defaultPrimaryConfiguration() }
            set { _primary = newValue }
        }
        public var secondary: ButtonAppearance {
            get { _secondary ?? ButtonAppearance.defaultSecondaryConfiguration() }
            set { _secondary = newValue }
        }
        public var tertiary: ButtonAppearance {
            get { _tertiary ?? ButtonAppearance.defaultTertiaryConfiguration() }
            set { _tertiary = newValue }
        }
        public var outline: ButtonAppearance {
            get { _outline ?? ButtonAppearance.defaultOutlineConfiguration() }
            set { _outline = newValue }
        }

        public init() {}
    }

    
}
