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
-- Name: discoverers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.discoverers (
    discoverers_id integer NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer,
    discovery_year integer NOT NULL,
    name character varying(30) NOT NULL,
    notes character varying(30)
);


ALTER TABLE public.discoverers OWNER TO freecodecamp;

--
-- Name: discoverers_discoverers_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.discoverers_discoverers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discoverers_discoverers_id_seq OWNER TO freecodecamp;

--
-- Name: discoverers_discoverers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.discoverers_discoverers_id_seq OWNED BY public.discoverers.discoverers_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_types character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    constellation text
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
    planet_id integer,
    name character varying(30) NOT NULL,
    is_spherical boolean NOT NULL,
    orbital_semi_major_axis_km integer
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
    star_id integer,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    planet_types character varying(30),
    distance_from_earth numeric,
    is_spherical boolean NOT NULL
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
    galaxy_id integer,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
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
-- Name: discoverers discoverers_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverers ALTER COLUMN discoverers_id SET DEFAULT nextval('public.discoverers_discoverers_id_seq'::regclass);


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
-- Data for Name: discoverers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.discoverers VALUES (1, 1, NULL, NULL, NULL, 1610, 'Galileo Galilei', 'Milky Way');
INSERT INTO public.discoverers VALUES (2, 3, NULL, NULL, NULL, 1864, 'Heinrich dArrest', 'NGC 4886');
INSERT INTO public.discoverers VALUES (3, 4, NULL, NULL, NULL, 1835, 'John Herschel', 'NGC 5264');
INSERT INTO public.discoverers VALUES (4, 5, NULL, NULL, NULL, 1787, 'William Herschel', 'NGC 5728');
INSERT INTO public.discoverers VALUES (5, 6, NULL, NULL, NULL, 1969, 'NASA', 'Markarian 231');
INSERT INTO public.discoverers VALUES (6, 7, NULL, NULL, NULL, 1992, 'M. Punch', 'Markarian 421');
INSERT INTO public.discoverers VALUES (7, NULL, NULL, 2, 2, 1877, 'Hall', 'Phobos');
INSERT INTO public.discoverers VALUES (8, NULL, NULL, 2, 3, 1877, 'Hall', 'Deimos');
INSERT INTO public.discoverers VALUES (9, NULL, NULL, 3, 4, 1610, 'Galileo Galilei', 'Io');
INSERT INTO public.discoverers VALUES (10, NULL, NULL, 3, 5, 1610, 'Galileo Galilei', 'Europa');
INSERT INTO public.discoverers VALUES (11, NULL, NULL, 3, 6, 1610, 'Galileo Galilei', 'Ganymede');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'NGC 2865', 'Elliptical', 400, 'Hydra');
INSERT INTO public.galaxy VALUES (3, 'NGC 4886', 'Lenticular', NULL, 'Coma Berenices');
INSERT INTO public.galaxy VALUES (4, 'NGC 5264', 'Irregular', NULL, 'Hydra');
INSERT INTO public.galaxy VALUES (5, 'NGC 5728', 'Seyfert', NULL, 'Libra');
INSERT INTO public.galaxy VALUES (6, 'Markarian 231', 'Quasar', NULL, 'Ursa Major');
INSERT INTO public.galaxy VALUES (7, 'Markarian 421', 'Blazar', NULL, 'Ursa Major');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', true, 384399);
INSERT INTO public.moon VALUES (2, 2, 'Phobos', false, 9380);
INSERT INTO public.moon VALUES (3, 2, 'Deimos', false, 23460);
INSERT INTO public.moon VALUES (4, 3, 'Io', true, 421800);
INSERT INTO public.moon VALUES (5, 3, 'Europa', true, 671100);
INSERT INTO public.moon VALUES (6, 3, 'Ganymede', true, 1070400);
INSERT INTO public.moon VALUES (7, 3, 'Callisto', true, 1882700);
INSERT INTO public.moon VALUES (8, 3, 'Amalthea', false, 181400);
INSERT INTO public.moon VALUES (9, 3, 'Himalia', false, 11461000);
INSERT INTO public.moon VALUES (10, 3, 'Elara', false, 11741000);
INSERT INTO public.moon VALUES (11, 3, 'Sinope', false, 23624000);
INSERT INTO public.moon VALUES (12, 4, 'Mimas', true, 185540);
INSERT INTO public.moon VALUES (13, 4, 'Enceladus', true, 238040);
INSERT INTO public.moon VALUES (14, 4, 'Dione', true, 294670);
INSERT INTO public.moon VALUES (15, 4, 'Rhea', true, 527070);
INSERT INTO public.moon VALUES (16, 4, 'Titan', true, 1221870);
INSERT INTO public.moon VALUES (17, 5, 'Ariel', true, 190900);
INSERT INTO public.moon VALUES (18, 5, 'Umbriel', true, 266000);
INSERT INTO public.moon VALUES (19, 5, 'Titania', true, 436300);
INSERT INTO public.moon VALUES (20, 5, 'Oberon', true, 583500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 4543, 'Terrestrial', 0, true);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 4603, 'Terrestrial', 225, true);
INSERT INTO public.planet VALUES (3, 1, 'Jupiter', 4603, 'Gas giant', 806.72, true);
INSERT INTO public.planet VALUES (4, 1, 'Saturn', 4503, 'Gas giant', 1601100, true);
INSERT INTO public.planet VALUES (5, 1, 'Uranus', 4503, 'Ice giant', NULL, true);
INSERT INTO public.planet VALUES (6, 1, 'Mercury', 4503, 'Terrestrial', NULL, true);
INSERT INTO public.planet VALUES (7, 1, 'Venus', 4503, 'Terrestrial', NULL, true);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 4503, 'Ice giant', NULL, true);
INSERT INTO public.planet VALUES (9, 1, 'Ceres', 4573, 'Dwarf', NULL, true);
INSERT INTO public.planet VALUES (10, 1, 'Pluto', 4503, 'Dwarf', NULL, true);
INSERT INTO public.planet VALUES (11, 1, 'Haumea', 4503, 'Dwarf', NULL, true);
INSERT INTO public.planet VALUES (12, 1, 'Makemake', 4503, 'Dwarf', NULL, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 4603, 'The Sun is the star at the center of the Solar System. It is a massive, hot ball of plasma, inflated and heated by energy produced by nuclear fusion');
INSERT INTO public.star VALUES (2, 1, 'Arcturus', 7100, 'Arcturus is the brightest star in the northern constellation of Boötes.');
INSERT INTO public.star VALUES (3, 1, 'Aldebaran', 6605, 'Aldebaran is a star located in the zodiac constellation of Taurus. ');
INSERT INTO public.star VALUES (4, 1, 'Rigel', 8005, 'Rigel is a blue supergiant star in the constellation of Orion.');
INSERT INTO public.star VALUES (5, 1, 'Canopus', 10, 'Canopus is the brightest star in the southern constellation of Carina and the second-brightest star in the night sky.');
INSERT INTO public.star VALUES (6, 1, 'Betelgeuse', 10.01, 'Betelgeuse is a red supergiant star in the constellation of Orion.');


--
-- Name: discoverers_discoverers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.discoverers_discoverers_id_seq', 1, false);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: discoverers discoverers_notes_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverers
    ADD CONSTRAINT discoverers_notes_key UNIQUE (notes);


--
-- Name: discoverers discoverers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverers
    ADD CONSTRAINT discoverers_pkey PRIMARY KEY (discoverers_id);


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
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: discoverers fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverers
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: discoverers fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverers
    ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: discoverers fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverers
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: discoverers fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverers
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

