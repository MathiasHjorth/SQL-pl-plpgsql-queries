toc.dat                                                                                             0000600 0004000 0002000 00000026470 14435651616 0014463 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       6                    {           bookstoreBackedUp    15.1    15.1 +    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         +           1262    16542    bookstoreBackedUp    DATABASE     �   CREATE DATABASE "bookstoreBackedUp" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Danish_Denmark.1252';
 #   DROP DATABASE "bookstoreBackedUp";
                postgres    false         ,           0    0    DATABASE "bookstoreBackedUp"    COMMENT     e   COMMENT ON DATABASE "bookstoreBackedUp" IS 'Samme som bookstore, bare en skabt via backup tar fil.';
                   postgres    false    3371                     2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false         -           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   postgres    false    5         .           0    0    SCHEMA public    ACL     Z   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO bookstore_users;
                   postgres    false    5         �            1259    16543 	   addresses    TABLE     �   CREATE TABLE public.addresses (
    shop_id integer NOT NULL,
    town character varying(50) NOT NULL,
    street_name character varying(35) NOT NULL,
    postal_code character(4),
    CONSTRAINT "numberInput" CHECK ((postal_code ~ '^[0-9]+$'::text))
);
    DROP TABLE public.addresses;
       public         heap    postgres    false    5         /           0    0    TABLE addresses    ACL     8   GRANT ALL ON TABLE public.addresses TO bookstore_user1;
          public          postgres    false    214         �            1259    16547    authors    TABLE     �   CREATE TABLE public.authors (
    author_id integer NOT NULL,
    first_name character varying(35) NOT NULL,
    last_name character varying(35) NOT NULL,
    date_of_birth date
);
    DROP TABLE public.authors;
       public         heap    postgres    false    5         0           0    0    TABLE authors    ACL     6   GRANT ALL ON TABLE public.authors TO bookstore_user1;
          public          postgres    false    215         �            1259    16550    book_authors    TABLE     c   CREATE TABLE public.book_authors (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);
     DROP TABLE public.book_authors;
       public         heap    postgres    false    5         1           0    0    TABLE book_authors    COMMENT     6   COMMENT ON TABLE public.book_authors IS 'Link-table';
          public          postgres    false    216         2           0    0    TABLE book_authors    ACL     ;   GRANT ALL ON TABLE public.book_authors TO bookstore_user1;
          public          postgres    false    216         �            1259    16553    books    TABLE     �   CREATE TABLE public.books (
    book_id integer NOT NULL,
    title character varying(50) NOT NULL,
    description text,
    publication_date date
);
    DROP TABLE public.books;
       public         heap    postgres    false    5         3           0    0    TABLE books    ACL     4   GRANT ALL ON TABLE public.books TO bookstore_user1;
          public          postgres    false    217         �            1259    16558    authors_with_books    VIEW     �  CREATE VIEW public.authors_with_books AS
 SELECT authors.first_name,
    authors.last_name,
    authors.date_of_birth,
    books.title,
    books.description,
    books.publication_date
   FROM ((public.authors
     JOIN public.book_authors ON ((authors.author_id = book_authors.author_id)))
     JOIN public.books ON ((books.book_id = book_authors.book_id)))
  ORDER BY books.title;
 %   DROP VIEW public.authors_with_books;
       public          postgres    false    216    215    215    215    216    217    217    217    217    215    5         4           0    0    TABLE authors_with_books    ACL     A   GRANT ALL ON TABLE public.authors_with_books TO bookstore_user1;
          public          postgres    false    218         �            1259    16562 
   shop_books    TABLE     _   CREATE TABLE public.shop_books (
    shop_id integer NOT NULL,
    book_id integer NOT NULL
);
    DROP TABLE public.shop_books;
       public         heap    postgres    false    5         5           0    0    TABLE shop_books    ACL     9   GRANT ALL ON TABLE public.shop_books TO bookstore_user1;
          public          postgres    false    219         �            1259    16565    shops    TABLE     e   CREATE TABLE public.shops (
    shop_id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.shops;
       public         heap    postgres    false    5         6           0    0    TABLE shops    ACL     4   GRANT ALL ON TABLE public.shops TO bookstore_user1;
          public          postgres    false    220                    0    16543 	   addresses 
   TABLE DATA           L   COPY public.addresses (shop_id, town, street_name, postal_code) FROM stdin;
    public          postgres    false    214       3360.dat !          0    16547    authors 
   TABLE DATA           R   COPY public.authors (author_id, first_name, last_name, date_of_birth) FROM stdin;
    public          postgres    false    215       3361.dat "          0    16550    book_authors 
   TABLE DATA           :   COPY public.book_authors (book_id, author_id) FROM stdin;
    public          postgres    false    216       3362.dat #          0    16553    books 
   TABLE DATA           N   COPY public.books (book_id, title, description, publication_date) FROM stdin;
    public          postgres    false    217       3363.dat $          0    16562 
   shop_books 
   TABLE DATA           6   COPY public.shop_books (shop_id, book_id) FROM stdin;
    public          postgres    false    219       3364.dat %          0    16565    shops 
   TABLE DATA           .   COPY public.shops (shop_id, name) FROM stdin;
    public          postgres    false    220       3365.dat �           2606    16569    addresses addresses_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (shop_id);
 B   ALTER TABLE ONLY public.addresses DROP CONSTRAINT addresses_pkey;
       public            postgres    false    214         �           2606    16571    authors authors_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public            postgres    false    215         �           2606    16573    book_authors book_authors_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT book_authors_pkey PRIMARY KEY (book_id, author_id);
 H   ALTER TABLE ONLY public.book_authors DROP CONSTRAINT book_authors_pkey;
       public            postgres    false    216    216         �           2606    16575    books books_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            postgres    false    217                    2606    16576 #   addresses numberValueBelowThreshold    CHECK CONSTRAINT        ALTER TABLE public.addresses
    ADD CONSTRAINT "numberValueBelowThreshold" CHECK (((postal_code)::integer < 9990)) NOT VALID;
 J   ALTER TABLE public.addresses DROP CONSTRAINT "numberValueBelowThreshold";
       public          postgres    false    214    214         �           2606    16578    shop_books shop_books_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.shop_books
    ADD CONSTRAINT shop_books_pkey PRIMARY KEY (shop_id, book_id);
 D   ALTER TABLE ONLY public.shop_books DROP CONSTRAINT shop_books_pkey;
       public            postgres    false    219    219         �           2606    16580    shops shop_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shop_pkey PRIMARY KEY (shop_id);
 9   ALTER TABLE ONLY public.shops DROP CONSTRAINT shop_pkey;
       public            postgres    false    220         �           2606    16581    book_authors author_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT author_id FOREIGN KEY (author_id) REFERENCES public.authors(author_id) NOT VALID;
 @   ALTER TABLE ONLY public.book_authors DROP CONSTRAINT author_id;
       public          postgres    false    216    3203    215         �           2606    16586    book_authors book_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT book_id FOREIGN KEY (book_id) REFERENCES public.books(book_id) NOT VALID;
 >   ALTER TABLE ONLY public.book_authors DROP CONSTRAINT book_id;
       public          postgres    false    216    3207    217         �           2606    16591    shop_books book_id    FK CONSTRAINT     v   ALTER TABLE ONLY public.shop_books
    ADD CONSTRAINT book_id FOREIGN KEY (book_id) REFERENCES public.books(book_id);
 <   ALTER TABLE ONLY public.shop_books DROP CONSTRAINT book_id;
       public          postgres    false    219    3207    217         �           2606    16596    addresses shop_id    FK CONSTRAINT        ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT shop_id FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id) NOT VALID;
 ;   ALTER TABLE ONLY public.addresses DROP CONSTRAINT shop_id;
       public          postgres    false    214    3211    220         �           2606    16601    shop_books shop_id    FK CONSTRAINT     v   ALTER TABLE ONLY public.shop_books
    ADD CONSTRAINT shop_id FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id);
 <   ALTER TABLE ONLY public.shop_books DROP CONSTRAINT shop_id;
       public          postgres    false    220    219    3211         
           826    16606    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     e   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO bookstore_users;
          public          postgres    false    5                    826    16607    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO bookstore_users;
                   postgres    false                                                                                                                                                                                                                3360.dat                                                                                            0000600 0004000 0002000 00000000224 14435651616 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Odense	Vindegade 12	5000
2	Randers	Oldburgsgade 87	7200
3	Jels	Solgade 54	2300
4	Uggersly	Slukeftervej 42	5000
5	Tønder	Alfredallé 65	2140
\.


                                                                                                                                                                                                                                                                                                                                                                            3361.dat                                                                                            0000600 0004000 0002000 00000000174 14435651616 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Bridgette	Green	1900-10-10
3	Henning	Primdahl	1980-02-02
4	Dorte	Estridsen	1990-02-02
1	Ernest	Hemmingway	1900-12-04
\.


                                                                                                                                                                                                                                                                                                                                                                                                    3362.dat                                                                                            0000600 0004000 0002000 00000000051 14435651616 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1
2	1
1	2
3	2
4	2
6	3
5	3
8	4
7	4
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       3363.dat                                                                                            0000600 0004000 0002000 00000000645 14435651616 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Den gamle mand og havet	Klassiker fra Ernest Hemmingway	1920-10-10
2	Farvel våben	Klassiker fra Ernest Hemmingway	1929-10-10
3	Rundt om jorden på 1 dag	Rejsebog om verdenen	2001-04-04
5	Favre nye verden	Endnu en rejsebog	1940-02-02
6	Goddag i skuret	Eventyrbog	1949-02-02
7	Afrika	Geologibog	2010-02-02
8	10 ting du skal nå inden du bliver 30	Midtyverne gjort bedst	2015-02-02
4	Spis værre	Kokkebog	1975-04-05
\.


                                                                                           3364.dat                                                                                            0000600 0004000 0002000 00000000015 14435651616 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1
1	2
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   3365.dat                                                                                            0000600 0004000 0002000 00000000124 14435651616 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Bog og Idé
2	Bogklubben Randers
3	Læsehesten
4	Læs og byt
5	Din boghandel
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                            restore.sql                                                                                         0000600 0004000 0002000 00000022464 14435651616 0015407 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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

DROP DATABASE "bookstoreBackedUp";
--
-- Name: bookstoreBackedUp; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "bookstoreBackedUp" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Danish_Denmark.1252';


ALTER DATABASE "bookstoreBackedUp" OWNER TO postgres;

\connect "bookstoreBackedUp"

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
-- Name: DATABASE "bookstoreBackedUp"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "bookstoreBackedUp" IS 'Samme som bookstore, bare en skabt via backup tar fil.';


--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    shop_id integer NOT NULL,
    town character varying(50) NOT NULL,
    street_name character varying(35) NOT NULL,
    postal_code character(4),
    CONSTRAINT "numberInput" CHECK ((postal_code ~ '^[0-9]+$'::text))
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    author_id integer NOT NULL,
    first_name character varying(35) NOT NULL,
    last_name character varying(35) NOT NULL,
    date_of_birth date
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- Name: book_authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_authors (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.book_authors OWNER TO postgres;

--
-- Name: TABLE book_authors; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.book_authors IS 'Link-table';


--
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    book_id integer NOT NULL,
    title character varying(50) NOT NULL,
    description text,
    publication_date date
);


ALTER TABLE public.books OWNER TO postgres;

--
-- Name: authors_with_books; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.authors_with_books AS
 SELECT authors.first_name,
    authors.last_name,
    authors.date_of_birth,
    books.title,
    books.description,
    books.publication_date
   FROM ((public.authors
     JOIN public.book_authors ON ((authors.author_id = book_authors.author_id)))
     JOIN public.books ON ((books.book_id = book_authors.book_id)))
  ORDER BY books.title;


ALTER TABLE public.authors_with_books OWNER TO postgres;

--
-- Name: shop_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_books (
    shop_id integer NOT NULL,
    book_id integer NOT NULL
);


ALTER TABLE public.shop_books OWNER TO postgres;

--
-- Name: shops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shops (
    shop_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.shops OWNER TO postgres;

--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (shop_id, town, street_name, postal_code) FROM stdin;
\.
COPY public.addresses (shop_id, town, street_name, postal_code) FROM '$$PATH$$/3360.dat';

--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (author_id, first_name, last_name, date_of_birth) FROM stdin;
\.
COPY public.authors (author_id, first_name, last_name, date_of_birth) FROM '$$PATH$$/3361.dat';

--
-- Data for Name: book_authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_authors (book_id, author_id) FROM stdin;
\.
COPY public.book_authors (book_id, author_id) FROM '$$PATH$$/3362.dat';

--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (book_id, title, description, publication_date) FROM stdin;
\.
COPY public.books (book_id, title, description, publication_date) FROM '$$PATH$$/3363.dat';

--
-- Data for Name: shop_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_books (shop_id, book_id) FROM stdin;
\.
COPY public.shop_books (shop_id, book_id) FROM '$$PATH$$/3364.dat';

--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shops (shop_id, name) FROM stdin;
\.
COPY public.shops (shop_id, name) FROM '$$PATH$$/3365.dat';

--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (shop_id);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- Name: book_authors book_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT book_authors_pkey PRIMARY KEY (book_id, author_id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);


--
-- Name: addresses numberValueBelowThreshold; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.addresses
    ADD CONSTRAINT "numberValueBelowThreshold" CHECK (((postal_code)::integer < 9990)) NOT VALID;


--
-- Name: shop_books shop_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_books
    ADD CONSTRAINT shop_books_pkey PRIMARY KEY (shop_id, book_id);


--
-- Name: shops shop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shop_pkey PRIMARY KEY (shop_id);


--
-- Name: book_authors author_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT author_id FOREIGN KEY (author_id) REFERENCES public.authors(author_id) NOT VALID;


--
-- Name: book_authors book_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT book_id FOREIGN KEY (book_id) REFERENCES public.books(book_id) NOT VALID;


--
-- Name: shop_books book_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_books
    ADD CONSTRAINT book_id FOREIGN KEY (book_id) REFERENCES public.books(book_id);


--
-- Name: addresses shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT shop_id FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id) NOT VALID;


--
-- Name: shop_books shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_books
    ADD CONSTRAINT shop_id FOREIGN KEY (shop_id) REFERENCES public.shops(shop_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO bookstore_users;


--
-- Name: TABLE addresses; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.addresses TO bookstore_user1;


--
-- Name: TABLE authors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.authors TO bookstore_user1;


--
-- Name: TABLE book_authors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.book_authors TO bookstore_user1;


--
-- Name: TABLE books; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.books TO bookstore_user1;


--
-- Name: TABLE authors_with_books; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.authors_with_books TO bookstore_user1;


--
-- Name: TABLE shop_books; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.shop_books TO bookstore_user1;


--
-- Name: TABLE shops; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.shops TO bookstore_user1;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO bookstore_users;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO bookstore_users;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            