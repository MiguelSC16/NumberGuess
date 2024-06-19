--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 10000
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1718763204470', 2, 17);
INSERT INTO public.users VALUES ('user_1718763204471', 5, 30);
INSERT INTO public.users VALUES ('user_1718763091635', 2, 702);
INSERT INTO public.users VALUES ('user_1718763206728', 2, 294);
INSERT INTO public.users VALUES ('user_1718763091636', 5, 77);
INSERT INTO public.users VALUES ('user_1718763206729', 5, 451);
INSERT INTO public.users VALUES ('user_1718763099412', 2, 160);
INSERT INTO public.users VALUES ('user_1718763099413', 5, 160);
INSERT INTO public.users VALUES ('user_1718763135991', 2, 522);
INSERT INTO public.users VALUES ('user_1718763135992', 5, 144);
INSERT INTO public.users VALUES ('user_1718763146913', 2, 60);
INSERT INTO public.users VALUES ('user_1718763146914', 5, 30);
INSERT INTO public.users VALUES ('user_1718763171790', 2, 583);
INSERT INTO public.users VALUES ('user_1718763171791', 5, 2);
INSERT INTO public.users VALUES ('user_1718763196361', 2, 194);
INSERT INTO public.users VALUES ('user_1718763196362', 5, 90);
INSERT INTO public.users VALUES ('user_1718763199130', 2, 359);
INSERT INTO public.users VALUES ('user_1718763199131', 5, 10);
INSERT INTO public.users VALUES ('user_1718763201322', 2, 152);
INSERT INTO public.users VALUES ('user_1718763201323', 5, 275);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

