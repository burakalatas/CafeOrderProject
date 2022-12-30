--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 15rc2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: beveragelistpricechanges(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.beveragelistpricechanges() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW."beverageprice" <> OLD."beverageprice" THEN
        INSERT INTO "beveragelistpricechanges"("beverageid", "oldbeverageprice", "newbeverageprice", "updatedate")
        VALUES(OLD."beverageid", OLD."beverageprice" , NEW."beverageprice", CURRENT_TIMESTAMP::TIMESTAMP);
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.beveragelistpricechanges() OWNER TO postgres;

--
-- Name: deletedOrdersFunc(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."deletedOrdersFunc"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN

    INSERT INTO "deletedOrders"("orderId", "staffId", "tableId", "orderAddress", "deletedDate")
    VALUES(OLD."orderid", OLD."staffid", OLD."tableid", OLD."orderaddress", CURRENT_TIMESTAMP::TIMESTAMP);
RETURN OLD;
END;
$$;


ALTER FUNCTION public."deletedOrdersFunc"() OWNER TO postgres;

--
-- Name: foodlistpricechanges(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.foodlistpricechanges() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW."foodprice" <> OLD."foodprice" THEN
        INSERT INTO "foodlistpricechanges"("foodid", "oldfoodprice", "newfoodprice", "updatedate")
        VALUES(OLD."foodid", OLD."foodprice" , NEW."foodprice", CURRENT_TIMESTAMP::TIMESTAMP);
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.foodlistpricechanges() OWNER TO postgres;

--
-- Name: trimAddress(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."trimAddress"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."orderaddress" = LTRIM(NEW."orderaddress"); -- Clear previous and next spaces
    RETURN NEW;
END;
$$;


ALTER FUNCTION public."trimAddress"() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: beveragelist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beveragelist (
    beverageid integer NOT NULL,
    beveragename character varying NOT NULL,
    beverageprice real NOT NULL
);


ALTER TABLE public.beveragelist OWNER TO postgres;

--
-- Name: beveragelist_beverageid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beveragelist_beverageid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beveragelist_beverageid_seq OWNER TO postgres;

--
-- Name: beveragelist_beverageid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beveragelist_beverageid_seq OWNED BY public.beveragelist.beverageid;


--
-- Name: beveragelistpricechanges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beveragelistpricechanges (
    beveragelistrecordno integer NOT NULL,
    beverageid smallint NOT NULL,
    oldbeverageprice real NOT NULL,
    newbeverageprice real NOT NULL,
    updatedate timestamp without time zone NOT NULL
);


ALTER TABLE public.beveragelistpricechanges OWNER TO postgres;

--
-- Name: beveragelistpricechanges_beveragelistrecordno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beveragelistpricechanges_beveragelistrecordno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beveragelistpricechanges_beveragelistrecordno_seq OWNER TO postgres;

--
-- Name: beveragelistpricechanges_beveragelistrecordno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beveragelistpricechanges_beveragelistrecordno_seq OWNED BY public.beveragelistpricechanges.beveragelistrecordno;


--
-- Name: beverages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beverages (
    beverageid integer NOT NULL,
    beveragename character varying(100) NOT NULL,
    beverageprice real NOT NULL,
    orderid integer NOT NULL
);


ALTER TABLE public.beverages OWNER TO postgres;

--
-- Name: beverages_beverageid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beverages_beverageid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beverages_beverageid_seq OWNER TO postgres;

--
-- Name: beverages_beverageid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beverages_beverageid_seq OWNED BY public.beverages.beverageid;


--
-- Name: cashier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cashier (
    staffid integer NOT NULL
);


ALTER TABLE public.cashier OWNER TO postgres;

--
-- Name: checkout; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.checkout (
    sectionid integer NOT NULL,
    cashierid integer,
    orderid integer
);


ALTER TABLE public.checkout OWNER TO postgres;

--
-- Name: courier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courier (
    staffid integer NOT NULL
);


ALTER TABLE public.courier OWNER TO postgres;

--
-- Name: deletedOrders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."deletedOrders" (
    "deletedOrdersId" integer NOT NULL,
    "orderId" integer NOT NULL,
    "staffId" integer NOT NULL,
    "tableId" integer NOT NULL,
    "orderAddress" character varying,
    "deletedDate" timestamp without time zone NOT NULL
);


ALTER TABLE public."deletedOrders" OWNER TO postgres;

--
-- Name: deletedOrders_deletedOrdersId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."deletedOrders_deletedOrdersId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."deletedOrders_deletedOrdersId_seq" OWNER TO postgres;

--
-- Name: deletedOrders_deletedOrdersId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."deletedOrders_deletedOrdersId_seq" OWNED BY public."deletedOrders"."deletedOrdersId";


--
-- Name: foodlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foodlist (
    foodid integer NOT NULL,
    foodname character varying(100) NOT NULL,
    foodprice real NOT NULL
);


ALTER TABLE public.foodlist OWNER TO postgres;

--
-- Name: foodlist_foodid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.foodlist_foodid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foodlist_foodid_seq OWNER TO postgres;

--
-- Name: foodlist_foodid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.foodlist_foodid_seq OWNED BY public.foodlist.foodid;


--
-- Name: foodlistpricechanges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foodlistpricechanges (
    foodlistrecordno integer NOT NULL,
    foodid smallint NOT NULL,
    oldfoodprice real NOT NULL,
    newfoodprice real NOT NULL,
    updatedate timestamp without time zone NOT NULL
);


ALTER TABLE public.foodlistpricechanges OWNER TO postgres;

--
-- Name: foodlistpricechanges_foodlistrecordno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.foodlistpricechanges_foodlistrecordno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foodlistpricechanges_foodlistrecordno_seq OWNER TO postgres;

--
-- Name: foodlistpricechanges_foodlistrecordno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.foodlistpricechanges_foodlistrecordno_seq OWNED BY public.foodlistpricechanges.foodlistrecordno;


--
-- Name: foods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foods (
    foodid integer NOT NULL,
    foodname character varying(100) NOT NULL,
    foodprice real NOT NULL,
    orderid integer NOT NULL
);


ALTER TABLE public.foods OWNER TO postgres;

--
-- Name: foods_foodid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.foods_foodid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foods_foodid_seq OWNER TO postgres;

--
-- Name: foods_foodid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.foods_foodid_seq OWNED BY public.foods.foodid;


--
-- Name: kitchen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kitchen (
    sectionid integer NOT NULL,
    orderid integer
);


ALTER TABLE public.kitchen OWNER TO postgres;

--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    orderid integer NOT NULL,
    orderaddress character varying(300),
    totalprice real,
    staffid integer,
    tableid integer NOT NULL
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: order_orderid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_orderid_seq OWNER TO postgres;

--
-- Name: order_orderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_orderid_seq OWNED BY public."order".orderid;


--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    staffid integer NOT NULL,
    stafftype character varying(50) NOT NULL,
    staffname character varying,
    staffphoneno character(11)
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: staff_staffid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_staffid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_staffid_seq OWNER TO postgres;

--
-- Name: staff_staffid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_staffid_seq OWNED BY public.staff.staffid;


--
-- Name: tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tables (
    tableid integer NOT NULL
);


ALTER TABLE public.tables OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    userid integer NOT NULL,
    username character varying NOT NULL,
    userpassword character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_userid_seq OWNER TO postgres;

--
-- Name: user_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_userid_seq OWNED BY public."user".userid;


--
-- Name: waiter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.waiter (
    staffid integer NOT NULL
);


ALTER TABLE public.waiter OWNER TO postgres;

--
-- Name: beveragelist beverageid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beveragelist ALTER COLUMN beverageid SET DEFAULT nextval('public.beveragelist_beverageid_seq'::regclass);


--
-- Name: beveragelistpricechanges beveragelistrecordno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beveragelistpricechanges ALTER COLUMN beveragelistrecordno SET DEFAULT nextval('public.beveragelistpricechanges_beveragelistrecordno_seq'::regclass);


--
-- Name: beverages beverageid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beverages ALTER COLUMN beverageid SET DEFAULT nextval('public.beverages_beverageid_seq'::regclass);


--
-- Name: deletedOrders deletedOrdersId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."deletedOrders" ALTER COLUMN "deletedOrdersId" SET DEFAULT nextval('public."deletedOrders_deletedOrdersId_seq"'::regclass);


--
-- Name: foodlist foodid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foodlist ALTER COLUMN foodid SET DEFAULT nextval('public.foodlist_foodid_seq'::regclass);


--
-- Name: foodlistpricechanges foodlistrecordno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foodlistpricechanges ALTER COLUMN foodlistrecordno SET DEFAULT nextval('public.foodlistpricechanges_foodlistrecordno_seq'::regclass);


--
-- Name: foods foodid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foods ALTER COLUMN foodid SET DEFAULT nextval('public.foods_foodid_seq'::regclass);


--
-- Name: order orderid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN orderid SET DEFAULT nextval('public.order_orderid_seq'::regclass);


--
-- Name: staff staffid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN staffid SET DEFAULT nextval('public.staff_staffid_seq'::regclass);


--
-- Name: user userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN userid SET DEFAULT nextval('public.user_userid_seq'::regclass);


--
-- Data for Name: beveragelist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.beveragelist VALUES (3, 'Milk', 12);
INSERT INTO public.beveragelist VALUES (2, 'Tea', 5);
INSERT INTO public.beveragelist VALUES (4, 'Turkish Coffee', 30);
INSERT INTO public.beveragelist VALUES (5, 'Ice Tea', 17);
INSERT INTO public.beveragelist VALUES (6, 'Water', 3);
INSERT INTO public.beveragelist VALUES (7, 'Milkshake', 28);
INSERT INTO public.beveragelist VALUES (1, 'Lemonade', 19);


--
-- Data for Name: beveragelistpricechanges; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.beveragelistpricechanges VALUES (1, 1, 15, 17, '2022-12-22 13:08:06.052432');
INSERT INTO public.beveragelistpricechanges VALUES (2, 7, 28, 29, '2022-12-27 21:54:51.05515');
INSERT INTO public.beveragelistpricechanges VALUES (3, 6, 2.5, 3, '2022-12-27 22:38:29.14413');
INSERT INTO public.beveragelistpricechanges VALUES (4, 7, 29, 28, '2022-12-28 09:38:10.662583');
INSERT INTO public.beveragelistpricechanges VALUES (5, 1, 17, 19, '2022-12-29 15:36:51.179364');


--
-- Data for Name: beverages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.beverages VALUES (104, 'Tea', 5, 116);
INSERT INTO public.beverages VALUES (106, 'Water', 2.5, 119);
INSERT INTO public.beverages VALUES (107, 'Water', 2.5, 120);
INSERT INTO public.beverages VALUES (108, 'Milkshake', 28, 121);
INSERT INTO public.beverages VALUES (109, 'Water', 2.5, 122);
INSERT INTO public.beverages VALUES (112, 'Ice Tea', 17, 125);
INSERT INTO public.beverages VALUES (115, 'Milkshake', 28, 128);
INSERT INTO public.beverages VALUES (116, 'Ice Tea', 17, 129);
INSERT INTO public.beverages VALUES (99, 'Milkshake', 28, 111);


--
-- Data for Name: cashier; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cashier VALUES (1);
INSERT INTO public.cashier VALUES (6);


--
-- Data for Name: checkout; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: courier; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.courier VALUES (3);
INSERT INTO public.courier VALUES (8);


--
-- Data for Name: deletedOrders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."deletedOrders" VALUES (3, 108, 2, 1, NULL, '2022-12-22 18:28:35.9554');
INSERT INTO public."deletedOrders" VALUES (4, 115, 7, 0, 'adadad     adadadad           ', '2022-12-23 11:44:46.443504');
INSERT INTO public."deletedOrders" VALUES (5, 114, 6, 0, '        adadad     adadadad           ', '2022-12-23 11:44:49.38106');
INSERT INTO public."deletedOrders" VALUES (6, 113, 3, 5, NULL, '2022-12-23 11:44:52.305103');
INSERT INTO public."deletedOrders" VALUES (7, 112, 6, 0, 'adandjad adadjhad', '2022-12-23 11:44:55.212852');
INSERT INTO public."deletedOrders" VALUES (8, 95, 2, 4, NULL, '2022-12-23 18:26:07.591417');
INSERT INTO public."deletedOrders" VALUES (9, 118, 3, 3, NULL, '2022-12-23 18:28:11.816834');
INSERT INTO public."deletedOrders" VALUES (10, 117, 2, 5, NULL, '2022-12-27 10:14:23.051754');
INSERT INTO public."deletedOrders" VALUES (11, 96, 2, 5, NULL, '2022-12-27 10:20:53.493184');
INSERT INTO public."deletedOrders" VALUES (12, 124, 6, 3, NULL, '2022-12-27 10:21:03.281673');
INSERT INTO public."deletedOrders" VALUES (13, 127, 7, 3, NULL, '2022-12-27 11:28:54.650083');
INSERT INTO public."deletedOrders" VALUES (14, 126, 2, 1, NULL, '2022-12-29 16:22:34.446197');
INSERT INTO public."deletedOrders" VALUES (15, 123, 3, 4, NULL, '2022-12-29 16:22:39.073626');


--
-- Data for Name: foodlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.foodlist VALUES (1, 'Steak', 95);
INSERT INTO public.foodlist VALUES (5, 'Rice', 10);
INSERT INTO public.foodlist VALUES (8, 'Sandwich', 30);
INSERT INTO public.foodlist VALUES (4, 'Salad', 35);
INSERT INTO public.foodlist VALUES (3, 'Pizza', 85);
INSERT INTO public.foodlist VALUES (2, 'Hamburger', 65);
INSERT INTO public.foodlist VALUES (7, 'Pasta', 29);
INSERT INTO public.foodlist VALUES (6, 'French Fries', 27);


--
-- Data for Name: foodlistpricechanges; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.foodlistpricechanges VALUES (1, 2, 5, 10, '2022-12-21 15:02:21.697961');
INSERT INTO public.foodlistpricechanges VALUES (2, 2, 10, 5, '2022-12-21 15:02:56.880265');
INSERT INTO public.foodlistpricechanges VALUES (3, 7, 40, 35, '2022-12-23 18:24:04.922459');
INSERT INTO public.foodlistpricechanges VALUES (4, 8, 25, 30, '2022-12-23 18:24:16.995536');
INSERT INTO public.foodlistpricechanges VALUES (5, 4, 20, 35, '2022-12-23 18:24:38.415378');
INSERT INTO public.foodlistpricechanges VALUES (6, 2, 5, 6.5, '2022-12-27 10:14:35.484167');
INSERT INTO public.foodlistpricechanges VALUES (7, 6, 17, 3, '2022-12-27 10:32:10.229283');
INSERT INTO public.foodlistpricechanges VALUES (8, 2, 6.5, 65, '2022-12-27 10:51:06.123406');
INSERT INTO public.foodlistpricechanges VALUES (9, 7, 35, 29, '2022-12-27 11:03:46.072375');
INSERT INTO public.foodlistpricechanges VALUES (10, 6, 3, 27, '2022-12-27 21:58:18.418966');


--
-- Data for Name: foods; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.foods VALUES (94, 'Rice', 10, 111);
INSERT INTO public.foods VALUES (99, 'Steak', 95, 116);
INSERT INTO public.foods VALUES (102, 'Spaghetti', 17, 119);
INSERT INTO public.foods VALUES (103, 'Spaghetti', 17, 120);
INSERT INTO public.foods VALUES (104, 'Spaghetti', 17, 121);
INSERT INTO public.foods VALUES (105, 'Spaghetti', 17, 122);
INSERT INTO public.foods VALUES (108, 'Steak', 95, 125);
INSERT INTO public.foods VALUES (111, 'Sandwich', 30, 128);
INSERT INTO public.foods VALUES (112, 'Sandwich', 30, 129);
INSERT INTO public.foods VALUES (88, 'Fish', 75, 105);


--
-- Data for Name: kitchen; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."order" VALUES (105, NULL, 75, 7, 4);
INSERT INTO public."order" VALUES (111, 'İstanbul,Türkiye', 38, 3, 0);
INSERT INTO public."order" VALUES (116, NULL, 100, 2, 5);
INSERT INTO public."order" VALUES (119, NULL, 19.5, 6, 1);
INSERT INTO public."order" VALUES (120, NULL, 19.5, 7, 1);
INSERT INTO public."order" VALUES (121, NULL, 45, 6, 1);
INSERT INTO public."order" VALUES (122, NULL, 19.5, 2, 1);
INSERT INTO public."order" VALUES (125, 'serdivan home', 112, 3, 0);
INSERT INTO public."order" VALUES (128, NULL, 58, 6, 1);
INSERT INTO public."order" VALUES (129, NULL, 47, 2, 3);


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.staff VALUES (1, 'cashier', 'Ali', '05355353535');
INSERT INTO public.staff VALUES (2, 'waiter', 'Ayşe', '05454554545');
INSERT INTO public.staff VALUES (3, 'courier', 'Veli', '05552324567');
INSERT INTO public.staff VALUES (6, 'cashier', 'Yiğit', '05357898723');
INSERT INTO public.staff VALUES (7, 'waiter', 'Ömer', '05432345677');
INSERT INTO public.staff VALUES (8, 'courier', 'Burak', '05342314435');


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tables VALUES (1);
INSERT INTO public.tables VALUES (2);
INSERT INTO public.tables VALUES (3);
INSERT INTO public.tables VALUES (4);
INSERT INTO public.tables VALUES (5);
INSERT INTO public.tables VALUES (6);
INSERT INTO public.tables VALUES (7);
INSERT INTO public.tables VALUES (8);
INSERT INTO public.tables VALUES (0);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" VALUES (1, 'burak', 'b');
INSERT INTO public."user" VALUES (2, 'yiğit', 'y');
INSERT INTO public."user" VALUES (3, 'ömer', 'ö');


--
-- Data for Name: waiter; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.waiter VALUES (2);
INSERT INTO public.waiter VALUES (7);


--
-- Name: beveragelist_beverageid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beveragelist_beverageid_seq', 7, true);


--
-- Name: beveragelistpricechanges_beveragelistrecordno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beveragelistpricechanges_beveragelistrecordno_seq', 5, true);


--
-- Name: beverages_beverageid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beverages_beverageid_seq', 116, true);


--
-- Name: deletedOrders_deletedOrdersId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."deletedOrders_deletedOrdersId_seq"', 15, true);


--
-- Name: foodlist_foodid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.foodlist_foodid_seq', 8, true);


--
-- Name: foodlistpricechanges_foodlistrecordno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.foodlistpricechanges_foodlistrecordno_seq', 10, true);


--
-- Name: foods_foodid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.foods_foodid_seq', 112, true);


--
-- Name: order_orderid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_orderid_seq', 129, true);


--
-- Name: staff_staffid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_staffid_seq', 8, true);


--
-- Name: user_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_userid_seq', 3, true);


--
-- Name: foodlistpricechanges PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foodlistpricechanges
    ADD CONSTRAINT "PK" PRIMARY KEY (foodlistrecordno);


--
-- Name: beveragelist beveragelistpk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beveragelist
    ADD CONSTRAINT beveragelistpk PRIMARY KEY (beverageid);


--
-- Name: beveragelistpricechanges beveragelistpricechangespk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beveragelistpricechanges
    ADD CONSTRAINT beveragelistpricechangespk PRIMARY KEY (beveragelistrecordno);


--
-- Name: beverages beveragespk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beverages
    ADD CONSTRAINT beveragespk PRIMARY KEY (beverageid);


--
-- Name: cashier cashierpk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cashier
    ADD CONSTRAINT cashierpk PRIMARY KEY (staffid);


--
-- Name: checkout checkoutpk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkoutpk PRIMARY KEY (sectionid);


--
-- Name: courier courierpk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courier
    ADD CONSTRAINT courierpk PRIMARY KEY (staffid);


--
-- Name: deletedOrders deletedOrdersPk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."deletedOrders"
    ADD CONSTRAINT "deletedOrdersPk" PRIMARY KEY ("deletedOrdersId");


--
-- Name: foodlist foodlistpk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foodlist
    ADD CONSTRAINT foodlistpk PRIMARY KEY (foodid);


--
-- Name: foods foodspk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foods
    ADD CONSTRAINT foodspk PRIMARY KEY (foodid);


--
-- Name: kitchen kitchenpk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitchen
    ADD CONSTRAINT kitchenpk PRIMARY KEY (sectionid);


--
-- Name: order orderpk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT orderpk PRIMARY KEY (orderid);


--
-- Name: staff staffpk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staffpk PRIMARY KEY (staffid);


--
-- Name: tables tablespk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tablespk PRIMARY KEY (tableid);


--
-- Name: beveragelist unique_beveragelist_beverageid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beveragelist
    ADD CONSTRAINT unique_beveragelist_beverageid UNIQUE (beverageid);


--
-- Name: foodlist unique_foodlist_foodid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foodlist
    ADD CONSTRAINT unique_foodlist_foodid UNIQUE (foodid);


--
-- Name: tables unique_tables_tableid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT unique_tables_tableid UNIQUE (tableid);


--
-- Name: user userpk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT userpk PRIMARY KEY (userid);


--
-- Name: waiter waiterpk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waiter
    ADD CONSTRAINT waiterpk PRIMARY KEY (staffid);


--
-- Name: beveragelist beveragelistpricechangestrigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER beveragelistpricechangestrigger BEFORE UPDATE ON public.beveragelist FOR EACH ROW EXECUTE FUNCTION public.beveragelistpricechanges();


--
-- Name: order deletedOrdersTrigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "deletedOrdersTrigger" BEFORE DELETE ON public."order" FOR EACH ROW EXECUTE FUNCTION public."deletedOrdersFunc"();


--
-- Name: foodlist foodlistpricechangestrigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER foodlistpricechangestrigger BEFORE UPDATE ON public.foodlist FOR EACH ROW EXECUTE FUNCTION public.foodlistpricechanges();


--
-- Name: order trimSpaceTrigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "trimSpaceTrigger" BEFORE INSERT ON public."order" FOR EACH ROW EXECUTE FUNCTION public."trimAddress"();


--
-- Name: beverages beveragesfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beverages
    ADD CONSTRAINT beveragesfk FOREIGN KEY (orderid) REFERENCES public."order"(orderid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cashier cashierfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cashier
    ADD CONSTRAINT cashierfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: checkout checkoutfk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkoutfk2 FOREIGN KEY (cashierid) REFERENCES public.cashier(staffid);


--
-- Name: checkout checkoutfk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkoutfk3 FOREIGN KEY (orderid) REFERENCES public."order"(orderid);


--
-- Name: courier courierfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courier
    ADD CONSTRAINT courierfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: foods foodsdk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foods
    ADD CONSTRAINT foodsdk FOREIGN KEY (orderid) REFERENCES public."order"(orderid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kitchen kitchenfk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitchen
    ADD CONSTRAINT kitchenfk2 FOREIGN KEY (orderid) REFERENCES public."order"(orderid);


--
-- Name: order orderfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT orderfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid);


--
-- Name: order tablefk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT tablefk FOREIGN KEY (tableid) REFERENCES public.tables(tableid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: waiter waiterfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waiter
    ADD CONSTRAINT waiterfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

