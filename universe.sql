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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean,
    description text
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
    planet_id integer NOT NULL,
    description text,
    many_times_of_earth numeric(3,2)
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    distance_from_earth integer,
    many_times_of_earth numeric(3,2)
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
    galaxy_id integer NOT NULL,
    has_life boolean,
    description text
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
-- Name: visitor; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.visitor (
    visitor_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.visitor OWNER TO freecodecamp;

--
-- Name: visitor_visitor_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.visitor_visitor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visitor_visitor_id_seq OWNER TO freecodecamp;

--
-- Name: visitor_visitor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.visitor_visitor_id_seq OWNED BY public.visitor.visitor_id;


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
-- Name: visitor visitor_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visitor ALTER COLUMN visitor_id SET DEFAULT nextval('public.visitor_visitor_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Samanyolu', 8, true, 'Dünyanın olduğu galaksi');
INSERT INTO public.galaxy VALUES (2, 'Zamanyolu', 3, false, 'Bir dünyası yoktu');
INSERT INTO public.galaxy VALUES (3, 'Harmanyolu', 5, true, 'Dünyadan çok uzak');
INSERT INTO public.galaxy VALUES (4, 'Bulgurluyolu', 2, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sılayolu', 210, true, NULL);
INSERT INTO public.galaxy VALUES (6, '.okyolu', 1, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'AY', 1, 'Dünyanın uydusu', 0.02);
INSERT INTO public.moon VALUES (2, 'Nasip1', 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Nasip2', 4, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Nasip3', 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Nasip4', 4, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Nasip5', 5, NULL, 1.00);
INSERT INTO public.moon VALUES (7, 'Nasip6', 4, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Nasip7', 5, NULL, 1.20);
INSERT INTO public.moon VALUES (9, 'Nasip8', 4, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Nasip9', 5, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Nasip10', 5, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Nasip11', 4, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Hasip1', 13, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Hasip61', 7, 'Bize her yer TRABZON', NULL);
INSERT INTO public.moon VALUES (15, 'Hasip2', 8, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Hasip3', 9, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Hasip4', 8, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Hasip5', 7, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Hasip6', 8, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Hasip7', 8, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'World', 1, 0, 1.00);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 878347, 4.00);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 35433, 3.00);
INSERT INTO public.planet VALUES (4, 'Talha', 2, 231245, 5.00);
INSERT INTO public.planet VALUES (5, 'Huzeyfe', 3, 3425, 6.00);
INSERT INTO public.planet VALUES (6, 'Salih', 2, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Seyma', 1, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Kismet1', 6, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Kismet2', 6, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Kismet3', 6, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Kismet4', 6, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Kismet5', 3, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Kismet6', 5, NULL, NULL);
INSERT INTO public.planet VALUES (14, 'Kismet7', 6, NULL, NULL);
INSERT INTO public.planet VALUES (15, 'Kismet8', 4, NULL, NULL);
INSERT INTO public.planet VALUES (16, 'Kismet9', 4, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, 'Dünya var be');
INSERT INTO public.star VALUES (2, 'Hamza', 3, true, NULL);
INSERT INTO public.star VALUES (3, 'Ebu Bekir', 3, true, NULL);
INSERT INTO public.star VALUES (4, 'Ömer', 3, true, NULL);
INSERT INTO public.star VALUES (5, 'Ali', 3, true, NULL);
INSERT INTO public.star VALUES (6, 'Hasan', 5, true, NULL);
INSERT INTO public.star VALUES (7, 'Hüseyin', 5, true, NULL);


--
-- Data for Name: visitor; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.visitor VALUES (1, 'Ahmet', 'Mal Sahabısı');
INSERT INTO public.visitor VALUES (2, 'Necati', NULL);
INSERT INTO public.visitor VALUES (3, 'Naci', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: visitor_visitor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.visitor_visitor_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: visitor visitor_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visitor
    ADD CONSTRAINT visitor_pkey PRIMARY KEY (visitor_id);


--
-- Name: visitor visitor_visitor_id_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visitor
    ADD CONSTRAINT visitor_visitor_id_name_key UNIQUE (visitor_id, name);


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

