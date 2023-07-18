-- Active: 1689545317062@@127.0.0.1@3306

CREATE TABLE
    users(
        id TEXT UNIQUE PRIMARY KEY NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        role TEXT NOT NULL,
        created_at TEXT DEFAULT (DATETIME()) NOT NULL,
        updated_at TEXT DEFAULT (DATETIME()) NOT NULL
    );

CREATE TABLE
    post(
        id TEXT UNIQUE PRIMARY KEY NOT NULL,
        creator_id TEXT NOT NULL,
        content TEXT NOT NULL,
        likes INTEGER NOT NULL,
        dislikes INTEGER NOT NULL,
        created_at TEXT DEFAULT (DATETIME()) NOT NULL,
        updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
        Foreign Key (creator_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    like_dislike_post(
        id_user TEXT NOT NULL,
        id_post TEXT NOT NULL,
        like INTEGER,
        Foreign Key (id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
        Foreign Key (id_post) REFERENCES post(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    comment_post(
        id TEXT UNIQUE PRIMARY KEY NOT NULL,
        id_user NOT NULL,
        id_post NOT NULL,
        content TEXT NOT NULL,
        likes INTEGER NOT NULL,
        dislikes INTEGER NOT NULL,
        created_at TEXT DEFAULT (DATETIME()) NOT NULL,
        updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
        Foreign Key (id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
        Foreign Key (id_post) REFERENCES post(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    like_dislike_comment_post(
        id_user TEXT NOT NULL,
        id_comment TEXT NOT NULL,
        like INTEGER,
        Foreign Key (id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
        Foreign Key (id_comment) REFERENCES comment_post(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

-- Queries de inserção abaixo:

INSERT INTO
    users (id, name, email, password, role)
values (
        -- tipo NORMAL e senha = fulano123 (
        'u001',
        'Fulano',
        'fulano@email.com',
        '$2a$12$qPQj5Lm1dQK2auALLTC0dOWedtr/Th.aSFf3.pdK5jCmYelFrYadC',
        'NORMAL',
        DATETIME("now", "localtime"),
        null
    ), (
        -- tipo NORMAL e senha = beltrana00 (
        'u002',
        'Beltrana',
        'beltrana@email.com',
        '$2a$12$403HVkfVSUbDioyciv9IC.oBlgMqudbnQL8ubebJIXScNs8E3jYe2',
        'NORMAL',
        DATETIME("now", "localtime"),
        null
    ), (
        -- tipo ADMIN e senha = admin123 (
        'u003',
        'ADMIN',
        'admin@email.com',
        '$2a$12$lHyD.hKs3JDGu2nIbBrxYujrnfIX5RW5oq/B41HCKf7TSaq9RgqJ.',
        'ADMIN',
        DATETIME("now", "localtime"),
        null
    );

INSERT INTO
    post (
        id,
        creator_id,
        content,
        likes,
        dislikes,
        created_at
    )
VALUES (
        'p001',
        'u001',
        'Acabooooooou! É TRETAAA!',
        0,
        0,
        DATETIME("now", "localtime")
    ),(
        'p002',
        'u002',
        'Agora o Hexa vem!',
        0,
        0,
        DATETIME("now", "localtime")
    );

-- Queries de seleção abaixo:

SELECT * FROM users;

SELECT * FROM post;

SELECT * FROM like_dislike_post;

SELECT * FROM comment_post;

SELECT * FROM like_dislike_comment_post;

-- Queries de deletação abaixo:

DROP TABLE users;

DROP TABLE post;

DROP TABLE like_dislike_post;

DROP TABLE comment_post;

DROP TABLE like_dislike_comment_post;