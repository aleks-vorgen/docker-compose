--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-09-27 13:56:29

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

DROP SCHEMA IF EXISTS public;

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;


COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;


CREATE TABLE public.lab3_ko_categories (
    id integer NOT NULL,
    parent_id integer,
    title character varying(50) NOT NULL
);


ALTER TABLE public.lab3_ko_categories OWNER TO postgres;


CREATE SEQUENCE public.lab3_ko_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lab3_ko_categories_id_seq OWNER TO postgres;


ALTER SEQUENCE public.lab3_ko_categories_id_seq OWNED BY public.lab3_ko_categories.id;



CREATE TABLE public.lab3_ko_comments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(50) DEFAULT NULL::character varying,
    comment character varying(255) NOT NULL,
    rating smallint NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.lab3_ko_comments OWNER TO postgres;


CREATE SEQUENCE public.lab3_ko_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lab3_ko_comments_id_seq OWNER TO postgres;


ALTER SEQUENCE public.lab3_ko_comments_id_seq OWNED BY public.lab3_ko_comments.id;



CREATE TABLE public.lab3_ko_orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.lab3_ko_orders OWNER TO postgres;


CREATE SEQUENCE public.lab3_ko_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lab3_ko_orders_id_seq OWNER TO postgres;


ALTER SEQUENCE public.lab3_ko_orders_id_seq OWNED BY public.lab3_ko_orders.id;



CREATE TABLE public.lab3_ko_products (
    id integer NOT NULL,
    category_id integer NOT NULL,
    title character varying(50) NOT NULL,
    price numeric(11,2) NOT NULL,
    amount integer NOT NULL,
    description character varying(255) NOT NULL,
    img_path character varying(255) NOT NULL
);


ALTER TABLE public.lab3_ko_products OWNER TO postgres;


CREATE SEQUENCE public.lab3_ko_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lab3_ko_products_id_seq OWNER TO postgres;


ALTER SEQUENCE public.lab3_ko_products_id_seq OWNED BY public.lab3_ko_products.id;



CREATE TABLE public.lab3_ko_users (
    id integer NOT NULL,
    username character varying(20) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    permissions character varying(10) DEFAULT 'ROLE_USER'::character varying NOT NULL,
    active boolean DEFAULT false NOT NULL
);


ALTER TABLE public.lab3_ko_users OWNER TO postgres;


CREATE SEQUENCE public.lab3_ko_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lab3_ko_users_id_seq OWNER TO postgres;


ALTER SEQUENCE public.lab3_ko_users_id_seq OWNED BY public.lab3_ko_users.id;



ALTER TABLE ONLY public.lab3_ko_categories ALTER COLUMN id SET DEFAULT nextval('public.lab3_ko_categories_id_seq'::regclass);



ALTER TABLE ONLY public.lab3_ko_comments ALTER COLUMN id SET DEFAULT nextval('public.lab3_ko_comments_id_seq'::regclass);



ALTER TABLE ONLY public.lab3_ko_orders ALTER COLUMN id SET DEFAULT nextval('public.lab3_ko_orders_id_seq'::regclass);



ALTER TABLE ONLY public.lab3_ko_products ALTER COLUMN id SET DEFAULT nextval('public.lab3_ko_products_id_seq'::regclass);



ALTER TABLE ONLY public.lab3_ko_users ALTER COLUMN id SET DEFAULT nextval('public.lab3_ko_users_id_seq'::regclass);



INSERT INTO public.lab3_ko_categories VALUES (1, NULL, 'Фрукты');
INSERT INTO public.lab3_ko_categories VALUES (2, NULL, 'Овощи');
INSERT INTO public.lab3_ko_categories VALUES (3, 1, 'Яблоки');
INSERT INTO public.lab3_ko_categories VALUES (4, 1, 'Апельсины');
INSERT INTO public.lab3_ko_categories VALUES (5, 2, 'Помидоры');
INSERT INTO public.lab3_ko_categories VALUES (6, 2, 'Огурцы');



INSERT INTO public.lab3_ko_comments VALUES (1, 1, 'Понравились', 'Рекомендую', 5, 1);



INSERT INTO public.lab3_ko_orders VALUES (1, 1, 1);
INSERT INTO public.lab3_ko_orders VALUES (2, 1, 2);
INSERT INTO public.lab3_ko_orders VALUES (3, 1, 4);
INSERT INTO public.lab3_ko_orders VALUES (4, 1, 1);
INSERT INTO public.lab3_ko_orders VALUES (5, 1, 3);
INSERT INTO public.lab3_ko_orders VALUES (9, 1, 2);
INSERT INTO public.lab3_ko_orders VALUES (10, 1, 3);
INSERT INTO public.lab3_ko_orders VALUES (11, 1, 1);
INSERT INTO public.lab3_ko_orders VALUES (12, 10, 1);
INSERT INTO public.lab3_ko_orders VALUES (13, 10, 3);
INSERT INTO public.lab3_ko_orders VALUES (14, 1, 1);
INSERT INTO public.lab3_ko_orders VALUES (15, 1, 4);



INSERT INTO public.lab3_ko_products VALUES (2, 4, 'Апельсины такие', 40.00, 45, 'Вкусные апельсины', 'https://i.imgur.com/eMYWTYk.png');
INSERT INTO public.lab3_ko_products VALUES (3, 4, 'Апельсины сякие', 45.00, 40, 'Очень вкусные апельсины', 'https://i.imgur.com/NEAqPf2.png');
INSERT INTO public.lab3_ko_products VALUES (4, 3, 'Яблоки такие', 30.00, 20, 'Вкусные яблочки', 'https://i.imgur.com/WiZH5rN.png');
INSERT INTO public.lab3_ko_products VALUES (1, 3, 'Яблоки сякие', 35.00, 10, 'Очень вкусные яблочки', 'https://i.imgur.com/ETHzCHy.png');



INSERT INTO public.lab3_ko_users VALUES (1, 'ALexus', 'test@gmail.com', 'test12', 'ROLE_ADMIN', true);
INSERT INTO public.lab3_ko_users VALUES (10, 'test12', '123@gm.com', 'test12', 'ROLE_USER', true);



SELECT pg_catalog.setval('public.lab3_ko_categories_id_seq', 6, true);



SELECT pg_catalog.setval('public.lab3_ko_comments_id_seq', 2, true);



SELECT pg_catalog.setval('public.lab3_ko_orders_id_seq', 15, true);



SELECT pg_catalog.setval('public.lab3_ko_products_id_seq', 4, true);



SELECT pg_catalog.setval('public.lab3_ko_users_id_seq', 10, true);



ALTER TABLE ONLY public.lab3_ko_categories
    ADD CONSTRAINT lab3_ko_categories_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.lab3_ko_categories
    ADD CONSTRAINT lab3_ko_categories_title_unique UNIQUE (title);



ALTER TABLE ONLY public.lab3_ko_comments
    ADD CONSTRAINT lab3_ko_comments_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.lab3_ko_orders
    ADD CONSTRAINT lab3_ko_order_lists_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.lab3_ko_products
    ADD CONSTRAINT lab3_ko_products_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.lab3_ko_users
    ADD CONSTRAINT lab3_ko_users_email_unique UNIQUE (email);



ALTER TABLE ONLY public.lab3_ko_users
    ADD CONSTRAINT lab3_ko_users_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.lab3_ko_users
    ADD CONSTRAINT lab3_ko_users_username_unique UNIQUE (username);



ALTER TABLE ONLY public.lab3_ko_categories
    ADD CONSTRAINT lab3_ko_categories_parent_category_id_fkey FOREIGN KEY (parent_id) REFERENCES public.lab3_ko_categories(id);



ALTER TABLE ONLY public.lab3_ko_comments
    ADD CONSTRAINT lab3_ko_comments_fk FOREIGN KEY (product_id) REFERENCES public.lab3_ko_products(id);



ALTER TABLE ONLY public.lab3_ko_comments
    ADD CONSTRAINT lab3_ko_comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.lab3_ko_users(id);



ALTER TABLE ONLY public.lab3_ko_orders
    ADD CONSTRAINT lab3_ko_order_lists_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.lab3_ko_products(id);



ALTER TABLE ONLY public.lab3_ko_orders
    ADD CONSTRAINT lab3_ko_order_lists_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.lab3_ko_users(id);


ALTER TABLE ONLY public.lab3_ko_products
    ADD CONSTRAINT lab3_ko_products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.lab3_ko_categories(id);
