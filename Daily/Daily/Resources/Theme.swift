//
//  Theme.swift
//  Daily
//
//  Created by Арсений Токарев on 20.10.2020.
//

import UIKit


extension UIColor {
	
    static var dailyMainBackgroundColor: UIColor {
            colorForTheme(light: UIColor("D8F3FF"), dark: UIColor("034561"))
    }
	
	static var dailyDiaryTileColor: UIColor {
		colorForTheme(light: UIColor("0B3954", alpha: 0.3), dark: UIColor("82C1DF", alpha: 0.3))
	}
	
	static var dailyTitleTextColor: UIColor {
		colorForTheme(light: UIColor("0E79AB"), dark: UIColor("FFFFFE"))
	}
	
	static var dailySubtitleTextColor: UIColor {
		colorForTheme(light: UIColor("00171F"), dark: UIColor("FFFFFE"))
	}
	
	static var dailyTextColor: UIColor {
		colorForTheme(light: UIColor("0B3954"), dark: UIColor("FFFFFE"))
	}
	
	static var dailyTabBarColor: UIColor {
		colorForTheme(light: UIColor("82C1DF"), dark: UIColor("0B3954"))
	}
	
	static var dailyTabBarItemColor = UIColor("F2F9FC")
	
	static var dailyTabBarSelectedItemColor: UIColor {
		colorForTheme(light: UIColor("0B3954"), dark: UIColor("82C1DF"))
	}
	
	static var dailyNotificationClockOffColor: UIColor {
		return dailySubtitleTextColor
	}
	
	static var dailyNotificationClockOnColor: UIColor {
		colorForTheme(light: UIColor("0084FF"), dark: UIColor("3DA3FF"))
	}
	
	static var dailyUpcommingTaskTimeColor: UIColor {
		colorForTheme(light: UIColor("FF375F"), dark: UIColor("FF7E6A"))
	}
	
	static var dailyTaskTimeColor: UIColor {
		colorForTheme(light: UIColor("2081AD"), dark: UIColor("DDD1EF"))
	}
	
	static var dailyIdeasTileColor: UIColor {
		colorForTheme(light: UIColor("0B3954", alpha: 0.5), dark: UIColor("82C1DF", alpha: 0.5))
	}
	
	static var dailyFinishedProjectsCounterColor: UIColor {
		colorForTheme(light: UIColor("34C759"), dark: UIColor("30D158"))
	}
	
	static var dailyInProcessProjectsCounterColor: UIColor {
		colorForTheme(light: UIColor("FF375F"), dark: UIColor("FF376A"))
	}
	
	static var dailyRecentActionsTextColor = UIColor("0B3954", alpha: 0.6)
	
    static var dailyRecentActionsPadColor = UIColor("FFFFFF", alpha: 0.5)
	
	static var dailyProjectTileColor: UIColor {
		colorForTheme(light: UIColor("0B3954", alpha: 0.3), dark: UIColor("82C1DF", alpha: 0.3))
	}
	
	static var dailyProjectTaskTileColor: UIColor {
		colorForTheme(light: UIColor("0B3954", alpha: 0.05), dark: UIColor("82C1DF", alpha: 0.1))
	}
	
	static var dailyUnpinnedNoteTileColor = dailyProjectTaskTileColor
	static var dailyPinnedNoteTileColor: UIColor {
		colorForTheme(light: UIColor("0B3954", alpha: 0.2), dark: UIColor("82C1DF", alpha: 0.3))
	}
	
	static var dailyFoldUnfoldTileColor: UIColor {
		colorForTheme(light: UIColor("0B3954", alpha: 0.25), dark: UIColor("82C1DF", alpha: 0.25))
	}
	
	
	static var dailyAdaptiveGreen = UIColor.systemGreen
	
	static var dailyAdaptiveRed: UIColor {
		colorForTheme(light: UIColor("FF375F"), dark: UIColor("FF376A"))
	}
	
	static var dailyAdaptiveBlue: UIColor {
		colorForTheme(light: UIColor("0084FF"), dark: UIColor("3DA3FF"))
	}
	
	static var dailyAdaptiveYellow: UIColor {
		colorForTheme(light: UIColor("FFCC00"), dark: UIColor("FFD60A"))
	}
	
	static var dailyPlusButtonBlackoutColor = UIColor("000000", alpha: 0.6)
	
	static var dailyMoreButtonBlackoutColor = UIColor("000000", alpha: 0.3)
	
	static var dailyShadowColor: CGColor {
		colorForTheme(light: UIColor.black, dark: .clear).cgColor
	}
    
    static var dailyCalendarBackgroundColor: UIColor {
        colorForTheme(light: UIColor.white, dark: UIColor("1C1C1E"))
    }
	
	static var dailyLoginButtonColor = UIColor("82C1DF")
	
	static var dailySignupButtonColor = UIColor("82C1DF", alpha: 0.5)
	
	static var dailyOverlayButtonTextColor: UIColor {
		colorForTheme(light: UIColor("292929"), dark: UIColor("F9F9F9"))
	}
	
	static var dailyOverlayButtonTileColor: UIColor {
		colorForTheme(light: UIColor("F9F9F9"), dark: UIColor("292929"))
	}
	
	static var dailyOverlayTextFieldTextColor = dailyOverlayButtonTextColor
	
	static var dailyOverlayTextFieldColor = dailyOverlayButtonTileColor
	
	static var dailyNoteTextFieldTextColor = dailyTextColor
	
	static var dailyPlaceholderColor = dailyOverlayTextFieldTextColor.withAlphaComponent(0.5)
	
	static func colorForTheme(light: UIColor, dark: UIColor) -> UIColor {
		if #available(iOS 13, *) {
			return UIColor.init { traitCollection in
				return traitCollection.userInterfaceStyle == .dark ? dark : light
			}
		} else {
			return light
		}
	}
}
