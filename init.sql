CREATE table Accounts
(
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    email           varchar(50) UNIQUE NOT NULL,
    password        varchar(100),
    isEmailVerified boolean,
    isMentor        boolean
);

CREATE TYPE gender AS ENUM ('male', 'female', 'unknown');

create table UserProfiles
(
    accountId   uuid PRIMARY KEY REFERENCES Accounts (id),
    fname       varchar(255),
    lname       varchar(255),
    description text,
    DOB         date,
    gender      gender,
    avatarURL   varchar(255),
    coverURL    varchar(255)
)

