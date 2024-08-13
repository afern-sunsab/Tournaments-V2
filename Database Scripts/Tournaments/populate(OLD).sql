INSERT INTO USERS (USER_ID, USER_NAME, USER_EMAIL, USER_USERNAME, USER_IS_ADMIN, USER_BIRTHDATE) VALUES
(1, 'John Doe', 'johndoe@email.com', 'johndoe', false, '1990-01-01'),
(2, 'Jane Doe', 'janedoe@email.com', 'janedoe', false, '1990-01-01'),
(3, 'Admin', 'admin@email.com', 'admin', true, '1990-01-01'),
(4, 'Stan Marsh', 'stan@email.com', 'stan', false, '1990-01-01'),
(5, 'Kyle Broflovski', 'kyle@email.com', 'kyle', false, '1990-01-01'),
(6, 'Eric Cartman', 'eric@email.com', 'eric', false, '1990-01-01'),
(7, 'Kenny McCormick', 'kenny@email.com', 'kenny', false, '1990-01-01'),
(8, 'Super Mario', 'mario@email.com', 'mario', false, '1990-01-01'),
(9, 'Rick Mundy', 'rick@email.com', 'sniperboi', false, '1990-01-01'),
(10, 'Cloud Strife', 'cloud@email.com', 'SOLDIERboi', false, '1990-01-01'),
(11, 'Peter Griffin', 'peter@email.com', 'peter', false, '1990-01-01'),
(12, 'Homer Simpson', 'homer@email.com', 'homer', false, '1990-01-01'),
(13, 'Spongebob', 'spongebob@email.com', 'SpongeMeBob', false, '1990-01-01'),
(14, 'Guy Dudeman', 'guydude@email.com', 'guydude', false, '1990-01-01'),
(15, 'Dude Guyman', 'dudeguy@email.com', 'dudeguy', false, '1990-01-01'),
(16, 'Game Player', 'player@email.com', 'player', false, '1990-01-01'),
(17, 'Doug Funny', 'doug@email.com', 'doug', false, '1990-01-01'),
(18, 'Seymour Butts', 'seymour@email.com', 'SeyButts', false, '1990-01-01'),
(19, 'Wow Wow', 'wow@email.com', 'wow', false, '1990-01-01');

INSERT INTO GAMES (GAME_ID, GAME_NAME) VALUES
(1, 'Tennis'),
(2, 'Soccer'),
(3, 'Basketball'),
(4, 'Baseball'),
(5, 'Football'),
(6, 'Golf'),
(7, 'Hockey'),
(8, 'Volleyball'),
(9, 'Rugby'),
(10, 'Cricket'),
(11, 'Table Tennis'),
(12, 'Badminton'),
(13, 'Bowling'),
(14, 'Boxing');

INSERT INTO TOURNAMENTS (TOURNAMENT_ID, TOURNAMENT_NAME, TOURNAMENT_DESCRIPTION, TOURNAMENT_ENTRANT_LIMIT, TOURNAMENT_GAME, TOURNAMENT_LOCATION, TOURNAMENT_REG_END_DATE, TOURNAMENT_START_DATE, TOURNAMENT_THUMBNAIL) VALUES
(1, 'First tournament', 'This is a test first tournament', 8, 1, 'Calgary', '2021-01-01', '2021-01-02', 'https://via.placeholder.com/150');

INSERT INTO BRACKETS (BRACKET_ID, BRACKET_STYLE, BRACKET_ENTRANT_LIMIT, BRACKET_NEXT, BRACKET_TOURNAMENT, BRACKET_START_TIME, BRACKET_NAME) VALUES
(1, 'Single Elimination', 8, 2, 1, '2021-01-02 12:00:00', 'First bracket');

INSERT INTO MATCHES (MATCH_ID, MATCH_ROUND, MATCH_START_TIME, MATCH_NEXT, MATCH_BRACKET) VALUES
(1, 1, '2021-01-02 12:00:00', 5, 1),
(2, 1, '2021-01-02 12:00:00', 5, 1),
(3, 1, '2021-01-02 12:00:00', 6, 1),
(4, 1, '2021-01-02 12:00:00', 6, 1),
(5, 2, '2021-01-02 12:00:00', 7, 1),
(6, 2, '2021-01-02 12:00:00', 7, 1),
(7, 3, '2021-01-02 12:00:00', null, 1);

INSERT INTO RANKINGS (RANKING_USER, RANKING_GAME, RANKING_SCORE) VALUES
(1, 1, 1000),
(1, 2, 2000),
(2, 1, 1500),
(2, 2, 2500),
(3, 1, 3000),
(3, 2, 4000),
(4, 1, 5000),
(4, 2, 6000),
(5, 1, 7000),
(5, 2, 8000),
(6, 1, 9000),
(6, 2, 10000),
(7, 1, 11000),
(7, 2, 12000),
(8, 1, 13000),
(8, 2, 14000),
(9, 1, 15000),
(9, 2, 16000),
(10, 1, 17000),
(10, 2, 18000),
(11, 1, 19000),
(11, 2, 20000),
(12, 1, 21000),
(12, 2, 22000),
(13, 1, 23000),
(13, 2, 24000),
(14, 1, 25000),
(14, 2, 26000),
(15, 1, 27000),
(15, 2, 28000),
(16, 1, 29000),
(16, 2, 30000),
(17, 1, 310);

insert into tournament_entrant (entrant_tournament, entrant_user, entrant_seed) values
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 4),
(1, 5, 5),
(1, 6, 6),
(1, 7, 7),
(1, 8, 8);

insert into tournament_owner (owner_user, owner_tournament) values
(9, 1),
(10, 1);

insert into bracket_entrant (entrant_bracket, entrant_user) values
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8);

insert into match_entrant (entrant_match, entrant_user, entrant_score, entrant_dq) values
(1, 1, 0, false),
(1, 2, 0, true),
(2, 3, 0, false),
(2, 4, 0, false),
(3, 5, 0, false),
(3, 6, 0, false),
(4, 7, 0, false),
(4, 8, 0, true),

(5, 1, 0, false),
(5, 3, 0, false),
(6, 5, 0, false),
(6, 7, 0, false),

(7, 1, 0, false),
(7, 5, 0, false);