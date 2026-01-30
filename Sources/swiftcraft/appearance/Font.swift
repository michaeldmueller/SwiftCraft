//
//  Font.swift
//  SwiftCraft
//
//  Created by Michael Mueller on 1/30/26.
//

import UIKit

extension SCAppearance {

    public struct Font {
        internal var _largeTitle: UIFont = UIFont.systemFont(ofSize: 32.0, weight: .regular)
        internal var _title1: UIFont = UIFont.systemFont(ofSize: 28.0, weight: .regular)
        internal var _title2: UIFont = UIFont.systemFont(ofSize: 20.0, weight: .regular)
        internal var _title3: UIFont = UIFont.systemFont(ofSize: 18.0, weight: .regular)
        internal var _headline: UIFont = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        internal var _body: UIFont = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        internal var _callout: UIFont = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        internal var _subheadline: UIFont = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        internal var _footnote: UIFont = UIFont.systemFont(ofSize: 13.0, weight: .regular)
        internal var _caption1: UIFont = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        internal var _caption2: UIFont = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        
        // By default, SwiftCraft will provide scaled fonts as this is the recommended
        // practice for accessibility by Apple. If fixed font sizes are required, use
        // SC.appearance.font.fixed (ex: SC.appearance.font.fixed.callout)
        public var largeTitle: UIFont {
            get { UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: _largeTitle) }
            set { _largeTitle = newValue }
        }

        public var title1: UIFont {
            get { UIFontMetrics(forTextStyle: .title1).scaledFont(for: _title1) }
            set { _title1 = newValue }
        }

        public var title2: UIFont {
            get { UIFontMetrics(forTextStyle: .title2).scaledFont(for: _title2) }
            set { _title2 = newValue }
        }

        public var title3: UIFont {
            get { UIFontMetrics(forTextStyle: .title3).scaledFont(for: _title3) }
            set { _title3 = newValue }
        }

        public var headline: UIFont {
            get { UIFontMetrics(forTextStyle: .headline).scaledFont(for: _headline) }
            set { _headline = newValue }
        }

        public var body: UIFont {
            get { UIFontMetrics(forTextStyle: .body).scaledFont(for: _body) }
            set { _body = newValue }
        }

        public var callout: UIFont {
            get { UIFontMetrics(forTextStyle: .callout).scaledFont(for: _callout) }
            set { _callout = newValue }
        }

        public var subheadline: UIFont {
            get { UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: _subheadline) }
            set { _subheadline = newValue }
        }

        public var footnote: UIFont {
            get { UIFontMetrics(forTextStyle: .footnote).scaledFont(for: _footnote) }
            set { _footnote = newValue }
        }

        public var caption1: UIFont {
            get { UIFontMetrics(forTextStyle: .caption1).scaledFont(for: _caption1) }
            set { _caption1 = newValue }
        }

        public var caption2: UIFont {
            get { UIFontMetrics(forTextStyle: .caption2).scaledFont(for: _caption2) }
            set { _caption2 = newValue }
        }

        // Fixed fonts, available with usage SC.appearance.font.fixed
        public var fixed: FixedFont { FixedFont(font: self) }

        public struct FixedFont {
            private let font: Font

            internal init(font: Font) {
                self.font = font
            }

            public var largeTitle: UIFont { font._largeTitle }
            public var title1: UIFont { font._title1 }
            public var title2: UIFont { font._title2 }
            public var title3: UIFont { font._title3 }
            public var headline: UIFont { font._headline }
            public var body: UIFont { font._body }
            public var callout: UIFont { font._callout }
            public var subheadline: UIFont { font._subheadline }
            public var footnote: UIFont { font._footnote }
            public var caption1: UIFont { font._caption1 }
            public var caption2: UIFont { font._caption2 }
        }

        public init() {}
    }
}
