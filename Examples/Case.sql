Select
    heart_rate,
    exercisetype,
    Case
		When heart_rate > 220-30 Then 'Above Max'
		When heart_rate > (0.90 * (220-30)) Then 'Above Target'
		When heart_rate > (0.50 * (220-30)) Then 'Within Target'
		Else 'Below Target'
	End as 'hr_zone'

From
    exercise_logs;