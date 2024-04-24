//
//  JobView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 24.04.24.
//

import SwiftUI

struct JobView: View {
    // MARK: - Properties
    @EnvironmentObject private var theme: AppTheme
    @State var isSaved: Bool
    var job: Job

    // MARK: - View
    var body: some View {
        VStack(alignment: .leading, spacing: theme.spacingTokens.spacing.spacing8) {
            Image(job.image)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .clipped()

            HStack {
                Image(job.posterImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())

                VStack(alignment: .leading) {
                    Text(job.posterName)
                        .font(Font.sourceSansPro(.regular, size: 12))
                        .foregroundStyle(theme.colorTheme.text.black)

                    Text(job.posterBadge)
                        .font(Font.sourceSansPro(.regular, size: 12))
                        .foregroundStyle(.gray)
                }

                Spacer()

                Button {
                    isSaved.toggle()
                } label: {
                    Image(systemName: isSaved ? "heart.fill" : "heart")
                        .foregroundStyle(isSaved ? Color.red : Color.gray)
                }.padding(.horizontal, theme.spacingTokens.padding.padding8)
            }
            .padding(.top, theme.spacingTokens.padding.padding8)
            .padding(.leading, theme.spacingTokens.padding.padding4)

            HStack {
                Text(job.title)
                    .font(Font.sourceSansPro(.regular, size: 14))
                    .foregroundStyle(theme.colorTheme.text.black)
                    .padding(.vertical, theme.spacingTokens.padding.padding8)

                Spacer()
            }
            .padding(.horizontal, theme.spacingTokens.padding.padding8)

            HStack {
                Text(job.description)
                    .font(Font.sourceSansPro(.regular, size: 12))
                    .foregroundStyle(theme.colorTheme.text.black)

                Spacer()
            }
            .padding(.horizontal, theme.spacingTokens.padding.padding8)

            HStack(spacing: theme.spacingTokens.spacing.spacing4) {
                Image(systemName: "star.fill")
                Text("\(String(format: "%.1f", job.rating))")
                    .foregroundStyle(Color.gray)

                Text("(\(job.ratingCount))")
                    .foregroundStyle(Color.gray)
                    .font(Font.sourceSansPro(.regular, size: 16))

                Spacer()

                Text("From ")
                    .font(Font.sourceSansPro(.regular, size: 14))
                    .foregroundStyle(theme.colorTheme.text.black)

                    +

                Text("$\(job.startingPrice)")
                    .font(Font.sourceSansPro(.regular, size: 18))
                    .foregroundStyle(theme.colorTheme.text.black)

            }.padding(.horizontal, 8)
                .font(Font.sourceSansPro(.semibold, size: 16))
                .foregroundStyle(theme.colorTheme.primary.primary)

            Spacer()
        }
        .padding(theme.spacingTokens.padding.padding16)
        .background(Color.white)
        .cornerRadius(theme.spacingTokens.cornerRadius.cornerRadius8)
        .shadow(color: Color(.systemGray3).opacity(0.5), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    JobView(isSaved: true, job: .mockJob)
        .environmentObject(AppTheme())
}
