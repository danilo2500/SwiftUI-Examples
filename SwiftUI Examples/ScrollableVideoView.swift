//
//  ScrollableVideoView.swift
//  SwiftUI Examples
//
//  Created by Danilo Henrique on 17/11/25.
//


import SwiftUI
import AVKit

struct ScrollableVideoView: View {
    
    let videos = DisplayVideo.mockVideos
    
    @State var activeVideo: DisplayVideo?
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ForEach(videos) { video in
                    VideoPlayer(player: video.player)
                        .scaledToFill()
                        .containerRelativeFrame(.vertical)
                        .id(video)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .scrollPosition(id: $activeVideo)
        .onChange(of: activeVideo) { previous, current in
            current?.player.play()
            previous?.player.pause()
        }
        .onAppear {
            activeVideo = videos.first
        }
    }
    
}

struct DisplayVideo: Identifiable, Hashable, Equatable {
    let id: UUID
    let url: URL
    let player: AVPlayer
    
    init(id: UUID = UUID(), url: URL) {
        self.id = id
        self.url = url
        self.player = AVPlayer(url: url)
    }
    
    static let mockVideos: [DisplayVideo] = {
        var videos: [DisplayVideo] = []
        for _ in 0...10 {
            videos.append(.init(url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!))
        }
        return videos
    }()
}

#Preview {
    ScrollableVideoView()
}
