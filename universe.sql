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
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    cluster_id integer NOT NULL,
    name character varying(20) NOT NULL,
    right_ascension time without time zone
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cluster_cluster_id_seq OWNED BY public.cluster.cluster_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    type character varying(20),
    cluster_id integer NOT NULL,
    right_ascension time without time zone
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
    name character varying(20),
    planet_id integer NOT NULL,
    mass_order_magnitude integer,
    comment text
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
    name character varying(30),
    in_habitable_zone boolean,
    star_id integer NOT NULL,
    temperature numeric(5,2),
    known_moons integer,
    has_humans boolean
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
    name character varying(20),
    radius numeric(10,5),
    galaxy_id integer NOT NULL,
    right_ascension time without time zone
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
-- Name: cluster cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster ALTER COLUMN cluster_id SET DEFAULT nextval('public.cluster_cluster_id_seq'::regclass);


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
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster VALUES (1, 'bullet', '06:58:38');
INSERT INTO public.cluster VALUES (2, 'virgo', '12:27:00');
INSERT INTO public.cluster VALUES (3, 'norma', '16:14:22');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'ESO 137-8', NULL, 3, NULL);
INSERT INTO public.galaxy VALUES (2, 'ESO 137-6', NULL, 3, NULL);
INSERT INTO public.galaxy VALUES (3, 'ESO 206-G20', NULL, 1, NULL);
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 'SA(s)b', 2, '00:42:44');
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 'SBbc', 2, '17:45:40');
INSERT INTO public.galaxy VALUES (6, 'NGC 221', 'E2', 2, '00:42:42');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 22, 'A classic');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 16, 'Glorified asteroid');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 15, 'Glorified asteroid');
INSERT INTO public.moon VALUES (4, 'Europa', 4, 22, 'Subsurface ocean');
INSERT INTO public.moon VALUES (5, 'Io', 4, 22, 'Volcanos');
INSERT INTO public.moon VALUES (6, 'Callisto', 4, 23, 'Extremely salty subsurface ocean');
INSERT INTO public.moon VALUES (7, 'Ganymede', 4, 23, 'Another subsurface ocean');
INSERT INTO public.moon VALUES (8, 'Mimas', 8, 19, 'Another subsurface ocean. Weird name.');
INSERT INTO public.moon VALUES (9, 'Enceladus', 8, 19, 'Another subsurface ocean.');
INSERT INTO public.moon VALUES (10, 'Tethys', 8, 20, 'Kind of boring');
INSERT INTO public.moon VALUES (11, 'Dione', 8, 21, 'Ice cliffs');
INSERT INTO public.moon VALUES (12, 'Rhea', 8, 21, 'Ice cliffs too');
INSERT INTO public.moon VALUES (13, 'Titan', 8, 23, 'Atmosphere dense than Earths');
INSERT INTO public.moon VALUES (14, 'Iapetus', 8, 21, 'Two tone coloration');
INSERT INTO public.moon VALUES (15, 'Miranda', 9, 19, 'Normal persons name');
INSERT INTO public.moon VALUES (16, 'Ariel', 9, 21, 'No water for mermaid name');
INSERT INTO public.moon VALUES (17, 'Oberon', 9, 21, 'Cool name');
INSERT INTO public.moon VALUES (18, 'Titania', 9, 21, 'Cool name');
INSERT INTO public.moon VALUES (19, 'Umbriel', 9, 21, 'Obscure reference');
INSERT INTO public.moon VALUES (20, 'Triton', 9, 22, 'Obvious name');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Venus', true, 7, 232.00, 0, false);
INSERT INTO public.planet VALUES (5, 'Proxima Centauri d', false, 4, 360.00, 0, false);
INSERT INTO public.planet VALUES (6, 'Proxima Centauri b', true, 4, 234.00, 0, false);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri c', false, 4, 39.00, 0, false);
INSERT INTO public.planet VALUES (12, 'Bardnards Star b', false, 5, 443.00, 0, false);
INSERT INTO public.planet VALUES (7, 'Mercury', false, 7, 437.00, 0, false);
INSERT INTO public.planet VALUES (2, 'Mars', false, 7, 209.00, 2, false);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 7, 88.00, 95, false);
INSERT INTO public.planet VALUES (8, 'Saturn', false, 7, 134.00, 146, false);
INSERT INTO public.planet VALUES (9, 'Uranus', false, 7, 76.00, 28, false);
INSERT INTO public.planet VALUES (10, 'Neptune', false, 7, 72.00, 16, false);
INSERT INTO public.planet VALUES (1, 'Earth', true, 7, 255.00, 1, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'AE Andromedae', 55.00000, 5, '00:43:03');
INSERT INTO public.star VALUES (2, 'AF Andromedae', 63.00000, 5, '00:43:33');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 0.15420, 4, '14:29:43');
INSERT INTO public.star VALUES (5, 'Barnards Star', 0.18700, 4, '17:57:48');
INSERT INTO public.star VALUES (3, 'M31-RV', 2000.00000, 5, '00:43:02');
INSERT INTO public.star VALUES (6, 'Sirius', 0.00840, 4, '06:45:09');
INSERT INTO public.star VALUES (7, 'Sun', 1.00000, 4, NULL);


--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cluster_cluster_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: cluster cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (cluster_id);


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
-- Name: cluster uc_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT uc_name UNIQUE (name);


--
-- Name: galaxy fk_galaxy_cluster; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy_cluster FOREIGN KEY (cluster_id) REFERENCES public.cluster(cluster_id);


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

