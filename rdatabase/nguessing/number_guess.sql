--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 132);
INSERT INTO public.games VALUES (2, 1, 703);
INSERT INTO public.games VALUES (3, 3, 557);
INSERT INTO public.games VALUES (4, 3, 654);
INSERT INTO public.games VALUES (5, 1, 124);
INSERT INTO public.games VALUES (6, 1, 333);
INSERT INTO public.games VALUES (7, 1, 900);
INSERT INTO public.games VALUES (8, 8, 640);
INSERT INTO public.games VALUES (9, 8, 80);
INSERT INTO public.games VALUES (10, 10, 178);
INSERT INTO public.games VALUES (11, 10, 90);
INSERT INTO public.games VALUES (12, 8, 434);
INSERT INTO public.games VALUES (13, 8, 880);
INSERT INTO public.games VALUES (14, 8, 710);
INSERT INTO public.games VALUES (15, 15, 197);
INSERT INTO public.games VALUES (16, 15, 655);
INSERT INTO public.games VALUES (17, 16, 681);
INSERT INTO public.games VALUES (18, 16, 108);
INSERT INTO public.games VALUES (19, 15, 72);
INSERT INTO public.games VALUES (20, 15, 857);
INSERT INTO public.games VALUES (21, 15, 437);
INSERT INTO public.games VALUES (22, 17, 685);
INSERT INTO public.games VALUES (23, 17, 150);
INSERT INTO public.games VALUES (24, 18, 359);
INSERT INTO public.games VALUES (25, 18, 849);
INSERT INTO public.games VALUES (26, 17, 215);
INSERT INTO public.games VALUES (27, 17, 867);
INSERT INTO public.games VALUES (28, 17, 109);
INSERT INTO public.games VALUES (29, 19, 306);
INSERT INTO public.games VALUES (30, 20, 100);
INSERT INTO public.games VALUES (31, 19, 395);
INSERT INTO public.games VALUES (32, 19, 579);
INSERT INTO public.games VALUES (33, 19, 166);
INSERT INTO public.games VALUES (34, 21, 741);
INSERT INTO public.games VALUES (35, 22, 727);
INSERT INTO public.games VALUES (36, 21, 895);
INSERT INTO public.games VALUES (37, 21, 829);
INSERT INTO public.games VALUES (38, 21, 528);
INSERT INTO public.games VALUES (39, 23, 903);
INSERT INTO public.games VALUES (40, 23, 2);
INSERT INTO public.games VALUES (41, 24, 226);
INSERT INTO public.games VALUES (42, 24, 328);
INSERT INTO public.games VALUES (43, 23, 208);
INSERT INTO public.games VALUES (44, 23, 227);
INSERT INTO public.games VALUES (45, 23, 898);
INSERT INTO public.games VALUES (46, 25, 895);
INSERT INTO public.games VALUES (47, 25, 266);
INSERT INTO public.games VALUES (48, 26, 196);
INSERT INTO public.games VALUES (49, 26, 132);
INSERT INTO public.games VALUES (50, 25, 949);
INSERT INTO public.games VALUES (51, 25, 270);
INSERT INTO public.games VALUES (52, 25, 524);
INSERT INTO public.games VALUES (53, 39, 294);
INSERT INTO public.games VALUES (54, 39, 765);
INSERT INTO public.games VALUES (55, 40, 397);
INSERT INTO public.games VALUES (56, 40, 524);
INSERT INTO public.games VALUES (57, 39, 849);
INSERT INTO public.games VALUES (58, 39, 200);
INSERT INTO public.games VALUES (59, 39, 157);
INSERT INTO public.games VALUES (60, 91, 759);
INSERT INTO public.games VALUES (61, 91, 714);
INSERT INTO public.games VALUES (62, 92, 172);
INSERT INTO public.games VALUES (63, 92, 862);
INSERT INTO public.games VALUES (64, 91, 55);
INSERT INTO public.games VALUES (65, 91, 28);
INSERT INTO public.games VALUES (66, 91, 195);
INSERT INTO public.games VALUES (67, 93, 635);
INSERT INTO public.games VALUES (68, 93, 987);
INSERT INTO public.games VALUES (69, 94, 103);
INSERT INTO public.games VALUES (70, 94, 373);
INSERT INTO public.games VALUES (71, 93, 978);
INSERT INTO public.games VALUES (72, 93, 475);
INSERT INTO public.games VALUES (73, 93, 176);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1753877317708');
INSERT INTO public.users VALUES (3, 'user_1753877317707');
INSERT INTO public.users VALUES (8, 'user_1753877355748');
INSERT INTO public.users VALUES (10, 'user_1753877355747');
INSERT INTO public.users VALUES (15, 'user_1753877535935');
INSERT INTO public.users VALUES (16, 'user_1753877535934');
INSERT INTO public.users VALUES (17, 'user_1753877548341');
INSERT INTO public.users VALUES (18, 'user_1753877548340');
INSERT INTO public.users VALUES (19, 'user_1753877618713');
INSERT INTO public.users VALUES (20, 'user_1753877618712');
INSERT INTO public.users VALUES (21, 'user_1753877676341');
INSERT INTO public.users VALUES (22, 'user_1753877676340');
INSERT INTO public.users VALUES (23, 'user_1753877685222');
INSERT INTO public.users VALUES (24, 'user_1753877685221');
INSERT INTO public.users VALUES (25, 'user_1753877753449');
INSERT INTO public.users VALUES (26, 'user_1753877753448');
INSERT INTO public.users VALUES (27, 'user_1753877807322');
INSERT INTO public.users VALUES (28, 'user_1753877807321');
INSERT INTO public.users VALUES (29, 'user_1753877963554');
INSERT INTO public.users VALUES (30, 'user_1753877963553');
INSERT INTO public.users VALUES (31, 'user_1753877974905');
INSERT INTO public.users VALUES (32, 'user_1753877974904');
INSERT INTO public.users VALUES (33, 'user_1753878004522');
INSERT INTO public.users VALUES (34, 'user_1753878004521');
INSERT INTO public.users VALUES (35, 'user_1753878060944');
INSERT INTO public.users VALUES (36, 'user_1753878060943');
INSERT INTO public.users VALUES (37, 'user_1753878090058');
INSERT INTO public.users VALUES (38, 'user_1753878090057');
INSERT INTO public.users VALUES (39, 'user_1753878154742');
INSERT INTO public.users VALUES (40, 'user_1753878154741');
INSERT INTO public.users VALUES (41, 'user_1753878168550');
INSERT INTO public.users VALUES (42, 'user_1753878168549');
INSERT INTO public.users VALUES (43, 'user_1753878757558');
INSERT INTO public.users VALUES (45, 'user_1753878757557');
INSERT INTO public.users VALUES (50, 'user_1753879013904');
INSERT INTO public.users VALUES (51, 'user_1753879013903');
INSERT INTO public.users VALUES (52, 'user_1753879022121');
INSERT INTO public.users VALUES (53, 'user_1753879022120');
INSERT INTO public.users VALUES (54, 'user_1753879068832');
INSERT INTO public.users VALUES (55, 'user_1753879068831');
INSERT INTO public.users VALUES (56, 'user_1753879120282');
INSERT INTO public.users VALUES (57, 'user_1753879120281');
INSERT INTO public.users VALUES (58, 'user_1753879127926');
INSERT INTO public.users VALUES (59, 'user_1753879127925');
INSERT INTO public.users VALUES (60, 'user_1753879204031');
INSERT INTO public.users VALUES (61, 'user_1753879204030');
INSERT INTO public.users VALUES (62, 'user_1753879285579');
INSERT INTO public.users VALUES (63, 'user_1753879285578');
INSERT INTO public.users VALUES (64, 'user_1753879308611');
INSERT INTO public.users VALUES (65, 'user_1753879308610');
INSERT INTO public.users VALUES (66, 'user_1753879327940');
INSERT INTO public.users VALUES (67, 'user_1753879327939');
INSERT INTO public.users VALUES (68, 'user_1753879367631');
INSERT INTO public.users VALUES (69, 'user_1753879367630');
INSERT INTO public.users VALUES (70, 'user_1753879459724');
INSERT INTO public.users VALUES (71, 'user_1753879459723');
INSERT INTO public.users VALUES (72, 'user_1753879611134');
INSERT INTO public.users VALUES (73, 'user_1753879611133');
INSERT INTO public.users VALUES (74, 'user_1753879626352');
INSERT INTO public.users VALUES (75, 'user_1753879626351');
INSERT INTO public.users VALUES (76, 'Marta G');
INSERT INTO public.users VALUES (77, 'user_1753879815191');
INSERT INTO public.users VALUES (78, 'user_1753879815190');
INSERT INTO public.users VALUES (79, 'user_1753880158166');
INSERT INTO public.users VALUES (80, 'user_1753880158165');
INSERT INTO public.users VALUES (81, 'user_1753880193648');
INSERT INTO public.users VALUES (82, 'user_1753880193647');
INSERT INTO public.users VALUES (83, 'user_1753880332361');
INSERT INTO public.users VALUES (84, 'user_1753880332360');
INSERT INTO public.users VALUES (85, 'user_1753880592351');
INSERT INTO public.users VALUES (86, 'user_1753880592350');
INSERT INTO public.users VALUES (87, 'user_1753880624261');
INSERT INTO public.users VALUES (88, 'user_1753880624260');
INSERT INTO public.users VALUES (89, 'user_1753881113678');
INSERT INTO public.users VALUES (90, 'user_1753881113676');
INSERT INTO public.users VALUES (91, 'user_1753881502822');
INSERT INTO public.users VALUES (92, 'user_1753881502821');
INSERT INTO public.users VALUES (93, 'user_1753881527848');
INSERT INTO public.users VALUES (94, 'user_1753881527847');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 73, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 94, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

