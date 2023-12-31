toc.dat                                                                                             0000600 0004000 0002000 00000016615 14512013731 0014445 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       ;            	    {           kineteco    16.0    16.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         
           1262    16416    kineteco    DATABASE     {   CREATE DATABASE kineteco WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Polish_Poland.1250';
    DROP DATABASE kineteco;
                postgres    false                     2615    16418    human_resources    SCHEMA        CREATE SCHEMA human_resources;
    DROP SCHEMA human_resources;
                postgres    false                     2615    16417    manufacturing    SCHEMA        CREATE SCHEMA manufacturing;
    DROP SCHEMA manufacturing;
                postgres    false         �            1259    16439 
   department    TABLE     �   CREATE TABLE human_resources.department (
    department_id integer NOT NULL,
    department_name character varying(50) NOT NULL,
    building character varying(20) NOT NULL
);
 '   DROP TABLE human_resources.department;
       human_resources         heap    postgres    false    7         �            1259    16434 	   employees    TABLE     �   CREATE TABLE human_resources.employees (
    employee_id integer NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    hire_date date,
    department_id integer DEFAULT 800 NOT NULL
);
 &   DROP TABLE human_resources.employees;
       human_resources         heap    postgres    false    7         �            1259    16424 
   categories    TABLE     (  CREATE TABLE manufacturing.categories (
    category_id integer NOT NULL,
    category_name character varying(50) NOT NULL,
    market character varying(20) NOT NULL,
    CONSTRAINT categories_market_check CHECK ((((market)::text = 'domestic'::text) OR ((market)::text = 'industrial'::text)))
);
 %   DROP TABLE manufacturing.categories;
       manufacturing         heap    postgres    false    6         �            1259    16419    products    TABLE     �   CREATE TABLE manufacturing.products (
    product_id character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    power integer,
    manufacturing_cost numeric(10,2),
    category_id integer DEFAULT 4
);
 #   DROP TABLE manufacturing.products;
       manufacturing         heap    postgres    false    6         �            1259    16449    products_details    VIEW     �   CREATE VIEW manufacturing.products_details AS
 SELECT product_id,
    name,
    power,
    manufacturing_cost,
    category_id
   FROM manufacturing.products;
 *   DROP VIEW manufacturing.products_details;
       manufacturing          postgres    false    217    217    217    217    217    6                   0    16439 
   department 
   TABLE DATA           W   COPY human_resources.department (department_id, department_name, building) FROM stdin;
    human_resources          postgres    false    220       4868.dat           0    16434 	   employees 
   TABLE DATA           j   COPY human_resources.employees (employee_id, first_name, last_name, hire_date, department_id) FROM stdin;
    human_resources          postgres    false    219       4867.dat           0    16424 
   categories 
   TABLE DATA           O   COPY manufacturing.categories (category_id, category_name, market) FROM stdin;
    manufacturing          postgres    false    218       4866.dat           0    16419    products 
   TABLE DATA           c   COPY manufacturing.products (product_id, name, power, manufacturing_cost, category_id) FROM stdin;
    manufacturing          postgres    false    217       4865.dat n           2606    16443    department department_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY human_resources.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_id);
 M   ALTER TABLE ONLY human_resources.department DROP CONSTRAINT department_pkey;
       human_resources            postgres    false    220         d           2606    16458 #   employees employees_hire_date_check    CHECK CONSTRAINT     �   ALTER TABLE human_resources.employees
    ADD CONSTRAINT employees_hire_date_check CHECK ((hire_date > '2023-01-01'::date)) NOT VALID;
 Q   ALTER TABLE human_resources.employees DROP CONSTRAINT employees_hire_date_check;
       human_resources          postgres    false    219    219         l           2606    16438    employees employees_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY human_resources.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 K   ALTER TABLE ONLY human_resources.employees DROP CONSTRAINT employees_pkey;
       human_resources            postgres    false    219         i           2606    16428    categories categories_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY manufacturing.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 K   ALTER TABLE ONLY manufacturing.categories DROP CONSTRAINT categories_pkey;
       manufacturing            postgres    false    218         g           2606    16423    products products_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY manufacturing.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 G   ALTER TABLE ONLY manufacturing.products DROP CONSTRAINT products_pkey;
       manufacturing            postgres    false    217         j           1259    16456    employees_last_name_idx    INDEX     |   CREATE INDEX employees_last_name_idx ON human_resources.employees USING btree (last_name) WITH (deduplicate_items='false');
 4   DROP INDEX human_resources.employees_last_name_idx;
       human_resources            postgres    false    219         e           1259    16453    products_name_idx    INDEX     m   CREATE INDEX products_name_idx ON manufacturing.products USING btree (name) WITH (deduplicate_items='true');
 ,   DROP INDEX manufacturing.products_name_idx;
       manufacturing            postgres    false    217         p           2606    16444 &   employees employees_department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY human_resources.employees
    ADD CONSTRAINT employees_department_id_fkey FOREIGN KEY (department_id) REFERENCES human_resources.department(department_id) ON UPDATE CASCADE NOT VALID;
 Y   ALTER TABLE ONLY human_resources.employees DROP CONSTRAINT employees_department_id_fkey;
       human_resources          postgres    false    220    4718    219         o           2606    16429 "   products products_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY manufacturing.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES manufacturing.categories(category_id) ON UPDATE CASCADE;
 S   ALTER TABLE ONLY manufacturing.products DROP CONSTRAINT products_category_id_fkey;
       manufacturing          postgres    false    4713    217    218                                                                                                                           4868.dat                                                                                            0000600 0004000 0002000 00000000340 14512013731 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        100	Account Management	Main
200	Environmental Compliance	Taft
300	Facilities/Engineering	Watson
400	Human Resources	Main
500	Manufacturing	South
600	Manufacturing Admin	South
700	Quality Control	South
800	Training	Main
\.


                                                                                                                                                                                                                                                                                                4867.dat                                                                                            0000600 0004000 0002000 00000002174 14512013731 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	Suzanne	Farmer	2014-09-18	300
5	Leonard	Grant	2009-12-05	300
20	Elaine	Jefferson	2020-03-02	500
27	Raquel	Booth	2010-10-24	600
28	Eric	Jackson	2020-06-30	800
36	Chris	Preston	2020-03-27	400
44	Diane	Andrews	2017-06-07	500
58	Jessica	Chapman	2020-04-10	800
59	Michael	Bowman	2018-09-03	300
61	Mark	Moses	2017-10-13	700
67	Leslie	Doyle	2014-12-24	400
77	Allan	Carter	2010-12-18	700
84	Michael	Kirby	2018-11-19	400
96	Christopher	Soto	2019-09-24	500
103	Deborah	Lindsey	2013-05-25	200
111	Teason	Anderson	2018-01-30	800
112	Douglas	Howell	2009-08-06	100
114	Bryant	Vargas	2019-08-21	100
139	Edward	Hayes	2020-03-11	100
157	Al	Serrano	2019-11-01	100
168	John	Cameron	2017-08-28	600
190	Jessica	Wilson	2019-01-21	600
198	Hunyen	Curry	2009-10-30	200
205	Michael	Vasquez	2018-06-06	100
213	Brian	Morton	2019-06-18	700
214	Gary	Jennings	2020-04-07	500
222	Danielle	Atkinson	2018-07-27	200
234	Gary	Long	2019-01-12	500
251	Michael	Schmidt	2010-07-28	500
259	George	Horn	2020-02-06	400
275	Shannon	Gilbert	2011-07-03	800
287	Dennis	Freeman	2019-08-20	800
290	Robert	French	2013-02-06	100
303	Cynthia	Harper	2019-09-20	400
313	Ellen	Fox	2010-01-20	400
\.


                                                                                                                                                                                                                                                                                                                                                                                                    4866.dat                                                                                            0000600 0004000 0002000 00000000207 14512013731 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	grid tie inverters	industrial
5	wind harvesters	industrial
4	solar panels	domestic
1	batteries	industrial
3	lightbulbs	domestic
\.


                                                                                                                                                                                                                                                                                                                                                                                         4865.dat                                                                                            0000600 0004000 0002000 00000002452 14512013731 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        KES	K-ECO Mini	5	16.25	5
KE48Li	K-Eco 48 volt 	\N	3500.00	1
KE001	K-Eco phone charger	3	1.23	4
KEAA12	K-Eco AA NiMH rechargeable batteries (12-pack)	\N	5.00	1
KEAAA06	K-Eco AAA NiMH rechargeable batteries (6-pack)	\N	2.20	1
KEAAA12	K-Eco AAA NiMH rechargeable batteries (12-pack)	\N	4.40	1
KE12Li	K-Eco 12-volt Lithium-ion solar battery	\N	2100.00	1
KE18Li	K-Eco 18-volt Lithium-ion solar battery	\N	2300.00	1
KE36Li	K-Eco 36-volt Lithium-ion solar battery	\N	2800.00	1
KEBR5	K-Eco Breeze Mini	5	31.45	5
KEBL100	K-Eco Blast 100	100	175.00	5
KEBL200	K-Eco Blast 200	200	230.00	5
KEBL400	K-Eco Blast 400	400	455.00	5
KEBL400X	K-Eco Blast 400x	400	650.00	5
KEBL600	K-Eco Blast 600	600	585.00	5
KEBL800	K-Eco Blast 800	800	685.00	5
KEBL1200	K-Eco Blast 1200	1200	1050.00	5
KE9W	K-Eco Energy Bulbs 9W	9	0.55	3
KE9W04	K-Eco Energy Bulbs 9W (4-pack)	9	2.20	3
KE9W08	K-Eco Energy Bulbs 9W (8-pack)	9	4.40	3
KE13W	K-Eco Energy Bulbs 13W	13	0.75	3
KE13W04	K-Eco Energy Bulbs 13W (4-pack)	13	3.00	3
KE13W08	K-Eco Energy Bulbs 13W (8-pack)	13	6.00	3
KE20W	K-Eco Energy Bulbs 20W	20	1.20	3
KE20W04	K-Eco Energy Bulbs 20W (4-pack)	20	4.90	3
KE20W08	K-Eco Energy Bulbs 20W (8-pack)	20	9.80	3
KE23W	K-Eco Energy Bulbs 23W	23	1.45	3
KE23W04	K-Eco Energy Bulbs 23W (4-pack)	23	5.80	3
KE23W08	K-Eco Energy Bulbs 23W (8-pack)	23	11.60	3
\.


                                                                                                                                                                                                                      restore.sql                                                                                         0000600 0004000 0002000 00000015133 14512013731 0015364 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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

DROP DATABASE kineteco;
--
-- Name: kineteco; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE kineteco WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Polish_Poland.1250';


ALTER DATABASE kineteco OWNER TO postgres;

\connect kineteco

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
-- Name: human_resources; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA human_resources;


ALTER SCHEMA human_resources OWNER TO postgres;

--
-- Name: manufacturing; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA manufacturing;


ALTER SCHEMA manufacturing OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: department; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.department (
    department_id integer NOT NULL,
    department_name character varying(50) NOT NULL,
    building character varying(20) NOT NULL
);


ALTER TABLE human_resources.department OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.employees (
    employee_id integer NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    hire_date date,
    department_id integer DEFAULT 800 NOT NULL
);


ALTER TABLE human_resources.employees OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: manufacturing; Owner: postgres
--

CREATE TABLE manufacturing.categories (
    category_id integer NOT NULL,
    category_name character varying(50) NOT NULL,
    market character varying(20) NOT NULL,
    CONSTRAINT categories_market_check CHECK ((((market)::text = 'domestic'::text) OR ((market)::text = 'industrial'::text)))
);


ALTER TABLE manufacturing.categories OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: manufacturing; Owner: postgres
--

CREATE TABLE manufacturing.products (
    product_id character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    power integer,
    manufacturing_cost numeric(10,2),
    category_id integer DEFAULT 4
);


ALTER TABLE manufacturing.products OWNER TO postgres;

--
-- Name: products_details; Type: VIEW; Schema: manufacturing; Owner: postgres
--

CREATE VIEW manufacturing.products_details AS
 SELECT product_id,
    name,
    power,
    manufacturing_cost,
    category_id
   FROM manufacturing.products;


ALTER VIEW manufacturing.products_details OWNER TO postgres;

--
-- Data for Name: department; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.department (department_id, department_name, building) FROM stdin;
\.
COPY human_resources.department (department_id, department_name, building) FROM '$$PATH$$/4868.dat';

--
-- Data for Name: employees; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.employees (employee_id, first_name, last_name, hire_date, department_id) FROM stdin;
\.
COPY human_resources.employees (employee_id, first_name, last_name, hire_date, department_id) FROM '$$PATH$$/4867.dat';

--
-- Data for Name: categories; Type: TABLE DATA; Schema: manufacturing; Owner: postgres
--

COPY manufacturing.categories (category_id, category_name, market) FROM stdin;
\.
COPY manufacturing.categories (category_id, category_name, market) FROM '$$PATH$$/4866.dat';

--
-- Data for Name: products; Type: TABLE DATA; Schema: manufacturing; Owner: postgres
--

COPY manufacturing.products (product_id, name, power, manufacturing_cost, category_id) FROM stdin;
\.
COPY manufacturing.products (product_id, name, power, manufacturing_cost, category_id) FROM '$$PATH$$/4865.dat';

--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_id);


--
-- Name: employees employees_hire_date_check; Type: CHECK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE human_resources.employees
    ADD CONSTRAINT employees_hire_date_check CHECK ((hire_date > '2023-01-01'::date)) NOT VALID;


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: manufacturing; Owner: postgres
--

ALTER TABLE ONLY manufacturing.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: manufacturing; Owner: postgres
--

ALTER TABLE ONLY manufacturing.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: employees_last_name_idx; Type: INDEX; Schema: human_resources; Owner: postgres
--

CREATE INDEX employees_last_name_idx ON human_resources.employees USING btree (last_name) WITH (deduplicate_items='false');


--
-- Name: products_name_idx; Type: INDEX; Schema: manufacturing; Owner: postgres
--

CREATE INDEX products_name_idx ON manufacturing.products USING btree (name) WITH (deduplicate_items='true');


--
-- Name: employees employees_department_id_fkey; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.employees
    ADD CONSTRAINT employees_department_id_fkey FOREIGN KEY (department_id) REFERENCES human_resources.department(department_id) ON UPDATE CASCADE NOT VALID;


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: manufacturing; Owner: postgres
--

ALTER TABLE ONLY manufacturing.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES manufacturing.categories(category_id) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     