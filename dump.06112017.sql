--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: thiagopontes
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO thiagopontes;

--
-- Name: carteiras; Type: TABLE; Schema: public; Owner: thiagopontes
--

CREATE TABLE carteiras (
    id integer NOT NULL,
    data_da_compra date,
    empresa_id integer,
    user_id integer,
    entrada numeric(11,2),
    alvo numeric(11,2),
    stop numeric(11,2),
    atual numeric(5,2),
    quantidade integer,
    situacao character varying,
    total_da_compra numeric(11,2),
    total_da_venda numeric(11,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    data_da_venda date
);


ALTER TABLE carteiras OWNER TO thiagopontes;

--
-- Name: carteiras_id_seq; Type: SEQUENCE; Schema: public; Owner: thiagopontes
--

CREATE SEQUENCE carteiras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE carteiras_id_seq OWNER TO thiagopontes;

--
-- Name: carteiras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thiagopontes
--

ALTER SEQUENCE carteiras_id_seq OWNED BY carteiras.id;


--
-- Name: empresas; Type: TABLE; Schema: public; Owner: thiagopontes
--

CREATE TABLE empresas (
    id integer NOT NULL,
    nome character varying,
    ticker character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE empresas OWNER TO thiagopontes;

--
-- Name: empresas_id_seq; Type: SEQUENCE; Schema: public; Owner: thiagopontes
--

CREATE SEQUENCE empresas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresas_id_seq OWNER TO thiagopontes;

--
-- Name: empresas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thiagopontes
--

ALTER SEQUENCE empresas_id_seq OWNED BY empresas.id;


--
-- Name: papers; Type: TABLE; Schema: public; Owner: thiagopontes
--

CREATE TABLE papers (
    id integer NOT NULL,
    name character varying,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE papers OWNER TO thiagopontes;

--
-- Name: papers_id_seq; Type: SEQUENCE; Schema: public; Owner: thiagopontes
--

CREATE SEQUENCE papers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE papers_id_seq OWNER TO thiagopontes;

--
-- Name: papers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thiagopontes
--

ALTER SEQUENCE papers_id_seq OWNED BY papers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: thiagopontes
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO thiagopontes;

--
-- Name: users; Type: TABLE; Schema: public; Owner: thiagopontes
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO thiagopontes;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: thiagopontes
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO thiagopontes;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thiagopontes
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: wallets; Type: TABLE; Schema: public; Owner: thiagopontes
--

CREATE TABLE wallets (
    id integer NOT NULL,
    paper_id integer,
    user_id integer,
    purchased_price numeric(8,2),
    quantity integer,
    purchased_at date,
    sold_at date,
    sold_price numeric(8,2),
    status character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE wallets OWNER TO thiagopontes;

--
-- Name: wallets_id_seq; Type: SEQUENCE; Schema: public; Owner: thiagopontes
--

CREATE SEQUENCE wallets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wallets_id_seq OWNER TO thiagopontes;

--
-- Name: wallets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thiagopontes
--

ALTER SEQUENCE wallets_id_seq OWNED BY wallets.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY carteiras ALTER COLUMN id SET DEFAULT nextval('carteiras_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY empresas ALTER COLUMN id SET DEFAULT nextval('empresas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY papers ALTER COLUMN id SET DEFAULT nextval('papers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY wallets ALTER COLUMN id SET DEFAULT nextval('wallets_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: thiagopontes
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-04-28 01:40:47.90628	2017-04-28 01:40:47.90628
\.


--
-- Data for Name: carteiras; Type: TABLE DATA; Schema: public; Owner: thiagopontes
--

COPY carteiras (id, data_da_compra, empresa_id, user_id, entrada, alvo, stop, atual, quantidade, situacao, total_da_compra, total_da_venda, created_at, updated_at, data_da_venda) FROM stdin;
2	2017-09-09	28	1	10.00	13.00	9.00	9.55	1000	encerrado	\N	\N	2017-09-09 11:10:40.186536	2017-10-04 23:47:14.865157	2017-10-04
1	2017-09-09	7	1	15.00	18.00	13.50	37.51	1000	em_andamento	\N	\N	2017-09-09 11:08:44.589932	2017-10-22 18:16:37.187055	\N
4	2017-10-03	63	1	16.75	19.00	15.00	15.76	800	em_andamento	\N	\N	2017-10-03 23:09:20.51983	2017-10-22 18:16:37.19917	\N
\.


--
-- Name: carteiras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thiagopontes
--

SELECT pg_catalog.setval('carteiras_id_seq', 4, true);


--
-- Data for Name: empresas; Type: TABLE DATA; Schema: public; Owner: thiagopontes
--

COPY empresas (id, nome, ticker, created_at, updated_at) FROM stdin;
1	BB SEGURIDADE	BBSE3	2017-09-09 00:41:31.106385	2017-09-09 00:41:31.106385
2	CIELO	CIEL3	2017-09-09 00:41:31.108805	2017-09-09 00:41:31.108805
3	ELETROBRAS	ELET3	2017-09-09 00:41:31.110514	2017-09-09 00:41:31.110514
4	EQUATORIAL	EQTL3	2017-09-09 00:41:31.112053	2017-09-09 00:41:31.112053
5	ITAUSA	ITSA3	2017-09-09 00:41:31.113574	2017-09-09 00:41:31.113574
6	PETROBRAS	PETR4	2017-09-09 00:41:31.115207	2017-09-09 00:41:31.115207
7	BANCO DO BRASIL	BBAS3	2017-09-09 00:41:31.116754	2017-09-09 00:41:31.116754
8	KROTON	KROT3	2017-09-09 00:41:31.118291	2017-09-09 00:41:31.118291
9	USIMINAS	USIM5	2017-09-09 00:41:31.1198	2017-09-09 00:41:31.1198
10	GOL	GOLL4	2017-09-09 00:41:31.121408	2017-09-09 00:41:31.121408
11	EMBRAER	EMBR3	2017-09-09 00:41:31.122944	2017-09-09 00:41:31.122944
12	JBS	JBSS3	2017-09-09 00:41:31.124465	2017-09-09 00:41:31.124465
13	GERDAU	GOAU4	2017-09-09 00:41:31.125992	2017-09-09 00:41:31.125992
14	VALE	VALE5	2017-09-09 00:41:31.127546	2017-09-09 00:41:31.127546
15	ELETROPAULO	ELPL4	2017-09-09 00:41:31.129036	2017-09-09 00:41:31.129036
16	SMILES	SMLE3	2017-09-09 00:41:31.13061	2017-09-09 00:41:31.13061
17	MOVIDA	MOVI3	2017-09-09 00:41:31.132144	2017-09-09 00:41:31.132144
18	B2W DIGITAL	BTOW3	2017-09-09 00:41:31.13367	2017-09-09 00:41:31.13367
19	TOTVS	TOTS3	2017-09-09 00:41:31.135172	2017-09-09 00:41:31.135172
20	NATURA	NATU3	2017-09-09 00:41:31.136755	2017-09-09 00:41:31.136755
21	CYRELA	CYRE3	2017-09-09 00:41:31.138243	2017-09-09 00:41:31.138243
22	IOCHP-MAXION	MYPK3	2017-09-09 00:41:31.139736	2017-09-09 00:41:31.139736
23	TUPY	TUPY3	2017-09-09 00:41:31.141274	2017-09-09 00:41:31.141274
24	PETRORIO	PRIO3	2017-09-09 00:41:31.142934	2017-09-09 00:41:31.142934
25	MULTIPLAN	MULT3	2017-09-09 00:41:31.144643	2017-09-09 00:41:31.144643
26	KLABIN	KLBN11	2017-09-09 00:41:31.14622	2017-09-09 00:41:31.14622
27	FLEURY	FLRY3	2017-09-09 00:41:31.147786	2017-09-09 00:41:31.147786
28	DIRECIONAL	DIRR3	2017-09-09 00:41:31.149345	2017-09-09 00:41:31.149345
29	SLC AGRICOLA	SLCE3	2017-09-09 00:41:31.150975	2017-09-09 00:41:31.150975
30	ITAU UNIBANCO	ITUB4	2017-09-09 00:41:31.15258	2017-09-09 00:41:31.15258
31	LOJAS RENNER	LREN3	2017-09-09 00:41:31.154134	2017-09-09 00:41:31.154134
32	BB SEGURIDADE	BBSE3	2017-09-09 00:41:44.744225	2017-09-09 00:41:44.744225
33	CIELO	CIEL3	2017-09-09 00:41:44.746516	2017-09-09 00:41:44.746516
34	ELETROBRAS	ELET3	2017-09-09 00:41:44.748052	2017-09-09 00:41:44.748052
35	EQUATORIAL	EQTL3	2017-09-09 00:41:44.749675	2017-09-09 00:41:44.749675
36	ITAUSA	ITSA3	2017-09-09 00:41:44.751221	2017-09-09 00:41:44.751221
37	PETROBRAS	PETR4	2017-09-09 00:41:44.752713	2017-09-09 00:41:44.752713
38	BANCO DO BRASIL	BBAS3	2017-09-09 00:41:44.754317	2017-09-09 00:41:44.754317
39	KROTON	KROT3	2017-09-09 00:41:44.755927	2017-09-09 00:41:44.755927
40	USIMINAS	USIM5	2017-09-09 00:41:44.757478	2017-09-09 00:41:44.757478
41	GOL	GOLL4	2017-09-09 00:41:44.758997	2017-09-09 00:41:44.758997
42	EMBRAER	EMBR3	2017-09-09 00:41:44.76046	2017-09-09 00:41:44.76046
43	JBS	JBSS3	2017-09-09 00:41:44.761892	2017-09-09 00:41:44.761892
44	GERDAU	GOAU4	2017-09-09 00:41:44.763401	2017-09-09 00:41:44.763401
45	VALE	VALE5	2017-09-09 00:41:44.764892	2017-09-09 00:41:44.764892
46	ELETROPAULO	ELPL4	2017-09-09 00:41:44.766427	2017-09-09 00:41:44.766427
47	SMILES	SMLE3	2017-09-09 00:41:44.767984	2017-09-09 00:41:44.767984
48	MOVIDA	MOVI3	2017-09-09 00:41:44.769551	2017-09-09 00:41:44.769551
49	B2W DIGITAL	BTOW3	2017-09-09 00:41:44.771143	2017-09-09 00:41:44.771143
50	TOTVS	TOTS3	2017-09-09 00:41:44.772661	2017-09-09 00:41:44.772661
51	NATURA	NATU3	2017-09-09 00:41:44.774131	2017-09-09 00:41:44.774131
52	CYRELA	CYRE3	2017-09-09 00:41:44.775648	2017-09-09 00:41:44.775648
53	IOCHP-MAXION	MYPK3	2017-09-09 00:41:44.77725	2017-09-09 00:41:44.77725
54	TUPY	TUPY3	2017-09-09 00:41:44.778735	2017-09-09 00:41:44.778735
55	PETRORIO	PRIO3	2017-09-09 00:41:44.780401	2017-09-09 00:41:44.780401
56	MULTIPLAN	MULT3	2017-09-09 00:41:44.781912	2017-09-09 00:41:44.781912
57	KLABIN	KLBN11	2017-09-09 00:41:44.783387	2017-09-09 00:41:44.783387
58	FLEURY	FLRY3	2017-09-09 00:41:44.784877	2017-09-09 00:41:44.784877
59	DIRECIONAL	DIRR3	2017-09-09 00:41:44.786451	2017-09-09 00:41:44.786451
60	SLC AGRICOLA	SLCE3	2017-09-09 00:41:44.788024	2017-09-09 00:41:44.788024
61	ITAU UNIBANCO	ITUB4	2017-09-09 00:41:44.789557	2017-09-09 00:41:44.789557
62	LOJAS RENNER	LREN3	2017-09-09 00:41:44.791151	2017-09-09 00:41:44.791151
63	fesa	FESA4	2017-10-03 23:08:32.933701	2017-10-03 23:08:32.933701
\.


--
-- Name: empresas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thiagopontes
--

SELECT pg_catalog.setval('empresas_id_seq', 63, true);


--
-- Data for Name: papers; Type: TABLE DATA; Schema: public; Owner: thiagopontes
--

COPY papers (id, name, code, created_at, updated_at) FROM stdin;
1	BB SEGURIDADE	BBSE3	2017-04-28 01:40:50.651723	2017-04-28 01:40:50.651723
2	CIELO	CIEL3	2017-04-28 01:40:50.653896	2017-04-28 01:40:50.653896
3	ELETROBRAS	ELET3	2017-04-28 01:40:50.655501	2017-04-28 01:40:50.655501
4	EQUATORIAL	EQTL3	2017-04-28 01:40:50.657025	2017-04-28 01:40:50.657025
5	ITAUSA	ITSA3	2017-04-28 01:40:50.658549	2017-04-28 01:40:50.658549
6	PETROBRAS	PETR4	2017-04-28 01:40:50.660089	2017-04-28 01:40:50.660089
7	BANCO DO BRASIL	BBAS3	2017-04-28 01:40:50.661663	2017-04-28 01:40:50.661663
8	KROTON	KROT3	2017-04-28 01:40:50.663221	2017-04-28 01:40:50.663221
9	USIMINAS	USIM5	2017-04-28 01:40:50.664739	2017-04-28 01:40:50.664739
10	GOL	GOLL4	2017-04-28 01:40:50.666301	2017-04-28 01:40:50.666301
11	EMBRAER	EMBR3	2017-04-28 01:40:50.667854	2017-04-28 01:40:50.667854
12	JBS	JBSS3	2017-04-28 01:40:50.669393	2017-04-28 01:40:50.669393
13	GERDAU	GOAU4	2017-04-28 01:40:50.670939	2017-04-28 01:40:50.670939
14	VALE	VALE5	2017-04-28 01:40:50.672725	2017-04-28 01:40:50.672725
15	ELETROPAULO	ELPL4	2017-04-28 01:40:50.674284	2017-04-28 01:40:50.674284
16	SMILES	SMLE3	2017-04-28 01:40:50.675843	2017-04-28 01:40:50.675843
17	MOVIDA	MOVI3	2017-04-28 01:40:50.677645	2017-04-28 01:40:50.677645
18	B2W DIGITAL	BTOW3	2017-04-28 01:40:50.679268	2017-04-28 01:40:50.679268
19	TOTVS	TOTS3	2017-04-28 01:40:50.680831	2017-04-28 01:40:50.680831
20	NATURA	NATU3	2017-04-28 01:40:50.682366	2017-04-28 01:40:50.682366
21	CYRELA	CYRE3	2017-04-28 01:40:50.683969	2017-04-28 01:40:50.683969
22	IOCHP-MAXION	MYPK3	2017-04-28 01:40:50.685547	2017-04-28 01:40:50.685547
23	TUPY	TUPY3	2017-04-28 01:40:50.687109	2017-04-28 01:40:50.687109
24	PETRORIO	PRIO3	2017-04-28 01:40:50.688622	2017-04-28 01:40:50.688622
25	MULTIPLAN	MULT3	2017-04-28 01:40:50.690149	2017-04-28 01:40:50.690149
26	KLABIN	KLBN11	2017-04-28 01:40:50.691663	2017-04-28 01:40:50.691663
27	FLEURY	FLRY3	2017-04-28 01:40:50.693268	2017-04-28 01:40:50.693268
28	DIRECIONAL	DIRR3	2017-04-28 01:40:50.694827	2017-04-28 01:40:50.694827
29	SLC AGRICOLA	SLCE3	2017-04-28 01:40:50.696354	2017-04-28 01:40:50.696354
\.


--
-- Name: papers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thiagopontes
--

SELECT pg_catalog.setval('papers_id_seq', 29, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: thiagopontes
--

COPY schema_migrations (version) FROM stdin;
20161024223713
20161108222618
20161108222942
20170908233047
20170908234612
20171004230003
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: thiagopontes
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, failed_attempts, unlock_token, locked_at, created_at, updated_at) FROM stdin;
1	tnevesp@gmail.com	$2a$11$xmxR.ce0tJibkA3pafGttehfFYzmqGr274O8d4uxDJHLDze.0MsLq	\N	\N	\N	14	2017-10-22 18:17:05.080736	2017-10-22 17:28:17.311446	::1	::1	\N	2017-09-08 00:00:00	\N	\N	0	\N	\N	2017-04-28 01:40:50.641557	2017-10-22 18:17:05.08328
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thiagopontes
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Data for Name: wallets; Type: TABLE DATA; Schema: public; Owner: thiagopontes
--

COPY wallets (id, paper_id, user_id, purchased_price, quantity, purchased_at, sold_at, sold_price, status, created_at, updated_at) FROM stdin;
1	1	\N	35.20	100	2015-05-04	\N	\N	open	2017-04-28 01:40:50.718042	2017-04-28 01:40:50.718042
2	2	\N	41.55	100	2015-05-04	\N	\N	open	2017-04-28 01:40:50.722027	2017-04-28 01:40:50.722027
3	3	\N	7.52	100	2015-05-04	2016-06-20	8.56	closed	2017-04-28 01:40:50.725111	2017-04-28 01:40:50.725111
4	4	\N	31.74	100	2015-05-04	\N	\N	open	2017-04-28 01:40:50.728273	2017-04-28 01:40:50.728273
5	5	\N	9.60	300	2015-05-05	\N	\N	open	2017-04-28 01:40:50.731311	2017-04-28 01:40:50.731311
6	6	\N	4.49	100	2016-02-04	2016-06-20	9.28	closed	2017-04-28 01:40:50.736247	2017-04-28 01:40:50.736247
7	6	\N	4.60	100	2016-02-18	2016-06-20	9.28	closed	2017-04-28 01:40:50.740165	2017-04-28 01:40:50.740165
8	1	\N	28.00	100	2016-06-20	\N	\N	open	2017-04-28 01:40:50.74396	2017-04-28 01:40:50.74396
9	7	\N	17.05	100	2016-07-01	2017-03-20	32.31	closed	2017-04-28 01:40:50.747405	2017-04-28 01:40:50.747405
10	8	\N	14.30	100	2016-07-01	\N	\N	open	2017-04-28 01:40:50.752594	2017-04-28 01:40:50.752594
11	9	\N	3.02	400	2016-07-26	2017-03-17	4.55	closed	2017-04-28 01:40:50.755519	2017-04-28 01:40:50.755519
12	10	\N	6.69	1000	2016-09-22	2016-12-01	5.25	closed	2017-04-28 01:40:50.758426	2017-04-28 01:40:50.758426
13	11	\N	15.63	400	2016-10-19	2017-04-03	16.87	closed	2017-04-28 01:40:50.763281	2017-04-28 01:40:50.763281
14	11	\N	15.86	600	2016-10-24	2017-04-03	16.87	closed	2017-04-28 01:40:50.771232	2017-04-28 01:40:50.771232
15	12	\N	10.05	500	2016-11-08	2017-03-06	11.28	closed	2017-04-28 01:40:50.774147	2017-04-28 01:40:50.774147
16	12	\N	9.15	500	2016-11-09	2017-03-06	11.28	closed	2017-04-28 01:40:50.776913	2017-04-28 01:40:50.776913
17	13	\N	6.00	1200	2016-11-30	\N	\N	open	2017-04-28 01:40:50.779632	2017-04-28 01:40:50.779632
18	6	\N	16.03	900	2016-11-30	\N	\N	open	2017-04-28 01:40:50.782258	2017-04-28 01:40:50.782258
19	14	\N	26.49	500	2016-12-01	2017-02-22	33.07	closed	2017-04-28 01:40:50.785037	2017-04-28 01:40:50.785037
20	15	\N	11.55	1000	2017-01-11	\N	\N	open	2017-04-28 01:40:50.789166	2017-04-28 01:40:50.789166
21	16	\N	48.55	300	2017-01-18	2017-02-08	59.97	closed	2017-04-28 01:40:50.793088	2017-04-28 01:40:50.793088
22	17	\N	7.30	1000	2017-02-08	2017-02-08	7.37	closed	2017-04-28 01:40:50.796094	2017-04-28 01:40:50.796094
23	18	\N	13.00	1200	2017-02-14	2017-02-23	12.10	closed	2017-04-28 01:40:50.799031	2017-04-28 01:40:50.799031
24	19	\N	26.76	600	2017-03-06	2017-03-13	27.27	closed	2017-04-28 01:40:50.80218	2017-04-28 01:40:50.80218
25	20	\N	27.49	500	2017-03-10	2017-04-27	29.52	closed	2017-04-28 01:40:50.807633	2017-04-28 01:40:50.807633
26	21	\N	13.59	1000	2017-03-13	2017-03-20	13.05	closed	2017-04-28 01:40:50.811849	2017-04-28 01:40:50.811849
27	22	\N	15.49	1000	2017-03-13	\N	\N	open	2017-04-28 01:40:50.819423	2017-04-28 01:40:50.819423
28	23	\N	14.25	1000	2017-03-13	2017-04-04	14.29	closed	2017-04-28 01:40:50.823306	2017-04-28 01:40:50.823306
29	24	\N	41.00	200	2017-03-29	\N	\N	open	2017-04-28 01:40:50.835556	2017-04-28 01:40:50.835556
30	25	\N	68.20	200	2017-04-05	\N	\N	open	2017-04-28 01:40:50.838473	2017-04-28 01:40:50.838473
31	26	\N	15.18	1500	2017-04-11	2017-04-11	15.05	closed	2017-04-28 01:40:50.841304	2017-04-28 01:40:50.841304
32	27	\N	44.32	400	2017-04-13	\N	\N	open	2017-04-28 01:40:50.845438	2017-04-28 01:40:50.845438
33	14	\N	26.46	800	2017-04-13	2017-04-13	26.24	closed	2017-04-28 01:40:50.848268	2017-04-28 01:40:50.848268
34	28	\N	5.86	2000	2017-04-17	\N	\N	open	2017-04-28 01:40:50.850999	2017-04-28 01:40:50.850999
35	29	\N	18.45	600	2017-04-19	\N	\N	open	2017-04-28 01:40:50.853618	2017-04-28 01:40:50.853618
36	28	\N	5.79	1300	2017-04-20	\N	\N	open	2017-04-28 01:40:50.856272	2017-04-28 01:40:50.856272
\.


--
-- Name: wallets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thiagopontes
--

SELECT pg_catalog.setval('wallets_id_seq', 36, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: carteiras_pkey; Type: CONSTRAINT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY carteiras
    ADD CONSTRAINT carteiras_pkey PRIMARY KEY (id);


--
-- Name: empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (id);


--
-- Name: papers_pkey; Type: CONSTRAINT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY papers
    ADD CONSTRAINT papers_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);


--
-- Name: index_carteiras_on_empresa_id; Type: INDEX; Schema: public; Owner: thiagopontes
--

CREATE INDEX index_carteiras_on_empresa_id ON carteiras USING btree (empresa_id);


--
-- Name: index_carteiras_on_user_id; Type: INDEX; Schema: public; Owner: thiagopontes
--

CREATE INDEX index_carteiras_on_user_id ON carteiras USING btree (user_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: thiagopontes
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: thiagopontes
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: thiagopontes
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: thiagopontes
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON users USING btree (unlock_token);


--
-- Name: index_wallets_on_paper_id; Type: INDEX; Schema: public; Owner: thiagopontes
--

CREATE INDEX index_wallets_on_paper_id ON wallets USING btree (paper_id);


--
-- Name: index_wallets_on_user_id; Type: INDEX; Schema: public; Owner: thiagopontes
--

CREATE INDEX index_wallets_on_user_id ON wallets USING btree (user_id);


--
-- Name: fk_rails_614cd1232f; Type: FK CONSTRAINT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY carteiras
    ADD CONSTRAINT fk_rails_614cd1232f FOREIGN KEY (empresa_id) REFERENCES empresas(id);


--
-- Name: fk_rails_732f6628c4; Type: FK CONSTRAINT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY wallets
    ADD CONSTRAINT fk_rails_732f6628c4 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_dc556508aa; Type: FK CONSTRAINT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY wallets
    ADD CONSTRAINT fk_rails_dc556508aa FOREIGN KEY (paper_id) REFERENCES papers(id);


--
-- Name: fk_rails_de49e3f2ea; Type: FK CONSTRAINT; Schema: public; Owner: thiagopontes
--

ALTER TABLE ONLY carteiras
    ADD CONSTRAINT fk_rails_de49e3f2ea FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: thiagopontes
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM thiagopontes;
GRANT ALL ON SCHEMA public TO thiagopontes;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

