//
//  HSAudioPlayerLog.swift
//  HSAudioPlayer
//
//  Created by Hans Seiffert on 02.08.16.
//  Copyright © 2016 Hans Seiffert. All rights reserved.
//

import UIKit

// MARK: - HSAudioPlayerLog

func HSAudioPlayerLog(message: AnyObject = "", file: String = #file, function: String = #function, line: Int = #line) {
	#if DEBUG
		if (HSAudioPlayerLogSettings.Verbose == true) {
			if (HSAudioPlayerLogSettings.DetailedLog == true),
				let className = NSURL(string: file)?.lastPathComponent?.componentsSeparatedByString(".").first {
					let log = "\(NSDate()) - [\(className)].\(function)[\(line)]: \(message)"
					print(log)
			} else {
				print(message)
			}
		}
	#endif
}
