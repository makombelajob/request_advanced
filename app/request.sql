-- CREATION OF TABLES
CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE categories (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE tasks (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    duration INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    started_at TIMESTAMP,
    completed_at TIMESTAMP,
    description TEXT,
    users_id BIGINT,
    categories_id BIGINT,
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (categories_id) REFERENCES categories(id)
);

INSERT INTO users (name, last_name, email)
VALUES('Job', 'johnny', 'test@yes.go');

INSERT INTO categories(name) VALUES ("Social");

INSERT INTO tasks (title, duration, users_id, categories_id) VALUES ('Envoyer un mail', 10, 2, 3);

UPDATE tasks SET users_id = 1, categories_id = 1 WHERE id = 1;

-- Lister toutes les tâches avec leur catégorie --
SELECT *
FROM tasks
LEFT JOIN categories ON tasks.categories_id = categories.id;

-- Lister toutes les tâches assignées à un utilisateur spécifique --
SELECT * FROM tasks
LEFT JOIN users
ON tasks.users_id = users.id 
WHERE users.id = 1;

-- Lister les tâches par catégorie avec le nom utilisateur assigné 
SELECT * FROM tasks 
LEFT JOIN categories
ON tasks.categories_id = categories.id 
ORDER BY tasks.id DESC;

-- Compter le nombre total de tâches
SELECT COUNT(*) AS nombre_de_tache FROM tasks;

-- Calculer la durée moyenne estimée des tâches
SELECT AVG(duration) AS duree_moyenne FROM tasks;

--- Trouver la tâche avec la durée estimée la plus longue 
SELECT MAX(duration) AS longue_duree FROM tasks;

-- Calculer la somme des durées estimées de toutes les tâches
SELECT SUM(duration) AS somme FROM tasks;

