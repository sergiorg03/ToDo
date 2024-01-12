INSERT INTO
    listas (
        nombreLista,
        descripcion,
        activa,
        emailUsuario,
        completada
    )
VALUES
    (
        'Lista1',
        'Descripción Lista1',
        1,
        'user1@email.com',
        0
    ),
    (
        'Lista2',
        'Descripción Lista2',
        1,
        'user1@email.com',
        0
    ),
    (
        'Lista3',
        'Descripción Lista3',
        1,
        'user2@email.com',
        1
    ),
    (
        'Lista4',
        'Descripción Lista4',
        1,
        'user3@email.com',
        0
    ),
    (
        'Lista5',
        'Descripción Lista5',
        1,
        'user4@email.com',
        1
    ),
    (
        'Lista6',
        'Descripción Lista6',
        1,
        'user5@email.com',
        0
    ),
    (
        'Lista7',
        'Descripción Lista7',
        1,
        'user6@email.com',
        1
    ),
    (
        'Lista8',
        'Descripción Lista8',
        1,
        'user7@email.com',
        0
    ),
    (
        'Lista9',
        'Descripción Lista9',
        1,
        'user8@email.com',
        1
    ),
    (
        'Lista10',
        'Descripción Lista10',
        1,
        'user9@email.com',
        0
    );

INSERT INTO
    contenidoListas (
        idLista,
        nombreApartado,
        completado,
        emailUsuario
    )
VALUES
    (1, 'Tarea1', 0, 'user1@email.com'),
    (1, 'Tarea2', 1, 'user1@email.com'),
    (2, 'Tarea3', 0, 'user2@email.com'),
    (2, 'Tarea4', 1, 'user3@email.com'),
    (3, 'Tarea5', 1, 'user4@email.com');