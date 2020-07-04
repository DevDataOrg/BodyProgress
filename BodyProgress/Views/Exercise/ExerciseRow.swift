//
//  ExerciseRow.swift
//  BodyProgress
//
//  Created by Karthick Selvaraj on 03/05/20.
//  Copyright © 2020 Mallow Technologies Private Limited. All rights reserved.
//

import SwiftUI
import CoreData

struct ExerciseRow: View {
    
    @ObservedObject var exercise: Exercise
    
    var body: some View {
        ZStack {
            exercise.wBodyPart.color()
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    HStack {
                        Text(exercise.wName)
                            .font(kPrimaryBodyFont)
                            .fontWeight(.bold)
                        if exercise.wIsFavourite {
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(kFavStarColour)
                        }
                    }
                    if (!exercise.wNotes.isEmpty) && (exercise.wNotes != kDefaultValue) {
                        Text(exercise.wNotes)
                            .font(kPrimarySubheadlineFont)
                            .multilineTextAlignment(.leading)
                            .opacity(0.75)
                    }
                }
                .padding()
                Spacer()
                if exercise.wExerciseSets.count > 0 {
                    Text("\(exercise.wExerciseSets.count)")
                        .font(kPrimaryBodyFont)
                        .bold()
                        .frame(width: 30, height: 30)
                        .padding([.top, .bottom], 5)
                        .clipShape(Circle())
                }
                Image(systemName: "arrowtriangle.right.fill")
                    .foregroundColor(.secondary)
                    .opacity(0.2)
                    .padding([.top, .bottom, .trailing])
            }

        }
        .frame(height: 60)
        .cornerRadius(kCornerRadius)
    }
}

struct ExerciseRow_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let pExercise = Exercise(context: moc)
        pExercise.name = "Dummbells curl"
        pExercise.notes = "Keep dumbeels straight, lift up and down slowly and repeat"
        return ExerciseRow(exercise: pExercise)
    }
}
