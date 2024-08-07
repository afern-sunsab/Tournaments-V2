-- Drop existing tables if they exist
DROP TABLE IF EXISTS DB_Survey_Measurements CASCADE;
DROP TABLE IF EXISTS DB_Fracture_Measurements CASCADE;
DROP TABLE IF EXISTS DB_Survey_Parameters CASCADE;
DROP TABLE IF EXISTS DB_Fracture_Parameters CASCADE;
DROP TABLE IF EXISTS DB_Survey_Design CASCADE;
DROP TABLE IF EXISTS DB_Fracture_Design CASCADE;
DROP TABLE IF EXISTS DB_Well CASCADE;
DROP TABLE IF EXISTS DB_Pad CASCADE;
DROP TABLE IF EXISTS DB_Group CASCADE;

-- Create tables
CREATE TABLE DB_Group (
    Group_ID INT PRIMARY KEY,
	Group_Name VARCHAR(255)
);

CREATE TABLE DB_Pad (
    Pad_ID INT PRIMARY KEY,
    Group_ID INT REFERENCES DB_Group(Group_ID)
);

CREATE TABLE DB_Well (
    Well_ID INT PRIMARY KEY,
	Pad_ID INT REFERENCES DB_Pad(Pad_ID)
);

CREATE TABLE DB_Survey_Design (
    Survey_ID INT PRIMARY KEY,
    Lateral_Length double precision,
    Well_Spacing double precision,
    Drill_Turn double precision,
    Turn_Direction BOOLEAN,
    Lateral_Azimuth double precision,
    Total_Depth double precision,
    Drill_Build double precision,
    Lateral_Dip double precision,
	Well_ID INT REFERENCES DB_Well(Well_ID)
);

CREATE TABLE DB_Fracture_Design (
    Fracture_ID INT PRIMARY KEY,
    Fracture_Spacing double precision,
    Backoff double precision,
    Inclination_Cutoff double precision,
    Joint_Length double precision,
    Survey_Design JSON,
	Well_ID INT REFERENCES DB_Well(Well_ID)
);

CREATE TABLE DB_Survey_Measurements (
    Measurment_ID INT PRIMARY KEY,
    Measured_Depth double precision,
    Inclination double precision,
    Azimuth double precision,
    TVD double precision,
    Subsea double precision,
    Vertical_Section double precision,
    Dogleg double precision,
    NS double precision,
    EW double precision,
    Delta_X double precision,
    Delta_Y double precision,
	Well_ID INT REFERENCES DB_Well(Well_ID)
);

CREATE TABLE DB_Fracture_Measurements (
    Measurement_ID INT PRIMARY KEY,
    EW_Surface_Plus double precision,
    EW_Surface_Minus double precision,
    NS_Surface_Plus double precision,
    NS_Surface_Minus double precision,
    TVD_Subsea_Plus double precision,
    TVD_Subsea_Minus double precision,
	Well_ID INT REFERENCES DB_Well(Well_ID)
);

CREATE TABLE DB_Survey_Parameters (
    Paramater_ID INT PRIMARY KEY,
    Surface_X double precision,
    Surface_Y double precision,
    KB_Elevation double precision,
	Well_ID INT REFERENCES DB_Well(Well_ID)
);

CREATE TABLE DB_Fracture_Parameters (
    Parameter_ID INT PRIMARY KEY,
    Half_Length double precision,
    Azimuth double precision,
    Height double precision,
	Well_ID INT REFERENCES DB_Well(Well_ID)
);
