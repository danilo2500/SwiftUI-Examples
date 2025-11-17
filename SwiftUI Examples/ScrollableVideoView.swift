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
    
    static let mockVideos: [DisplayVideo] = [
        .init(url: URL(string: "https://files.vecteezy.com/system/resource/files/26489443/A0BC8E1C-59E1-4FEE-8624-C098F2C34BD1.mov?response-content-disposition=attachment%3Bfilename%3Dvecteezy_feeding-the-dog-at-home-smart-dog-salutation-every-time_26489443.mov&Expires=1763389404&Signature=Tscv~2OtYFZFnEyTSdsS3A9OSzkp6OwrdLGxJsk1anjl1m1k~0k4WJgbQPBepqj3FZoPJFv5Q6s7KyindYjWurlKAEZrxjLwh-rBcGeoCT4XRhSJfVko~1VbTecsLw3ft7-4QnhkxzDBkikWXkRy2Svb2hPJ5-xmdPkUWfHHNaUWZBK4hessSgMu2o~gLIRc0tez2FcliW7hEzWYhZie2nitMayHEbEHSiPvdyK3qi4KEOy7S~H1N8G80Nb82iofuDycubB2SYc07nT4limvnK7fk2sqYaAzOLuCdLKR8Km8sHVzUgUA3ybOneOQHfBz1JyCQx9jpNVmXsV5hH4XHQ__&Key-Pair-Id=K3714PYOSHV3HB")!),
        .init(url: URL(string: "https://files.vecteezy.com/system/resource/files/41288401/vecteezy_beautiful-girl-enjoying-music-pretty-young-woman-dancing__482.mp4?response-content-disposition=attachment%3Bfilename%3Dvecteezy_beautiful-girl-enjoying-music-pretty-young-woman-dancing_41288401.mp4&Expires=1763388904&Signature=S9MSMnb-hixVsqkmPGdbFWEyAuWYhMsbdrlvXCC2VR2-uQYDU4zdkB5ZjM1-8VEkIXvqorjRFb0-hPUWDGMnXrqDz5kDpbuJKIx7AbO82OPp2ll81appbPmbCoi1Sbov1tnwDZZKPqX1-50be-M64u9HfzVVq8BwTYwnHF~kkY~v3JKCDIclOE2gV00btDkRuVS~kpClBINu75TfHxoKhDgj4DL4fnqm9iKvjjl-QIHYF05rwxoIuPdltElBIV6QsO5wMI9xAvniVNpfhMdkKdLWED2t3lUCVqkBDk7A8RbXE1clbYFU5brWn05QkqdR3WBBMio1O1ye~K9bm0iVMA__&Key-Pair-Id=K3714PYOSHV3HB")!),
        .init(url: URL(string: "https://files.vecteezy.com/system/resource/files/16945468/vtg-1-32.mp4?response-content-disposition=attachment%3Bfilename%3Dvecteezy_vertical-video-beautiful-legs-business-woman-in-high-heeled_16945468.mp4&Expires=1763388076&Signature=Bl0ZV9~nqMNzYGJXwZ5f0GqaQruGbgcU6xc-golfR-ZAHkMZZrnnkUCFrEHz-cryusb3okO62wfV-0XMq0L5ee0eJBjU4EQcHDjgKnVGUHR9kfoRPcSTXz1WvXCrK3a6DSZFe15kK1hoxliN8uMcJwLQFWJcT0hcc5pdN6jQa-XDBuMQzKRBaSyOkNE4Fre9QW4zeFLeELDy3-Ib82yluFFDb7~Dl75enSUV2yqz0BYDgXgJni9yGwNDJse-feoOB4vbi~ufiKz2GG4oGmXjTBVgisRbXoZhi6h4sAl72PYa5AH~Vjc5Ur0lNUWs2iBeiD8EjihZ1EYdrBYxJo5DZQ__&Key-Pair-Id=K3714PYOSHV3HB")!),
        .init(url: URL(string: "https://files.vecteezy.com/system/resource/files/16968377/kaleidoscope_0071.mov?response-content-disposition=attachment%3Bfilename%3Dvecteezy_red-blue-neon-motion-background-vj-loop-vertical-looped-video_16968377.mov&Expires=1763388093&Signature=puvoniPCe1jXjSK19W~P8z7RcHCwgr1sLhR-DofhQLTtJq0FuCJUPY1CZyS2z5kqNAo~~v50TddmU05MDDOXDfjDcOOQxmvcEYC1mV8Lo3z82J3~Pit9Vb4kEUGrrQTxqMMUQ~O3dU9mkEW7BhoXP6eC8ZRo05BHYLca2ILSCDrqGjK8Pi-ugxnpR1vRbmivmyq3mDwQ99aN1OnjEm9~TNP2XfcyO04LPzGv3hNJl~0k12QDj0UpoT8P4J47hP8HyCz~jQ2gqfGzntO1xe0GwAVQ88d2jN4IvEwnn33tZ9asXqR6zqX~bq0~MNGMlH24PL5Z6Y7S0lA5Y-kQ~c19IA__&Key-Pair-Id=K3714PYOSHV3HB")!)
    ]
}

#Preview {
    ScrollableVideoView()
}
