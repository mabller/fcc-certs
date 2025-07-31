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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_km integer,
    composition_notes text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_id_asteroid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_id_asteroid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_id_asteroid_seq OWNER TO freecodecamp;

--
-- Name: asteroid_id_asteroid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_id_asteroid_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    number_of_stars integer,
    age_million_years integer,
    diameter_kpc numeric,
    is_active boolean,
    is_barred boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_galaxy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_galaxy_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_galaxy_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    orbit_days integer,
    discovery_year integer,
    diameter_km numeric,
    is_tidally_locked boolean,
    has_subsurface_ocean boolean,
    planet_id integer,
    surface_features text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_moon_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    number_of_moons integer,
    rotation_period_hours integer,
    mass_earth numeric,
    is_habitable boolean,
    has_atmosphere boolean,
    star_id integer,
    climate_notes text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_planet_seq OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_planet_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    temperature integer,
    age_million_years integer,
    mass_solar numeric,
    is_main_sequence boolean,
    has_planetary_system boolean,
    galaxy_id integer,
    spectral_type_info text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_star_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_star_seq OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_star_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_id_asteroid_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_galaxy_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_moon_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_planet_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_star_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 945, 'Rich in water ice and hydrated minerals');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 'Rocky, differentiated, basaltic crust');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, 'Carbonaceous with signs of hydrated minerals');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, 13000, 30.0, true, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 100, 10000, 35.0, true, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40, 9000, 18.5, false, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 80, 12000, 50.0, false, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 60, 8500, 23.0, true, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic', 30, 7000, 14.0, false, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 27, -4000, 3474.8, true, false, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 0, 1877, 22.2, true, false, 2, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 1, 1877, 12.4, true, false, 2, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', 4, 1610, 3121.6, true, true, 1, NULL);
INSERT INTO public.moon VALUES (5, 'Moonlet-1', 1, 2120, 10.0, true, false, 6, NULL);
INSERT INTO public.moon VALUES (6, 'Moonlet-2', 3, 2121, 15.0, true, false, 6, NULL);
INSERT INTO public.moon VALUES (7, 'AndroMoon-A', 4, 2340, 1000.0, true, false, 7, NULL);
INSERT INTO public.moon VALUES (8, 'AndroMoon-B', 3, 2341, 800.0, true, false, 7, NULL);
INSERT INTO public.moon VALUES (9, 'AndroMoon-C', 2, 2342, 500.0, true, false, 7, NULL);
INSERT INTO public.moon VALUES (10, 'AndroMoon-D', 2, 2343, 600.0, true, false, 8, NULL);
INSERT INTO public.moon VALUES (11, 'Triangulum I', 4, 2420, 1200.0, true, true, 10, NULL);
INSERT INTO public.moon VALUES (12, 'Triangulum II', 3, 2421, 800.0, true, false, 10, NULL);
INSERT INTO public.moon VALUES (13, 'Triangulum III', 2, 2422, 900.0, true, true, 10, NULL);
INSERT INTO public.moon VALUES (14, 'Whirlmoon-1', 8, 2500, 2000.0, true, false, 11, NULL);
INSERT INTO public.moon VALUES (15, 'Whirlmoon-2', 6, 2501, 1000.0, true, false, 11, NULL);
INSERT INTO public.moon VALUES (16, 'Whirlmoon-3', 8, 2502, 1200.0, true, true, 11, NULL);
INSERT INTO public.moon VALUES (17, 'Moon A', 1, 2100, 50.0, true, false, 4, NULL);
INSERT INTO public.moon VALUES (18, 'Moon B', 1, 2200, 30.0, true, false, 5, NULL);
INSERT INTO public.moon VALUES (19, 'Moon C', 4, 2300, 400.0, true, true, 9, NULL);
INSERT INTO public.moon VALUES (20, 'Moon D', 2, 2305, 200.0, true, false, 12, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 24, 1.00, true, true, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 2, 25, 0.107, false, true, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Kepler-22b', 0, 30, 2.4, false, true, 2, NULL);
INSERT INTO public.planet VALUES (4, 'Proxima b', 0, 11, 1.27, true, true, 2, NULL);
INSERT INTO public.planet VALUES (5, 'Sirius I', 0, 20, 0.8, false, false, 3, NULL);
INSERT INTO public.planet VALUES (6, 'Sirius II', 1, 18, 1.5, true, true, 3, NULL);
INSERT INTO public.planet VALUES (7, 'Andromeda X', 2, 35, 3.2, false, true, 4, NULL);
INSERT INTO public.planet VALUES (8, 'Andromeda Y', 1, 40, 1.8, false, true, 4, NULL);
INSERT INTO public.planet VALUES (9, 'Triangulum A', 0, 22, 0.9, true, true, 5, NULL);
INSERT INTO public.planet VALUES (10, 'Triangulum B', 3, 27, 1.3, true, true, 5, NULL);
INSERT INTO public.planet VALUES (11, 'Whirlpool Prime', 1, 30, 4.5, false, true, 6, NULL);
INSERT INTO public.planet VALUES (12, 'Whirlpool Beta', 0, 15, 0.6, false, false, 6, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5778, 4600, 1.00, true, true, 1, NULL);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 3042, 4700, 0.12, true, true, 1, NULL);
INSERT INTO public.star VALUES (3, 'Sirius', 9940, 250, 2.02, true, true, 1, NULL);
INSERT INTO public.star VALUES (4, 'Alpha Andromedae', 13800, 100, 2.5, false, false, 2, NULL);
INSERT INTO public.star VALUES (5, 'TRI-186', 3500, 6000, 0.6, true, true, 3, NULL);
INSERT INTO public.star VALUES (6, 'Whirlpool-22', 7200, 5000, 1.3, true, true, 5, NULL);


--
-- Name: asteroid_id_asteroid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_id_asteroid_seq', 3, true);


--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_galaxy_seq', 6, true);


--
-- Name: moon_id_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_moon_seq', 20, true);


--
-- Name: planet_id_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_planet_seq', 12, true);


--
-- Name: star_id_star_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_star_seq', 6, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_id_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_id_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_id_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

