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
-- Name: actions; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.actions (
    actions_id integer NOT NULL,
    action_time numeric,
    name character varying(20) NOT NULL
);


ALTER TABLE public.actions OWNER TO freecodecamp;

--
-- Name: actions_action_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.actions_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actions_action_id_seq OWNER TO freecodecamp;

--
-- Name: actions_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.actions_action_id_seq OWNED BY public.actions.actions_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    local_group integer,
    galaxy_id integer NOT NULL,
    star_count integer,
    planet_count numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbit_time numeric,
    has_moon_friends boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    is_habitable boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planets integer,
    galaxy_id integer,
    expiration_date numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: actions actions_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.actions ALTER COLUMN actions_id SET DEFAULT nextval('public.actions_action_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Data for Name: actions; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.actions VALUES (1, NULL, 'Rotation');
INSERT INTO public.actions VALUES (2, NULL, 'Translation');
INSERT INTO public.actions VALUES (3, NULL, 'Orbit');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 1, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Andromeda', 1, 2, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Triangulum', 1, 3, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Canes Dwarf', 1, 4, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Phoenix Dwarf', 1, 5, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Tucana Dwarf', 1, 6, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Cetus Dwarf', 1, 7, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 7.39, true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 30.3, true, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 84.36, true, 5);
INSERT INTO public.moon VALUES (4, 'Io', 42.18, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 7.1556, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 16.690, true, 5);
INSERT INTO public.moon VALUES (8, 'Themisto', 130.03, true, 5);
INSERT INTO public.moon VALUES (9, 'Leda', 240.93, true, 5);
INSERT INTO public.moon VALUES (10, 'Ersa', 249.23, true, 5);
INSERT INTO public.moon VALUES (11, 'S/2018 J 2', 249.92, true, 5);
INSERT INTO public.moon VALUES (12, 'Himalia', 250.56, true, 5);
INSERT INTO public.moon VALUES (13, 'Pandia', 251.91, true, 5);
INSERT INTO public.moon VALUES (14, 'Lysithea', 259.20, true, 5);
INSERT INTO public.moon VALUES (15, 'Elara', 259.64, true, 5);
INSERT INTO public.moon VALUES (16, 'S/2011 J 3', 259.84, true, 5);
INSERT INTO public.moon VALUES (17, 'Dia', 278.21, true, 5);
INSERT INTO public.moon VALUES (18, 'S/2018 J 4', 427.63, true, 5);
INSERT INTO public.moon VALUES (20, 'Carpo', 456.29, true, 5);
INSERT INTO public.moon VALUES (21, 'Valetudo', 527.61, true, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', '', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', '', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The honored one', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The red planet', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The biggest planet', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The one with rings', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice giant', false, 1);
INSERT INTO public.planet VALUES (9, 'Lalande 21185 b', 'Has 9/10 of Jupiters mass', false, 6);
INSERT INTO public.planet VALUES (10, 'Lalande 21185 a', 'Has 1.6 of Jupiters mass', false, 6);
INSERT INTO public.planet VALUES (11, 'Próxima Centauri b', 'Expoplanet', true, 2);
INSERT INTO public.planet VALUES (12, 'Próxima Centauri d', 'Recently discovered', false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 1, NULL);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 3, 1, NULL);
INSERT INTO public.star VALUES (3, 'Toliman', 2, 1, NULL);
INSERT INTO public.star VALUES (4, 'Rigil Kentaurus', 0, 1, NULL);
INSERT INTO public.star VALUES (5, 'Wolf 359', 0, 1, NULL);
INSERT INTO public.star VALUES (6, 'Lalande 21185', 2, 1, NULL);


--
-- Name: actions_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.actions_action_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: actions actions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (actions_id);


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
-- Name: actions unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.actions
    ADD CONSTRAINT unique_name UNIQUE (name);


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
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

