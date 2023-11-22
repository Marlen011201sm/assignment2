DROP TABLE IF EXISTS appointment;
DROP TABLE IF EXISTS job_application;
DROP TABLE IF EXISTS job;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS caregiver;
DROP TABLE IF EXISTS USERS;

CREATE TABLE USERS (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(80) NOT NULL,
    given_name VARCHAR(30) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    city VARCHAR(50),
    phone_number VARCHAR(12),
    profile_description TEXT,
    password VARCHAR(80) NOT NULL
);


CREATE TABLE CAREGIVER (
    caregiver_user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    photo BLOB,
    gender VARCHAR(20),
    caregiving_type VARCHAR(100) NOT NULL,
    hourly_rate DECIMAL(6, 3) NOT NULL,
    FOREIGN KEY (caregiver_user_id) REFERENCES USERS(user_id) ON DELETE CASCADE
);

CREATE TABLE MEMBER (
    member_user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    house_rules TEXT,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE
);

CREATE TABLE ADDRESS (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    house_number VARCHAR(100),
    street VARCHAR(80),
    town VARCHAR(80),
    member_user_id INT NOT NULL,
    FOREIGN KEY (member_user_id) REFERENCES MEMBER(member_user_id) ON DELETE CASCADE
);

CREATE TABLE JOB (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    member_user_id INT,
    required_caregiving_type VARCHAR(40) NOT NULL,
    other_requirements TEXT,
    date_posted DATE,
    FOREIGN KEY (member_user_id) REFERENCES MEMBER(member_user_id) ON DELETE CASCADE
);

CREATE TABLE JOB_APPLICATION (
    job_application_id INT AUTO_INCREMENT PRIMARY KEY,
    caregiver_user_id INT,
    job_id INT,
    date_applied DATE,
    FOREIGN KEY (caregiver_user_id) REFERENCES CAREGIVER(caregiver_user_id) ON DELETE CASCADE,
    FOREIGN KEY (job_id) REFERENCES JOB(job_id) ON DELETE CASCADE
);

CREATE TABLE APPOINTMENT (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    caregiver_user_id INT,
    member_user_id INT,
    appointment_date DATE,
    appointment_time TIME,
    work_hours INT,
    status VARCHAR(20),
    FOREIGN KEY (caregiver_user_id) REFERENCES CAREGIVER(caregiver_user_id) ON DELETE CASCADE,
    FOREIGN KEY (member_user_id) REFERENCES MEMBER(member_user_id) ON DELETE CASCADE
);



INSERT INTO USERS (email, given_name, surname, city, phone_number, profile_description, password) VALUES
('salta2001@example.com', 'Saltanat', 'Myrzakhatova', 'Astana', '+77479752690', 'Loves kids', 'password1'),
('aru2000@example.com', 'Aruzhan', 'Nurmoldaeva', 'Almaty', '+77479752691', 'Good conversation skills', 'password2'),
('symbat2001@example.com', 'Symbat', 'Ganieva', 'Almaty', '+77479752692', 'Has planty of ideas about games', 'password3'),
('kama1999@example.com', 'Kamila', 'Nurymova', 'Shymkent', '+77479752693', 'Cares about babies', 'password4'),
('aizhan2002@example.com', 'Aizhan', 'Nurzhanova', 'Aktau', '+77479752694', '', 'password5'),
('aidana2000@example.com', 'Aidana', 'Ramatullaeva', 'Almaty', '+77479752695', 'Needs Playmate for Children', 'password6'),
('aiganym1998@example.com', 'Aiganym', 'Zhapparova', 'Pavlodar', '+77479752696', 'Elderly Care', 'password7'),
('dana1998@example.com', 'Dana', 'Ainieva', 'Semey', '+77479752697', 'Babysitter', 'password8'),
('sezim2004@example.com', 'Sezim', 'Ydyrysova', 'Semey', '+77479752698', 'Needs Elderly Care', 'password9'),
('lyazzat2000@example.com', 'Lyazzat', 'Abdukarimova', 'Kokshetau', '+77479752699', 'Babysitter', 'password10'),
('Alia@example.com', 'Alia', 'Bekturova', 'Almaty', '+77071234567', 'Tech enthusiast', 'password2'),
('Gulmira@example.com', 'Gulmira', 'Zhunisova', 'Karaganda', '+77771234567', 'Nature lover', 'password3'),
('Aizhan@example.com', 'Aizhan', 'Kazbekova', 'Pavlodar', '+77771234569', 'Art and music lover', 'password5'),
('Dauren@example.com', 'Dauren', 'Nurpeisov', 'Shymkent', '+77071234568', 'Fitness fanatic', 'password4'),
('Bakhyt@example.com', 'Bakhyt', 'Rakhimov', 'Taraz', '+77071234570', 'Foodie and traveler', 'password6'),
('Dana@example.com', 'Dana', 'Tursynbekova', 'Atyrau', '+77771234571', 'Bookworm', 'password7'),
('Erlan@example.com', 'Erlan', 'Zhumabayev', 'Aktobe', '+77071234572', 'Outdoor adventurer', 'password8'),
('Zarina@example.com', 'Zarina', 'Mukhamedova', 'Kyzylorda', '+77771234573', 'Tech entrepreneur', 'password9'),
('Kairat@example.com', 'Kairat', 'Akhmetov', 'Petropavl', '+77071234574', 'Photography enthusiast', 'password10'),
('Madina@example.com', 'Madina', 'Kanatova', 'Oskemen', '+77771234575', 'Animal rights activist', 'password11'),
('Nurlan@example.com', 'Nurlan', 'Tuleubayev', 'Semey', '+77071234576', 'Film and TV buff', 'password12'),
('Raushan@example.com', 'Raushan', 'Yessengeldiyeva', 'Kostanay', '+77771234577', 'Gamer', 'password13'),
('Saken@example.com', 'Saken', 'Kairbekov', 'Pavlodar', '+77071234578', 'Sports enthusiast', 'password14'),
('Togzhan@example.com', 'Togzhan', 'Sarsenbayeva', 'Almaty', '+77771234579', 'Fashionista', 'password15'),
('Ulan@example.com', 'Ulan', 'Bisenov', 'Astana', '+77071234580', 'Coffee connoisseur', 'password16'),
('Bolat@example.com', 'Bolat', 'Bolatov', 'Aktau', '+77771234993', 'Tech entrepreneur', '011201'),
('Askar@example.com', 'Askar', 'Askarov', 'Shymkent', '+77771234581', 'Yoga practitioner', 'password17');


--INSERT INTO CAREGIVER (caregiver_user_id, photo, gender, caregiving_type, hourly_rate, user_id) VALUES
--(100, NULL, 'Female', 'Playmate for Children', 10.55, 1),
--(101, NULL, 'Female', 'Elderly Care', 8.00,2),
--(102, NULL, 'Female', 'Babysitter', 9.50,3),
--(103, NULL, 'Female', 'Babysitter', 13.00,4),
--(104, NULL, 'Female', 'Elderly Care', 9.50,5),
--(105, NULL, 'Female', 'Babysitter', 7.00,6),
--(106, NULL, 'Female', 'Babysitter', 10.99,7),
--(107, NULL, 'Female', 'Elderly Care', 12.00,8),
--(108, NULL, 'Female', 'Playmate for Children', 8.99,9),
--(109, NULL, 'Female', 'Playmate for Children', 10.49,10),
--(110, NULL, 'Female', 'Playmate for Children', 11.99,11),
--(111, NULL, 'Female', 'Playmate for Children', 12.49,12);
--
--INSERT INTO MEMBER (member_user_id, house_rules) VALUES
--(112, 'No shoes inside the house'),
--(113, 'No pets'),
--(114, 'Turn off lights and appliances when not in use'),
--(115, 'Respect quiet hours, especially during nighttime'),
--(116, 'No smoking inside the house'),
--(117, 'No pets'),
--(118, 'Be mindful of energy consumption'),
--(119, 'Keep personal belongings in designated areas'),
--(120, 'No pets'),
--(121, 'Report any damages or issues promptly'),
--(122, 'Participate in a rotating cleaning schedule'),
--(123, 'Be mindful of energy consumption'),
--(124, 'No pets'),
--(125, 'Be considerate of different schedules and routines'),
--(126, 'No smoking inside the house');
--
--INSERT INTO ADDRESS (member_user_id, house_number, street, town) VALUES
--(112, '789', 'Pine', 'Pavlodar'),
--(113, '101', 'Cedar', 'Shymkent'),
--(114, '202', 'Turan', 'Taraz'),
--(115, '303', 'Birch', 'Atyrau'),
--(116, '404', 'Tashkent', 'Aktobe'),
--(117, '505', 'Sain', 'Kyzylorda'),
--(118, '606', 'Ash', 'Petropavl'),
--(119, '707', 'Turan', 'Oskemen'),
--(120, '951', 'Main', 'Semey'),
--(121, '159', 'Oak', 'Kostanay'),
--(122, '123', 'Main', 'Pavlodar'),
--(123, '879', 'Turan', 'Almaty'),
--(124, '666', 'Main', 'Astana'),
--(125, '456', 'Qabanbay', 'Aktau'),
--(126, '588', 'Bogenbay', 'Shymkent');
--
--INSERT INTO JOB (member_user_id, required_caregiving_type, other_requirements, date_posted) VALUES
--(112, 'Elderly Care', 'Quiet playtime', '2023-11-19'),
--(113, 'Babysitter', 'gentle', '2023-11-20'),
--(114, 'Playmate for Children', 'Quiet playtime', '2023-11-21'),
--(115, 'Elderly Care', 'No smoking', '2023-11-22'),
--(116, 'Babysitter', 'Art and craft activities', '2023-11-23'),
--(117, 'Playmate for Children', 'Child-friendly space', '2023-11-24'),
--(118, 'Elderly Care', 'gentle', '2023-11-25'),
--(119, 'Babysitter', 'Daily check-ins', '2023-11-26'),
--(120, 'Playmate for Children', 'Pet-friendly', '2023-11-27'),
--(121, 'Elderly Care', 'Quiet hours after 9 PM', '2023-11-28'),
--(122, 'Playmate for Children', 'Child-friendly space', '2023-11-24'),
--(123, 'Elderly Care', 'Water plants responsibly', '2023-11-25'),
--(124, 'Elderly Care', 'gentle', '2023-11-26'),
--(125, 'Playmate for Children', 'Pet-friendly', '2023-11-27'),
--(126, 'Elderly Care', 'gentle', '2023-11-28');
--
--INSERT INTO JOB_APPLICATION (caregiver_user_id, job_id, date_applied) VALUES
--(100, 1, '2023-11-20'),
--(101, 2, '2023-11-21'),
--(102, 3, '2023-11-22'),
--(103, 4, '2023-11-23'),
--(104, 5, '2023-11-24'),
--(105, 6, '2023-11-25'),
--(106, 7, '2023-11-26'),
--(107, 8, '2023-11-27'),
--(108, 9, '2023-11-28'),
--(109, 10, '2023-11-29'),
--(110, 11, '2023-11-28'),
--(111, 12, '2023-11-29');
--
--INSERT INTO APPOINTMENT (caregiver_user_id, member_user_id, appointment_date, appointment_time, work_hours, status) VALUES
--(100, 112, '2023-12-01', '14:00:00', 3, 'Confirmed'),
--(101, 113, '2023-12-02', '15:30:00', 2, 'Confirmed'),
--(102, 114, '2023-12-03', '12:00:00', 4, 'Pending'),
--(103, 115, '2023-12-04', '16:00:00', 5, 'Confirmed'),
--(104, 116, '2023-12-05', '10:00:00', 6, 'Confirmed'),
--(105, 116, '2023-12-06', '13:30:00', 3, 'Pending'),
--(106, 117, '2023-12-07', '11:00:00', 4, 'Confirmed'),
--(107, 118, '2023-12-08', '14:30:00', 2, 'Confirmed'),
--(108, 119, '2023-12-09', '09:00:00', 7, 'Pending'),
--(109, 120, '2023-12-10', '17:00:00', 4, 'Confirmed'),
--(110, 121, '2023-12-08', '14:30:00', 2, 'Confirmed'),
--(111, 122, '2023-12-09', '09:00:00', 7, 'Pending'),
--(103, 125, '2023-12-10', '17:00:00', 4, 'Confirmed');

