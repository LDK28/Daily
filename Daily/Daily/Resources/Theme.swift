//
//  Theme.swift
//  Daily
//
//  Created by Арсений Токарев on 20.10.2020.
//

import UIKit

// MARK: - Main And general
extension UIColor {
	
    static var dailyMainBackgroundColor: UIColor {
            colorForTheme(light: UIColor("D8F3FF"), dark: UIColor("034561"))
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
	
	static var dailyPlusButtonBlackoutColor = UIColor("000000", alpha: 0.6)
	
	static var dailyMoreButtonBlackoutColor = UIColor("000000", alpha: 0.3)
	
	static var dailyShadowColor: CGColor {
		colorForTheme(light: UIColor.black, dark: .clear).cgColor
	}
	
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

//MARK: - Diary
extension UIColor {

	static var dailyDiaryTileColor: UIColor {
		colorForTheme(light: UIColor("0B3954", alpha: 0.3), dark: UIColor("82C1DF", alpha: 0.3))
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
}

//MARK: - Ideas
extension UIColor {
	static var dailyIdeasTileColor: UIColor {
		colorForTheme(light: UIColor("0B3954", alpha: 0.5), dark: UIColor("82C1DF", alpha: 0.5))
	}
	
	static var dailyFinishedProjectsCounterColor: UIColor {
		colorForTheme(light: UIColor("34C759"), dark: UIColor("30D158"))
	}
	
	static var dailyInProcessProjectsCounterColor: UIColor {
		colorForTheme(light: UIColor("FF375F"), dark: UIColor("FF376A"))
	}
	
	static var dailyNoteTextFieldTextColor = dailyTextColor
	
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
	
}

//MARK: - Profile
extension UIColor {
	static var dailyProfileTileColor: UIColor {
		colorForTheme(light: UIColor("0B3954").withAlphaComponent(0.05),
					  dark: UIColor("82C1DF").withAlphaComponent(0.25))
	}
}

//MARK: - Calendar
extension UIColor {
    static var dailyCalendarBackgroundColor: UIColor {
        colorForTheme(light: UIColor.white, dark: UIColor("1C1C1E"))
    }
}

//MARK: - Login Page
extension UIColor {
	static var dailyLoginButtonColor = UIColor("82C1DF")
	
	static var dailySignupButtonColor = UIColor("82C1DF", alpha: 0.5)
	
}

//MARK: - Overlay
extension UIColor {
	static var dailyOverlayButtonTextColor: UIColor {
		colorForTheme(light: UIColor("292929"), dark: UIColor("F9F9F9"))
	}
	
	static var dailyOverlayButtonTileColor: UIColor {
		colorForTheme(light: UIColor("F9F9F9"), dark: UIColor("292929"))
	}
	
	static var dailyOverlayTextFieldTextColor = dailyOverlayButtonTextColor
	
	static var dailyOverlayTextFieldColor = dailyOverlayButtonTileColor
}

//MARK: - Adaptive Colors
extension UIColor {
	static var dailyAdaptiveGreen = UIColor.systemGreen
	
	static var dailyAdaptiveRed: UIColor {
		colorForTheme(light: UIColor("FF375F"), dark: UIColor("FF376A"))
	}
	
	static var dailyAdaptiveBlue: UIColor {
		colorForTheme(light: UIColor("0084FF"), dark: UIColor("3DA3FF"))
	}
	
	static var dailyAdaptiveBlue2: UIColor {
		colorForTheme(light: UIColor("5AC8FA"), dark: UIColor("64D2FF"))
	}
	
	static var dailyAdaptiveDarkBlue = UIColor("0B3954")
	
	static var dailyAdaptiveYellow: UIColor {
		colorForTheme(light: UIColor("FFCC00"), dark: UIColor("FFD60A"))
	}
	
	static var dailyAdaptiveGray = UIColor("AEAEB2")
	
}
