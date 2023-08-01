BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Types" (
	"type_id"	INTEGER NOT NULL,
	"type_name"	TEXT NOT NULL,
	PRIMARY KEY("type_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Subtasks" (
	"task_id"	INTEGER NOT NULL,
	"subtask_id"	INTEGER NOT NULL,
	FOREIGN KEY("task_id") REFERENCES "Task"("task_id"),
	FOREIGN KEY("subtask_id") REFERENCES "Task"("task_id")
);
CREATE TABLE IF NOT EXISTS "Repeating" (
	"task_id"	INTEGER NOT NULL,
	"weekday-time_UTC"	TEXT NOT NULL,
	FOREIGN KEY("task_id") REFERENCES "Task"("task_id")
);
CREATE TABLE IF NOT EXISTS "Groups" (
	"group_id"	INTEGER NOT NULL,
	"group_name"	INTEGER NOT NULL,
	PRIMARY KEY("group_id")
);
CREATE TABLE IF NOT EXISTS "Status" (
	"status"	INTEGER NOT NULL,
	"status_name"	TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS "Task" (
	"task_id"	INTEGER NOT NULL,
	"type_id"	INTEGER NOT NULL,
	"title"	TEXT NOT NULL,
	"content"	TEXT NOT NULL,
	"comment"	TEXT NOT NULL,
	"priority"	INTEGER NOT NULL,
	"status"	INTEGER NOT NULL,
	"datetime_start_UTC"	TEXT NOT NULL,
	"datetime_end_UTC"	INTEGER NOT NULL,
	"aproximate_time_minutes"	INTEGER,
	"group_id"	INTEGER,
	FOREIGN KEY("type_id") REFERENCES "Types"("type_id"),
	PRIMARY KEY("task_id" AUTOINCREMENT)
);
INSERT INTO "Types" VALUES (1,'Cyclic');
INSERT INTO "Types" VALUES (2,'one-time');
INSERT INTO "Subtasks" VALUES (1,2);
INSERT INTO "Subtasks" VALUES (3,4);
INSERT INTO "Repeating" VALUES (1,'1970-01-24T20:00:36Z');
INSERT INTO "Repeating" VALUES (1,'1970-01-24T20:00:36Z');
INSERT INTO "Repeating" VALUES (3,'1970-01-24T20:00:36Z');
INSERT INTO "Repeating" VALUES (2,'1970-01-24T19:00:36Z');
INSERT INTO "Repeating" VALUES (2,'1970-01-24T19:00:36Z');
INSERT INTO "Repeating" VALUES (4,'1970-01-24T19:00:36Z');
INSERT INTO "Groups" VALUES (1,'Programming');
INSERT INTO "Groups" VALUES (2,'Self');
INSERT INTO "Status" VALUES (1,'pending');
INSERT INTO "Status" VALUES (2,'completed');
INSERT INTO "Task" VALUES (1,1,'C/C++','lesson','',5,1,'2023-07-24T20:00:36Z','2023-08-25T21:00:36Z',60,1);
INSERT INTO "Task" VALUES (2,1,'C/C++ Presentation','make presentation for C/C++ lesson','',4,1,'2023-07-24T19:00:36Z','2023-08-25T20:00:36Z',60,1);
INSERT INTO "Task" VALUES (3,1,'Django','lesson','',5,1,'2023-07-24T20:00:36Z','2023-08-25T21:00:36Z',60,1);
INSERT INTO "Task" VALUES (4,1,'Django Presentation','make presentation for Django lesson','',4,1,'2023-07-24T19:00:36Z','2023-08-25T20:00:36Z',60,1);
INSERT INTO "Task" VALUES (5,2,'Make to-read list','search notes in notion/telegram','',6,2,'2023-07-24T15:00:36Z','2023-07-24T16:30:36Z',30,2);
COMMIT;
