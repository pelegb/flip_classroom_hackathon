PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "django_admin_log" (
    "id" integer NOT NULL PRIMARY KEY,
    "action_time" datetime NOT NULL,
    "user_id" integer NOT NULL,
    "content_type_id" integer,
    "object_id" text,
    "object_repr" varchar(200) NOT NULL,
    "action_flag" smallint unsigned NOT NULL,
    "change_message" text NOT NULL
);
INSERT INTO "django_admin_log" VALUES(1,'2013-12-23 18:42:12.077937',1,3,'1','Teachers',1,'');
INSERT INTO "django_admin_log" VALUES(2,'2013-12-23 18:45:03.747558',1,4,'2','itamar',1,'');
INSERT INTO "django_admin_log" VALUES(3,'2013-12-23 18:45:32.390536',1,4,'2','itamar',2,'groups שונה.');
INSERT INTO "django_admin_log" VALUES(4,'2013-12-23 18:46:35.223538',1,4,'2','itamar',2,'first_name, last_name ו email שונה.');
INSERT INTO "django_admin_log" VALUES(5,'2013-12-23 18:47:06.967888',1,4,'3','yonatan',1,'');
INSERT INTO "django_admin_log" VALUES(6,'2013-12-23 18:47:37.350762',1,4,'3','yonatan',2,'first_name, last_name ו email שונה.');
INSERT INTO "django_admin_log" VALUES(7,'2013-12-23 19:10:27.274439',1,3,'1','Teachers',2,'permissions שונה.');
CREATE TABLE "auth_permission" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" varchar(100) NOT NULL,
    UNIQUE ("content_type_id", "codename")
);
INSERT INTO "auth_permission" VALUES(1,'Can add log entry',1,'add_logentry');
INSERT INTO "auth_permission" VALUES(2,'Can change log entry',1,'change_logentry');
INSERT INTO "auth_permission" VALUES(3,'Can delete log entry',1,'delete_logentry');
INSERT INTO "auth_permission" VALUES(4,'Can add permission',2,'add_permission');
INSERT INTO "auth_permission" VALUES(5,'Can change permission',2,'change_permission');
INSERT INTO "auth_permission" VALUES(6,'Can delete permission',2,'delete_permission');
INSERT INTO "auth_permission" VALUES(7,'Can add group',3,'add_group');
INSERT INTO "auth_permission" VALUES(8,'Can change group',3,'change_group');
INSERT INTO "auth_permission" VALUES(9,'Can delete group',3,'delete_group');
INSERT INTO "auth_permission" VALUES(10,'Can add user',4,'add_user');
INSERT INTO "auth_permission" VALUES(11,'Can change user',4,'change_user');
INSERT INTO "auth_permission" VALUES(12,'Can delete user',4,'delete_user');
INSERT INTO "auth_permission" VALUES(13,'Can add content type',5,'add_contenttype');
INSERT INTO "auth_permission" VALUES(14,'Can change content type',5,'change_contenttype');
INSERT INTO "auth_permission" VALUES(15,'Can delete content type',5,'delete_contenttype');
INSERT INTO "auth_permission" VALUES(16,'Can add session',6,'add_session');
INSERT INTO "auth_permission" VALUES(17,'Can change session',6,'change_session');
INSERT INTO "auth_permission" VALUES(18,'Can delete session',6,'delete_session');
INSERT INTO "auth_permission" VALUES(19,'Can add teach topic',7,'add_teachtopic');
INSERT INTO "auth_permission" VALUES(20,'Can change teach topic',7,'change_teachtopic');
INSERT INTO "auth_permission" VALUES(21,'Can delete teach topic',7,'delete_teachtopic');
INSERT INTO "auth_permission" VALUES(22,'Can add teach item',8,'add_teachitem');
INSERT INTO "auth_permission" VALUES(23,'Can change teach item',8,'change_teachitem');
INSERT INTO "auth_permission" VALUES(24,'Can delete teach item',8,'delete_teachitem');
INSERT INTO "auth_permission" VALUES(25,'Can add video page',9,'add_videopage');
INSERT INTO "auth_permission" VALUES(26,'Can change video page',9,'change_videopage');
INSERT INTO "auth_permission" VALUES(27,'Can delete video page',9,'delete_videopage');
INSERT INTO "auth_permission" VALUES(28,'Can add rating review',10,'add_ratingreview');
INSERT INTO "auth_permission" VALUES(29,'Can change rating review',10,'change_ratingreview');
INSERT INTO "auth_permission" VALUES(30,'Can delete rating review',10,'delete_ratingreview');
INSERT INTO "auth_permission" VALUES(31,'Can add textual review',11,'add_textualreview');
INSERT INTO "auth_permission" VALUES(32,'Can change textual review',11,'change_textualreview');
INSERT INTO "auth_permission" VALUES(33,'Can delete textual review',11,'delete_textualreview');
INSERT INTO "auth_permission" VALUES(34,'Can add tag',12,'add_tag');
INSERT INTO "auth_permission" VALUES(35,'Can change tag',12,'change_tag');
INSERT INTO "auth_permission" VALUES(36,'Can delete tag',12,'delete_tag');
INSERT INTO "auth_permission" VALUES(37,'Can add tag video',13,'add_tagvideo');
INSERT INTO "auth_permission" VALUES(38,'Can change tag video',13,'change_tagvideo');
INSERT INTO "auth_permission" VALUES(39,'Can delete tag video',13,'delete_tagvideo');
CREATE TABLE "auth_group_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("group_id", "permission_id")
);
INSERT INTO "auth_group_permissions" VALUES(1,1,13);
INSERT INTO "auth_group_permissions" VALUES(2,1,14);
INSERT INTO "auth_group_permissions" VALUES(3,1,15);
INSERT INTO "auth_group_permissions" VALUES(4,1,19);
INSERT INTO "auth_group_permissions" VALUES(5,1,20);
INSERT INTO "auth_group_permissions" VALUES(6,1,21);
INSERT INTO "auth_group_permissions" VALUES(7,1,22);
INSERT INTO "auth_group_permissions" VALUES(8,1,23);
INSERT INTO "auth_group_permissions" VALUES(9,1,24);
INSERT INTO "auth_group_permissions" VALUES(10,1,25);
INSERT INTO "auth_group_permissions" VALUES(11,1,26);
INSERT INTO "auth_group_permissions" VALUES(12,1,27);
INSERT INTO "auth_group_permissions" VALUES(13,1,28);
INSERT INTO "auth_group_permissions" VALUES(14,1,29);
INSERT INTO "auth_group_permissions" VALUES(15,1,30);
INSERT INTO "auth_group_permissions" VALUES(16,1,31);
INSERT INTO "auth_group_permissions" VALUES(17,1,32);
INSERT INTO "auth_group_permissions" VALUES(18,1,33);
INSERT INTO "auth_group_permissions" VALUES(19,1,34);
INSERT INTO "auth_group_permissions" VALUES(20,1,35);
INSERT INTO "auth_group_permissions" VALUES(21,1,36);
INSERT INTO "auth_group_permissions" VALUES(22,1,37);
INSERT INTO "auth_group_permissions" VALUES(23,1,38);
INSERT INTO "auth_group_permissions" VALUES(24,1,39);
CREATE TABLE "auth_group" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(80) NOT NULL UNIQUE
);
INSERT INTO "auth_group" VALUES(1,'Teachers');
CREATE TABLE "auth_user_groups" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL REFERENCES "auth_group" ("id"),
    UNIQUE ("user_id", "group_id")
);
INSERT INTO "auth_user_groups" VALUES(1,2,1);
CREATE TABLE "auth_user_user_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("user_id", "permission_id")
);
CREATE TABLE "auth_user" (
    "id" integer NOT NULL PRIMARY KEY,
    "password" varchar(128) NOT NULL,
    "last_login" datetime NOT NULL,
    "is_superuser" bool NOT NULL,
    "username" varchar(30) NOT NULL UNIQUE,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL,
    "email" varchar(75) NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL,
    "date_joined" datetime NOT NULL
);
INSERT INTO "auth_user" VALUES(1,'pbkdf2_sha256$12000$YntSkEvG8yvF$YH7bGuLDP5KJQeB7jo2xrCQ/ZArP/a9bcyzW5YbfMrA=','2013-12-23 19:02:47.711077',1,'flip','','','flip@klum.com',1,1,'2013-12-14 16:06:45.523886');
INSERT INTO "auth_user" VALUES(2,'pbkdf2_sha256$12000$UfBZxSIUoRuf$5zDtBGtihOe0dWSChLLa6nYixY+bBQauNs00tvQoikg=','2013-12-23 19:11:21.650798',0,'itamar','איתמר','המורה','ita@mar.com',0,1,'2013-12-23 18:45:03');
INSERT INTO "auth_user" VALUES(3,'pbkdf2_sha256$12000$LVyaqjCgy2BK$p8GC5xzcF7iRClI9l5edgqAIiisSxDrE4kqkOJMMe7Q=','2013-12-23 19:16:47.489351',0,'yonatan','יונתן','התלמיד','yona@tan.com',0,1,'2013-12-23 18:47:06');
CREATE TABLE "django_content_type" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(100) NOT NULL,
    "app_label" varchar(100) NOT NULL,
    "model" varchar(100) NOT NULL,
    UNIQUE ("app_label", "model")
);
INSERT INTO "django_content_type" VALUES(1,'log entry','admin','logentry');
INSERT INTO "django_content_type" VALUES(2,'permission','auth','permission');
INSERT INTO "django_content_type" VALUES(3,'group','auth','group');
INSERT INTO "django_content_type" VALUES(4,'user','auth','user');
INSERT INTO "django_content_type" VALUES(5,'content type','contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(6,'session','sessions','session');
INSERT INTO "django_content_type" VALUES(7,'teach topic','core','teachtopic');
INSERT INTO "django_content_type" VALUES(8,'teach item','core','teachitem');
INSERT INTO "django_content_type" VALUES(9,'video page','core','videopage');
INSERT INTO "django_content_type" VALUES(10,'rating review','core','ratingreview');
INSERT INTO "django_content_type" VALUES(11,'textual review','core','textualreview');
INSERT INTO "django_content_type" VALUES(12,'tag','core','tag');
INSERT INTO "django_content_type" VALUES(13,'tag video','core','tagvideo');
CREATE TABLE "django_session" (
    "session_key" varchar(40) NOT NULL PRIMARY KEY,
    "session_data" text NOT NULL,
    "expire_date" datetime NOT NULL
);
INSERT INTO "django_session" VALUES('klmur794b0djmk4yk8g2bmrkxzapwifz','ODliYzc5ZWM1NTlkY2Y0OWM0NDU1ZmI5Y2Q3YWY5NmU1NDhlYTU4Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=','2014-01-06 19:16:47.529382');
CREATE TABLE "core_teachtopic" (
    "id" integer NOT NULL PRIMARY KEY,
    "title" varchar(50) NOT NULL,
    "description" text NOT NULL,
    "parent_id" integer REFERENCES "core_teachtopic" ("id")
);
INSERT INTO "core_teachtopic" VALUES(1,'פיזיקה','פיזיקה (מהמילה היוונית פיזיס φύσις, טבע) היא ענף במדעי הטבע החוקר את חוקי היסוד של הטבע כפי שהם באים לידי ביטוי בכל מערכת הניתנת לתצפית, בכדור הארץ ובחלל. הנושאים בהם עוסקת הפיזיקה כוללים תנועת עצמים, התנהגות החומר, חקר האנרגיה, והשפעת חוקי טבע מסוימים על רצף המרחב והזמן. מדע הפיזיקה מתפתח על ידי תצפיות וממצאים, המגובשים לכדי תאוריות וחוקים המתוארים לרוב בשפה של משוואות מתמטיות. ככל שיש יותר תצפיות ומתקבלים יותר ממצאים מביצוע של ניסויים, עשויות התאוריות הללו להתעדכן ולהשתכלל.
',NULL);
INSERT INTO "core_teachtopic" VALUES(2,'מכניקה','המכניקה הקלאסית היא אחד מענפי הפיזיקה הבסיסיים והמוקדמים ביותר, החוקר את תנועת הגופים, את הכוחות הפועלים עליהם ואת תכונותיהם הפיזיקליות, כשאלה מתקיימים במהירויות נמוכות (יחסית למהירות האור) ובסדרי גודל הגדולים, יחסית, מאלה שבהם עוסקת מכניקת הקוונטים (הדנה באובייקטים זעירים). לרוב, המונח "מכניקה" לבדו מתייחס למכניקה הקלאסית, הגם שאף תורת היחסות ומכניקת הקוונטים הן תורות מכניות העוסקות בחקר תחומים דומים, אך בסדרי גודל קיצוניים יותר ותוך שימוש בהנחות אחרות ובכלים מתמטיים מתקדמים יותר. המכניקה הקלאסית נקראת לעתים אף "מכניקה ניוטונית" על שמו של אייזק ניוטון, אשר נחשב למנסחה הראשון בצורתה המדעית המקובלת היום.',1);
INSERT INTO "core_teachtopic" VALUES(3,'תנועה מעגלית','בפיזיקה, תנועה מעגלית היא תנועה של גוף על גבי מסלול מעגלי. תנועה מעגלית נפוצה מאוד בטבע. דוגמאות למערכות המתוארות על ידי תנועה מעגלית: לוויין המקיף את כדור הארץ, מסה מסתובבת הקשורה לחוט מתוח ומטען חשמלי בשדה מגנטי.',2);
INSERT INTO "core_teachtopic" VALUES(4,'חוקי התנועה של ניוטון','חוקי התנועה של ניוטון הם שלושה חוקי פיזיקה שניסח אייזק ניוטון, ועוסקים בתנועתם של גופים. אלה הם חוקי היסוד של המכניקה הקלאסית.
ניוטון פרסם חוקים אלה לראשונה בספרו "העקרונות המתמטיים של פילוסופיית הטבע", ותוך שימוש בחשבון האינפיניטסימלי שפיתח, הוכיח תוצאות רבות העוסקות בגופים אידאליים. באמצעות חוקי התנועה שלו וחוק המשיכה האוניברסלי נתן ניוטון הסבר לחוקי קפלר על תנועתם של כוכבי לכת.
',2);
CREATE TABLE "core_teachitem" (
    "id" integer NOT NULL PRIMARY KEY,
    "title" varchar(50) NOT NULL,
    "description" text NOT NULL,
    "parent_id" integer REFERENCES "core_teachtopic" ("id")
);
INSERT INTO "core_teachitem" VALUES(1,'מבוא לתנועה מעגלית','מבוא בסיסי לתנועה מעגלית',3);
INSERT INTO "core_teachitem" VALUES(2,'תנועה מעגלית בחלל','תנועה מעגלית ללא כוח משיכה',3);
CREATE TABLE "core_videopage" (
    "id" integer NOT NULL PRIMARY KEY,
    "youtube_movie_id" varchar(25) NOT NULL,
    "upload_date" datetime NOT NULL,
    "content" text NOT NULL,
    "video_title" varchar(50) NOT NULL,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    "teach_item_id" integer REFERENCES "core_teachitem" ("id")
);
INSERT INTO "core_videopage" VALUES(1,'D7GdUFVQzso','2013-12-14 10:58:53.996144','הטכניון - קורס 113013 - השלמות פיסיקה 1
הרצאה 21 - תנועה מעגלית
מרצה : פרופ'' מריו ליביו
פקולטה : פיסיקה
','השלמות פיסיקה 1 - הרצאה 21',1,1);
INSERT INTO "core_videopage" VALUES(2,'Te_WEj4nuYo','2013-12-14 10:59:39.350030','הסבר על תנועה מעגלית - דוד לניאדו - מכללת אפקה
השלמות פיזיקה','פיזיקה - דוד לניאדו - אפקה - תנועה מעגלית',1,1);
INSERT INTO "core_videopage" VALUES(3,'K82rEtPECe8','2013-12-14 11:00:07.664072','הקלטה של שיעור חי מתאריך 12.06.2013
מנחה - גיל קרסיק','פיזיקה מכניקה- תנועה מעגלית',1,2);
CREATE TABLE "core_ratingreview" (
    "id" integer NOT NULL PRIMARY KEY,
    "video_id" integer NOT NULL REFERENCES "core_videopage" ("id"),
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    "context" varchar(10) NOT NULL,
    "rate" smallint unsigned NOT NULL
);
CREATE TABLE "core_textualreview" (
    "id" integer NOT NULL PRIMARY KEY,
    "video_id" integer NOT NULL REFERENCES "core_videopage" ("id"),
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    "textual_review" varchar(500) NOT NULL
);
CREATE TABLE "core_tag" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(20) NOT NULL UNIQUE
);
INSERT INTO "core_tag" VALUES(1,'שיעור מצולם');
INSERT INTO "core_tag" VALUES(2,'צילום מסך');
INSERT INTO "core_tag" VALUES(3,'ניסוי');
INSERT INTO "core_tag" VALUES(4,'מעשי');
INSERT INTO "core_tag" VALUES(5,'העשרה');
CREATE TABLE "core_tagvideo" (
    "id" integer NOT NULL PRIMARY KEY,
    "video_id" integer NOT NULL REFERENCES "core_videopage" ("id"),
    "tag_id" integer NOT NULL REFERENCES "core_tag" ("id")
);
CREATE INDEX "django_admin_log_6340c63c" ON "django_admin_log" ("user_id");
CREATE INDEX "django_admin_log_37ef4eb4" ON "django_admin_log" ("content_type_id");
CREATE INDEX "auth_permission_37ef4eb4" ON "auth_permission" ("content_type_id");
CREATE INDEX "auth_group_permissions_5f412f9a" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_83d7f98b" ON "auth_group_permissions" ("permission_id");
CREATE INDEX "auth_user_groups_6340c63c" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_5f412f9a" ON "auth_user_groups" ("group_id");
CREATE INDEX "auth_user_user_permissions_6340c63c" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_83d7f98b" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_session_b7b81f0c" ON "django_session" ("expire_date");
CREATE INDEX "core_teachtopic_410d0aac" ON "core_teachtopic" ("parent_id");
CREATE INDEX "core_teachitem_410d0aac" ON "core_teachitem" ("parent_id");
CREATE INDEX "core_videopage_6340c63c" ON "core_videopage" ("user_id");
CREATE INDEX "core_videopage_27ec9f0b" ON "core_videopage" ("teach_item_id");
CREATE INDEX "core_ratingreview_c11471f1" ON "core_ratingreview" ("video_id");
CREATE INDEX "core_ratingreview_6340c63c" ON "core_ratingreview" ("user_id");
CREATE INDEX "core_textualreview_c11471f1" ON "core_textualreview" ("video_id");
CREATE INDEX "core_textualreview_6340c63c" ON "core_textualreview" ("user_id");
CREATE INDEX "core_tagvideo_c11471f1" ON "core_tagvideo" ("video_id");
CREATE INDEX "core_tagvideo_5659cca2" ON "core_tagvideo" ("tag_id");
COMMIT;
