CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name_users" varchar(70) NOT NULL,
  "email_users" varchar(70) NOT NULL,
  "password_user" varchar(10) NOT NULL,
  "age_user" int NOT NULL,
  "id_rol" int NOT NULL
);

CREATE TABLE "roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "type" varchar(15) NOT NULL
);

CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,

  "title_course" varchar(100) NOT NULL,
  "description_course" varchar(200) NOT NULL,
  "level_course_id" int NOT NULL,
  "teacher_course_id" int NOT NULL,
  "category_id" int NOT NULL
);

CREATE TABLE "status_course" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name_user_id" int NOT NULL,
  "name_course_id" int NOT NULL
);

CREATE TABLE "level_courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "type" varchar(15) NOT NULL
);

CREATE TABLE "course_video" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title_course_video" varchar(100) NOT NULL,
  "url_video_course" varchar(200) NOT NULL,
  "title_course_id" int NOT NULL
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title_course" varchar(50) NOT NULL
);

ALTER TABLE "courses" ADD FOREIGN KEY ("level_course_id") REFERENCES "level_courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_course_id") REFERENCES "users" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("title_course_id") REFERENCES "courses" ("id");

ALTER TABLE "roles" ADD FOREIGN KEY ("id") REFERENCES "users" ("id_rol");

ALTER TABLE "status_course" ADD FOREIGN KEY ("name_course_id") REFERENCES "courses" ("id");

ALTER TABLE "status_course" ADD FOREIGN KEY ("name_user_id") REFERENCES "users" ("id");

INSERT INTO roles (type) VALUES ('student'), ('teacher'), ('admin');

INSERT INTO users (name_users, email_users, password_user, age_user, id_rol) VALUES ('roger', 'roger@email.com', '12345', 18, 1), ('maria', 'maria@email.com', '56789', 20, 2), ('carmen', 'carmen@email.com', '74123', 26, 2), ('juan', 'juan@email.com', '58963', 45, 3), ('pedro', 'pedro@email.com', '96325', 36, 1), ('mario', 'mario@email.com', '58741', 53, 1), ('ronald', 'ronald@email.com', '15963', 42, 1);

INSERT INTO level_courses (type) VALUES ('beginner'), ('intermadiate'), ('advanced');

INSERT INTO categories (title_course) VALUES ('frontend'), ('backend'), ('desing'), ('drawing'), ('architecture'), ('economy'), ('work_online');

INSERT INTO courses (title_course, description_course, level_course_id, teacher_course_id, category_id) VALUES ('html beginner', 'description html beginner', 1, 2, 1), ('css beginner', 'description css beginner', 1, 2, 1), ('css intermediate', 'description css intermediate', 2, 3, 1), ('react beginner', 'description react beginner', 1, 4, 1), ('react intermediate', 'description react intermediate', 2, 4, 1), ('react advanced', 'description react advanced', 3, 3, 1), ('nodejs intermediate', 'description react intermediate', 1, 2, 2);

INSERT INTO course_video (title_course_video, url_video_course, title_course_id) VALUES ('estructura', 'www.htmlbeginner1.com', 1), ('etiquetas', 'www.htmlbeginner2.com', 1), ('css intro', 'www.cssintermediate1.com', 2), ('css flex box', 'www.cssintermediate2.com', 2), ('react intermadiate', 'www.reactintermediate1.com', 5), ('react advanced', 'www.reactadvanced1.com', 6), ('nodejs intermediate', 'www.nodejsintermediate1.com', 7);

INSERT INTO status_course (name_user_id, name_course_id) VALUES (1,1), (1,5), (2,3), (2,7), (2,5), (3,2), (4,7);