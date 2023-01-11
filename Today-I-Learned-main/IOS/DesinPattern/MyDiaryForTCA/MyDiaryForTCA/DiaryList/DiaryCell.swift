//
//  DiaryCell.swift
//  MyDiaryForTCA
//
//  Created by JeongMin Ko on 2023/01/10.
//

import SwiftUI

struct DiaryCell: View {
    private let diary: Diary
    
    public init(diary: Diary) {
        self.diary = diary
    }

    public var body: some View {
        if diary.contentType().isMemo {
            MemoCell(diary: diary)
        } else {
            EpisodeCell(diary: diary)
        }
    }
}

struct DiaryCell_Previews: PreviewProvider {
    static var memoDary = Diary(title: "memo", content: "content")
    static var episordDary = Diary(title: "episord", content: "content")
    static var previews: some View {
        MemoCell(diary: Self.memoDary)
        EpisodeCell(diary: Self.episordDary)
    }
    
}


public struct MemoCell: View {
    private let diary: Diary

    public init(diary: Diary) {
        self.diary = diary
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center, spacing: 4) {
                Image(systemName: diary.imageName)
                    .font(.caption)
                Text(diary.title)
                    .bold()
            }
            Text(diary.content)
                .font(.caption)
                .lineLimit(1)
                .foregroundColor(.gray)
        }
    }
}

public struct EpisodeCell: View {
    private let diary: Diary

    public init(diary: Diary) {
        self.diary = diary
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center, spacing: 4) {
                Image(systemName: diary.imageName)
                    .font(.caption)
                Text(diary.title)
                    .bold()
            }
        }
    }
}
