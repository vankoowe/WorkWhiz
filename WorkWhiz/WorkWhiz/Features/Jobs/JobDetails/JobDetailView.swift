//
//  JobDetailView.swift
//  WorkWhiz
//
//  Created by Ivan Gamov on 24.04.24.
//

import SwiftUI

struct JobDetail: View {
    // MARK: - Properties
    @StateObject var viewModel: JobDetailViewModel
    @EnvironmentObject private var theme: AppTheme

    // MARK: - View
    var body: some View {
        VStack(alignment: .leading, spacing: theme.spacingTokens.spacing.spacing16) {
            VStack(spacing: theme.spacingTokens.spacing.spacing40) {
                backButton
                
                Image(viewModel.job.image)
                    .resizable()
                    .scaledToFit()
                    .clipped()
            }

            HStack {
                Image(viewModel.job.posterImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())

                VStack(alignment: .leading) {
                    Text(viewModel.job.posterName)
                        .font(Font.sourceSansPro(.regular, size: 12))

                    Text(viewModel.job.posterBadge)
                        .font(Font.sourceSansPro(.regular, size: 12))
                        .foregroundStyle(.gray)
                }

                Spacer()

                Button {
                    viewModel.isSaved.toggle()
                } label: {
                    Image(systemName: viewModel.isSaved ? "heart.fill" : "heart")
                        .foregroundStyle(viewModel.isSaved ? Color.red : Color.gray)
                }.padding(.horizontal, theme.spacingTokens.padding.padding8)
            }
            .padding(.top, theme.spacingTokens.padding.padding8)
            .padding(.leading, theme.spacingTokens.padding.padding4)

            HStack {
                Text(viewModel.job.title)
                    .font(Font.sourceSansPro(.regular, size: 14))
                    .padding(.vertical, theme.spacingTokens.padding.padding8)

                Spacer()
            }
            .padding(.horizontal, theme.spacingTokens.padding.padding8)

            HStack(spacing: theme.spacingTokens.spacing.spacing4) {
                Image(systemName: "star.fill")
                Text("\(String(format: "%.1f", viewModel.job.rating))")

                Text("(\(viewModel.job.ratingCount))")
                    .foregroundStyle(Color.gray)
                    .font(Font.sourceSansPro(.regular, size: 16))

                Spacer()

                Text("From ")
                    .font(Font.sourceSansPro(.regular, size: 14))
                    .foregroundStyle(theme.colorTheme.text.black)

                    +

                Text("$\(viewModel.job.startingPrice)")
                    .font(Font.sourceSansPro(.regular, size: 18))
                    .foregroundStyle(theme.colorTheme.text.black)

            }.padding(.horizontal, 8)
                .font(Font.sourceSansPro(.semibold, size: 16))
                .foregroundStyle(theme.colorTheme.primary.primary)

            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .padding(theme.spacingTokens.padding.padding16)
        .background(Color.white)
        .environmentObject(theme)
    }

    private var backButton: some View {
        HStack {
            Button {
                viewModel.goBack()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: theme.spacingTokens.cornerRadius.cornerRadius8)
                        .foregroundStyle(theme.colorTheme.background.placeholder.opacity(0.25))

                    Image(systemName: "chevron.backward")
                        .renderingMode(.template)
                        .foregroundStyle(theme.colorTheme.primary.primary)
                }
                .frame(width: 24, height: 24)
            }

            Spacer()
        }
    }
}

#Preview {
    JobDetail(viewModel: JobDetailViewModel(job: .mockJob, isSaved: true, goBack: {}))
        .environmentObject(AppTheme())
}
