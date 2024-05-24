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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text NOT NULL,
    is_normal boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    mass_in_millions_of_kilonewtons integer,
    distance_from_earth_in_lightyears numeric,
    galaxy_id integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text NOT NULL,
    is_normal boolean,
    is_spiral boolean,
    age_in_millions_of_years integer,
    mass_in_millions_of_kilonewtons integer,
    distance_from_earth_in_lightyears numeric
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
    name character varying(64) NOT NULL,
    description text NOT NULL,
    is_spherical boolean,
    has_been_landed_on boolean,
    age_in_millions_of_years integer,
    mass_in_millions_of_kilonewtons integer,
    distance_from_its_planet_in_kilometers numeric,
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
    name character varying(64) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    habitable boolean,
    could_be_landed_on boolean,
    has_water boolean,
    is_spherical boolean,
    has_been_landed_on boolean,
    age_in_millions_of_years integer,
    mass_in_millions_of_kilonewtons integer,
    distance_from_its_sun_in_kilometers numeric,
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
    name character varying(64) NOT NULL,
    description text NOT NULL,
    is_normal boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    mass_in_millions_of_kilonewtons integer,
    distance_from_earth_in_lightyears numeric,
    galaxy_id integer
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Gaia BH1', 'The nearest known black hole, called Gaia BH1, is about 1,500 light-years away.', true, true, 789000000, 843000000, 754000000, 5);
INSERT INTO public.black_hole VALUES (2, 'QSO J0313-1806', 'The most distant black hole detected, at the center of a galaxy called QSO J0313-1806, is around 13 billion light-years away.', true, true, 233000000, 75500000, 130000000000, 5);
INSERT INTO public.black_hole VALUES (3, 'TON 618', 'The most massive black hole observed, TON 618, tips the scales at 66 billion times the Sun''s mass.', true, true, 660000000, 660000000, 880000000000, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is a barred spiral galaxy around 13.6 billion years old with large pivoting arms stretching out across the cosmos. Our home galaxy''s disk is about 100,000 light-years in diameter and just 1000 light-years thick, according to Las Cumbres Observatory.', true, true, 136000, 154000000, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.', true, true, 1001000, 123000000, 2500000);
INSERT INTO public.galaxy VALUES (3, 'Condor', 'The largest known spiral galaxy, it has a diameter of over 665,300 light-years (204.0 kiloparsecs). It is tidally disturbed by the smaller lenticular galaxy IC 4970.', true, true, 463000, 289000000, 3490000);
INSERT INTO public.galaxy VALUES (4, 'Cosmos Redshift', 'Galaxy Cosmos Redshift 7 is reported to be the brightest of distant galaxies (z > 6) and to contain some of the earliest first stars (first generation; Population III) that produced the chemical elements needed for the later formation of planets and life as we know it.', true, true, 896000, 132000000, 7890000);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'This is the fourth-largest galaxy in the Local Group, and forms a pair with the SMC, and from recent research, may not be part of the Milky Way system of satellites at all.', true, true, 276000, 965000000, 893000);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'This forms a pair with the LMC, and from recent research, may not be part of the Milky Way system of satellites at all.', true, true, 19000, 59000000, 4830000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The moon', 'The Moon is Earth''s only natural satellite. It orbits at an average distance of 384,400 km (238,900 mi), about 30 times the diameter of Earth. Over time Earth''s gravity has caused tidal locking, causing the same side of the Moon to always face Earth. Because of this, the lunar day and the lunar month are the same length, at 29.5 Earth days. The Moon''s gravitational pull - and to a lesser extent, the Sun''s - are the main drivers of Earth''s tides.', true, true, 446000000, 734000000, 384400, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Phobos (/''foʊbəs/; systematic designation: Mars I) is the innermost and larger of the two natural satellites of Mars, the other being Deimos. The two moons were discovered in 1877 by American astronomer Asaph Hall. It is named after Phobos, the Greek god of fear and panic, who is the son of Ares (Mars) and twin brother of Deimos.', true, false, 43000000, 1000000, 3000, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Deimos /''daɪməs/ (systematic designation: Mars II) is the smaller and outer of the two natural satellites of Mars, the other being Phobos. Deimos has a mean radius of 6.2 km (3.9 mi) and takes 30.3 hours to orbit Mars. Deimos is 23,460 km (14,580 mi) from Mars, much farther than Mars''s other moon, Phobos. It is named after Deimos, the Ancient Greek god and personification of dread and terror.', true, false, 460000, 150000, 12000, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Jupiter''s icy moon Ganymede is the largest moon in our solar system, even bigger than the planet Mercury, and the dwarf planet Pluto. There''s strong evidence that Ganymede has an underground saltwater ocean that may hold more water than all the water on Earth''s surface. It might even have ice and oceans stacked up in several layers like a club sandwich.', true, false, 320000, 13000, 11000, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Callisto is Jupiter''s second largest moon and the third largest moon in our solar system. Its surface is the most heavily cratered of any object in our solar system. Images of Callisto captured by passing spacecraft show bright white spots standing out against darker regions. Scientists think the bright areas are mostly ice and the darker patches are areas where the ice has eroded.', true, false, 390000, 1000, 1880000, 5);
INSERT INTO public.moon VALUES (6, 'Io', 'Jupiter''s moon Io is the most volcanically active world in the solar system, with hundreds of volcanoes, some erupting lava fountains dozens of miles (or kilometers) high. Io is caught in a tug-of-war between Jupiter''s massive gravity and the smaller but precisely timed pulls from two neighboring moons that orbit farther from Jupiter—Europa and Ganymede.', true, false, 450000, 890000, 190000, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 'Europa is the fourth largest of Jupiter''s 95 moons. It''s the sixth-closest moon to the planet. Europa and Jupiter''s three other largest moons - Io, Ganymede, and Callisto - were the first moons discovered beyond Earth. They are called the Galilean moons after Italian astronomer Galileo Galilei, who first observed them with a homemade telescope in January 1610.', true, false, 460000, 740000, 417000, 5);
INSERT INTO public.moon VALUES (8, 'Metis', 'Metis /''mi:təs/, also known as Jupiter XVI, is the innermost known moon of Jupiter. It was discovered in 1979 in images taken by Voyager 1, and was named in 1983 after the first wife of Zeus, Metis. Additional observations made between early 1996 and September 2003 by the Galileo spacecraft allowed its surface to be imaged.', true, false, 450000, 630000, 128000, 5);
INSERT INTO public.moon VALUES (9, 'Adrastea', 'Adrastea (/ædrə''sti:ə/), also known as Jupiter XV, is the second by distance, and the smallest of the four inner moons of Jupiter. It was discovered in photographs taken by Voyager 2 in 1979, making it the first natural satellite to be discovered from images taken by an interplanetary spacecraft, rather than through a telescope. It was officially named after the mythological Adrasteia, foster mother of the Greek god Zeus—the equivalent of the Roman god Jupiter.', true, false, 470000, 850000, 129000, 5);
INSERT INTO public.moon VALUES (10, 'Amalthea', 'Amalthea /æməl''θi:ə/ is a moon of Jupiter. It has the third-closest orbit around Jupiter among known moons and was the fifth moon of Jupiter to be discovered, so it is also known as Jupiter V. It is also the fifth-largest moon of Jupiter, after the four Galilean moons. Edward Emerson Barnard discovered the moon on 9 September 1892 and named it after Amalthea of Greek mythology. It was the last natural satellite to be discovered by direct visual observation; all later moons were discovered by photographic or digital imaging.', true, false, 480000, 33000, 181000, 5);
INSERT INTO public.moon VALUES (11, 'Thebe', 'Thebe /''θi:bi:/, also known as Jupiter XIV, is the fourth of Jupiter''s moons by distance from the planet. It was discovered by Stephen P. Synnott in images from the Voyager 1 space probe taken on March 5, 1979, while making its flyby of Jupiter. In 1983, it was officially named after the mythological nymph Thebe.', true, false, 470000, 499000, 138000, 5);
INSERT INTO public.moon VALUES (12, 'Titan', 'Saturn''s largest moon Titan is an extraordinary and exceptional world. Among our solar system''s more than 150 known moons, Titan is the only one with a substantial atmosphere. And of all the places in the solar system, Titan is the only place besides Earth known to have liquids in the form of rivers, lakes and seas on its surface.', true, false, 100000000, 12300000, 759000, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'Few worlds in our solar system are as compelling as Saturn''s icy ocean moon Enceladus. A handful of worlds are thought to have liquid water oceans beneath their frozen shell, but Enceladus sprays its ocean out into space where spacecraft can sample it. From these samples, scientists have determined that Enceladus has most of the chemical ingredients needed for life, and likely has hydrothermal vents releasing hot, mineral-rich water into its ocean.', true, false, 100, 10800, 140000, 6);
INSERT INTO public.moon VALUES (14, 'Hyperion', 'Hyperion is the largest of Saturn''s irregular, nonspherical moons. Hyperion''s mean radius is 83.9 miles (135 kilometers), but since Hyperion is rather potato-shaped, its shape can be described in terms of its diameter along its three axes: 255 x 163 x 137 miles (410 x 260 x 220 kilometers, respectively). Considering its odd shape, Hyperion is probably a remnant of a larger moon that was destroyed by a major impact.', false, false, 670000, 56000, 933000, 6);
INSERT INTO public.moon VALUES (15, 'Prometheus', 'Prometheus acts as a shepherding moon, constraining the extent of the inner edge of Saturn''s F Ring. Prometheus is extremely irregular and has visible craters — some up to 12.4 miles (20 kilometers) in diameter. However, it is much less cratered than its nearby neighbors Pandora, Janus and Epimetheus. The density of Prometheus has been estimated to be low; it is probably a porous, icy body.', false, false, 89000000, 230000, 139000, 6);
INSERT INTO public.moon VALUES (16, 'Pandora', 'Pandora, a potato-shaped moon, is coated in a fine (dust-sized) icy material. Even the craters on Pandora are coated in debris, a stark contrast to the crisply-defined craters of other moons, such as Hyperion. Curious grooves and ridges also appear to cross the surface of the small moon.', false, false, 5400000, 3800000, 142000, 6);
INSERT INTO public.moon VALUES (17, 'Janus', 'Janus is a potato-shaped moon with a mean radius of 55.6 miles (89.5 kilometers) and dimensions of 122 x 119 x 93 miles (196 x 192 x 150 kilometers, respectively).Janus is extensively cratered with several craters larger than 19 miles (30 kilometers). Janus'' prominent craters are named Castor, Phoebe, Idas and Lynceus.', false, false, 78000000, 6600000, 94000, 6);
INSERT INTO public.moon VALUES (18, 'Epimetheus', 'Epimetheus is a potato-shaped moon with a mean radius of 36 miles (58 km) and dimensions of 84 x 65 x 65 miles (135 x 108 x 105 km, respectively). Its shape reflects pronounced flattening at the Epimethean South Pole associated with the remains of a large crater. Epimetheus has several craters larger than 19 miles (30 km), including Hilairea and Pollux.', false, false, 33000000, 4300000, 151000, 6);
INSERT INTO public.moon VALUES (19, 'Mimas', 'Less than 123 miles (198 kilometers) in mean radius, crater-covered Mimas is the smallest and innermost of Saturn''s major moons. It is not quite big enough to hold a round shape, so it is somewhat ovoid with dimensions of 129 x 122 x 119 miles (207 x 197 x 191 kilometers, respectively). Its low density suggests that it consists almost entirely of water ice, which is the only substance ever detected on Mimas.', false, false, 42000000, 6500000, 186000, 6);
INSERT INTO public.moon VALUES (20, 'Iapetus', 'Iapetus has been called the yin and yang of the Saturn moons because its leading hemisphere has a reflectivity (or albedo) as dark as coal (albedo 0.03-0.05 with a slight reddish tinge) and its trailing hemisphere is much brighter at 0.5-0.6. Saturn''s third largest moon, Iapetus has a mean radius of 457 miles (736 kilometers) and a density only 1.2 times that of liquid water. It has been suggested that Iapetus (like Rhea) is three quarters ice and one quarter rock.', true, false, 5700000, 890000, 3560000, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Earth is the third planet from the Sun and the only astronomical object known to harbor life. This is enabled by Earth being a water world, the only one in the Solar System sustaining liquid surface water. Almost all of Earth''s water is contained in its global ocean, covering 70.8% of Earth''s crust. The remaining 29.2% of Earth''s crust is land, most of which is located in the form of continental landmasses within Earth''s land hemisphere.', true, true, true, true, true, true, 454000, 597000, 0, 7);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Mercury is the first planet from the Sun and the smallest in the Solar System. In English, it is named after the ancient Roman god Mercurius (Mercury), god of commerce and communication, and the messenger of the gods. Mercury is classified as a terrestrial planet, with roughly the same surface gravity as Mars.', false, false, false, false, true, false, 450000, 32800000, 0, 7);
INSERT INTO public.planet VALUES (3, 'Venus', 'Venus is the second planet from the Sun. It is a terrestrial planet and is the closest in mass and size to its orbital neighbour Earth. Venus is notable for having the densest atmosphere of the terrestrial planets, composed mostly of carbon dioxide with a thick, global sulfuric acid cloud cover.', false, false, false, false, true, false, 450000, 48700000, 0, 7);
INSERT INTO public.planet VALUES (4, 'Mars', 'Mars is the fourth planet from the Sun. The surface of Mars is orange-red because it is covered in iron(III) oxide dust, giving it the nickname "the Red Planet".[21][22] Mars is among the brightest objects in Earth''s sky, and its high-contrast albedo features have made it a common subject for telescope viewing.', false, false, true, true, true, true, 460000, 639000, 0, 7);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. A gas giant, Jupiter''s mass is more than two and a half times that of all the other planets in the Solar System combined and slightly less than one one-thousandth the mass of the Sun.', false, false, false, false, true, false, 460000, 1900000000, 0, 7);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine-and-a-half times that of Earth. It has only one-eighth the average density of Earth, but is over 95 times more massive.', false, false, false, false, true, false, 450000, 56800000, 0, 7);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Uranus is the seventh planet from the Sun. It is a gaseous cyan-coloured ice giant. Most of the planet is made of water, ammonia, and methane in a supercritical phase of matter, which in astronomy is called ''ice'' or volatiles. The planet''s atmosphere has a complex layered cloud structure and has the lowest minimum temperature of 49 K (-224 °C; -371 °F) out of all the Solar System''s planets.', false, false, false, false, true, false, 450000, 868000000, 0, 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Neptune is the eighth and farthest known planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, and slightly more massive than fellow ice giant Uranus. Neptune is denser and physically smaller than Uranus because its greater mass causes more gravitational compression of its atmosphere. Being composed primarily of gases and liquids, it has no well-defined solid surface.', false, false, false, false, true, false, 450000, 100000000, 0, 7);
INSERT INTO public.planet VALUES (9, '51 Pegasi b', 'This was the first exoplanet discovered around a sun-like star. 51 Pegasi b, also known as Dimidium, was discovered in 1995 and opened a new era in the search for exoplanets. It''s a Hot Jupiter, meaning it''s a gas giant that orbits extremely close to its star (every four Earth days), which results in blistering surface temperatures. This exoplanet is about 50 light-years away from Earth.', false, false, false, false, true, false, 610000000, 472000, 50, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'Discovered by NASA''s Kepler Space Telescope in 2011, Kepler-22b was the first planet discovered within its star''s habitable zone — the region where conditions might be just right for liquid water, as opposed to water vapor. We don''t know for sure if it''s a water world, but it''s a tantalizing possibility. This super-Earth is over 600 light-years away and seems to have a moderate surface temperature of 72 degrees F (22 C). Its orbit is 290 Earth days.', false, true, true, true, true, false, 7000000, 193000000, 600, 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 'Meet our nearest exoplanet neighbor: Proxima Centauri b. Located just over four light-years away, this Earth-sized planet orbits in the habitable zone of its red dwarf star, Proxima Centauri, the closest star to the sun. Its orbit takes around 11 Earth days.', false, true, true, true, true, false, 485000000, 123000, 4, 3);
INSERT INTO public.planet VALUES (12, 'Kepler-186f', 'This was the first Earth-size planet found orbiting within its star''s habitable zone. Finding this planet in 2014 confirmed that planets the size of Earth could exist in the habitable zone of stars beyond our sun (previous discoveries showed much-bigger planets). Kepler-186f orbits its red dwarf star every 130 days and receives one-third of the energy from its star that Earth gets from the sun, so it''s on the outer edge of the habitable zone.', false, true, true, true, true, false, 4000000, 478000, 50, 4);
INSERT INTO public.planet VALUES (13, 'Kepler-452b', 'Discovered in 2015, Kepler-452b was the first near-Earth-sized planet to be in the habitable zone of a sun-like star. The time it takes to orbit its star (385 Earth days) is also very close to that of Earth''s. This makes it one of the most Earth-like planets we''ve found in terms of size, temperature and the type of star it orbits.', false, true, true, true, true, false, 6000000, 1000000, 50, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Polaris', 'Also known as the North Star (as well as the Pole Star, Lodestar, and sometimes Guiding Star), Polaris is the 45th brightest star in the night sky. It is very close to the north celestial pole, which is why it has been used as a navigational tool in the northern hemisphere for centuries. Scientifically speaking, this star is known as Alpha Ursae Minoris because it is the alpha star in the constellation Ursa Minor (the Little Bear).', true, true, 70, 54000, 430, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Also known as the Dog Star, because it’s the brightest star in Canis Major (the “Big Dog”), Sirius is also the brightest star in the night sky. The name “Sirius” is derived from the Ancient Greek “Seirios“, which translates to “glowing” or “scorcher”. Whereas it appears to be a single bright star to the naked eye, Sirius is actually a binary star system, consisting of a white main-sequence star named Sirius A, and a faint white dwarf companion named Sirius B.', true, true, 230, 200000, 6.8, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'Also known as Rigel Kent or Toliman, Alpha Centauri is the brightest star in the southern constellation of Centaurus and the third brightest star in the night sky. It is also the closest star system to Earth, at just a shade over four light-years. But much like Sirius and Polaris, it is actually a multistar system, consisting of Alpha Centauri A, B, and Proxima Centauri (aka. Centauri C).', true, true, 485000, 2190, 4, 5);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Pronounced "Beetle-juice" (yes, the same as the 1988 Tim Burton movie), this bright red supergiant is roughly 65o light-year from Earth. Also known as Alpha Orionis, it is nevertheless easy to spot in the Orion constellation since it is one of the largest and most luminous stars in the night sky.', true, true, 10000, 329000000, 700, 2);
INSERT INTO public.star VALUES (5, 'Rigel', 'Also known as Beta Orionis, and located between 700 and 900 light years away, Rigel is the brightest star in the constellation Orion and the seventh brightest star in the night sky. Here too, what appears to be a blue supergiant is actually a multistar system. The primary star (Rigel A) is a blue-white supergiant that is 21 times more massive than our sun, and shines with approximately 120,000 times the luminosity.', true, true, 9, 3580000, 864, 3);
INSERT INTO public.star VALUES (6, 'Vega', 'Vega is another bright blue star that anchors the otherwise faint Lyra constellation (the Harp). Along with Deneb (from Cygnus) and Altair (from Aquila), it is a part of the Summer Triangle in the Northern hemisphere. It is also the brightest star in the constellation Lyra, the fifth brightest star in the night sky and the second brightest star in the northern celestial hemisphere (after Arcturus).', true, true, 450, 425000, 25, 4);
INSERT INTO public.star VALUES (7, 'The sun', 'The Sun is the star at the center of the Solar System. It is a massive, nearly perfect ball of hot plasma, heated to incandescence by nuclear fusion reactions in its core, radiating the energy from its surface mainly as visible light and infrared radiation with 10% at ultraviolet energies. It is by far the most important source of energy for life on Earth. The Sun has been an object of veneration in many cultures. It has been a central subject for astronomical research since antiquity.', true, true, 460000, 199000, 9.3, 1);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

