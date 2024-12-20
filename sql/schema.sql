CREATE TABLE projects (
    project_id INTEGER
        CONSTRAINT projects_pk
            PRIMARY KEY,
    project_name TEXT
);

CREATE TABLE tasks (
    task_id INTEGER
        CONSTRAINT tasks_pk
            PRIMARY KEY,
    parent_id INTEGER
        CONSTRAINT tasks_tasks_task_id_fk
            REFERENCES tasks
            ON UPDATE CASCADE ON DELETE SET NULL,
    project_id INTEGER
        CONSTRAINT tasks_project_project_id_fk
            REFERENCES projects
            ON UPDATE CASCADE ON DELETE SET NULL,
    name TEXT DEFAULT "Untitled" NOT NULL,
    description TEXT,
    priority TEXT,
    difficulty INTEGER DEFAULT 0 NOT NULL,
    duration INTEGER DEFAULT 0 NOT NULL,
    time_fixed INTEGER DEFAULT 1 NOT NULL,
    time_fixed_time TEXT,
    created_at TEXT,
    updated_at TEXT
);
CREATE UNIQUE INDEX idx_tasks_task_id ON tasks(task_id);

CREATE INDEX idx_tasks_parent_id ON tasks(parent_id);
CREATE INDEX idx_tasks_project_id ON tasks(project_id);

CREATE INDEX idx_tasks_name ON tasks(name);
CREATE INDEX idx_tasks_description ON tasks(description);
CREATE INDEX idx_tasks_priority ON tasks(priority);
CREATE INDEX idx_tasks_difficulty ON tasks(difficulty);
CREATE INDEX idx_tasks_time_fixed_time ON tasks(time_fixed_time);
CREATE INDEX idx_tasks_created_at ON tasks(created_at);
CREATE INDEX idx_tasks_updated_at ON tasks(updated_at);



