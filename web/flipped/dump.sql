--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO flipped;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO flipped;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, true);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO flipped;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO flipped;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 24, true);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO flipped;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO flipped;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('auth_permission_id_seq', 39, true);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO flipped;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO flipped;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO flipped;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 2, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO flipped;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('auth_user_id_seq', 4, true);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO flipped;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO flipped;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: core_ratingreview; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE core_ratingreview (
    id integer NOT NULL,
    video_id integer NOT NULL,
    user_id integer NOT NULL,
    context character varying(10) NOT NULL,
    rate smallint NOT NULL,
    CONSTRAINT core_ratingreview_rate_check CHECK ((rate >= 0))
);


ALTER TABLE public.core_ratingreview OWNER TO flipped;

--
-- Name: core_ratingreview_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE core_ratingreview_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_ratingreview_id_seq OWNER TO flipped;

--
-- Name: core_ratingreview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE core_ratingreview_id_seq OWNED BY core_ratingreview.id;


--
-- Name: core_ratingreview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('core_ratingreview_id_seq', 1, false);


--
-- Name: core_tag; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE core_tag (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.core_tag OWNER TO flipped;

--
-- Name: core_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE core_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_tag_id_seq OWNER TO flipped;

--
-- Name: core_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE core_tag_id_seq OWNED BY core_tag.id;


--
-- Name: core_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('core_tag_id_seq', 6, true);


--
-- Name: core_tagvideo; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE core_tagvideo (
    id integer NOT NULL,
    video_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.core_tagvideo OWNER TO flipped;

--
-- Name: core_tagvideo_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE core_tagvideo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_tagvideo_id_seq OWNER TO flipped;

--
-- Name: core_tagvideo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE core_tagvideo_id_seq OWNED BY core_tagvideo.id;


--
-- Name: core_tagvideo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('core_tagvideo_id_seq', 1, false);


--
-- Name: core_teachitem; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE core_teachitem (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    description text NOT NULL,
    parent_id integer
);


ALTER TABLE public.core_teachitem OWNER TO flipped;

--
-- Name: core_teachitem_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE core_teachitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_teachitem_id_seq OWNER TO flipped;

--
-- Name: core_teachitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE core_teachitem_id_seq OWNED BY core_teachitem.id;


--
-- Name: core_teachitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('core_teachitem_id_seq', 2, true);


--
-- Name: core_teachtopic; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE core_teachtopic (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    description text NOT NULL,
    parent_id integer
);


ALTER TABLE public.core_teachtopic OWNER TO flipped;

--
-- Name: core_teachtopic_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE core_teachtopic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_teachtopic_id_seq OWNER TO flipped;

--
-- Name: core_teachtopic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE core_teachtopic_id_seq OWNED BY core_teachtopic.id;


--
-- Name: core_teachtopic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('core_teachtopic_id_seq', 6, true);


--
-- Name: core_textualreview; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE core_textualreview (
    id integer NOT NULL,
    video_id integer NOT NULL,
    user_id integer NOT NULL,
    textual_review character varying(500) NOT NULL
);


ALTER TABLE public.core_textualreview OWNER TO flipped;

--
-- Name: core_textualreview_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE core_textualreview_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_textualreview_id_seq OWNER TO flipped;

--
-- Name: core_textualreview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE core_textualreview_id_seq OWNED BY core_textualreview.id;


--
-- Name: core_textualreview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('core_textualreview_id_seq', 1, false);


--
-- Name: core_videopage; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE core_videopage (
    id integer NOT NULL,
    youtube_movie_id character varying(25) NOT NULL,
    upload_date timestamp with time zone NOT NULL,
    content text NOT NULL,
    video_title character varying(50) NOT NULL,
    user_id integer NOT NULL,
    teach_item_id integer
);


ALTER TABLE public.core_videopage OWNER TO flipped;

--
-- Name: core_videopage_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE core_videopage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_videopage_id_seq OWNER TO flipped;

--
-- Name: core_videopage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE core_videopage_id_seq OWNED BY core_videopage.id;


--
-- Name: core_videopage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('core_videopage_id_seq', 3, true);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO flipped;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO flipped;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 13, true);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO flipped;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO flipped;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('django_content_type_id_seq', 13, true);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO flipped;

--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO flipped;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO flipped;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 1, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE core_ratingreview ALTER COLUMN id SET DEFAULT nextval('core_ratingreview_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE core_tag ALTER COLUMN id SET DEFAULT nextval('core_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE core_tagvideo ALTER COLUMN id SET DEFAULT nextval('core_tagvideo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE core_teachitem ALTER COLUMN id SET DEFAULT nextval('core_teachitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE core_teachtopic ALTER COLUMN id SET DEFAULT nextval('core_teachtopic_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE core_textualreview ALTER COLUMN id SET DEFAULT nextval('core_textualreview_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE core_videopage ALTER COLUMN id SET DEFAULT nextval('core_videopage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY auth_group (id, name) FROM stdin;
1	Teachers
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	24
2	1	25
3	1	26
4	1	27
5	1	20
6	1	21
7	1	22
8	1	23
9	1	28
10	1	29
11	1	13
12	1	39
13	1	38
14	1	15
15	1	14
16	1	19
17	1	32
18	1	31
19	1	30
20	1	37
21	1	36
22	1	35
23	1	34
24	1	33
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add teach topic	7	add_teachtopic
20	Can change teach topic	7	change_teachtopic
21	Can delete teach topic	7	delete_teachtopic
22	Can add teach item	8	add_teachitem
23	Can change teach item	8	change_teachitem
24	Can delete teach item	8	delete_teachitem
25	Can add video page	9	add_videopage
26	Can change video page	9	change_videopage
27	Can delete video page	9	delete_videopage
28	Can add rating review	10	add_ratingreview
29	Can change rating review	10	change_ratingreview
30	Can delete rating review	10	delete_ratingreview
31	Can add textual review	11	add_textualreview
32	Can change textual review	11	change_textualreview
33	Can delete textual review	11	delete_textualreview
34	Can add tag	12	add_tag
35	Can change tag	12	change_tag
36	Can delete tag	12	delete_tag
37	Can add tag video	13	add_tagvideo
38	Can change tag video	13	change_tagvideo
39	Can delete tag video	13	delete_tagvideo
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$12000$UfBZxSIUoRuf$5zDtBGtihOe0dWSChLLa6nYixY+bBQauNs00tvQoikg=	2013-12-23 21:56:35.701+02	f	itamar	איתמר	המורה	ita@mar.com	f	t	2013-12-23 20:45:03+02
3	pbkdf2_sha256$12000$LVyaqjCgy2BK$p8GC5xzcF7iRClI9l5edgqAIiisSxDrE4kqkOJMMe7Q=	2013-12-23 21:16:47.489+02	f	yonatan	יונתן	התלמיד	yona@tan.com	f	t	2013-12-23 20:47:06+02
4	pbkdf2_sha256$12000$zBbXH0VvLMde$JhyOLoBF7GmzHhBJzD4MG/ylWrxnyF9q0RpQtTdX6Xs=	2013-12-24 09:55:30.281+02	f	eran	ערן	קידר	eran@klum.com	f	t	2013-12-24 09:52:48+02
1	pbkdf2_sha256$12000$YntSkEvG8yvF$YH7bGuLDP5KJQeB7jo2xrCQ/ZArP/a9bcyzW5YbfMrA=	2014-01-06 21:29:13.546+02	t	flip	פליפ	פלופ	flip@klum.com	t	t	2013-12-14 18:06:45+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
1	2	1
2	4	1
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: core_ratingreview; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY core_ratingreview (id, video_id, user_id, context, rate) FROM stdin;
\.


--
-- Data for Name: core_tag; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY core_tag (id, name) FROM stdin;
1	שיעור מצולם
2	צילום מסך
3	ניסוי
4	מעשי
5	העשרה
6	בגרות
\.


--
-- Data for Name: core_tagvideo; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY core_tagvideo (id, video_id, tag_id) FROM stdin;
\.


--
-- Data for Name: core_teachitem; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY core_teachitem (id, title, description, parent_id) FROM stdin;
1	מבוא לתנועה מעגלית	מבוא בסיסי לתנועה מעגלית	3
2	תנועה מעגלית בחלל	תנועה מעגלית ללא כוח משיכה	3
\.


--
-- Data for Name: core_teachtopic; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY core_teachtopic (id, title, description, parent_id) FROM stdin;
1	פיזיקה	פיזיקה (מהמילה היוונית פיזיס φύσις, טבע) היא ענף במדעי הטבע החוקר את חוקי היסוד של הטבע כפי שהם באים לידי ביטוי בכל מערכת הניתנת לתצפית, בכדור הארץ ובחלל. הנושאים בהם עוסקת הפיזיקה כוללים תנועת עצמים, התנהגות החומר, חקר האנרגיה, והשפעת חוקי טבע מסוימים על רצף המרחב והזמן. מדע הפיזיקה מתפתח על ידי תצפיות וממצאים, המגובשים לכדי תאוריות וחוקים המתוארים לרוב בשפה של משוואות מתמטיות. ככל שיש יותר תצפיות ומתקבלים יותר ממצאים מביצוע של ניסויים, עשויות התאוריות הללו להתעדכן ולהשתכלל.\n	\N
2	מכניקה	המכניקה הקלאסית היא אחד מענפי הפיזיקה הבסיסיים והמוקדמים ביותר, החוקר את תנועת הגופים, את הכוחות הפועלים עליהם ואת תכונותיהם הפיזיקליות, כשאלה מתקיימים במהירויות נמוכות (יחסית למהירות האור) ובסדרי גודל הגדולים, יחסית, מאלה שבהם עוסקת מכניקת הקוונטים (הדנה באובייקטים זעירים). לרוב, המונח "מכניקה" לבדו מתייחס למכניקה הקלאסית, הגם שאף תורת היחסות ומכניקת הקוונטים הן תורות מכניות העוסקות בחקר תחומים דומים, אך בסדרי גודל קיצוניים יותר ותוך שימוש בהנחות אחרות ובכלים מתמטיים מתקדמים יותר. המכניקה הקלאסית נקראת לעתים אף "מכניקה ניוטונית" על שמו של אייזק ניוטון, אשר נחשב למנסחה הראשון בצורתה המדעית המקובלת היום.	1
3	תנועה מעגלית	בפיזיקה, תנועה מעגלית היא תנועה של גוף על גבי מסלול מעגלי. תנועה מעגלית נפוצה מאוד בטבע. דוגמאות למערכות המתוארות על ידי תנועה מעגלית: לוויין המקיף את כדור הארץ, מסה מסתובבת הקשורה לחוט מתוח ומטען חשמלי בשדה מגנטי.	2
4	חוקי התנועה של ניוטון	חוקי התנועה של ניוטון הם שלושה חוקי פיזיקה שניסח אייזק ניוטון, ועוסקים בתנועתם של גופים. אלה הם חוקי היסוד של המכניקה הקלאסית.\nניוטון פרסם חוקים אלה לראשונה בספרו "העקרונות המתמטיים של פילוסופיית הטבע", ותוך שימוש בחשבון האינפיניטסימלי שפיתח, הוכיח תוצאות רבות העוסקות בגופים אידאליים. באמצעות חוקי התנועה שלו וחוק המשיכה האוניברסלי נתן ניוטון הסבר לחוקי קפלר על תנועתם של כוכבי לכת.\n	2
5	כימיה	כֿימיה (מערבית: كيمياء, כִּימִיַא) היא ענף במדעי הטבע העוסק בהרכב החומר, מבנהו, תכונותיו והשינויים החלים בו במהלך אינטרקציה עם חומר אחר או עם אנרגיה. כימיה היא דיסציפלינה מדעית הקשורה לחקר של אטומים, מולקולות, גבישים וצברים אחרים של חומר, בין אם הם מצויים בהרכב מסוים או בצורה מבודדת. ניתן לכנות את הכימיה כ"מדע מרכזי", כיוון שהיא מקשרת בין תחומים נוספים של מדעי הטבע, כגון אסטרונומיה, פיזיקה, מדע החומרים, ביולוגיה וגאולוגיה. מבחינה היסטורית, הכימיה המודרנית התפתחה מהאלכימיה בעקבות המהפכה הכימית (1773).	\N
6	כימיה אורגנית	כימיה אורגנית היא ענף בכימיה העוסק במבנה, במאפיינים ובתגובות של תרכובות אורגניות - מגוון החומרים המכילים אטומי פחמן ומימן. בחקר המבנה נעשה שימוש בספקטרומטריה ובשיטות כימיות ופיזיקליות אחרות על מנת לקבוע את הרכב החומר ואת מבנהו המרחבי. המאפיינים הפיזיקליים של החומר והמאפיינים הכימיים של החומר נלמדים בשיטות דומות וגם נעשה שימוש בשיטות לאמוד את הריאקטיביות הכימית, במטרה להבין את התנהגות החומר האורגני במתכונתו הטבעית (אם ניתן), אולם גם בתמיסות, תערובות ובצורות סינתטיות. חקר התרכובות האורגניות כולל את הכנתם, על ידי סינתזה או באמצעות תגובות עוקבות, במעבדה או תאורטית.	5
\.


--
-- Data for Name: core_textualreview; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY core_textualreview (id, video_id, user_id, textual_review) FROM stdin;
\.


--
-- Data for Name: core_videopage; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY core_videopage (id, youtube_movie_id, upload_date, content, video_title, user_id, teach_item_id) FROM stdin;
1	D7GdUFVQzso	2013-12-14 12:58:53.996+02	הטכניון - קורס 113013 - השלמות פיסיקה 1\nהרצאה 21 - תנועה מעגלית\nמרצה : פרופ' מריו ליביו\nפקולטה : פיסיקה\n	השלמות פיסיקה 1 - הרצאה 21	1	1
2	Te_WEj4nuYo	2013-12-14 12:59:39.35+02	הסבר על תנועה מעגלית - דוד לניאדו - מכללת אפקה\nהשלמות פיזיקה	פיזיקה - דוד לניאדו - אפקה - תנועה מעגלית	1	1
3	K82rEtPECe8	2013-12-14 13:00:07.664+02	הקלטה של שיעור חי מתאריך 12.06.2013\nמנחה - גיל קרסיק	פיזיקה מכניקה- תנועה מעגלית	1	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2013-12-23 20:42:12.077+02	1	3	1	Teachers	1	
2	2013-12-23 20:45:03.747+02	1	4	2	itamar	1	
3	2013-12-23 20:45:32.39+02	1	4	2	itamar	2	groups שונה.
4	2013-12-23 20:46:35.223+02	1	4	2	itamar	2	first_name, last_name ו email שונה.
5	2013-12-23 20:47:06.967+02	1	4	3	yonatan	1	
6	2013-12-23 20:47:37.35+02	1	4	3	yonatan	2	first_name, last_name ו email שונה.
7	2013-12-23 21:10:27.274+02	1	3	1	Teachers	2	permissions שונה.
8	2013-12-23 23:15:00.678+02	1	12	6	בגרות	1	
9	2013-12-24 09:52:33.151+02	1	4	1	flip	2	first_name ו last_name שונה.
10	2013-12-24 09:52:48.238+02	1	4	4	eran	1	
11	2013-12-24 09:53:19.429+02	1	4	4	eran	2	first_name, last_name, email ו groups שונה.
12	2013-12-24 09:53:56.245+02	1	7	5	כימיה	1	
13	2013-12-24 09:54:32.717+02	1	7	6	כימיה אורגנית	1	
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	content type	contenttypes	contenttype
6	session	sessions	session
7	teach topic	core	teachtopic
8	teach item	core	teachitem
9	video page	core	videopage
10	rating review	core	ratingreview
11	textual review	core	textualreview
12	tag	core	tag
13	tag video	core	tagvideo
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
wnj066l7spm767v0i3nl27o8o5umlbdd	YzY4NmNhOWQxMmRmZjYyYjFkNTRlMjA3Yzg5OTYzZjgxMjBiY2M5NTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-01-20 21:29:13.551+02
\.


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	core	0001_initial	2014-01-06 21:23:05.414+02
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: core_ratingreview_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY core_ratingreview
    ADD CONSTRAINT core_ratingreview_pkey PRIMARY KEY (id);


--
-- Name: core_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY core_tag
    ADD CONSTRAINT core_tag_name_key UNIQUE (name);


--
-- Name: core_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY core_tag
    ADD CONSTRAINT core_tag_pkey PRIMARY KEY (id);


--
-- Name: core_tagvideo_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY core_tagvideo
    ADD CONSTRAINT core_tagvideo_pkey PRIMARY KEY (id);


--
-- Name: core_teachitem_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY core_teachitem
    ADD CONSTRAINT core_teachitem_pkey PRIMARY KEY (id);


--
-- Name: core_teachtopic_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY core_teachtopic
    ADD CONSTRAINT core_teachtopic_pkey PRIMARY KEY (id);


--
-- Name: core_textualreview_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY core_textualreview
    ADD CONSTRAINT core_textualreview_pkey PRIMARY KEY (id);


--
-- Name: core_videopage_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY core_videopage
    ADD CONSTRAINT core_videopage_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_93d2d1f8; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_93d2d1f8 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_ratingreview_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_ratingreview
    ADD CONSTRAINT core_ratingreview_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_ratingreview_video_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_ratingreview
    ADD CONSTRAINT core_ratingreview_video_id_fkey FOREIGN KEY (video_id) REFERENCES core_videopage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_tagvideo_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_tagvideo
    ADD CONSTRAINT core_tagvideo_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES core_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_tagvideo_video_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_tagvideo
    ADD CONSTRAINT core_tagvideo_video_id_fkey FOREIGN KEY (video_id) REFERENCES core_videopage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_teachitem_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_teachitem
    ADD CONSTRAINT core_teachitem_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES core_teachtopic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_teachtopic_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_teachtopic
    ADD CONSTRAINT core_teachtopic_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES core_teachtopic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_textualreview_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_textualreview
    ADD CONSTRAINT core_textualreview_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_textualreview_video_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_textualreview
    ADD CONSTRAINT core_textualreview_video_id_fkey FOREIGN KEY (video_id) REFERENCES core_videopage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_videopage_teach_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_videopage
    ADD CONSTRAINT core_videopage_teach_item_id_fkey FOREIGN KEY (teach_item_id) REFERENCES core_teachitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_videopage_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_videopage
    ADD CONSTRAINT core_videopage_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_c0d12874; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_c0d12874 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

