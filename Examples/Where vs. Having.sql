/*
WHERE clause is used to filter rows before you aggregate them.
HAVING clause is used to filter groups once you've declared a GROUP BY statement.
*/

SELECT
    CAST(ExerciseType AS VARCHAR(100)) ExerciseType,
    SUM(Calories) AS Total_Calories

FROM
    exercise_logs

WHERE
    ExterciseType = 'Cardio'

GROUP BY
    CAST(ExerciseType AS VARCHAR(100))
HAVING SUM(Calories) > 150;