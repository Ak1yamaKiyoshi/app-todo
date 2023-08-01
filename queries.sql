-- Get all tasks
Select * From Task

-- Get all TASKS that are not SUBTASKS and STATUS PENDING
Select * From Task
WHERE Task.task_id not in (Select Subtasks.subtask_id From Subtasks) 
	and Task.status == 1

-- GET TASKS that: NOT SUBTASKS, IN GROUP, have 1 (PENDING) Status
Select * From Task
WHERE Task.task_id not in (Select Subtasks.subtask_id From Subtasks) 
	and Task.group_id == 1
	and Task.status == 1

-- Select SUBTASKS of TASK by task_id THAT ARE PENDING
SELECT Task.task_id, 
	Task.title, 
	Task.content, 
	Task.status, 
	Task.priority 
FROM Task
INNER JOIN Subtasks ON Task.task_id=Subtasks.subtask_id 
WHERE Subtasks.task_id = 1 and Task.status == 1
