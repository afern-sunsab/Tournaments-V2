DROP TABLE IF EXISTS RANKING CASCADE;
-- DROP TABLE IF EXISTS TOURNAMENT_OWNER CASCADE;
DROP TABLE IF EXISTS MATCH_ENTRANT CASCADE;
-- DROP TABLE IF EXISTS BRACKET_ENTRANT CASCADE;
-- DROP TABLE IF EXISTS TOURNAMENT_ENTRANT CASCADE;
DROP TABLE IF EXISTS MATCH CASCADE;
DROP TABLE IF EXISTS BRACKET CASCADE;
DROP TABLE IF EXISTS TOURNAMENT CASCADE;
DROP TABLE IF EXISTS GAME CASCADE;
DROP TABLE IF EXISTS MEMBER CASCADE;

CREATE TABLE MEMBER (
    MEMBER_ID SERIAL PRIMARY KEY,
    MEMBER_NAME VARCHAR(255) NOT NULL,
    MEMBER_EMAIL VARCHAR(255) NOT NULL,
    MEMBER_USERNAME VARCHAR(255) NOT NULL,
    MEMBER_IS_ADMIN BOOLEAN NOT NULL,
    MEMBER_BIRTHDATE DATE NOT NULL
);

CREATE TABLE GAME (
    GAME_ID SERIAL PRIMARY KEY,
    GAME_NAME VARCHAR(255) NOT NULL
);

CREATE TABLE TOURNAMENT (
    TOURNAMENT_ID SERIAL PRIMARY KEY,
    TOURNAMENT_NAME VARCHAR(255) NOT NULL,
    TOURNAMENT_DESCRIPTION VARCHAR(255) NOT NULL,
    TOURNAMENT_ENTRANT_LIMIT INT NOT NULL,
    TOURNAMENT_GAME_ID INT NOT NULL,
    TOURNAMENT_LOCATION VARCHAR(255) NOT NULL,
    TOURNAMENT_REG_END_DATE DATE NOT NULL,
    TOURNAMENT_START_DATE DATE NOT NULL,
    TOURNAMENT_THUMBNAIL VARCHAR(255) NOT NULL,
	TOURNAMENT_USERS INT[],
	TOURNAMENT_OWNERS INT[],
	FOREIGN KEY (TOURNAMENT_GAME_ID) REFERENCES GAME(GAME_ID)
);

CREATE TABLE BRACKET (
    BRACKET_ID SERIAL PRIMARY KEY,
    BRACKET_STYLE VARCHAR(255) NOT NULL,
    BRACKET_ENTRANT_LIMIT INT NOT NULL,
    BRACKET_NEXT INT NOT NULL,
    BRACKET_TOURNAMENT_ID INT NOT NULL,
    BRACKET_START_TIME DATE NOT NULL,
    BRACKET_NAME VARCHAR(255) NOT NULL,
	FOREIGN KEY (BRACKET_TOURNAMENT_ID) REFERENCES TOURNAMENT(TOURNAMENT_ID)
);

CREATE TABLE MATCH (
    MATCH_ID SERIAL PRIMARY KEY,
    MATCH_ROUND INT,
    MATCH_START_TIME DATE,
    MATCH_NEXT INT,
    MATCH_BRACKET_ID INT,
	FOREIGN KEY (MATCH_BRACKET_ID) REFERENCES BRACKET(BRACKET_ID)
);

CREATE TABLE MATCH_ENTRANT (
    ENTRANT_USER INT,
    ENTRANT_MATCH INT,
    ENTRANT_DQ BOOLEAN,
    ENTRANT_SCORE INT,
	FOREIGN KEY (ENTRANT_USER) REFERENCES MEMBER(MEMBER_ID),
	FOREIGN KEY (ENTRANT_MATCH) REFERENCES MATCH(MATCH_ID)
);

CREATE TABLE RANKING (
    RANKING_MEMBER_ID INT,
    RANKING_GAME_ID INT,
    RANKING_SCORE INT,
	PRIMARY KEY (RANKING_MEMBER_ID,RANKING_GAME_ID),
	FOREIGN KEY (RANKING_MEMBER_ID) REFERENCES MEMBER(MEMBER_ID),
	FOREIGN KEY (RANKING_GAME_ID) REFERENCES GAME(GAME_ID)
);



-- What is entrant seed doing here? What is it useful for?
-- CREATE TABLE TOURNAMENT_ENTRANT (
-- 	ENTRANT_SEED INT PRIMARY KEY,
--     ENTRANT_USER INT,
--     ENTRANT_TOURNAMENT INT,
-- 	FOREIGN KEY (ENTRANT_USER) REFERENCES USERS(USER_ID),
-- 	FOREIGN KEY (ENTRANT_TOURNAMENT) REFERENCES TOURNAMENTS(TOURNAMENT_ID)
-- );

-- Why do we need this table? It does not have any additonal data
-- CREATE TABLE BRACKET_ENTRANT (
--     ENTRANT_USER INT,
--     ENTRANT_BRACKET INT,
-- 	FOREIGN KEY (ENTRANT_USER) REFERENCES USERS(USER_ID),
-- 	FOREIGN KEY (ENTRANT_BRACKET) REFERENCES BRACKETS(BRACKET_ID)
-- );

-- Could the entrant score be somewhere else?
-- (No)

-- This table is adding nothing new?
-- CREATE TABLE TOURNAMENT_OWNER (
--     OWNER_USER INT,
--     OWNER_TOURNAMENT INT,
-- 	FOREIGN KEY (OWNER_USER) REFERENCES USERS(USER_ID),
-- 	FOREIGN KEY (OWNER_TOURNAMENT) REFERENCES TOURNAMENTS(TOURNAMENT_ID)
-- );
