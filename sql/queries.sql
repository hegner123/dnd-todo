-- name: SelectTask :one
SELECT * FROM tasks
WHERE task_id = ? LIMIT 1;

-- name: SelectProjectTasks :many
SELECT * FROM tasks
WHERE project_id = ?;

-- name: SelectNestedTasks :many
SELECT * FROM tasks
WHERE parent_id = ?;


-- name: SearchTaskFixedDate :many
SELECT * FROM tasks
WHERE time_fixed_time LIKE ?;

-- name: CreateTask :one
INSERT INTO tasks (task_id, parent_id, project_id, name, description, priority, difficulty, duration, time_fixed,
                   time_fixed_time, created_at, updated_at)
VALUES (?,?,?,?,?,?,?,?,?,?,?,?) RETURNING *;

-- name: UpdateTask :one
UPDATE tasks
SET parent_id = ?,
    project_id = ?,
    name = ?,
    description = ?,
    priority = ?,
    difficulty = ?,
    duration = ?,
    time_fixed = ?,
    time_fixed_time = ?,
    updated_at = ?
WHERE task_id = ?
RETURNING *;

-- name: DeleteTask :one
DELETE FROM tasks
WHERE task_id = ?
RETURNING *;

-- name: ListTasks :many
SELECT * FROM tasks;

-- name: CountTasks :one
SELECT COUNT(*) AS count
FROM tasks;

-- name: FilterTasksByPriority :many
SELECT *
FROM tasks
WHERE priority = ?
ORDER BY created_at DESC;

-- name: FilterTasksByDifficulty :many
SELECT *
FROM tasks
WHERE difficulty = ?;

-- name: UpdateTaskName :one
UPDATE tasks
SET name = ?, updated_at = ?
WHERE task_id = ?
RETURNING *;

-- name: UpdateTaskDescription :one
UPDATE tasks
SET description = ?, updated_at = ?
WHERE task_id = ?
RETURNING *;

-- name: OrderTasksByTaskIdAsc :many
SELECT * FROM tasks
ORDER BY task_id ASC;

-- name: OrderTasksByTaskIdDesc :many
SELECT * FROM tasks
ORDER BY task_id DESC;

-- name: OrderTasksByParentIdAsc :many
SELECT * FROM tasks
ORDER BY parent_id ASC;

-- name: OrderTasksByParentIdDesc :many
SELECT * FROM tasks
ORDER BY parent_id DESC;

-- name: OrderTasksByProjectIdAsc :many
SELECT * FROM tasks
ORDER BY project_id ASC;

-- name: OrderTasksByProjectIdDesc :many
SELECT * FROM tasks
ORDER BY project_id DESC;

-- name: OrderTasksByNameAsc :many
SELECT * FROM tasks
ORDER BY name ASC;

-- name: OrderTasksByNameDesc :many
SELECT * FROM tasks
ORDER BY name DESC;

-- name: OrderTasksByDescriptionAsc :many
SELECT * FROM tasks
ORDER BY description ASC;

-- name: OrderTasksByDescriptionDesc :many
SELECT * FROM tasks
ORDER BY description DESC;

-- name: OrderTasksByPriorityAsc :many
SELECT * FROM tasks
ORDER BY priority ASC;

-- name: OrderTasksByPriorityDesc :many
SELECT * FROM tasks
ORDER BY priority DESC;

-- name: OrderTasksByDifficultyAsc :many
SELECT * FROM tasks
ORDER BY difficulty ASC;

-- name: OrderTasksByDifficultyDesc :many
SELECT * FROM tasks
ORDER BY difficulty DESC;

-- name: OrderTasksByDurationAsc :many
SELECT * FROM tasks
ORDER BY duration ASC;

-- name: OrderTasksByDurationDesc :many
SELECT * FROM tasks
ORDER BY duration DESC;

-- name: OrderTasksByTimeFixedAsc :many
SELECT * FROM tasks
ORDER BY time_fixed ASC;

-- name: OrderTasksByTimeFixedDesc :many
SELECT * FROM tasks
ORDER BY time_fixed DESC;

-- name: OrderTasksByTimeFixedTimeAsc :many
SELECT * FROM tasks
ORDER BY time_fixed_time ASC;

-- name: OrderTasksByTimeFixedTimeDesc :many
SELECT * FROM tasks
ORDER BY time_fixed_time DESC;

-- name: OrderTasksByCreatedAtAsc :many
SELECT * FROM tasks
ORDER BY created_at ASC;

-- name: OrderTasksByCreatedAtDesc :many
SELECT * FROM tasks
ORDER BY created_at DESC;

-- name: OrderTasksByUpdatedAtAsc :many
SELECT * FROM tasks
ORDER BY updated_at ASC;

-- name: OrderTasksByUpdatedAtDesc :many
SELECT * FROM tasks
ORDER BY updated_at DESC;

-- name: MatchTaskId :one
SELECT * FROM tasks
WHERE task_id = ?;

-- name: SearchTaskId :many
SELECT * FROM tasks
WHERE task_id LIKE ?;

-- name: MatchParentId :one
SELECT * FROM tasks
WHERE parent_id = ?;

-- name: SearchParentId :many
SELECT * FROM tasks
WHERE parent_id LIKE ?;

-- name: MatchProjectId :one
SELECT * FROM tasks
WHERE project_id = ?;

-- name: SearchProjectId :many
SELECT * FROM tasks
WHERE project_id LIKE ?;

-- name: MatchTaskName :one
SELECT * FROM tasks
WHERE name = ?;

-- name: SearchTaskName :many
SELECT * FROM tasks
WHERE name LIKE ?;

-- name: MatchTaskDescription :one
SELECT * FROM tasks
WHERE description = ?;

-- name: SearchTaskDescription :many
SELECT * FROM tasks
WHERE description LIKE ?;

-- name: MatchTaskPriority :one
SELECT * FROM tasks
WHERE priority = ?;

-- name: SearchTaskPriority :many
SELECT * FROM tasks
WHERE priority LIKE ?;

-- name: MatchTaskDifficulty :one
SELECT * FROM tasks
WHERE difficulty = ?;

-- name: SearchTaskDifficulty :many
SELECT * FROM tasks
WHERE difficulty LIKE ?;

-- name: MatchTaskDuration :one
SELECT * FROM tasks
WHERE duration = ?;

-- name: SearchTaskDuration :many
SELECT * FROM tasks
WHERE duration LIKE ?;

-- name: MatchTaskTimeFixed :one
SELECT * FROM tasks
WHERE time_fixed = ?;

-- name: SearchTaskTimeFixed :many
SELECT * FROM tasks
WHERE time_fixed LIKE ?;

-- name: MatchTaskTimeFixedTime :one
SELECT * FROM tasks
WHERE time_fixed_time = ?;

-- name: SearchTaskTimeFixedTime :many
SELECT * FROM tasks
WHERE time_fixed_time LIKE ?;

-- name: MatchTaskCreatedAt :one
SELECT * FROM tasks
WHERE created_at = ?;

-- name: SearchTaskCreatedAt :many
SELECT * FROM tasks
WHERE created_at LIKE ?;

-- name: MatchTaskUpdatedAt :one
SELECT * FROM tasks
WHERE updated_at = ?;

-- name: SearchTaskUpdatedAt :many
SELECT * FROM tasks
WHERE updated_at LIKE ?;

