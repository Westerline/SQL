SELECT
    CAST(ExerciseType AS VARCHAR(100)) ExerciseType,
    SUM(Calories) AS Total_Calories

FROM
    exercise_logs

GROUP BY
    CAST(ExerciseType AS VARCHAR(100))

HAVING SUM(Calories) > 150;