//
//  HSEMusicLibraryViewController.swift
//  Example
//
//  Created by Hans Seiffert on 02.08.16.
//  Copyright © 2016 Hans Seiffert. All rights reserved.
//

import UIKit
import HSAudioPlayer
import MediaPlayer

class HSEMusicLibraryViewController: UIViewController {

	var data		: [MPMediaItem]	= []

	override func viewDidLoad() {
		super.viewDidLoad()

		HSAudioPlayer.sharedInstance.setup()

		let tempData = MPMediaQuery.songsQuery().items ?? []
		self.data = []
		for mediaItem in tempData {
			if (mediaItem.cloudItem == false && mediaItem.assetURL != nil) {
				self.data.append(mediaItem)
				if (self.data.count >= 20) {
					break
				}
			}
		}
	}
}

// MARK: - UITableView delegates

extension HSEMusicLibraryViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.data.count
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("musicLibraryCell", forIndexPath: indexPath)
		cell.textLabel?.text = self.data[indexPath.row].title
		return cell
	}

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)

		HSAudioPlayer.sharedInstance.play(mediaItems: self.data, startPosition: indexPath.row)
	}
}
