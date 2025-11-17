//
//  ContentView.swift
//  SwiftUI Examples
//
//  Created by Danilo Henrique on 15/11/25.
//

import SwiftUI
import AVKit

struct MainView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Gradients") {
                    GradientExamplesView()
                }
                NavigationLink("Scrollable Video") {
                    ScrollableVideoView()
                }
            }
            .navigationTitle("SwiftUI Examples")
        }
    }
}

struct ScrollableVideoView: View {
    
    struct DisplayVideo: Identifiable {
        let id: UUID
        let url: URL
        let player: AVPlayer
        
        init(id: UUID = UUID(), url: URL) {
            self.id = id
            self.url = url
            self.player = AVPlayer(url: url)
        }
    }
    
    private static let demoVideos: [DisplayVideo] = [
        .init(url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8")!),
        .init(url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8")!),
        .init(url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8")!),
        .init(url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8")!),
        .init(url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8")!),
        .init(url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8")!)
    ]
    
    private let videos = Self.demoVideos
    @State private var activeVideoID: DisplayVideo.ID? = Self.demoVideos.first?.id
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(videos) { video in
                    VideoPlayer(player: video.player)
                        .containerRelativeFrame(.vertical)
                        .id(video.id)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .scrollPosition(id: $activeVideoID)
        .ignoresSafeArea()
        .onChange(of: activeVideoID, initial: true) { previous, current in
            previous
            if previous != current {
                pauseVideo(id: previous)
            }
            guard let current else {
                return
            }
            playVideo(id: current)
        }
    }
    
    private func playVideo(id: DisplayVideo.ID) {
        guard let video = videos.first(where: { $0.id == id }) else {
            return
        }
        video.player.play()
    }
    
    private func pauseVideo(id: DisplayVideo.ID?) {
        guard let id, let video = videos.first(where: { $0.id == id }) else {
            return
        }
        video.player.pause()
    }
    
}

#Preview {
    ScrollableVideoView()
}


#Preview {
    MainView()
}
