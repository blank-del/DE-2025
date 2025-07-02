IF NOT EXISTS (
    SELECT name
    FROM sys.databases
    WHERE name = N'SQLTutorial')
CREATE DATABASE SQLTutorial;