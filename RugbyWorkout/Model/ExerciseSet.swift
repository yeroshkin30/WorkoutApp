//
//  SetModel.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 17.06.2024.
//

import Foundation

// MARK: - SetModel
struct ExerciseSet: Identifiable, Hashable {
    let id: UUID = .init()
    let name: String
    let duration: Int
    let exercisesCount: Int
    let exercises: [Exercise]
}


// Sample exercises
let exercises = [
    Exercise(
        name: "Push-Ups",
        repeatsCount: "15",
        description: "Begin in a plank position, lower your body until your chest nearly touches the floor, then push back up."
    ),
    Exercise(
        name: "Jumping Jacks",
        repeatsCount: "30",
        description: "Stand upright with your legs together and arms at your sides, then jump to spread your legs and lift your arms overhead."
    ),
    Exercise(
        name: "Squats",
        repeatsCount: "20",
        description: "Stand with feet shoulder-width apart, lower your hips back and down as if sitting in a chair, then return to standing."
    ),
    Exercise(
        name: "Lunges",
        repeatsCount: "15 each leg",
        description: "Step forward with one leg, lowering your hips until both knees are bent at about a 90-degree angle, then return to standing."
    ),
    Exercise(
        name: "Plank",
        repeatsCount: "60 seconds",
        description: "Hold a push-up position with your body in a straight line from shoulders to ankles, engaging your core."
    ),
    Exercise(
        name: "Burpees",
        repeatsCount: "12",
        description: "From a standing position, drop into a squat, kick your feet back to a plank, perform a push-up, return to squat, and jump up."
    ),
    Exercise(
        name: "High Knees",
        repeatsCount: "25 each leg",
        description: "Run in place, bringing your knees up towards your chest as high as possible with each step."
    ),
    Exercise(
        name: "Mountain Climbers",
        repeatsCount: "20 each leg",
        description: "Start in a plank position, drive one knee toward your chest, then switch legs rapidly."
    ),
    Exercise(
        name: "Bicycle Crunches",
        repeatsCount: "20 each side",
        description: "Lie on your back, lift your legs and shoulders, and perform a cycling motion while bringing opposite elbows to knees."
    ),
    Exercise(
        name: "Jump Squats",
        repeatsCount: "15",
        description: "Perform a squat and then jump explosively, landing softly and immediately going into the next squat."
    ),
    Exercise(
        name: "Dumbbell Rows",
        repeatsCount: "12 each arm",
        description: "With a dumbbell in one hand, bend over and pull the weight to your hip, keeping your back straight."
    ),
    Exercise(
        name: "Tricep Dips",
        repeatsCount: "15",
        description: "Using a bench or chair, lower your body by bending your elbows, then push back up to the starting position."
    ),
    Exercise(
        name: "Leg Raises",
        repeatsCount: "15",
        description: "Lie on your back with legs straight, lift them towards the ceiling, then lower them back down without touching the ground."
    ),
    Exercise(
        name: "Twists",
        repeatsCount: "20 each side",
        description: "Sit on the ground with knees bent, lean back slightly and twist your torso, tapping the ground on each side."
    ),
    Exercise(
        name: "Calf Raises",
        repeatsCount: "20",
        description: "Stand with feet shoulder-width apart, lift your heels off the ground, then slowly lower them back down."
    ),
    Exercise(
        name: "Pull-Ups",
        repeatsCount: "10",
        description: "Hang from a pull-up bar with an overhand grip, pull your body up until your chin is above the bar, then lower back down."
    ),
    Exercise(
        name: "Side Plank",
        repeatsCount: "30 seconds each side",
        description: "Lie on your side, prop yourself up on one elbow, and hold your body in a straight line."
    ),
    Exercise(
        name: "Deadlifts",
        repeatsCount: "12",
        description: "With feet hip-width apart, lift a barbell from the ground to hip level, keeping your back straight and core engaged."
    ),
    Exercise(
        name: "Flutter Kicks",
        repeatsCount: "30 seconds",
        description: "Lie on your back with legs extended, lift them slightly off the ground, and flutter them in a small, quick motion."
    ),
    Exercise(
        name: "Box Jumps",
        repeatsCount: "12",
        description: "Jump onto a sturdy box or platform, landing softly, then step or jump back down."
    )
]

// Function to generate a random set of exercises
func generateRandomSet(name: String, duration: Int, exercisesCount: Int) -> ExerciseSet {
    let shuffledExercises = exercises.shuffled()
    let selectedExercises = Array(shuffledExercises.prefix(exercisesCount))
    return ExerciseSet(name: name, duration: duration, exercisesCount: exercisesCount, exercises: selectedExercises)
}

// Generate an array of sets
let setsArray: [ExerciseSet] = [
    generateRandomSet(name: "Generated Set 1", duration: 30, exercisesCount: 10),
    generateRandomSet(name: "Generated Set 2", duration: 22, exercisesCount: 12),
    generateRandomSet(name: "Generated Set 3", duration: 35, exercisesCount: 14),
    generateRandomSet(name: "Generated Set 4", duration: 25, exercisesCount: 17),
    generateRandomSet(name: "Generated Set 5", duration: 37, exercisesCount: 19),
    generateRandomSet(name: "Generated Set 6", duration: 19, exercisesCount: 18),
    generateRandomSet(name: "Generated Set 7", duration: 32, exercisesCount: 18),
    generateRandomSet(name: "Generated Set 8", duration: 30, exercisesCount: 12),
    generateRandomSet(name: "Generated Set 9", duration: 36, exercisesCount: 15)
]
