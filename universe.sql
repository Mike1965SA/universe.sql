--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_type character varying(20),
    age_in_millions_of_years integer,
    galaxy_description text,
    distance_from_earth_millions_lightyears numeric(5,3),
    name character varying(40) NOT NULL
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
    name character varying(20) NOT NULL,
    moon_type character varying(20),
    distance_from_earth_lightyears integer,
    age_in_millions_of_years integer,
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
    name character varying(20) NOT NULL,
    planet_type character varying(20),
    distance_from_earth_lightyears integer,
    age_in_millions_of_years integer,
    number_of_moons numeric(3,0),
    may_suuport_life boolean,
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
    name character varying(20) NOT NULL,
    star_type character varying(20),
    age_in_millions_of_years integer,
    is_visible_with_the_naked_eye boolean,
    galaxy_id integer,
    distance_from_earth_millions_lightyears numeric(5,3)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: visitation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.visitation (
    visited boolean,
    visited_on date NOT NULL,
    visited_from character varying(20),
    visitation_id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.visitation OWNER TO freecodecamp;

--
-- Name: visitation_visit_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.visitation_visit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visitation_visit_id_seq OWNER TO freecodecamp;

--
-- Name: visitation_visit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.visitation_visit_id_seq OWNED BY public.visitation.visitation_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: visitation visitation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visitation ALTER COLUMN visitation_id SET DEFAULT nextval('public.visitation_visit_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (9, NULL, NULL, NULL, 0.000, 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 'Cloud', NULL, 'Large cloud of stars grouped with the SMC named after Ferdinand Magellan', 0.160, 'Large Magellanic Cloud');
INSERT INTO public.galaxy VALUES (3, 'Cloud', NULL, 'Large cloud of stars grouped with the LMC named after Ferdinand Magellan', 0.200, 'Small Magellanic Cloud');
INSERT INTO public.galaxy VALUES (4, 'Spiral', NULL, 'Closest To Milky Way, in the constellation of Andromeda', 2.500, 'Andromeda Galaxy');
INSERT INTO public.galaxy VALUES (5, 'Double armed Spiral', NULL, 'Named due to its location on the Triangulum constellation', 2.900, 'Triangulum Galaxy');
INSERT INTO public.galaxy VALUES (6, NULL, NULL, NULL, 13.700, 'Centaurus A');
INSERT INTO public.galaxy VALUES (7, 'Spiral', NULL, 'Named after the discoverer Johann Bodes 1774', 12.000, 'Bodes Galaxy');
INSERT INTO public.galaxy VALUES (8, NULL, NULL, NULL, 12.000, 'Sculptor Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', NULL, 0, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Io', NULL, 0, NULL, 3);
INSERT INTO public.moon VALUES (3, 'Europa', NULL, 0, NULL, 3);
INSERT INTO public.moon VALUES (4, 'Ganymede', NULL, 0, NULL, 3);
INSERT INTO public.moon VALUES (5, 'Calisto', NULL, 0, NULL, 3);
INSERT INTO public.moon VALUES (6, 'Nalad', NULL, 0, NULL, 4);
INSERT INTO public.moon VALUES (7, 'Thalassa', NULL, 0, NULL, 4);
INSERT INTO public.moon VALUES (8, 'Despina', NULL, 0, NULL, 4);
INSERT INTO public.moon VALUES (9, 'Galatea', NULL, 0, NULL, 4);
INSERT INTO public.moon VALUES (10, 'Larissa', NULL, 0, NULL, 4);
INSERT INTO public.moon VALUES (11, 'Hippocamp', NULL, 0, NULL, 4);
INSERT INTO public.moon VALUES (12, 'Proteus', NULL, 0, NULL, 4);
INSERT INTO public.moon VALUES (13, 'Nemo', NULL, 250000, NULL, 9);
INSERT INTO public.moon VALUES (14, 'Deirdre', NULL, 250000, NULL, 9);
INSERT INTO public.moon VALUES (15, 'Bethos', NULL, 250000, NULL, 9);
INSERT INTO public.moon VALUES (16, 'Alstany', NULL, 250000, NULL, 9);
INSERT INTO public.moon VALUES (17, 'Georvan', NULL, 910000, NULL, 10);
INSERT INTO public.moon VALUES (18, 'Geordiecarr', NULL, 910000, NULL, 10);
INSERT INTO public.moon VALUES (19, 'Goover', NULL, 910000, NULL, 10);
INSERT INTO public.moon VALUES (20, 'Serveth', NULL, 910000, NULL, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, 0, NULL, 1, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', NULL, 0, NULL, 0, false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', 0, NULL, 95, false, 1);
INSERT INTO public.planet VALUES (4, 'Neptune', NULL, 0, NULL, 14, false, 1);
INSERT INTO public.planet VALUES (5, 'Cosi', NULL, 3, NULL, 0, true, 1);
INSERT INTO public.planet VALUES (6, 'Trance', NULL, 6, NULL, 1, false, 1);
INSERT INTO public.planet VALUES (7, 'Elevenn', 'Ice', 210000, NULL, 2, false, 3);
INSERT INTO public.planet VALUES (8, 'Noomonrne', NULL, 161000, NULL, 3, false, 4);
INSERT INTO public.planet VALUES (9, 'Allurvan', 'Gas Giant', 250000, NULL, 5, false, 5);
INSERT INTO public.planet VALUES (10, 'Nentoni', NULL, 901000, NULL, 0, false, 6);
INSERT INTO public.planet VALUES (11, 'Ominoom', NULL, 12100000, NULL, 0, false, 7);
INSERT INTO public.planet VALUES (12, 'Ominucky', NULL, 12100000, NULL, 0, false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SOL', 'G2V', NULL, true, 9, 0.000);
INSERT INTO public.star VALUES (2, 'Saluna', 'G2V', NULL, true, 9, 0.000);
INSERT INTO public.star VALUES (3, '11 Leonis Miniora', 'G8V', NULL, true, 3, 0.210);
INSERT INTO public.star VALUES (4, 'Seena', 'G1L', NULL, false, 2, 0.160);
INSERT INTO public.star VALUES (5, 'Sayla', 'G1L', NULL, false, 3, 0.250);
INSERT INTO public.star VALUES (6, 'Greeva', 'K2V', NULL, false, 5, 2.901);
INSERT INTO public.star VALUES (7, 'Omoinom', 'K2G', NULL, false, 8, 12.001);


--
-- Data for Name: visitation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.visitation VALUES (true, '2001-04-01', 'Elevenn', 1, 'EL1');
INSERT INTO public.visitation VALUES (true, '2001-04-03', 'Elevenn', 2, 'EL2');
INSERT INTO public.visitation VALUES (true, '2003-04-05', 'Ominoom', 3, 'OM1');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: visitation_visit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.visitation_visit_id_seq', 3, true);


--
-- Name: galaxy five; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT five UNIQUE (name);


--
-- Name: moon four; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT four UNIQUE (name);


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
-- Name: star one; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT one UNIQUE (name);


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
-- Name: planet three; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT three UNIQUE (name);


--
-- Name: visitation two; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visitation
    ADD CONSTRAINT two UNIQUE (name);


--
-- Name: visitation visitation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visitation
    ADD CONSTRAINT visitation_pkey PRIMARY KEY (visitation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

