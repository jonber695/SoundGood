CREATE TABLE admin_staff (
 id INT NOT NULL,
 employee_id VARCHAR(50) NOT NULL,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 street_name VARCHAR(50),
 street_number VARCHAR(10),
 zip VARCHAR(5)
);

ALTER TABLE admin_staff ADD CONSTRAINT PK_admin_staff PRIMARY KEY (id);


CREATE TABLE instuctor (
 id INT NOT NULL,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 age VARCHAR(10),
 personal_number VARCHAR(12) NOT NULL,
 street_name VARCHAR(50),
 street_number VARCHAR(10),
 zip VARCHAR(5)
);

ALTER TABLE instuctor ADD CONSTRAINT PK_instuctor PRIMARY KEY (id);


CREATE TABLE lesson_type_price (
 lesson_type VARCHAR(50) NOT NULL,
 price NUMERIC(32) NOT NULL
);

ALTER TABLE lesson_type_price ADD CONSTRAINT PK_lesson_type_price PRIMARY KEY (lesson_type);


CREATE TABLE level_of_lesson_price (
 level_of_lesson VARCHAR(50) NOT NULL,
 price NUMERIC(32) NOT NULL
);

ALTER TABLE level_of_lesson_price ADD CONSTRAINT PK_level_of_lesson_price PRIMARY KEY (level_of_lesson);


CREATE TABLE parent (
 id INT NOT NULL,
 street_name VARCHAR(50),
 street_number VARCHAR(10),
 zip VARCHAR(5)
);

ALTER TABLE parent ADD CONSTRAINT PK_parent PRIMARY KEY (id);


CREATE TABLE schedule (
 id INT NOT NULL
);

ALTER TABLE schedule ADD CONSTRAINT PK_schedule PRIMARY KEY (id);


CREATE TABLE sibling_dicount (
 parent_id INT NOT NULL,
 amount NUMERIC(32)
);

ALTER TABLE sibling_dicount ADD CONSTRAINT PK_sibling_dicount PRIMARY KEY (parent_id);


CREATE TABLE special_day_addon_price (
 special_day_addon VARCHAR(50) NOT NULL,
 price NUMERIC(32) NOT NULL
);

ALTER TABLE special_day_addon_price ADD CONSTRAINT PK_special_day_addon_price PRIMARY KEY (special_day_addon);


CREATE TABLE student (
 id INT NOT NULL,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 age VARCHAR(10) NOT NULL,
 personal_number VARCHAR(12) NOT NULL,
 street_name VARCHAR(50),
 street_number VARCHAR(10),
 zip VARCHAR(5),
 number_of_lessons INT,
 current_skill VARCHAR(50) NOT NULL,
 number_of_instruments_rented INT,
 parent_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE student_payment (
 student_id INT NOT NULL,
 amount NUMERIC(32)
);

ALTER TABLE student_payment ADD CONSTRAINT PK_student_payment PRIMARY KEY (student_id);


CREATE TABLE application (
 student_id INT NOT NULL,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 age VARCHAR(10) NOT NULL,
 personal_number VARCHAR(12) NOT NULL,
 instrument VARCHAR(50) NOT NULL,
 admin_staff_id INT
);

ALTER TABLE application ADD CONSTRAINT PK_application PRIMARY KEY (student_id);


CREATE TABLE appointment (
 schedule_id INT NOT NULL,
 time TIMESTAMP(10),
 date VARCHAR(10)
);

ALTER TABLE appointment ADD CONSTRAINT PK_appointment PRIMARY KEY (schedule_id);


CREATE TABLE audition (
 student_id INT NOT NULL,
 is_passed VARCHAR(5)
);

ALTER TABLE audition ADD CONSTRAINT PK_audition PRIMARY KEY (student_id);


CREATE TABLE email (
 email VARCHAR(50) NOT NULL,
 student_id INT NOT NULL,
 parent_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (email,student_id,parent_id,instructor_id);


CREATE TABLE individual_lesson (
 schedule_id INT NOT NULL,
 level VARCHAR(50),
 instrument VARCHAR(50),
 student_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (schedule_id);


CREATE TABLE instructor_payment (
 instructor_id INT NOT NULL,
 amount NUMERIC(32)
);

ALTER TABLE instructor_payment ADD CONSTRAINT PK_instructor_payment PRIMARY KEY (instructor_id);


CREATE TABLE number_of_children (
 parent_id INT NOT NULL,
 number_of_children INT
);

ALTER TABLE number_of_children ADD CONSTRAINT PK_number_of_children PRIMARY KEY (parent_id);


CREATE TABLE phone_number (
 phone_number VARCHAR(15) NOT NULL,
 parent_id INT NOT NULL,
 student_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE phone_number ADD CONSTRAINT PK_phone_number PRIMARY KEY (phone_number,parent_id,student_id,instructor_id);


CREATE TABLE rental_agreement_for_instrument (
 student_id INT NOT NULL,
 length INT,
 start_date VARCHAR(15),
 end_date VARCHAR(15)
);

ALTER TABLE rental_agreement_for_instrument ADD CONSTRAINT PK_rental_agreement_for_instrument PRIMARY KEY (student_id);


CREATE TABLE schedualed_time_slot (
 schedule_id INT NOT NULL,
 time TIMESTAMP(10),
 date VARCHAR(10)
);

ALTER TABLE schedualed_time_slot ADD CONSTRAINT PK_schedualed_time_slot PRIMARY KEY (schedule_id);


CREATE TABLE ensemble (
 schedule_id INT NOT NULL,
 target_genre VARCHAR(50),
 min_number_of_students VARCHAR(10) NOT NULL,
 max_number_of_students VARCHAR(10) NOT NULL,
 instructor_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (schedule_id);


CREATE TABLE group_lesson (
 schedule_id INT NOT NULL,
 min_number_of_students VARCHAR(10) NOT NULL,
 max_number_of_students VARCHAR(10) NOT NULL,
 level VARCHAR(50),
 Instrument VARCHAR(50),
 instructor_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (schedule_id);


CREATE TABLE instrument (
 id INT NOT NULL,
 brand VARCHAR(50) NOT NULL,
 type VARCHAR(50) NOT NULL,
 quantity INT NOT NULL,
 price NUMERIC(32) NOT NULL,
 student_id INT
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (id);


CREATE TABLE price (
 schedule_id INT NOT NULL,
 lesson_type VARCHAR(50) NOT NULL,
 level_of_lesson VARCHAR(50) NOT NULL,
 special_day_addon VARCHAR(50) NOT NULL
);

ALTER TABLE price ADD CONSTRAINT PK_price PRIMARY KEY (schedule_id);


ALTER TABLE sibling_dicount ADD CONSTRAINT FK_sibling_dicount_0 FOREIGN KEY (parent_id) REFERENCES parent (id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (parent_id) REFERENCES parent (id);


ALTER TABLE student_payment ADD CONSTRAINT FK_student_payment_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE application ADD CONSTRAINT FK_application_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE application ADD CONSTRAINT FK_application_1 FOREIGN KEY (admin_staff_id) REFERENCES admin_staff (id);


ALTER TABLE appointment ADD CONSTRAINT FK_appointment_0 FOREIGN KEY (schedule_id) REFERENCES schedule (id);


ALTER TABLE audition ADD CONSTRAINT FK_audition_0 FOREIGN KEY (student_id) REFERENCES application (student_id);


ALTER TABLE email ADD CONSTRAINT FK_email_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE email ADD CONSTRAINT FK_email_1 FOREIGN KEY (parent_id) REFERENCES parent (id);
ALTER TABLE email ADD CONSTRAINT FK_email_2 FOREIGN KEY (instructor_id) REFERENCES instuctor (id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (schedule_id) REFERENCES appointment (schedule_id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_2 FOREIGN KEY (instructor_id) REFERENCES instuctor (id);


ALTER TABLE instructor_payment ADD CONSTRAINT FK_instructor_payment_0 FOREIGN KEY (instructor_id) REFERENCES instuctor (id);


ALTER TABLE number_of_children ADD CONSTRAINT FK_number_of_children_0 FOREIGN KEY (parent_id) REFERENCES parent (id);


ALTER TABLE phone_number ADD CONSTRAINT FK_phone_number_0 FOREIGN KEY (parent_id) REFERENCES parent (id);
ALTER TABLE phone_number ADD CONSTRAINT FK_phone_number_1 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE phone_number ADD CONSTRAINT FK_phone_number_2 FOREIGN KEY (instructor_id) REFERENCES instuctor (id);


ALTER TABLE rental_agreement_for_instrument ADD CONSTRAINT FK_rental_agreement_for_instrument_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE schedualed_time_slot ADD CONSTRAINT FK_schedualed_time_slot_0 FOREIGN KEY (schedule_id) REFERENCES schedule (id);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (schedule_id) REFERENCES schedualed_time_slot (schedule_id);
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (instructor_id) REFERENCES instuctor (id);
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_2 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (schedule_id) REFERENCES schedualed_time_slot (schedule_id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (instructor_id) REFERENCES instuctor (id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_2 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (student_id) REFERENCES rental_agreement_for_instrument (student_id);


ALTER TABLE price ADD CONSTRAINT FK_price_0 FOREIGN KEY (schedule_id) REFERENCES group_lesson (schedule_id);
ALTER TABLE price ADD CONSTRAINT FK_price_1 FOREIGN KEY (schedule_id) REFERENCES ensemble (schedule_id);
ALTER TABLE price ADD CONSTRAINT FK_price_2 FOREIGN KEY (schedule_id) REFERENCES individual_lesson (schedule_id);
ALTER TABLE price ADD CONSTRAINT FK_price_3 FOREIGN KEY (lesson_type) REFERENCES lesson_type_price (lesson_type);
ALTER TABLE price ADD CONSTRAINT FK_price_4 FOREIGN KEY (level_of_lesson) REFERENCES level_of_lesson_price (level_of_lesson);
ALTER TABLE price ADD CONSTRAINT FK_price_5 FOREIGN KEY (special_day_addon) REFERENCES special_day_addon_price (special_day_addon);


