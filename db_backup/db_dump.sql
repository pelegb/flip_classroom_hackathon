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
-- Name: core_ratingreview; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE core_ratingreview (
    id integer NOT NULL,
    video_id integer NOT NULL,
    user_id integer,
    context character varying(12) NOT NULL,
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
-- Name: core_teachitem; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE core_teachitem (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    description text NOT NULL,
    parent_id integer,
    order_index integer NOT NULL,
    video_count_cache integer,
    CONSTRAINT ck_order_index_pstv_789a814029615a1c CHECK ((order_index >= 0)),
    CONSTRAINT core_teachitem_order_index_check CHECK ((order_index >= 0)),
    CONSTRAINT core_teachitem_video_count_cache_check CHECK ((video_count_cache >= 0))
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
-- Name: core_teachtopic; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE core_teachtopic (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    description text NOT NULL,
    parent_id integer,
    order_index integer NOT NULL,
    video_count_cache integer,
    CONSTRAINT ck_order_index_pstv_2b3570bab2edb157 CHECK ((order_index >= 0)),
    CONSTRAINT core_teachtopic_order_index_check CHECK ((order_index >= 0)),
    CONSTRAINT core_teachtopic_video_count_cache_check CHECK ((video_count_cache >= 0))
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
-- Name: core_textualreview; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE core_textualreview (
    id integer NOT NULL,
    video_id integer NOT NULL,
    user_id integer,
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
-- Name: core_videopage_tags; Type: TABLE; Schema: public; Owner: flipped; Tablespace: 
--

CREATE TABLE core_videopage_tags (
    id integer NOT NULL,
    videopage_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.core_videopage_tags OWNER TO flipped;

--
-- Name: core_videopage_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: flipped
--

CREATE SEQUENCE core_videopage_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_videopage_tags_id_seq OWNER TO flipped;

--
-- Name: core_videopage_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flipped
--

ALTER SEQUENCE core_videopage_tags_id_seq OWNED BY core_videopage_tags.id;


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
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_ratingreview ALTER COLUMN id SET DEFAULT nextval('core_ratingreview_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_tag ALTER COLUMN id SET DEFAULT nextval('core_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_teachitem ALTER COLUMN id SET DEFAULT nextval('core_teachitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_teachtopic ALTER COLUMN id SET DEFAULT nextval('core_teachtopic_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_textualreview ALTER COLUMN id SET DEFAULT nextval('core_textualreview_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_videopage ALTER COLUMN id SET DEFAULT nextval('core_videopage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_videopage_tags ALTER COLUMN id SET DEFAULT nextval('core_videopage_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY auth_group (id, name) FROM stdin;
1	Teachers
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	32
2	1	33
3	1	34
4	1	35
5	1	36
6	1	37
7	1	38
8	1	39
9	1	40
10	1	41
11	1	42
12	1	22
13	1	23
14	1	24
15	1	25
16	1	26
17	1	27
18	1	28
19	1	29
20	1	30
21	1	31
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 21, true);


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
19	Can add migration history	7	add_migrationhistory
20	Can change migration history	7	change_migrationhistory
21	Can delete migration history	7	delete_migrationhistory
22	Can add teach topic	8	add_teachtopic
23	Can change teach topic	8	change_teachtopic
24	Can delete teach topic	8	delete_teachtopic
25	Can add teach item	9	add_teachitem
26	Can change teach item	9	change_teachitem
27	Can delete teach item	9	delete_teachitem
28	Can add video page	10	add_videopage
29	Can change video page	10	change_videopage
30	Can delete video page	10	delete_videopage
31	Can add rating review	11	add_ratingreview
32	Can change rating review	11	change_ratingreview
33	Can delete rating review	11	delete_ratingreview
34	Can add textual review	12	add_textualreview
35	Can change textual review	12	change_textualreview
36	Can delete textual review	12	delete_textualreview
37	Can add tag	13	add_tag
38	Can change tag	13	change_tag
39	Can delete tag	13	delete_tag
40	Can add tag video	14	add_tagvideo
41	Can change tag video	14	change_tagvideo
42	Can delete tag video	14	delete_tagvideo
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('auth_permission_id_seq', 42, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
13	pbkdf2_sha256$12000$0RmRSK8MCjv1$TsNcO1G3lRD4SQf5rii1zJWOz5hdDNlutaHCxbOFjNc=	2014-04-28 15:46:32.062094-04	f	tomahidror	תום	אחי דרור	tom.ahidror@gmail.com	f	t	2014-04-28 15:46:31.915889-04
2	pbkdf2_sha256$12000$RJcB0SFfQ2oD$D365n99NdMYEE3Xicga0PijrzCi4KR4r2BA8gJ+6d3E=	2014-07-02 02:30:55.416957-04	t	banitt81	איתמר	בנית	banitt81@yahoo.com	t	t	2014-01-20 15:35:23-05
8	pbkdf2_sha256$12000$Tz7XNx3wlJ5S$wBk3XZBDNNZSEIfZAVvVl+//OBgXFadSInLYyV/VG8g=	2014-02-17 13:28:41.572163-05	f	noteacher	לאמורה	לאמורה	noteacher@teacher.com	f	t	2014-02-17 13:24:33-05
4	pbkdf2_sha256$12000$IVyD5cDON7eP$PuT0HdET8knRuOln9D8EIMtTBNT+0s83ONsJh5REP5k=	2014-05-20 16:23:22.768288-04	t	barakp	ברק	פלג	pelegb@gmail.com	t	t	2014-01-20 15:37:27-05
3	pbkdf2_sha256$12000$VMBQ6a6xTmQs$G48leBfbt6GjHuoBkczC9MUj5v6fqemiQ0ylorJptsM=	2014-02-25 03:29:14.266951-05	t	eran	ערן	קידר	ekeydar@gmail.com	t	t	2014-01-20 15:36:44-05
14	pbkdf2_sha256$12000$8Qrmten3AzPk$Wx7Lmfb+ZpdQkXq+72pLCeyxP3oPWU1ZTNF8NAJaaew=	2014-06-05 14:49:32.874961-04	f	אלינה	אלינה	קולטון	alinacolton@gmail.com	f	t	2014-06-05 14:49:32.603289-04
1	pbkdf2_sha256$12000$uPlKy3Oih2iu$lr3JvTcWE1gy2vuqTL0lwCNLlpqwNm5OOhNP3TLF/Yk=	2014-01-24 06:08:48.074708-05	t	flip	פליפ	פלופ	flip@flip.com	t	t	2014-01-20 15:30:21-05
9	pbkdf2_sha256$12000$IcUTTyyHXFrA$b4x7HiPY/iv+bx/ZJ0zYvkA/oyfieYd6wCAZ4ZmPEdE=	2014-02-28 17:56:26.595882-05	f	yoniLavi	יוני	לביא	yoni@lavi.fm	f	t	2014-02-28 17:56:26.34728-05
5	pbkdf2_sha256$12000$B1rh8eX57hdq$4XEiOJ7EShH5BLT9Kbf+ei4cOHTwEaL9iSxocyQCYFs=	2014-02-03 14:13:02.133729-05	f	gl1000007	גלעד	לייבוביץ	gl1000007@gmail.com	f	t	2014-02-03 14:13:01.872958-05
10	pbkdf2_sha256$12000$sHyNIpdIVU8n$VAM/x0hMFxJ9tbT5+NEBKPYgCIhaFQm7YQ4ElLbqkOE=	2014-03-03 09:10:14.378773-05	f	zoco	זוקו	ניסיון	zocomail@yahoo.com	f	t	2014-03-03 09:09:55.272732-05
6	pbkdf2_sha256$12000$188oeTJ170qT$Bby7e4xXghIMGmeJaYqP3CHa9yIMuvYN5cIM76ndiJQ=	2014-02-10 13:42:02.809739-05	f	shahar.josefbserg	shahar	josefsberg	shahar.josefsberg@gmail.com	f	t	2014-02-10 13:42:02.639976-05
7	pbkdf2_sha256$12000$CwgaDoYkLhom$3Foe4GQ86fbh6876uyVxQY+hi+UT3kF37ghOucu0HQI=	2014-02-11 01:56:15.242213-05	f	xTheBawsx	ליאור	לוי	lior.levy@hotmail.com	f	t	2014-02-11 01:55:38.844816-05
11	pbkdf2_sha256$12000$Zpy8TeXATh1W$cUYfmw0QB3R4heBt0rasRvtqzNOHF9OXe6Vznlbc/k8=	2014-04-07 04:26:52.384281-04	f	avivsalem	אביב	סלם	avivsalem@gmail.com	f	t	2014-04-07 04:26:52.199572-04
15	pbkdf2_sha256$12000$0UQOd7Qu2vPe$f6i9B5SepjcSFERAnnDnuRwgqrqfOy62HCM9d7Cpli8=	2014-06-26 01:30:10.406521-04	f	ricky_edu@yaffeonline.com	ריקי	יפה	ricky_edu@yaffeonline.com	f	t	2014-06-26 01:30:10.119109-04
12	pbkdf2_sha256$12000$yoHsHLSn2bTt$aMWQrKqZHtg78vjkGL9GBukw1hoWo/r/tVPUCJLQ5eo=	2014-04-24 02:24:24.131104-04	f	dpaluy	דוד	פלוי	dpaluy@gmail.com	f	t	2014-04-24 02:24:23.846583-04
16	pbkdf2_sha256$12000$aXfNQHJOalfK$VgAo0te3+q8MzBZxsf36SxKPrxEl6EEr+maVhTsV+0Y=	2014-06-30 14:12:11.408453-04	f	נועם הבר	נועם	הבר	haberjster@gmail.com	f	t	2014-06-29 06:42:07.996213-04
17	pbkdf2_sha256$12000$MivGh7P0FA5K$q5GNdtHRXK3NpQrVIDmeKMpx98pyochU2LX41N3VFHI=	2014-06-30 23:34:22.076562-04	f	levym	מיכאל	לוי	jlevym@gmail.com	f	t	2014-06-30 23:34:21.922236-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
3	4	1
6	3	1
7	2	1
8	8	1
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 8, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('auth_user_id_seq', 17, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: core_ratingreview; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY core_ratingreview (id, video_id, user_id, context, rate) FROM stdin;
1	3	3	rel	10
2	3	3	quality	10
\.


--
-- Name: core_ratingreview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('core_ratingreview_id_seq', 2, true);


--
-- Data for Name: core_tag; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY core_tag (id, name) FROM stdin;
1	HTML
2	דינמיקה
\.


--
-- Name: core_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('core_tag_id_seq', 2, true);


--
-- Data for Name: core_teachitem; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY core_teachitem (id, title, description, parent_id, order_index, video_count_cache) FROM stdin;
6	טבלאות ב HTML	<div><div>טבלאות מאפשרות ארגון נוח של מידע רב באופנים מגוונים בתוך דפי HTML.</div><div><br></div><div>מטרות:<br>הלומדים ידעו ליצור טבלאות בדפי HTML.<br>הלומדים&nbsp;ידעו לעצב טבלאות בדפי HTML.<br>הלומדים&nbsp;ישלטו בתגיות - table, tr, td, th ובתכונות cellspacing, cellpadding,border, colspan, rowspan.</div></div><div><br></div>	7	600	1
7	טפסים ב HTML	<div><div>טפסים מאפשרים יצירת דפי HTML בהם המשתמש יכול להזין מידע מסוגים שונים ולהשפיע על המידע המוצג בדף או לשלוח מידע לשרת.</div><div>פריט זה עוסק ביצירת הטפסים עצמם, ולא בטיפול במידע שהמשתמש מזין לתוכם. על מנת ללמוד כיצד לטפל במידע, יש לפנות לפריטים העוסקים בטפסים בפרקים javascript ו ASP.</div><div><br></div><div><u>מטרות:<br></u>הלומדים ידעו ליצור טפסים בקובץ HTML.<br>הלומדים&nbsp;ידעו ליצור שדות קלט מהסוגים: text, password, checkbox, radio, select, textArea, reset, submit.<br>הלומדים&nbsp;יכירו את התכונות הבאות ותפקידיהן: type, action, method, length, name, value, checked</div></div><div><br></div>	7	700	2
8	CSS	<div>טכנולוגיית CSS מאפשרת עיצוב דפי אינטרנט באופן אחיד ללא צורך לעצב כל תגית בנפרד. בפריט זה נלמד על עיצוב דף HTML בעזרת תגית style ועל עיצוב אחיד של מספר דפי HTML באמצעות קובץ CSS.<br><br><u>מטרות:<br></u>הלומדים יכירו את תגית style.<br>הלומדים ידעו לעצב דף HTML בודד בצורה ריכוזית באמצעות עיצוב תגית מסוימת ובאמצעות יצירת מחלקות עיצוב משוייכות וחפשיות.<br>הלומדים ידעו לעצב מספר דפי HTML באמצעות קובץ CSS יחיד.</div>	7	800	1
2	תכונות ב HTML	<div>שפת HTML מאפשרת לקבוע לתגיות מסוימות תכונות המעצבות אותן ומשפיעות על תפקודן.<br><br><u>מטרות:</u><br>הלומדים ידעו כיצד לשנות תכונותיהן של תגיות HTML.<br>הלומדים יכירו את התכונות - style-color, font-size, font-family, backgroundcolor, dir.<br>הלומדים יכירו את תגית span ויבינו את שימושיה.</div><div><br></div>	7	200	1
3	קישורים	<div><div>קישורים הם עמוד השדרה של ההיפרטקסט ומאפשרים מעבר מהיר בין דף אינטרנט אחד למשנהו.</div><div><br></div><div><u>מטרות:<br></u>הלומדים ידעו ליצור קישורים לקובץ HTML המצוי באותה תיקיה.<br>הלומדים&nbsp;ידעו ליצור קישורים לקובץ HTML המצוי באותו מחשב בתיקיה פנימית.<br>הלומדים&nbsp;ידעו ליצור קישורים לדף אינטרנט.</div></div><div>הלומדים&nbsp;ידעו ליצור קישורים למיקום מסוים בדף HTML.</div>	7	300	1
9	עבודה עם visual studio	<p>השימוש בתכנת notepad יעיל עד שלב מסוים, שמעבר לו רצוי לעבור לעבוד בסביבת פיתוח. כאן נלמד לעבוד עם תכנת web developer express 2008.</p><p><br></p><p>מטרות:<br>הלומדים יתקינו במחשביהם את תכנת visual studio web developer.<br>הלומדים ידעו ליצור אתר אינטרנט באמצעות התכנה, וליצור קבצי HTML בתוכו.<br>הלומדים ידעו לצפות בדפי ה HTML שיצרו בעזרת הדפדפן.</p>	6	2147483647	0
10	מבוא ל javascript	<div><div>javascript היא שפת תסריט המאפשרת הרצת קוד ללא הידור ישירות על הדפדפן של המשתמש.<br><br></div><div>מטרות:<br>הלומדים ידעו לשלב תסריט בדף HTML בעזרת תגית script.<br>הלומדים ידעו מתי מופעל תסריט JS וע"י מי.<br>הלומדים ידעו להצהיר על משתנים ולהכניס לתוכם ערכים.<br>הלומדים ידעו להשתמש בפקודות alert, ו prompt.<br>הלומדים יכירו את טיפוסי המשתנים הקיימים ב JS ויבינו כיצד הם נקבעים.<br>הלומדים יבינו את משמעותו של אופרטור '+' עבור סוגי משתנים שונים.</div></div>	9	100	2
5	תמונות ב HTML	<div><div>תגית img מאפשרת שילוב תמונות בתוך דפי HTML.</div><div><br></div><u><div><u>מטרות:</u></div></u><div>הלומדים ידעו לשלב תמונות בתוך דפי HTML.</div><div>הלומדים&nbsp;יכירו את תכונות src, alt, height.</div></div><div>הלומדים&nbsp;ידעו להגדיר תמונה כקישור.</div>	7	500	1
21	אובייקט response	<div><div>אובייקט response הוא אובייקט הקיים בצד השרת ואוסף לתוכו את כל המידע שיש לשלוח בסיום ריצת קוד השרת למשתמש. ללא שימוש בטכנולוגיית ASP הוא מכיל רק את התוכן המפיע בצד הלקוח של הקובץ (HTML, JS), אולם ניתן לשנות את התוכן המוכנס לתוכו במהלך ריצת הקוד בצד השרת.<br><br></div><div><u>מטרות:</u></div></div><div>הלומדים ידעו כי אובייקט response מכיל את כל המידע הנשלח את המשתמש מן השרת.</div><div>הלומדים ידעו להשתמש בפעולות - redirect,end,write.</div>	10	300	1
11	מבני בקרה ב javascript	<div><div>בפרק זה נעסוק במבני בקרה בסיסיים ב javascript:</div><div>- הוראות ביצוע מותנה (if).</div><div>- הוראות ביצוע חוזר (לולאות).</div><div><br></div><div>מטרות:</div><div>הלומדים ידעו לשלב בתסריט javacsript פקודות ביצוע מותנה ושערים לוגיים.</div></div><div>הלומדים ידעו לשלב בתסריט javacsript פקודות ביצוע חוזר (for, while).</div>	9	200	1
4	רשימות ב HTML	<div>רשימות מאפשרות ארגון נוח ומהיר של מידע בדפי HTML.<br><br><u>מטרות</u>:<br>הלומדים יכירו את תגיות ul,ol,li.<br>הלומדים ידעו ליצור רשימות ורשימות מקוננות בדפי HTML.</div>	7	400	0
20	מבוא ל ASP - שינוי תוכן דף באמצעות קוד צד שרת.	<p>בפרק זה נראה היכן נכתב קוד שרץ בצד שרת, מתי הוא רץ וכיצד ניתן לקשרו לתכנים הנשלחים בסופו של דבר למשתמש.</p><p><u>מטרות:<br></u>הלומדים יבינו כי ניתן להריץ קוד בצד שרת טרם שליחת הקובץ ללקוח.<br>הלומדים יכירו את פעולת page_load.<br>הלומדים ידעו ליצור קובץ asp ולהריץ קוד בצד שרת.<br>הלומדים ידעו להכניס תוכן לקובץ הנשלח ללקוח באמצעות קוד בצד שרת.</p>	10	200	1
19	masterPage	<div><div>masterPage מאפשר יצירת תבנית אחידה לתוכה יוכנסו התכנים בדפי האתר השונים. ניתן לראות שיטה זו מיושמת במרבית האתרים הגדולים, בהם קיים סמליל קבוע, ותרות קישורים קבועה בעוד שתוכן הדף מתחלף בהתאם לתנועת המשתמש באתר.&nbsp;</div><div><br></div><div>מטרות:<br>הלומדים ידעו ליצור דפים המבוססים על תבנית masterpage ובהם תכנים משתנים מרובים (יותר ממקטע בודד בדף שתכנו משתנה בהתאם לגלישת המשתמש).</div></div><div><br></div>	10	100	1
18	האובייקטים date setInterval	<div><div>פרק זה כולל טיפול בשני אובייקטים נוספים בשפת javascript המאפשרים שיפור נראות האתר, ובין השאר הוספת שעון לאתר.</div><div><br></div><div>מטרות:</div><div>הלומדים ידעו להשתמש באובייקט date.<br>הלומדים ידעו להשתמש בפעולת setInterval.</div></div><div>הלומדים ידעו להוסיף לאתר שעון מתעדכן.</div>	9	900	0
15	מחרוזות ב javascript, ותכונת innerHTML.	<div><div>קוד javascript מאפשר למתכנת לשנות את מראה הדף בהתאם לפעולות המשתמש. על מנת לבצע זאת כראוי, יש לדעת ליצור מחרוזות HTML תקינות ולהכניסן לדף הקיים. בפרק זה נעסוק בטיפול במחרוזות ובאופן הכנסתן לדף HTML.</div><div><br></div><div>הערה - הסרטונים בפרק זה לא נועדו ללימוד ראשוני של מחרוזות, אלא ללמידת אופן הטיפול במחרוזות ב javascript לאחר לימודן בשפה אחרת כלשהי.<br><br><u>מטרות:<br></u>הלומדים ידעו להפעיל פונקציות על מחרוזות בשפת JS.<br>הלומדים ידעו לגשת לתכונה innerHTML.<br>הלומדים ידעו להכניס לדף HTML תגיות נוספות באמצעות innerHTML.<br>הלומדים ידעו ליצור בעזרת קוד JS ותכונת innerHTML תגיות מורכבות.<br><br></div></div><div><div><br></div></div>	9	600	2
13	פעולות ב javascript ותכונת id	<div><div>פעולות (פונקציות) מאפשרות קריאה לקטע קוד ידוע מראש. כתיבת פעולות תאפשר לנו בעתיד להפעיל קטעי קוד בהתאם לפעולות המשתמש בדף.</div><div>תכונת id מהווה "שם" לתגיות בדף ה HTML ומאפשרת למתכנת להתייחס לתגיות אלה מתוך קוד javascript על מנת לשנות את תכונותיהן.</div><div><br></div><div>מטרות:<br>הלומדים ידעו לכתוב פעולות ב JS.<br>הלומדים ידעו להפעיל פעולות ב JS באמצעות קישור.<br>הלומדים ידעו כיצד לתת לעצם שם (תכונת id) וכיצד לגשת אליו מתוך קוד JS.</div></div>	9	400	2
14	תכנות מוכוון אירועים	<div><div>תכנות מוכוון אירועים הוא צורת תכנות בה אירועים מסוימים שמבצע המשתמש מפעילים פונקציות שנוצרו מראש. באופן זה ניתן ליצור דפי HTML אשר יגיבו לפעולות המשתמש.</div><div><br></div><div>מטרות:</div></div><div>התלמידים ידעו כיצד להפעיל פונקציות בעזרת טריגרים.</div>	9	500	1
27	אובייקט application	<div>אובייקט applictaion מאפשר שמירת מידע בשרת הנגיש מכל הדפים ועבור כל המשתמשים. בעזרתו ניתן לשתף מידע בין משתמשים שונים (סקרים, דירוגי משתמשים, צ'אט עוד).<br><br><u>מטרות:</u><br></div><div>הלומדים יבינו מהותו של אובייקט application, מתי נוצר, מתי נמחק, ולמה משמש.</div><div>הלומדים ידעו להכניס ערכים לאובייקט application.</div><div>הלומדים ידעו להוציא ערכים מתוך אובייקט application.</div><div>הלומדים ידעו ליצור מונה כניסות משתמשים ואפשרות שיחוח (צ'אט).</div>	12	200	1
30	הקלטת מסך - screenCasting	<div>screenCasting היא שיטה ליצירת סרטון בה מקליטים את מסך המחשב. גישה זו זולה ומהירה למאפשרת שימוש בכל אמצעי ההמחשה שהמחשב יכול להציע.</div>	13	100	3
31	שיעור הפוך מהו	<div>אחת הגישות הפדגוגיות המשלבת באופן משמעותי שימוש בסרטונים בתהליך ההוראה בכיתה היא שיעור הפוך.<br>כאן תמצאו סרטונים העוסקים בגישה - עקרונותיה, יתרונותיה וחסרונותיה.</div>	15	2147483647	4
48	מסה כובדית	<div>בפרק זה נגדיר מהי מסה כובדית, ונראה כיצד היא קשורה למסה האינרציאלית.<br>מטרות:<br>- הלומדים ידעו מהי מסה כובדית.<br>- הלומדים ידעו כי המסה הכובדית שווה למסה האינרציאלית.<br>- הלומדים ידעו כיצד לחשב משקלו של גוף בעזרת מסתו.</div>	19	300	0
26	אובייקט session	<p>אובייקט session מאפשר שמירת מידע על משתמש מסוים שיהיה נגיש מכל הדפים באתר. כך ניתן לוודא כי משתמש מסוים אכן ביצע login בדף אחר, ולאפשר התאמה אישית של דפי האתר למשתמש.</p><p><u>מטרות</u>:<br>הלומדים יבינו מהותו של אובייקט session, מתי נוצר, מתי נמחק, ולמה משמש.<br>הלומדים ידעו להכניס ערכים לאובייקט session.התלמידים ידעו להוציא ערכים מתוך אובייקט session.<br>הלומדים ידעו להגביל גישת גולשים לדפים מסוימים באתר למשתמשים שנרשמו בלבד.</p>	12	100	1
1	מבוא ל HTML	<div><div>פרק זה עוסק בכתיבת דף אינטרנט ראשון, היכרות עם תחביר תגיות והכרת תגיות בסיסיות ב HTML</div><div><br></div><div>מטרות:</div><div><div>הלומדים ידעו מהי שפת HTML ולמה משמשת.</div><div>הלומדים&nbsp;ידעו מהן תגיות ולמה הן משמשות.</div><div>הלומדים ידעו מה תפקיד הדפדפן בצפייה בדפי HTML.</div><div>הלומדים&nbsp;ידעו ליצור דף HTML בסיסי באמצעות ה notepad.</div><div>הלומדים&nbsp;יכירו את התגיות - html, head, body, title, h1 - h6, br, hr.</div></div></div>	7	100	1
32	עריכת סרטונים	<div>כאן תמצאו הסברים על עריכת וידאו בסיסית.</div>	13	200	2
47	החוק השני של ניוטון	<div>בפרק זה ננסח את החוק השני של ניוטון.<br>מטרות הלמידה:<br>- הלומדים ידעו את החוק השני של ניוטון.<br>- הלומדים ידעו ליישם את החוק במקרים שונים למציאת תאוצה / מסה / שקול כוחות.</div>	19	200	1
23	מבוא ל SQL	<p>בפרק זה נלמד את התחביר הבסיסי של שפת SQL.</p><p><u>מטרות:</u><br>הלומדים ידעו מה היא שפת SQL ולמה משמשת.<br>הלומדים ידעו ליצור מסדי נתונים ב visual studio.<br>הלומדים ידעו לכתוב שאילתות SQL מארבעת הסוגים - insert,update,delete,select.<br>הלומדים ידעו להפעיל שאילתות SQL על מסדי נתונים דרך ה visual studio.<br>הלומדים ידעו להשתמש ב LIKE בשאילתות SQL.</p>	11	100	4
25	הפעולה executeDataTable	<div><div>בפרק זה נלמד כיצד ניתן לאחזר מצד השרת נתונים השמורים במסד הנתונים באופן בו ניתן לעשות בהם שימוש שאינו הדפסה פשוטה של טבלת HTML.</div><div><br><u>מטרות:</u></div><div>הלומדים יכירו את הטיפוס DataTable.</div></div><div>הלומדים יבינו את המגבלות בשימוש בפעולה PrintDataTable.</div><div>הלומדים ידעו להשתמש בפעולה ExecuteDataTable ולחלץ באמצעותה כל נתוון המצוי במסד הנתונים.</div><div>הלומדים ידעו לייצר קוד HTML שיוכנס לצד הלקוח מתוך אובייקט DataTable.</div>	11	300	1
46	המסה האינרציאלית	<div>בפרק זה ניווכח כי יש קשר בין גודל הכוח הפועל על גוף לבין תאוצתו.<br>מטרות:<br>- הלומדים ידעו כי קיים קשר בין שקול הכוחות לבין בתאוצה בכיוון ובגודל.<br>- הלומדים ידעו כי הקשר בין גודל שקול הכוחות לבין גודל התאוצה הוא לינארי.<br>- הלומדים ידעו מהי מסה אינרציאלית.</div>	19	100	0
34	גישות היסטוריות לתנועת גופים	<div>פרק זה עוסק בגישותיהם של הוגים מהעת העתיקה לגבי תנועת גופים, ובפרט גישתו של אריסטו ותיאוריית האימפטוס.</div>	16	200	0
45	כוח החיכוך הסטטי	<div>פרק זה מציג את כוח החיכוך הסטטי - הכוח הפועל בין שני גופים במקביל למישור המגע ביניהם, כאשר אינם מחליקים זה על זה.<br>מטרות הלימוד:<br>הלומדים יבינו באילו מקרים פועל כוח החיכוך הסטטי.<br>הלומדים יבינו מה כיוונו של כוח החיכוך הסטטי.<br>הלומדים ידעו לחשב את כוח החיכוך הסטטי המרבי בעזרת מקדם החיכוך והכוח הנורמלי, ויבינו את ההבדל בינו לבין כוח החיכוך בפועל.</div>	18	400	0
35	החוק הראשון של ניוטון	<div>פרק זה עוסק בהתנהגותם של גופים כאשר תנועתם אינה מאולצת ע"י השפעות חיצוניות - כלומר, התנהגותם ה"טבעית".</div>	16	300	2
36	הגדרת כוח ויחידות	בפרק זה נגדיר את המושג כוח, ונגדיר את יחידת ניוטון המשמשת לכימות של הגודל "כוח".	17	100	0
39	דינמומטר	<div>בפרק זה נעסוק באופן בו ניתן למדוד כוח תוך שימוש בקפיצים.<br>מטרות הלמידה:<br>- הלומדים ידעו כיצד פועל דינמומטר.<br>- הלומדים ידעו כיצד ניתן לתכנן דינמומטר וכיצד להשתמש בו.</div>	17	300	0
38	קפיצים - העמקה	<div>בפרק זה נראה כיצד מתנהגים קפיצים בעת חיבורם זה לזה - חיבור בטור וחיבור במקביל.<br>מטרות הלמידה:<br>- הלומדים יבינו את הפיתוח של קבוע קפיץ שקול במקרה של חיבור קפיצים בטור ובמקביל.<br>- הלומדים ידעו כיצד לחשב קבוע קפיץ שקול בחיבור בטור ובמקביל.<br></div>	17	400	0
44	כוח החיכוך הקינטי	<div>פרק זה סוקר את כוח החיכוך הקינטי - הכוח הפועל בין שני גופים במקביל למישור המגע ביניהם, כאשר הם מחליקים זה על זה.<br><br>מטרות הלימוד:<br>- הלומדים יבינו באילו מקרים פועל כוח החיכוך הקינטי.<br>- הלומדים ידעו לחשב את גדלו של כוח החיכוך הקינטי.<br>- הלומדים ידעו מה כיוון פעולתו של כוח החיכוך הקינטי.</div>	18	300	0
42	מתיחות	<div>פרק זה סוקר את כוח המתיחות - הכוח שמפעיל חוט או חבל על הגוף הקשור אליו.<br>מטרות הלמידה:<br>- הלומדים ידעו מהו כוח המתיחות ולאילו כיוונים הוא פועל.<br>- הלומדים ידעו כי בחוט חסר משקל המתיחות אינה משתנה לאורך החוט.<br>- הלומדים ידעו כי המתיחות אינה משתנה בין מקרים בהם מפעיל הכוח "אקטיבי" (אדם המושך חבל) לבין מקרים בהם הוא "פסיבי" (חבל הקשור לקיר).<br><br></div>	18	100	0
43	הכוח הנורמלי	<div>פרק זה סוקר את הכוח הנורמלי - הכוח הפועל בין שני גופים בניצב למישור המגע ביניהם.<br>מטרות הלמידה:<br>- הלומדים יבינו מהו הכוח הנורמלי, וידעו לחשבו במקרים פשוטים (גוף על משטח אופקי המתמיד בתנועתו).<br>- הלומדים ידעו מה כיוונו של הכוח הנורמלי.</div>	18	200	0
53	חוק שימור התנע הקווי	בפרק זה נכליל את הרעיון של שימור תנע על מערכות מורכבות, המכילות יותר משני גופים.	20	400	0
51	משפט מתקף ותנע	בפרק זה נגדיר את המושג תנע ונראה את הזהות בין מהתקף הפועל על גוף לבין שינוי התנע שלו	20	200	1
55	התנגשויות	בפרק זה נלמד על השפעת שימור התנע על התנהגות גופים המתנגשים זה עם זה.	20	450	0
16	גישה לנתוני טופס באמצעות javascript	<div><div>במסגרת לימודי ה HTML ראינו כיצד ליצור ולעצב טופס כרצוננו. בפרק זה נתקדם מדרגה אחת הלאה ונראה כיצד ניתן לגשת לנתונים שהזין המשתמש בטופס באמצעות קוד javascript הרץ על מחשב הלקוח. כך ניתן לאפשר דינמיות רבה יותר של הדף המוצג, או לכתוב פעולות שנועדו לבדוק את תקינות הקלט שהזין המשתמש בטרם שליחתו לשרת (עוד על טיפול בנתונים ממחשב השרת, בפרק העוסק ב ASP).</div><div><br></div><div>מטרות:</div><div>הלומדים ידעו לגשת באמצעות קוד JS לנתונים שהכניס לקוח לטופס בכל סוגי השדות (טקסט, לחצני רדיו, צ'קבוקס, רשימה נגללת, תיבת טקסט).<br></div><div><br></div><div><br></div></div>	9	700	1
33	דינמיקה מהי	<div>מהן השאלות המרכזיות העומדות בבסיס הדינמיקה? אילו נושאים היא מכסה ומה ההשלכות שלה על ענפים אחרים בפיסיקה?</div>	16	100	0
41	אינטראקציות והחוק השלישי של ניוטון	<div>בפרק זה נסקור את ההדדיות של פעולת כוחות בין גופים, ונלמד את החוק השלישי של ניוטון.<br>מטרות הלמידה:<br>- הלומדים ידעו מהי אינטראקציה בין שני גופים.<br>- הלומדים ידעו את החוק השלישי של ניוטון ויבינו השלכותיו בתרחישים יומיומיים.</div>	16	500	0
49	הכוח כוקטור	<div>בפרק זה נראה כי ניתן להתייחס לכוח כוקטור ובהתאם לכך לחבר כוחות.<br>מטרול הלימוד:<br>- הלומדים ידעו כי שקול הכוחות הוא הוקטור המתקבל מחיבור וקטורי כל הכוחות הפועלים על גוף.<br>- הלומדים ידעו כי הגוף מאיץ בהתאם לגדלו וכיוונו של שקול הכוחות.<br>- הלומדים ידעו לחבר כוחות ולחשב שקול כוחות על גוף.</div>	16	800	0
37	חוק הוק	<div>בפרק זה נחקור התנהגות קפיצים ונלמד את חוק הוק<br>מטרות הלמידה:<br>- הלומדים יבינו את התגובה העקבית של קפיצים להפעלת כוח.<br>- הלומדים ידעו את חוק הוק.<br>- הלומדים יבינו מהו מקדם קפיץ ומה משמעותו.<br>- הלומדים יבינו מהי התארכות וכיצד מודדים אותה.<br>- הלומדים ידעו להשתמש בחוק הוק על מנת לחשב התארכות, כוח או קבוע קפיץ בתרחישים שונים.<br>- הלומדים ידעו כי חוק הוק תקף הם במתיחה והן בכיווץ קפיץ.</div>	17	200	0
50	מתקף	כאן נגדיר את הגודל מתקף ונראה את שימושיותה בכימותו השפעת כוחות על גופים.	20	100	0
54	רתע	בפרק זה נלמד על השלכות חוק שימור התנע במקרים בהם שני גופים או יותר נפרדים זה מזה.	20	500	1
22	אובייקט request וגישה לנתוני טופס מצד שרת	<div><div>אובייקט request מכיל את כל המידע שהתקבל מהמשתמש בעת שליחת הבקשה לדף מסוים. בעת כניסה רגילה לדף, יכיל מידע על המשתמש, ואת שם הקובץ המבוקש. אולם, לאחר מילוי טופס, כלל הנתונים שהכניס המשתמש לטופס יופיעו בצד שרת כנתונים השייכים לאובייקט request.</div><div><br></div><div><u>מטרות:</u></div></div><div>הלומדים ידעו מה תפקידה של תכונת action בתגית form.</div><div>הלומדים ידעו מה תפקידה של תכונת method בתגית form.</div><div>הלומדים ידעו מה תפקידיו של אובייקט request וידעו להשתמש בפעולות queryString, Form</div><div>הלומדים ידעו לגשת לנתוני טופס בצד שרת באמצעות שליחתם לדף נוסף.</div><div>הלומדים ידעו לגשת לנתוני טופס בצד שרת בדף של הטופס.</div>	10	400	1
24	חיבור SQL לצד שרת - פעולות בסיסיות	<p></p><div>בפרק זה נלמד כיצד לבצע באמצעות קוד הרץ בצד השרת (ASP) פעולות על מסד הנתונים בעזרת מחלקת עזר בשם MyADOHelper.</div><div><br></div><div><u>מטרות:</u></div><div>הלומדים ידעו מה תפקידה של המחלקה MyAdoHelper.</div><div>הלומדים ידעו לקשר את המחלקה MyAdoHelper.cs לאתר ב visual studio.</div><div>הלומדים ידעו לקלוט נתונים שהזין המשתמש בטופס HTML וליצור בעזרתם שאילתות SQL.</div><div>הלומדים ידעו להפעיל שאילתות על מסד הנתונים בעזרת הפעולות DoQuery, IsExist, PrintDataTable.</div><div>הלומדים ידעו לכתוב טפסים שיבצעו על מסד הנתונים את הפעולות הבאות:</div>\t<div>- הכנסת פריט חדש לטבלה במסד נתונים.</div>\t<div>- עדכון פריט במסד נתונים.</div>\t<div>- מחיקת פריט ממסד נתונים.</div>\t<div>- אחזור פריטים ממסד נתונים בעזרת prinDataTable</div><div>הלומדים ידעו ליצור אתר ובו דפים שנוצרים בעזרת מידע המצוי במסד הנתונים.</div><p></p>	11	200	4
12	אובייקטים קבועים בשפת javascript	<div><div>שפת javascript מכילה אובייקטים (עצמים) קבועים. כל אובייקט מכיל תכונות (משתנים) ופעולות (פונקציות). שימוש באובייקטים אלה מאפשר לשנות תכונותיהם בעזרת קוד javascript.</div><div><br></div><div>מטרות:</div><div>הלומדים ידעו מהו אובייקט (עצם).<br>הלומדים ידעו להשתמש באובייקטים קבועים של javascript:<br>- אובייקט window:<br>&nbsp; - הלומדים ידעו להשתמש בתכונת status.<br>&nbsp; - הלומדים ידעו להשתמש בפעולות prompt, alert,<br>- אובייקט document:<br>&nbsp; - הלומדים ידעו להשתמש בתכונות style של אובייקט body.<br>&nbsp; - הלומדים ידעו להשתמש בפעולה document.write.<br>הלומדים ידעו ליצור באופן דינמי (בהשפעת קלט מן המשתמש) תגיות ב HTML.<br>הלומדים ידעו ליצור באופן דינמי (בהשפעת קלט מן המשתמש) תגיות מורכבות ב HTML - טבלה למשל.</div></div>	9	300	1
17	גישה לאובייקטים דינמיים	<div><div>בפרקים ראינו כיצד ניתן לגשת ולשנותתכונותיו של אובייקט קבוע בשפה או אובייקט שיצרנו מראש ושייכנו לו תכונת id כלשהי. אולם, טכניקות אלו לא יכולות לעבוד כאשר אנו יוצרים אובייקטים באופן דינמי, כלומר, כתגובה לפעולות המשתמש. במקרה זה, לא נוכל תמיד לדעת מראש את ערך ה id של האובייקט אליו נרצה לגשת. כאן נראה כיצד ניתן לגשת לאובייקטים כאלה בעזרת פעולת getElementByID.</div><div><br></div><div><u>מטרות:<br></u>הלומדים יכירו את הפעולה getElementById<br>הלומדים ידעו לתת מזהים (id) לאובייקטים שנוצרו בעזרת קוד JS.<br>הלומדים ידעו לגשת באמצעות קוד JS לאובייקטים שנוצרו בקוד JS.</div></div>	9	800	1
57	סרטונים שונים - מדעי המחשב	לכאן יועלו סרטונים שטרם נוצר עבורם פרק לימוד מתאים	5	100000000	0
56	סרטונים שונים - פיסיקה	לכאן יש להעלות סרטונים שטרם נפתח עבורם פרק לימוד מתאים.	21	100	1
\.


--
-- Name: core_teachitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('core_teachitem_id_seq', 57, true);


--
-- Data for Name: core_teachtopic; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY core_teachtopic (id, title, description, parent_id, order_index, video_count_cache) FROM stdin;
13	מדריך להקלטת סרטונים	<div>כאן ניתן ללמוד איך להקליט סרטונים ללא עלות כספית, לקבל רעיונות חדשים להמחשות גרפיות מעניינות ולהכיר תוכנות הקלטה ועריכה בסיסיות.<br></div>	15	2147483647	5
3	פיסיקה	<div>תחום מדעי העוסק בתיאור חוקי הטבע. הפיסיקה עוסקת בין השאר בתנועת גופים, אור, קול וחקר החלל.</div>	\N	2147483647	\N
10	ASP	<div>ASP &nbsp;- active server page<br>טכנולוגיית ASP מקדמת אותנו צעד נוסף לכיוון יכולותיהם של אתרי אינטרנט מודרניים.<br>טכנולוגייה זו מאפשרת הרצת קוד על מחשב השרת בעת קבלת בקשהממשתמש לדף מסוים. כך, השרת יכול ליצור עבור המשתמש דף מיוחד המתאים לצרכיו וייחודי עבורו. דוגמאות טובות לשימוש ב ASP הן אתרי דוא"ל, אשר שולחים דף HTML המכיל את הודעות הדוא"ל של משתמש מסוים ברגע מסוים, או אתרי חיפוש, היוצרים דף המכיל תשובה לשאלה ששאל המשתמש זה עתה.</div>	6	300	4
11	SQL	<div>SQL - structured query language<br><br>שפת SQL מגדירה דרך סטנדרטית לגשת למסדי נתונים. שפה זו תאפשר לנו ליצור ולשנות מסדי נתונים במחשב השרת ובכך לשמור נתונים באתר גם ללא נוכחות של גולשים. למשל - שמירת רשימת משתמשים רשומים, או מוצרים לרכישה באתר של חנות מקוונת.</div>	6	400	9
12	קוד צד שרת - נושאים מתקדמים	<div>פרק זה מכיל עיסוק בשני אובייקטים הקיימים בצד שרת ומאפשרים שמירת מידע במעבר בין דפים שונים ובין משתמשים שונים - אובייקט session ואובייקט applictaion.<br>בעזרת שני אובייקטים אלו יכול השרת להעביר מידע בין דפי האתר לגבי משתמש מסוים ולהעביר מידע בין משתמשים שונים באותו האתר.</div>	6	500	2
6	מבוא לתכנות בסביבת האינטרנט	<div>הפרק מבוא לתכנות בסביבת האינטרנט עוסק בהכרת הכלים הבסיסיים המשמשים כותבי אתרים. ביניהם HTML, javascript, טכנולוגיות ASP, ושפת SQL.<br>השלמת פרק זה תאפשר כתיבת אתר אינטרנט בעל חלקים דינמיים, מערכת רישום משתמשים ושימוש במסדי נתונים, הגבלת הרשאות משתמשים שונים ועוד.</div>	5	2147483647	34
7	HTML	<div>שפת HTML היא שפת סימון המאפשרת יצירת דפי אינטרנט. דפים אלו ייכתבו ע"י מתכנת או באמצעות קוד ויפורשו ע"י דפדפן לצורך הצגתם למשתמש.&nbsp;</div>	6	100	8
17	כוחות	<div>בפרק זה נגדיר מהו כוח ונעסוק בשיטה למדידתו.</div>	16	400	0
18	סוגים של כוחות	<div>נושא זה עוסק בסוגי כוחות שונים בהם אנו נתקלים במערכות מכניות, ובפרט - מתיחות, הכוח הנורמלי וכוח החיכוך.</div>	16	600	0
5	מדעי המחשב	<div>תחום מדעי העוסק בפיתוח כלים לוגיים לפתרון בעיות, והתאמתם למערכות מחשב. בין השאר נכללים בתחום מדעי המחשב עיסוק בסיבוכיות פתרון בעיות מורכבות, וביישום מעשי של אלגוריתמים.</div>	\N	2147483647	\N
16	דינמיקה	<div>ענף במכניקה העוסק באופן בו כוחות ומומנטים משפיעים על תנועת גופים.</div>	4	300	5
19	החוק השני של ניוטון	<div>בפרק זה נעסוק בחוק השני של ניוטון, אשר מתאר את הקשר בין כוחות לבין שינוי בתנועת גופים.<br><br><br></div>	16	700	1
20	שימור תנע קווי	פרק זה עוסק בהגדרת המושגים תנע מותקף, מציאת הקשר ביניהם ולימוד חוק שימור התנע הקווי.	16	1000	2
15	ליצור וללמד	<div>תכנית לימודים זו מכילה נושאים הקשורים ל:</div><div>- הקלטת סרטונים.</div><div>- שיעורים הפוכים.</div><div>- מחשבות על שימוש בסרטונים בכיתה.</div>	\N	2147483647	\N
9	javascript	<div>על מנת ליצור דפי אינטרנט דינמיים, כלומר כאלה המסוגלים להשתנות ולהתעדכן בהתאם לפעולות המשתמש, יש צורך להריץ קוד כלשהו על מחשב המשתמש. פרק זה עוסק בשפת תסריט (script) הקרויה javascript המאפשרת ביצוע פעולות אלה.</div>	6	200	11
4	מכניקה קלאסית	<div>תחום רחב בפיסיקה העוסק בחקר תנועת גופים והכוחות הפועלים עליהם. תחום זה קרוי גם מכניקה ניוטונית כיוון שחלק ניכר ממנה מבוסס על תגליותיו של אייזיק ניוטון ופיתוחיו המתמטיים.</div>	3	2147483647	5
22	שונות - מחשבים	נושא זה נועד להכיל סרטונים שהועלו לאתר בטרם נפתח עבורם פרק לימוד מתאים.	5	100000000	0
21	שונות - פיסיקה	<div>נושא זה נועד להכיל סרטונים שהועלו לאתר בטרם נפתח עבורם פרק לימוד מתאים.</div>	3	1000000	1
\.


--
-- Name: core_teachtopic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('core_teachtopic_id_seq', 22, true);


--
-- Data for Name: core_textualreview; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY core_textualreview (id, video_id, user_id, textual_review) FROM stdin;
\.


--
-- Name: core_textualreview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('core_textualreview_id_seq', 1, false);


--
-- Data for Name: core_videopage; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY core_videopage (id, youtube_movie_id, upload_date, content, video_title, user_id, teach_item_id) FROM stdin;
1	ON9TVSn9KtU	2014-01-24 06:55:42.04662-05	<div>0:0 - תיאור תכונותיה של שפת HTML<br>3:19 - כתיבת דף HTML ראשון,מבנה כללי של דף HTML.<br>7:58 - תגיות h1-h6 - כותרות.<br>8:35 - תגית &lt;br&gt; - ירידת שורה.<br>9:20 - תגית title - כותרת חלון.<br>10:20 - סיכום והערות.<br><br></div>	דף HTML ראשון	2	1
2	CRd4Cxsbm8w	2014-01-24 08:33:44.62533-05	<div>0:0 - הקדמה ומוטיבציה.<br>1:26 - תגית style - תחביר בסיסי<br>4:05 - מחלקות עיצוב<br>6:03 - מחלקות חופשיות<br>7:03 - סיכום<br><br><br></div>	תגית style	2	8
3	QzXrz8tx_oQ	2014-01-25 02:31:17.534154-05	<div>0:0 - מבוא<br>0:30 - תגית הערה<br>0:36 - דוגמה ומוטיבציה - תכונת dir.<br>1:50 - תחביר כללי.<br>2:08 - תכונת style:color. שינוי צבע טקסט.<br>2:56 - היררכיה של תכונות.<br>3:45 - שינוי גופן (font-family) &nbsp;ו גודל גופן (font-size).<br>4:50 - מספר ערכים באותה תכונה.<br>5:16 - סיכום.<br><br><br><br></div>	תכונות של תגיות ב HTML	2	2
4	ecYGQbe8cLI	2014-01-25 02:39:35.891608-05	<div>0:00 - מבוא.<br>0:35 - תחביר בסיסי - תגית a, תכונת href. קישור לדף אינטרנט.<br>2:08 - קישור לדף HTML נוסף באותה תיקייה.<br>3:03 - קישור פנימי באותו דף. תכונת name.<br>4:38 - קישור חיצוני למקום מסוים בדף.<br><br><br><br></div>	קישורים ב HTML	2	3
5	RbZPDM4p1M8	2014-01-27 14:21:05.334345-05	<div>0:0 - מבוא<br>0:15 - תגית img ומיקום שמירת התמונה.<br>0:55 - תכונת src, מציינת את קובץ התמונה.<br>1:26 - תכונת alt, מציינת את הטקסט שיוצג במקרה שהתמונה לא נמצאה.<br>2:00 - תכונת height, קובעת את גובה התמונה.<br>2:35 - תכונת width, קובעת את רוחב התמונה.<br>3:00 - הדגמת השפעת תכונת alt.<br>3:32 - גישה לתמונה שאינה מצויה בתיקיה בה נמצא קובץ ה HTML.<br>4:00 - שילוב תמונה עם תגיות נוספות: בתוך טבלה וכקישור.<br><br></div>	תמונות ב HTML	2	5
6	0XBtzh3he0g	2014-01-27 14:31:31.027925-05	<div>0:0 - מבוא ומוטיבציה.<br>0:27 - תגית table - טבלה.<br>0:56 - תגית tr - שורה בטבלה.<br>1:25 - תגית td - תא בשורה.<br>2:43 - תגית th - תא בעל תכונות כותרת (כתב מודגש).<br>3:24 - תכונות התגית table (עיצוב טבלה).<br>border, cellspacing, cellpadding.<br>4:20 - דוגמה לשימוש בטבלה לארגון דפי אינטרנט.<br>5:05 - אורך השורה אינו קבוע - יכולות להיות שורות באורכים שונים.<br>5:47 - התכונות colspan,rowspan - מיזוג תאים.<br>7:00 - עיצוב תאי טבלה וסיכום.<br><br><br></div>	טבלאות ב HTML	2	6
7	E3d858NJ0Ao	2014-02-04 00:46:19.806-05	<div>0:0 - מבוא ותוכן הסרטון<br>0:37 - מהי שפת תסריט?<br>3:20 - תגית script<br>4:00 - פקודת alert - הקפצת חלון עם הודעה.<br>5:05 - מתי רץ קוד javascript?<br>6:30 - הצהרת משתנים ופקודת prompt - קבלת קלט מן המשתמש.<br><br><br><br></div>	מבוא ל javascript	2	10
8	7D7CBFUZjgE	2014-02-10 07:49:22.543604-05	<div>סרטון זה מתאר את תפקידיו של אובייקט request ואת הדרך לגשת לנתונים השמורים בו מקוד הרץ בצד שרת.</div>	אובייקט request וגישה לנתוני טופס מצד שרת	2	22
10	IlPoQRWdOso	2014-02-10 07:56:51.650125-05	<div>צריך להשלים</div>	מבוא ל ASP	2	20
11	5itl9Vuzu7s	2014-02-10 07:57:27.871993-05	<div>צריך להשלים</div>	masterPage	2	19
15	6YnwgYBu63I	2014-02-10 09:29:07.252128-05	להשלים	הפעולות isExist ו printDataTable 	2	24
16	hnXjpMSURQ0	2014-02-10 09:29:54.954434-05	להשלים	executeDataTable	2	25
17	RFl6a8yatNM	2014-02-10 09:32:04.605394-05	להשלים	סקירה כוללת של טיפול בטפסים	2	24
18	4Hz7o75IBwM	2014-02-10 09:38:05.864209-05	להשלים	אובייקט application	2	27
19	IFSfw9Xxjvs	2014-02-10 09:38:35.448663-05	להשלים	אובייקט session	2	26
9	OzMpSOGl77s	2014-02-10 07:54:46.602415-05	<div>0:0 - סקירה כללית - תקשורת בין שרת ללקוח, אובייקט request.<br>1:20 - סדר יצירת אובייקט response - הרצת פעולת page_load, העתקת צד לקוח.<br>2:15 - תחביר לגישה לאובייקט response ופעולת write. כתיבהישירות לתוך האובייקט.<br>3:52 - פעולת end. סיום הכתיבה לאובייק ושליחתו ללקוח ללא תוכן צד הלקוח (HTML).<br>5:14 - פעולת redirect. ניתוב הלקוח לדף אחר.<br>6:03 - סיכום.<br><br></div>	אובייקט response	2	21
20	68G1ZXaWUog	2014-02-11 00:42:16.112142-05	להשלים	לולאות בשפת javascript	2	11
21	mJCbCvbeqEM	2014-02-11 00:42:54.552133-05	להשלים	אובייקטים ב JS	2	12
22	tUkBNjlusYg	2014-02-11 00:43:43.146578-05	להשלים	פעולות ב JS	2	13
23	Cf_FTvsriEI	2014-02-11 00:44:06.184472-05	להשלים	תכונת id	2	13
26	BLr5lK-x0qQ	2014-02-12 11:56:23.446108-05	<div>0:00 - מבוא - מהי שאילתת SELECT?<br>0:15 - תחביר בסיסי של שאילתת SELECT.<br>0:50 - הרצה ידנית של שאילתה ב visual studio 2008, ודוגמאות לשאילתות.<br>2:45 - תחביר שימוש בשערים לוגיים בשאילתה.<br>3:05 - דוגמה לשימוש בשערים לוגיים.<br><br><br><br></div>	שאילתת SELECT	2	23
24	_L7fPgO8qX0	2014-02-12 10:50:45.926042-05	<div>0:00 - מוטיבציה - מסדי נתונים לשם מה?<br>1:48 - יצירת מסד נתונים ב visual studio 2013.<br>2:57 - יצירת טבלה חדשה במסד נתונים.<br>3:24 - הגדרת שדות (עמודות) בטבלה, וקביעת שם הטבלה.<br>5:30 - מילוי ידני של הטבלה.<br>6:30 - סיכום.</div>	מבוא למסדי נתונים - visual studio 2013	2	23
25	4eGj9CxtkrQ	2014-02-12 10:59:41.360317-05	<div>0:00 - מהי SQL.<br>0:45 - טיפוסי שאילתות קיימות.<br>1:08 - תחביר שאילתת INSERT (הכנסת רשומה חדשה לטבלה).<br>2:02 - דוגמה ב visual studio 2008.<br>4:26 - תחביר מקוצר של שאילתת INSERT המזינה את כל העמודות לפי הסדר.<br>4:50 - סיכום.<br><br></div>	מבוא ל SQL ושאילתת INSERT	2	23
12	FDz9E8-WCEM	2014-02-10 08:09:02.517659-05	<div>0:00 - מוטיבציה לשימוש במסדי נתונים.<br>1:50 - יצירת קובץ מסד נתונים ב visual studio 2008.<br>2:35 - יצירת טבלה חדשה במסד הנתונים.<br>2:58 - הגדרת עמודות בטבלה חדשה, כולל טיפוסי נתונים שונים, ושמירת הטבלה.<br>4:25 - הזנת מידע לטבלה באופן ידני.<br>5:20 - סיכום.<br><br><br><br></div>	מבוא למסדי נתונים - visual studio 2008	2	23
28	fh0LytOHBE0	2014-02-15 08:05:54.902882-05	להשלים	משתנים ב javascript	2	10
29	thzZ5hJQypA	2014-02-15 08:08:30.60519-05	להשלים	תכנות מוכוון אירועים ב JS	2	14
30	AWoCpT6_ZAw	2014-02-17 00:35:34.588615-05	להשלים	טיפול במחרוזות ב JS	2	15
32	swh0LUt9UvA	2014-02-17 00:37:10.431014-05	להשלים	גישה לנתוני טופס באמצעות javascript	2	16
33	Lf3NJQEm1B4	2014-02-17 00:37:54.421204-05	להשלים	פעולת getElementByID	2	17
34	9NrWQYuWzyM	2014-02-17 00:42:22.129819-05	להשלים	יצירת טפסים ב HTML - חלק א'	2	7
35	3iXjXPF3988	2014-02-17 00:42:43.134713-05	להשלים	יצירת טפסים ב HTML - חלק ב'	2	7
31	UKzP97XDB8s	2014-02-17 00:36:05.282922-05	להשלים	תכונת innerHTML	2	15
37	Vl7W-c9yaW4	2014-02-17 15:03:21.626405-05	להשלים	עבודה עם תכנת screencast-o-matic	2	30
38	3qvxqo71Z80	2014-02-17 15:06:18.154729-05	להשלים	שיעור הפוך מהו	2	31
40	9aGuLuipTwg	2014-02-17 15:09:13.374532-05	להשלים	why I flipped my classroom	2	31
41	y5HVHXh5Wjc	2014-02-17 15:14:07.291627-05	להשלים	5 Minute Guide to Screencasting	2	30
39	ojiebVw8O0g	2014-02-17 15:08:28.770961-05	להשלים	The Flipped Classroom Model	2	31
42	3ZZij3NNyVg	2014-02-17 15:17:56.168901-05	להשלים	Getting Started Tutorial - Windows Live Movie Make	2	32
43	JZXK68NS7gU	2014-02-17 15:19:05.743176-05	להשלים	Movie Maker Video Editing Tutorial	2	32
13	XEWwyUaTaDM	2014-02-10 09:28:07.008147-05	<div>0:00 - מה מטרת המחלקה MyADOHelper?<br>0:40 - תזכורת - מהי מחלקה?<br>2:03 - הכללת המחלקה MyAdoHelper בפרויקט ב visual studio.<br><br></div>	היכרות עם המחלקה myADOHelper	2	24
14	ExcGOR2FEfQ	2014-02-10 09:28:37.017639-05	<div>0:00 - תוכן הסרטון.<br>0:20 - סקירת מסד הנתונים עליו נעבוד בסרטון.<br>1:05 - הפעולה DoQuery.<br>1:26 - קריאה כללית של הפעולה במחלקה MyAdoHelper, סקירת הפרמטרים של הפעולה.<br>2:18 - קריאה לפעולה Doquery מתוך פעולת Page_Load, בעזרת שאילתה שנוצרה ידנית.<br>3:30 - הרצת הקוד ובדיקת שינוי מסד הנתונים.<br>4:40 - חיבור לטופס - סקירת הטופס בו נשתמש.<br>5:28 - חילוץ נתוני הטופס מאובייקט request.<br>6:15 - שינוי השימוש בפעולת DoQuery ויצירתה בעזרת הנתונים שחולצו מאובייקט request.<br>6:45 - הפעלת האתר והכנסת נתונם למסד הנתונים בעזרת טופס.<br>7:32 - סקירה חוזרת של השתלשלות האירועים - טופס -&gt; בדיקת קלט -&gt; צד שרת....<br>8:04 - סיכום<br><br></div>	פעולת DoQuery	2	24
44	S3mI81jNtHs	2014-04-28 13:26:40.136316-04	<div>0:00 - מבוא<br>0:28 - הגדרת השאלה - מה המצב הטבעי של גוף?<br>0:43 - תפיסה יומיומית - כאשר אין השפעות חיצוניות על גוף - הוא עוצר.<br>0:50 - כיצד היו מתנהגים חפצים ברכבת?<br>1:30 - דוגמה נוספת - חיכוך.<br>2:15 - החוק הראשון של ניוטון.<br>2:51 - משיכת נייר מתחת לחפץ.<br>3:15 - חפץ הממשיך לנוע בעצירה פתאומית.<br>3:29 - הסבר התנהגות הגוף בעת נסיעה ברכב.<br><br></div>	החוק הראשון של ניוטון	2	35
45	8KMllMbQ6x4	2014-04-28 15:58:13.434107-04	<div>מתוך פורום הפיס לחינוך 2013.<br>קישור לאתר הפורום:<br><a rel="nofollow" target="_blank" href="http://www.eduactionforum.com/%D7%9B%D7%99%D7%AA%D7%94-%D7%94%D7%A4%D7%95%D7%9B%D7%94-%D7%9C%D7%95%D7%9E%D7%93%D7%99%D7%9D-%D7%91%D7%91%D7%99%D7%AA-%D7%9E%D7%AA%D7%A8%D7%92%D7%9C%D7%99%D7%9D-%D7%91%D7%9B%D7%99%D7%AA%D7%94/">http://www.eduactionforum.com/%D7%9B%D7%99%D7%AA%D7%94-%D7%94%D7%A4%D7%95%D7%9B%D7%94-%D7%9C%D7%95%D...</a><br></div>	אביב צמח, מורה לאזרחות, על "כיתה הפוכה"	13	31
46	s3oJZPMq77M	2014-06-05 15:06:46.376649-04	פתיח לנושא תנע	סרטון לפתיחת נושא תנע	14	51
47	sh782dUxA-I	2014-06-05 15:08:55.412261-04	סרטון בנושא רתע בהתאם לתכנית הלימודים	רתע	14	54
50	MMVE7aClCqI	2014-06-17 12:02:42.95011-04	להשלים	חוק התנועה הראשון של ניוטון - קהאן בעברית	2	35
51	2W1IdIlZ0yA	2014-06-17 13:51:21.871432-04	להשלים	חוק התנועה השני של ניוטון - קהאן בעברית	2	47
52	yXUzW_de20I	2014-06-17 14:00:16.376511-04	להשלים	Screencast-O-Matic Tutorial - Record Screen Captur	2	30
53	0VhepciZjy0	2014-06-30 14:14:08.527633-04	<div>מהו לחץ, איפה פוגשים ביומיום תופעות קשורות ללחץ וכיצד אפשר להגדיל ולהקטין לחץ.</div>	פתיחה לנושא לחץ	16	56
\.


--
-- Name: core_videopage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('core_videopage_id_seq', 53, true);


--
-- Data for Name: core_videopage_tags; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY core_videopage_tags (id, videopage_id, tag_id) FROM stdin;
1	31	1
4	44	1
\.


--
-- Name: core_videopage_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('core_videopage_tags_id_seq', 4, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2014-01-20 15:32:49.448001-05	1	4	1	flip	2	first_name ו last_name שונה.
2	2014-01-20 15:34:30.583153-05	1	3	1	Teachers	1	
3	2014-01-20 15:35:24.025832-05	1	4	2	banitt81	1	
4	2014-01-20 15:36:14.344557-05	1	4	2	banitt81	2	first_name, last_name, email, is_superuser ו groups שונה.
5	2014-01-20 15:36:44.996765-05	1	4	3	eran	1	
6	2014-01-20 15:37:05.144618-05	1	4	3	eran	2	first_name, last_name, email ו groups שונה.
7	2014-01-20 15:37:27.403406-05	1	4	4	barakp	1	
8	2014-01-20 15:38:15.900108-05	1	4	4	barakp	2	first_name, last_name, email, is_staff, is_superuser ו groups שונה.
9	2014-01-20 15:38:29.467861-05	1	4	2	banitt81	2	is_staff שונה.
10	2014-01-20 15:39:08.69973-05	1	4	2	banitt81	2	is_superuser שונה.
11	2014-01-20 15:39:24.001388-05	1	4	3	eran	2	is_staff ו is_superuser שונה.
12	2014-01-20 15:39:44.374681-05	2	8	1	פיסיקה	1	
13	2014-01-20 15:39:57.872462-05	2	8	1	פיסיקה	3	
14	2014-01-20 16:43:02.570597-05	2	8	2	כימיה	1	
15	2014-01-20 16:44:01.787018-05	2	8	2	כימיה	3	
16	2014-01-24 06:35:15.474032-05	2	8	3	פיסיקה	1	
17	2014-01-24 06:37:31.468089-05	2	8	4	מכניקה קלאסית	1	
18	2014-01-24 06:40:50.635164-05	2	8	5	מדעי המחשב	1	
19	2014-01-24 06:43:10.143124-05	2	8	6	מבוא לתכנות בסביבת האינטרנט	1	
20	2014-01-24 06:44:08.12465-05	2	8	7	HTML	1	
21	2014-01-24 06:47:36.777914-05	2	8	8	מבוא ל HTML	1	
22	2014-01-24 06:49:47.276568-05	2	9	1	מבוא ל HTML	1	
23	2014-01-24 06:50:07.831556-05	2	8	8	מבוא ל HTML	3	
24	2014-01-24 08:10:06.52392-05	2	9	2	תכונות ב HTML	1	
25	2014-01-24 08:11:40.307187-05	2	9	3	קישורים	1	
26	2014-01-24 08:12:56.750209-05	2	9	4	רשימות ב HTML	1	
27	2014-01-24 08:17:13.815875-05	2	9	5	תמונות ב HTML	1	
28	2014-01-24 08:18:28.845221-05	2	9	6	טבלאות ב HTML	1	
29	2014-01-24 08:21:00.041783-05	2	9	7	טפסים ב HTML	1	
30	2014-01-24 08:22:56.784946-05	2	9	8	CSS	1	
31	2014-01-31 09:37:12.791929-05	2	9	9	עבודה עם visual studio	1	
32	2014-01-31 09:38:53.08228-05	2	8	9	javascript	1	
33	2014-02-03 10:16:00.858997-05	2	9	10	מבוא ל javascript	1	
34	2014-02-03 10:17:33.474237-05	2	9	11	מבני בקרה ב javascript	1	
35	2014-02-03 10:19:49.777791-05	2	9	12	אובייקטים קבועים בשפת javascript	1	
36	2014-02-03 10:21:54.917867-05	2	9	13	פעולות ב javascript ותכונת id	1	
37	2014-02-03 10:23:17.423463-05	2	9	14	תכנות מוכוון אירועים	1	
38	2014-02-03 10:26:13.602445-05	2	9	15	מחרוזות ב javascript, ותכונת innerHTML.	1	
39	2014-02-04 00:32:44.598985-05	2	9	16	גישה לנתוני טופס באמצעות javascript	1	
40	2014-02-04 00:36:12.732207-05	2	9	17	גישה לאובייקטים דינמיים	1	
41	2014-02-04 00:38:35.269404-05	2	9	18	האובייקטים date setInterval	1	
42	2014-02-09 00:31:08.828244-05	2	8	10	ASP	1	
43	2014-02-09 00:34:15.818509-05	2	9	19	masterPage	1	
44	2014-02-09 00:36:32.28133-05	2	9	20	מבוא ל ASP - שינוי תוכן דף באמצעות קוד צד שרת.	1	
45	2014-02-09 00:39:30.851261-05	2	9	21	אובייקט response	1	
46	2014-02-09 00:42:06.263285-05	2	9	22	אובייקט request וגישה לנתוני טופס מצד שרת	1	
47	2014-02-10 08:07:17.682229-05	2	8	11	SQL	1	
48	2014-02-10 08:08:34.117349-05	2	9	23	מבוא ל SQL	1	
49	2014-02-10 08:57:36.924695-05	2	9	24	חיבור SQL לצד שרת - פעולות בסיסיות	1	
50	2014-02-10 08:58:55.402402-05	2	9	25	הפעולה executeDataTable	1	
51	2014-02-10 09:34:06.083814-05	2	8	12	קוד צד שרת - נושאים מתקדמים	1	
52	2014-02-10 09:35:56.932243-05	2	9	26	אובייקט session	1	
53	2014-02-10 09:37:38.883069-05	2	9	27	אובייקט application	1	
54	2014-02-11 00:39:30.861276-05	2	10	9	אובייקט response	2	content ו video_title שונה.
55	2014-02-12 10:51:36.53279-05	2	10	12	מבוא למסדי נתונים - visual studio 2008	2	video_title שונה.
56	2014-02-12 10:51:54.145433-05	2	10	24	מבוא למסדי נתונים - visual studio 2013	2	video_title שונה.
57	2014-02-12 15:34:23.309007-05	2	10	27	טיפול בטפסים - המעגל השלם	3	
58	2014-02-15 07:50:32.840597-05	2	10	12	מבוא למסדי נתונים - visual studio 2008	2	content שונה.
59	2014-02-15 07:55:37.203166-05	2	10	26	שאילתת SELECT	2	content שונה.
60	2014-02-15 08:05:54.907682-05	2	10	28	משתנים ב javascript	1	
61	2014-02-15 08:06:29.212202-05	2	10	28	משתנים ב javascript	2	youtube_movie_id שונה.
62	2014-02-15 08:08:30.610008-05	2	10	29	תכנות מוכוון אירועים ב JS	1	
63	2014-02-17 12:22:20.096413-05	3	13	1	HTML	1	
64	2014-02-17 12:22:24.24877-05	3	10	31	תכונת innerHTML	2	tags שונה.
65	2014-02-17 13:26:57.475911-05	3	4	2	banitt81	2	is_superuser שונה.
66	2014-02-17 13:27:29.434161-05	2	4	8	noteacher	2	groups שונה.
67	2014-02-17 14:45:19.170792-05	2	8	13	מדריך להקלטת סרטונים	1	
68	2014-02-17 14:48:33.725979-05	2	8	14	הקלטת סרטונים	1	
69	2014-02-17 14:51:28.697569-05	2	9	28	screenCast-O-Matic	1	
70	2014-02-17 14:58:45.333292-05	2	9	29	מטא-תכנית לימודים: הקלטת סרטונים, שיעורים הפוכים..	1	
71	2014-02-17 14:59:26.929216-05	2	9	29	מטא-תכנית לימודים: הקלטת סרטונים, שיעורים הפוכים..	3	
72	2014-02-17 15:00:14.028834-05	2	8	15	מטא-תכנית לימודים- הקלטת סרטונים, שיעור הפוך...	1	
73	2014-02-17 15:00:32.13964-05	2	8	13	מדריך להקלטת סרטונים	2	parent שונה.
74	2014-02-17 15:01:10.849204-05	2	8	14	הקלטת סרטונים	3	
75	2014-02-17 15:02:38.153897-05	2	9	30	הקלטת מסך - screenCasting	1	
76	2014-02-17 15:05:32.032819-05	2	9	31	שיעור הפוך מהו	1	
77	2014-02-17 15:10:12.363033-05	2	8	15	מטא-תכנית לימודים- הקלטת סרטונים, שיעור הפוך...	2	description שונה.
78	2014-02-17 15:14:41.605165-05	2	10	41	5 Minute Guide to Screencasting	2	teach_item שונה.
79	2014-02-17 15:15:12.745706-05	2	10	39	The Flipped Classroom Model	2	video_title שונה.
80	2014-02-17 15:17:32.029677-05	2	9	32	עריכת סרטונים	1	
81	2014-02-17 15:21:12.246792-05	2	8	15	שיעור פתוח - הקלטת סרטונים, שיעור הפוך...	2	title שונה.
82	2014-02-19 00:39:05.60729-05	2	10	13	היכרות עם המחלקה myADOHelper	2	content שונה.
83	2014-02-19 01:02:37.660178-05	2	10	14	פעולת DoQuery	2	content שונה.
84	2014-02-24 14:13:43.957713-05	2	8	7	HTML	2	order_index שונה.
85	2014-02-24 14:13:52.021839-05	2	8	9	javascript	2	order_index שונה.
86	2014-02-24 14:14:03.975023-05	2	8	10	ASP	2	order_index שונה.
87	2014-02-24 14:14:16.996816-05	2	8	11	SQL	2	order_index שונה.
88	2014-02-24 14:14:25.851653-05	2	8	11	SQL	2	אף שדה לא השתנה.
89	2014-02-24 14:14:35.517873-05	2	8	12	קוד צד שרת - נושאים מתקדמים	2	order_index שונה.
90	2014-02-24 14:16:10.252647-05	2	9	1	מבוא ל HTML	2	order_index שונה.
91	2014-02-24 14:16:54.408322-05	2	9	3	קישורים	2	order_index שונה.
92	2014-02-24 14:17:02.997724-05	2	9	4	רשימות ב HTML	2	order_index שונה.
93	2014-02-24 14:17:15.246232-05	2	9	5	תמונות ב HTML	2	order_index שונה.
94	2014-02-24 14:17:28.964538-05	2	9	6	טבלאות ב HTML	2	order_index שונה.
95	2014-02-24 14:17:36.779453-05	2	9	7	טפסים ב HTML	2	order_index שונה.
96	2014-02-24 14:17:43.773288-05	2	9	8	CSS	2	order_index שונה.
97	2014-02-24 14:33:04.317429-05	2	9	9	עבודה עם visual studio	2	אף שדה לא השתנה.
98	2014-02-24 14:33:25.5447-05	2	9	10	מבוא ל javascript	2	order_index שונה.
99	2014-02-24 14:33:33.522293-05	2	9	11	מבני בקרה ב javascript	2	order_index שונה.
100	2014-02-24 14:33:50.209948-05	2	9	12	אובייקטים קבועים בשפת javascript	2	order_index שונה.
101	2014-02-24 14:33:57.626001-05	2	9	13	פעולות ב javascript ותכונת id	2	order_index שונה.
102	2014-02-24 14:34:04.20947-05	2	9	14	תכנות מוכוון אירועים	2	order_index שונה.
103	2014-02-24 14:34:11.491296-05	2	9	14	תכנות מוכוון אירועים	2	אף שדה לא השתנה.
104	2014-02-24 14:34:26.1-05	2	9	15	מחרוזות ב javascript, ותכונת innerHTML.	2	order_index שונה.
105	2014-02-24 14:34:33.089843-05	2	9	16	גישה לנתוני טופס באמצעות javascript	2	order_index שונה.
106	2014-02-24 14:34:39.451674-05	2	9	17	גישה לאובייקטים דינמיים	2	order_index שונה.
107	2014-02-24 14:34:57.882294-05	2	9	17	גישה לאובייקטים דינמיים	2	אף שדה לא השתנה.
108	2014-02-24 14:35:27.175444-05	2	9	18	האובייקטים date setInterval	2	order_index שונה.
109	2014-02-24 14:35:45.613774-05	2	9	19	masterPage	2	order_index שונה.
110	2014-02-24 14:35:54.050051-05	2	9	20	מבוא ל ASP - שינוי תוכן דף באמצעות קוד צד שרת.	2	order_index שונה.
111	2014-02-24 14:36:00.285799-05	2	9	21	אובייקט response	2	order_index שונה.
112	2014-02-24 14:36:06.58846-05	2	9	21	אובייקט response	2	אף שדה לא השתנה.
113	2014-02-24 14:36:13.467733-05	2	9	22	אובייקט request וגישה לנתוני טופס מצד שרת	2	order_index שונה.
114	2014-02-24 14:36:30.719146-05	2	9	23	מבוא ל SQL	2	order_index שונה.
115	2014-02-24 14:36:36.595547-05	2	9	24	חיבור SQL לצד שרת - פעולות בסיסיות	2	order_index שונה.
116	2014-02-24 14:36:43.386927-05	2	9	25	הפעולה executeDataTable	2	order_index שונה.
117	2014-02-24 14:36:51.514374-05	2	9	26	אובייקט session	2	order_index שונה.
118	2014-02-24 14:36:57.447478-05	2	9	27	אובייקט application	2	order_index שונה.
119	2014-02-24 14:37:43.907137-05	2	9	30	הקלטת מסך - screenCasting	2	order_index שונה.
120	2014-02-24 14:37:50.397228-05	2	9	32	עריכת סרטונים	2	order_index שונה.
121	2014-02-24 14:39:42.522462-05	2	9	2	תכונות ב HTML	2	order_index שונה.
122	2014-03-24 17:11:11.650036-04	4	8	15	ליצור וללמד	2	title שונה.
123	2014-04-28 13:10:16.86106-04	2	8	16	דינמיקה	1	
124	2014-04-28 13:12:35.451021-04	2	9	33	דינמיקה מהי	1	
125	2014-04-28 13:14:22.198316-04	2	9	34	גישות היסטוריות לתנועת גופים	1	
126	2014-04-28 13:15:21.296368-04	2	9	35	החוק הראשון של ניוטון	1	
127	2014-04-28 13:26:20.503312-04	2	13	2	דינמיקה	1	
128	2014-04-28 13:26:40.14805-04	2	10	44	החוק הראשון של ניוטון	1	
129	2014-04-28 13:27:34.238696-04	2	10	44	החוק הראשון של ניוטון	2	youtube_movie_id שונה.
130	2014-05-13 00:46:16.230826-04	2	8	17	כוחות	1	
131	2014-05-13 00:52:28.435554-04	2	9	36	הגדרת כוח ויחידות	1	
132	2014-05-13 00:53:30.34842-04	2	9	37	חוק הוק	1	
133	2014-05-13 00:54:39.358615-04	2	9	38	קפיצים - העמקה	1	
134	2014-05-13 00:55:02.73053-04	2	9	39	דינמומטר	1	
135	2014-05-13 01:01:52.610182-04	2	9	40	החוק הראשון של ניוטון בשפה וקטורית	1	
136	2014-05-19 13:18:08.076495-04	2	9	40	החוק הראשון של ניוטון בשפה וקטורית	3	
137	2014-05-19 13:19:21.835812-04	2	9	41	אינטראקציות והחוק השלישי של ניוטון	1	
138	2014-05-19 13:21:35.693033-04	2	8	18	סוגים של כוחות	1	
139	2014-05-19 13:21:52.549941-04	2	9	41	אינטראקציות והחוק השלישי של ניוטון	2	parent שונה.
140	2014-05-19 13:22:28.760238-04	2	9	42	מתיחות	1	
141	2014-05-19 13:23:05.168411-04	2	9	43	הכוח הנורמלי	1	
142	2014-05-19 13:23:41.052258-04	2	9	44	כוח החיכוך הקינטי	1	
143	2014-05-19 13:25:44.443849-04	2	9	45	כוח החיכוך הסטטי	1	
144	2014-05-19 13:26:42.007738-04	2	9	44	כוח החיכוך הקינטי	2	description שונה.
145	2014-05-19 13:27:46.236916-04	2	9	43	הכוח הנורמלי	2	description שונה.
146	2014-05-19 13:30:11.007744-04	2	9	42	מתיחות	2	description שונה.
147	2014-05-19 13:33:17.475964-04	2	9	41	אינטראקציות והחוק השלישי של ניוטון	2	description שונה.
148	2014-05-19 13:33:59.540575-04	2	9	39	דינמומטר	2	description שונה.
149	2014-05-19 13:35:00.334312-04	2	9	38	קפיצים - העמקה	2	description שונה.
150	2014-05-19 13:36:59.790216-04	2	9	37	חוק הוק	2	description שונה.
151	2014-05-19 13:42:35.587934-04	2	8	19	החוק השני של ניוטון	1	
152	2014-05-19 13:45:30.719463-04	2	9	46	המסה האינרציאלית	1	
153	2014-05-19 13:46:32.759093-04	2	9	47	החוק השני של ניוטון	1	
154	2014-05-19 13:48:11.706499-04	2	9	48	מסה כובדית	1	
155	2014-05-19 14:05:41.397607-04	2	9	49	הכוח כוקטור	1	
156	2014-06-16 12:06:58.898527-04	2	8	20	שימור תנע קווי	1	
157	2014-06-16 12:08:20.429788-04	2	9	50	מתקף	1	
158	2014-06-16 12:09:24.548334-04	2	9	51	משפט מתקף ותנע	1	
159	2014-06-16 12:11:11.26433-04	2	9	52	התנע באינטראקציה בין שני גופים	1	
160	2014-06-16 12:11:59.375152-04	2	9	53	חוק שימור התנע הקווי	1	
161	2014-06-16 12:34:30.836561-04	2	10	46	סרטון לפתיחת נושא תנע	2	teach_item שונה.
162	2014-06-16 12:43:40.179236-04	2	9	54	רתע	1	
163	2014-06-16 12:44:06.589569-04	2	10	47	רתע	2	teach_item שונה.
164	2014-06-16 13:56:22.772474-04	2	9	52	התנע באינטראקציה בין שני גופים	3	
165	2014-06-16 13:58:12.990377-04	2	9	55	התנגשויות	1	
166	2014-06-17 12:02:42.957876-04	2	10	50	חוק התנועה הראשון של ניוטון - קהאן בעברית	1	
167	2014-06-17 12:04:00.277626-04	2	10	49	חוק התנועה הראשון של ניוטון	3	
168	2014-06-17 12:04:00.282611-04	2	10	48	חוק התנועה הראשון של ניוטון - קאהן בעברית	3	
169	2014-06-17 13:51:21.875778-04	2	10	51	חוק התנועה השני של ניוטון - קהאן בעברית	1	
170	2014-06-17 14:00:16.381624-04	2	10	52	Screencast-O-Matic Tutorial - Record Screen Captur	1	
171	2014-06-30 12:39:49.794581-04	2	8	21	שונות	1	
172	2014-06-30 12:40:41.275833-04	2	9	56	סרטונים שאין להם פרק לימוד מתאים	1	
173	2014-06-30 15:24:43.717304-04	2	8	21	שונות - פיסיקה	2	title, parent ו video_count_cache שונה.
174	2014-06-30 15:25:12.642048-04	2	8	22	שונות - מחשבים	1	
175	2014-06-30 15:25:33.696977-04	2	8	21	שונות - פיסיקה	2	order_index שונה.
176	2014-06-30 15:26:10.751638-04	2	9	56	סרטונים שונים - פיסיקה	2	title שונה.
177	2014-06-30 15:26:45.760359-04	2	9	57	סרטונים שונים - מדעי המחשב	1	
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 177, true);


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
7	migration history	south	migrationhistory
8	teach topic	core	teachtopic
9	teach item	core	teachitem
10	video page	core	videopage
11	rating review	core	ratingreview
12	textual review	core	textualreview
13	tag	core	tag
14	tag video	core	tagvideo
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('django_content_type_id_seq', 14, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
89c7ngdrf4cxm8pr0jdoe39jxb31y634	YzY4NmNhOWQxMmRmZjYyYjFkNTRlMjA3Yzg5OTYzZjgxMjBiY2M5NTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-02-03 15:32:07.863996-05
uk3gdc72fdrymvtrgj19s9h5zyfoebop	ODliYzc5ZWM1NTlkY2Y0OWM0NDU1ZmI5Y2Q3YWY5NmU1NDhlYTU4Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-03-03 14:22:01.104067-05
9apg3df33qvya7osi2aa79dms7vp8nwh	ZGVhYzMyNzNiMzdlOGNiNGE0OWFlYTFjMmNiNzVlZWNmNzNmOGJhNjp7fQ==	2014-03-05 01:02:44.068845-05
60o4wuacuqozo2xpvcefumi1hrqap4dp	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-02-03 15:38:37.016374-05
5qao346w125jtxasojqwnh2cefrhj50y	ZWIyNzkxY2JmZDI4NTlkNDA4Y2MxNWU5YzIzMDQ3NDNlN2E4YWIyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-03-10 14:05:24.944787-04
f665rx27rm9lcef652s396z5nvh8tni7	ODliYzc5ZWM1NTlkY2Y0OWM0NDU1ZmI5Y2Q3YWY5NmU1NDhlYTU4Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-03-10 16:52:29.540439-04
dw5o1feh00g0qhh7je2mggyo193f7gcz	ZGVhYzMyNzNiMzdlOGNiNGE0OWFlYTFjMmNiNzVlZWNmNzNmOGJhNjp7fQ==	2014-02-07 04:08:04.010047-05
amjoycihx8lk42r5kjnm0azhvwi4ffzx	YzY4NmNhOWQxMmRmZjYyYjFkNTRlMjA3Yzg5OTYzZjgxMjBiY2M5NTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-02-07 06:08:48.079335-05
mc504i5w5txg0u9sfywbq96c4rz4d26a	ODliYzc5ZWM1NTlkY2Y0OWM0NDU1ZmI5Y2Q3YWY5NmU1NDhlYTU4Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-03-11 04:29:14.271327-04
32etwrr6n1oyznh0i0yfj9ensbqbutbi	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-02-07 06:33:08.610708-05
2xsyp4gljjm3q2j1hf3js7xqshhe5ydm	ZGVhYzMyNzNiMzdlOGNiNGE0OWFlYTFjMmNiNzVlZWNmNzNmOGJhNjp7fQ==	2014-02-11 15:30:11.110064-05
np1cw63vl02sp1b86tk43xsk45z5v9hh	ZGVhYzMyNzNiMzdlOGNiNGE0OWFlYTFjMmNiNzVlZWNmNzNmOGJhNjp7fQ==	2014-03-12 06:21:03.031325-04
gto34ja2djxho0l83fhisliu8kwe44pr	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-02-17 10:14:17.45555-05
1sh0qqaq29rrpl5mkx081t7f0mlebwu4	OGM3ZjI4MjZjMzBlMDI2NjI5ZTEyN2QxMWM3OWYzZGZhMGZhMmM5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=	2014-02-17 14:13:02.137418-05
xlavbw3otjip5ahptpsc9sb4orepw4ab	ODA5YTM3NWQyZTk5NDk2MjAyN2ZjYTE4YzQxODU1NDI3NWQ2ZDEwMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OX0=	2014-03-14 18:56:26.598132-04
3eqrt4mtiyvl10opx1amu3rkfkp06h9w	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-02-24 07:46:48.883406-05
khmcy03olsa4psfw80zpn0hpb61z4g5g	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-02-24 08:55:58.758994-05
4z2wf6ihw312uerqzru7520ncecdm6f7	OGI4ZGViYWY4M2U3Y2QwNzBlYjEwY2NmZWQ2M2JiM2EwZjgzYjUzNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTB9	2014-03-17 10:10:14.383688-04
jir3cp1ekfnuxacngeti8wwml0fvbaya	ZGVhYzMyNzNiMzdlOGNiNGE0OWFlYTFjMmNiNzVlZWNmNzNmOGJhNjp7fQ==	2014-02-24 13:42:21.612771-05
3uzzviducs9qhnqjujweza9owczdmgy0	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-03-24 14:11:40.387578-04
5aiby0wm4pg2rndn4i97lbjcmouzinus	ZWIyNzkxY2JmZDI4NTlkNDA4Y2MxNWU5YzIzMDQ3NDNlN2E4YWIyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-03-24 14:56:38.141943-04
dlghdx9786dtp7a10h770wnwbp40it5d	ZWIyNzkxY2JmZDI4NTlkNDA4Y2MxNWU5YzIzMDQ3NDNlN2E4YWIyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-03-24 18:10:51.411778-04
fzptgqqczgllmex02c5gdkbhmw7ogqmh	NjkzZjQ2Y2E0OTI3NzExYjBkNjczNTMxOTJmZmViMjhjOTE0ODgwYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6N30=	2014-02-25 01:56:15.246709-05
elrif0gww5use6y1e90ix4fvmjoy10i5	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-04-06 07:25:47.508469-04
qg6lbawjg35q7higlos6v5248i3eg4b9	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-02-26 11:55:27.632478-05
g3ossv6vr6ofl3m9oz7zg945yrnqv6en	NzMyZDdlMzQ1YmRhZTQ0OWUxNjczM2E5ZTlkNTEwODJkZDgzNDcwNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTF9	2014-04-07 05:26:52.38662-04
rossbag69sru2ih4j8ga0a18qyvasond	NTQwYWM5NjBmODMyMzM5NjEyY2VkZDkzOGRkZGMwZDhiYTc3ZGU1Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTJ9	2014-04-24 03:24:24.135171-04
k8e11mwrqtwozs8bf7qhyen0kr3xdyqf	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-04-28 14:08:10.449479-04
du1dd4pxndahcbzkg5s9r40pxrs6ku1i	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-04-28 15:08:33.428398-04
sy15jqvky5ooofxdp1rype4l42tep0gk	ZGVhYzMyNzNiMzdlOGNiNGE0OWFlYTFjMmNiNzVlZWNmNzNmOGJhNjp7fQ==	2014-04-28 15:58:46.619496-04
41mkzfcp3w2i67nx1j1uu8o9q90m92h0	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-04-28 16:16:23.307282-04
josoyzj8bisd4zbdsnf401xb9ffeh27r	MWI1ODY4YzkzZTI4NGM4MWI5NDg0YTQxOWRhM2QxOWJiZDU4MTFhNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTN9	2014-04-28 16:46:32.0645-04
uk2wmrwls3n68r90rqu51vbrtcgvow5q	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-03-03 13:26:07.570414-05
b2k6a3n1meh6vrpqxg0u83ol9btgcmrb	ZWIyNzkxY2JmZDI4NTlkNDA4Y2MxNWU5YzIzMDQ3NDNlN2E4YWIyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-04-28 18:15:14.301664-04
w3sk9mpq5fkr6qyucqf3x3v51uwizplw	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-05-13 01:44:50.54743-04
k6cf80hlyr1vf1pshchvzpg1q5ne3gx4	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-05-19 14:09:04.210496-04
i4jcn5a5v9fcldhs7yq9n7ey9muom7xa	ZWIyNzkxY2JmZDI4NTlkNDA4Y2MxNWU5YzIzMDQ3NDNlN2E4YWIyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-05-20 17:23:22.772832-04
s8lg3xk4a8aatohc27mkn6ostuqrj2xx	NmMxY2YwYjZmNTIwZDBjMDg0YTkyNmFmMjQ2OWNkMDZmNWIwYjdhZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTR9	2014-06-05 15:49:32.87722-04
efe4f4frndh95xhyw7k3uvq6qsrsb0k9	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-06-09 14:13:52.665519-04
ndq9mebexxs7whog2l1ceb8dynlfx3lr	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-06-09 14:23:08.509014-04
rg4dg9efny1s29dkrxyoqhzsq86dgmd1	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-06-16 13:05:18.044035-04
hhtjvvuwwf8dil68kbi5o6k1bex8ncyk	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-06-16 14:50:36.685532-04
bsakqh1gm1j79uwgwc5nts4zit2r6aga	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-06-17 12:56:34.550427-04
dgaqc96fu19qdxupp03jbb0v3dxuilkw	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-06-17 14:50:25.475564-04
xk3jth9cm1nzislk9aohl39ykqn20xwc	MTAyMzU1YWVkNjMzMjExYjUyYWE0NzE3MThhY2Q3OGUyMGViMmUzYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTV9	2014-06-26 02:30:10.410698-04
mulr9di0kv15c4h1i7xhzgsgipmcyhjg	ZDQ0NDJlMmNlNzljNTA0YWU4ZmJhNTQ2ZjlhZjExNGRlODVkYTNlYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTZ9	2014-06-29 07:42:08.262977-04
lrfayub5d2nfomjmlnntbsz5kglsyjlo	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-06-30 13:34:54.527428-04
obtrbuuh5lxvqtd8six92eus3u2muzoy	ZDQ0NDJlMmNlNzljNTA0YWU4ZmJhNTQ2ZjlhZjExNGRlODVkYTNlYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTZ9	2014-06-30 15:12:11.411361-04
qu8ii2ywfwcqbexwln1y025t32yl8z17	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-06-30 16:24:05.958614-04
lykm788dk9w79s7s1ec25d560eep65o7	OGY0YTcwYjNkZjdlMTgwMmZjMGYwMWE4M2U1YjZmNjVjZWYxMGRlODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTd9	2014-07-01 00:34:22.078855-04
o70bzt9ndn6jekx2oo137tinvzlpy79t	OWQ5ZjMwNDExMzIwZDcyMGY5N2IwMjQ2YzkzNzUxODlmNjM4ODViNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-07-02 03:30:55.420921-04
\.


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: flipped
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	django_extensions	0001_empty	2014-01-20 15:25:15.201381-05
2	core	0001_initial	2014-01-20 15:25:15.349247-05
3	core	0002_auto__chg_field_ratingreview_context	2014-01-20 15:25:15.419395-05
4	core	0003_auto__chg_field_ratingreview_user__chg_field_textualreview_user	2014-01-20 15:25:15.513243-05
5	core	0004_auto__del_tagvideo	2014-01-24 06:07:53.233193-05
6	core	0005_auto__add_field_teachtopic_order_index__add_field_teachitem_order_inde	2014-02-24 13:04:10.047609-05
7	core	0006_auto__add_field_teachtopic_video_count_cache__add_field_teachitem_vide	2014-06-17 06:26:28.746943-04
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flipped
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 7, true);


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
-- Name: core_videopage_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY core_videopage_tags
    ADD CONSTRAINT core_videopage_tags_pkey PRIMARY KEY (id);


--
-- Name: core_videopage_tags_videopage_id_32ad1b5527fb8257_uniq; Type: CONSTRAINT; Schema: public; Owner: flipped; Tablespace: 
--

ALTER TABLE ONLY core_videopage_tags
    ADD CONSTRAINT core_videopage_tags_videopage_id_32ad1b5527fb8257_uniq UNIQUE (videopage_id, tag_id);


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
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: core_ratingreview_user_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX core_ratingreview_user_id ON core_ratingreview USING btree (user_id);


--
-- Name: core_ratingreview_video_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX core_ratingreview_video_id ON core_ratingreview USING btree (video_id);


--
-- Name: core_tag_name_like; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX core_tag_name_like ON core_tag USING btree (name varchar_pattern_ops);


--
-- Name: core_teachitem_parent_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX core_teachitem_parent_id ON core_teachitem USING btree (parent_id);


--
-- Name: core_teachtopic_parent_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX core_teachtopic_parent_id ON core_teachtopic USING btree (parent_id);


--
-- Name: core_textualreview_user_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX core_textualreview_user_id ON core_textualreview USING btree (user_id);


--
-- Name: core_textualreview_video_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX core_textualreview_video_id ON core_textualreview USING btree (video_id);


--
-- Name: core_videopage_tags_tag_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX core_videopage_tags_tag_id ON core_videopage_tags USING btree (tag_id);


--
-- Name: core_videopage_tags_videopage_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX core_videopage_tags_videopage_id ON core_videopage_tags USING btree (videopage_id);


--
-- Name: core_videopage_teach_item_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX core_videopage_teach_item_id ON core_videopage USING btree (teach_item_id);


--
-- Name: core_videopage_user_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX core_videopage_user_id ON core_videopage USING btree (user_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: flipped; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


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
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_c591cf38; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_teachitem
    ADD CONSTRAINT parent_id_refs_id_c591cf38 FOREIGN KEY (parent_id) REFERENCES core_teachtopic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_fdbe991b; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_teachtopic
    ADD CONSTRAINT parent_id_refs_id_fdbe991b FOREIGN KEY (parent_id) REFERENCES core_teachtopic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tag_id_refs_id_3a2b739a; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_videopage_tags
    ADD CONSTRAINT tag_id_refs_id_3a2b739a FOREIGN KEY (tag_id) REFERENCES core_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teach_item_id_refs_id_e9cf5306; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_videopage
    ADD CONSTRAINT teach_item_id_refs_id_e9cf5306 FOREIGN KEY (teach_item_id) REFERENCES core_teachitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_0e6a31ef; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_textualreview
    ADD CONSTRAINT user_id_refs_id_0e6a31ef FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: user_id_refs_id_989c92af; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_ratingreview
    ADD CONSTRAINT user_id_refs_id_989c92af FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_a43d7cec; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_videopage
    ADD CONSTRAINT user_id_refs_id_a43d7cec FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_c0d12874; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_c0d12874 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: video_id_refs_id_294073fb; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_ratingreview
    ADD CONSTRAINT video_id_refs_id_294073fb FOREIGN KEY (video_id) REFERENCES core_videopage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: video_id_refs_id_6ea8b581; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_textualreview
    ADD CONSTRAINT video_id_refs_id_6ea8b581 FOREIGN KEY (video_id) REFERENCES core_videopage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: videopage_id_refs_id_049d8c62; Type: FK CONSTRAINT; Schema: public; Owner: flipped
--

ALTER TABLE ONLY core_videopage_tags
    ADD CONSTRAINT videopage_id_refs_id_049d8c62 FOREIGN KEY (videopage_id) REFERENCES core_videopage(id) DEFERRABLE INITIALLY DEFERRED;


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

