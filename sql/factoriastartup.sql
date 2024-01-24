-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-08-2023 a las 18:54:35
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `factoriastartup`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aptitudes`
--

CREATE TABLE `aptitudes` (
  `id_aptitud` int(20) NOT NULL,
  `descripcion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aptitudes`
--

INSERT INTO `aptitudes` (`id_aptitud`, `descripcion`) VALUES
(1, 'Marketing'),
(2, 'Contabilidad'),
(3, 'Ventas'),
(4, 'RRHH');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `busqueda_colaboradores`
--

CREATE TABLE `busqueda_colaboradores` (
  `id_busqueda` int(30) NOT NULL,
  `id_usuario` int(30) NOT NULL,
  `id_proyecto` int(30) NOT NULL,
  `porcentaje_empresa` int(10) NOT NULL,
  `porcentaje_ventas` int(11) NOT NULL,
  `obra_y_servicio` tinyint(1) NOT NULL,
  `pacto_a_futuro` tinyint(1) NOT NULL,
  `id_aptitud` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `busqueda_colaboradores`
--

INSERT INTO `busqueda_colaboradores` (`id_busqueda`, `id_usuario`, `id_proyecto`, `porcentaje_empresa`, `porcentaje_ventas`, `obra_y_servicio`, `pacto_a_futuro`, `id_aptitud`) VALUES
(78, 25, 67, 33, 33, 0, 1, 1),
(79, 24, 60, 10, 10, 0, 1, 2),
(80, 25, 66, 49, 49, 0, 1, 1),
(81, 24, 61, 49, 49, 0, 1, 1),
(82, 24, 64, 15, 15, 0, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `busqueda_proyectos`
--

CREATE TABLE `busqueda_proyectos` (
  `id_busqueda` int(30) NOT NULL,
  `id_usuario` int(30) NOT NULL,
  `id_proyecto` int(30) NOT NULL,
  `porcentaje_ventas` int(10) NOT NULL,
  `porcentaje_empresa` int(11) NOT NULL,
  `obra_y_servicio` tinyint(1) NOT NULL,
  `pacto_a_futuro` tinyint(1) NOT NULL,
  `mensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `busqueda_proyectos`
--

INSERT INTO `busqueda_proyectos` (`id_busqueda`, `id_usuario`, `id_proyecto`, `porcentaje_ventas`, `porcentaje_empresa`, `obra_y_servicio`, `pacto_a_futuro`, `mensaje`) VALUES
(31, 26, 64, 33, 33, 0, 1, 'hola'),
(32, 26, 67, 33, 33, 0, 1, 'hola'),
(33, 25, 60, 10, 10, 0, 1, 'estar&iacute;a interesada'),
(34, 26, 66, 49, 49, 0, 1, 'estar&iacute;a interesada'),
(35, 25, 62, 15, 15, 0, 1, 'estar&iacute;a interesada'),
(36, 25, 64, 64, 64, 0, 1, 'estar&iacute;a interesada'),
(37, 26, 61, 49, 49, 0, 1, 'estar&iacute;a interesada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `busqueda_sector`
--

CREATE TABLE `busqueda_sector` (
  `id_busqueda` int(30) NOT NULL,
  `id_usuario` int(30) NOT NULL,
  `id_sector` int(30) NOT NULL,
  `porcentaje_ventas` int(10) NOT NULL,
  `porcentaje_empresa` int(11) NOT NULL,
  `obra_y_servicio` tinyint(1) NOT NULL,
  `pacto_a_futuro` tinyint(1) NOT NULL,
  `mensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `busqueda_sector`
--

INSERT INTO `busqueda_sector` (`id_busqueda`, `id_usuario`, `id_sector`, `porcentaje_ventas`, `porcentaje_empresa`, `obra_y_servicio`, `pacto_a_futuro`, `mensaje`) VALUES
(8, 26, 1, 33, 33, 0, 1, 'hola');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL,
  `id_propietario` int(30) NOT NULL,
  `evento` text NOT NULL,
  `fecha` text NOT NULL,
  `id_proyecto` int(30) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id_evento`, `id_propietario`, `evento`, `fecha`, `id_proyecto`, `descripcion`) VALUES
(14, 24, '\"InnovateX: Cumbre de Innovación Tecnológica\"', '2023-09-11', 62, 'Únete a nosotros en InnovateX, donde exploraremos las últimas tendencias en tecnología y descubriremos cómo la innovación está dando forma al futuro. Con conferencias de expertos líderes en la industria, sesiones interactivas y demostraciones en vivo, esta cumbre te llevará a través de un viaje inspirador hacia la vanguardia de la tecnología. Prepárate para desafiar tus perspectivas, conectar con mentes creativas y explorar el emocionante panorama de la innovación.'),
(15, 24, '\"FashionFusion: Encuentro de Moda y Arte\"', '2023-09-15', 63, ' Descubre un mundo de posibilidades sostenibles en EcoConscious Expo, donde la ecología y el estilo de vida consciente convergen. Explora una variedad de stands que presentan productos ecológicos, conferencias sobre hábitos de vida sostenibles y talleres prácticos para un enfoque más respetuoso con el medio ambiente. Únete a nosotros para aprender, conectarte y descubrir formas de hacer una diferencia positiva en el planeta.'),
(16, 25, '\"ExpressVibe Unleashed: Conecta, Crea y Expresa\"', '2023-08-18', 66, '¡Bienvenidos a \"ExpressVibe Unleashed\"! Este evento revolucionario trae la moda adolescente al siglo XXI, fusionando creatividad, tecnología y estilo en una experiencia única. Prepárate para sumergirte en un mundo donde tu ropa se convierte en una pantalla para tu individualidad y donde la comunidad adolescente se une para celebrar la expresión auténtica.'),
(17, 24, '\"LedgerFest: Explorando el Futuro del Libro Contable\"', '2023-09-30', 60, 'Te invitamos a ser parte de \"LedgerFest\", el evento que te sumergirá en el emocionante mundo de los libros contables y la tecnología blockchain. Únete a nosotros para explorar cómo la innovación está transformando la forma en que registramos y gestionamos transacciones financieras. Desde expertos en contabilidad hasta entusiastas de la tecnología, este evento es una oportunidad única para conocer las últimas tendencias y ampliar tus conocimientos.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE `imagenes` (
  `id` int(15) NOT NULL,
  `ruta` varchar(80) NOT NULL,
  `nombre` varchar(400) NOT NULL,
  `mimeType` varchar(30) NOT NULL,
  `carpeta` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`id`, `ruta`, `nombre`, `mimeType`, `carpeta`) VALUES
(42, 'img/fotosProyectos/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosProyectos'),
(43, 'img/fotosProyectos/43.jpg', 'photo-1526512340740-9217d0159da9.jpg', 'image/jpeg', 'fotosProyectos'),
(44, 'img/fotosPost/44.jpg', 'relacionesprof.jpg', 'image/jpeg', 'fotosPost'),
(45, 'img/fotosPost/44.jpg', 'relacionesprof.jpg', 'image/jpeg', 'fotosPost'),
(46, 'img/fotosProyectos/43.jpg', 'photo-1526512340740-9217d0159da9.jpg', 'image/jpeg', 'fotosProyectos'),
(47, 'img/fotosProyectos/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosProyectos'),
(48, 'img/fotosPost/43.jpg', 'photo-1526512340740-9217d0159da9.jpg', 'image/jpeg', 'fotosPost'),
(49, 'img/fotosPost/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosPost'),
(50, 'img/fotosPost/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosPost'),
(51, 'img/fotosProyectos/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosProyectos'),
(52, 'img/fotosUsers/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosUsers'),
(53, 'img/fotosUsers/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosUsers'),
(54, 'img/fotosUsers/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosUsers'),
(55, 'img/fotosUsers/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosUsers'),
(56, 'img/fotosUsers/43.jpg', 'photo-1526512340740-9217d0159da9.jpg', 'image/jpeg', 'fotosUsers'),
(57, 'img/fotosUsers/43.jpg', 'photo-1526512340740-9217d0159da9.jpg', 'image/jpeg', 'fotosUsers'),
(58, 'img/fotosUsers/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosUsers'),
(59, 'img/fotosUsers/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosUsers'),
(60, 'img/fotosUsers/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosUsers'),
(61, 'img/fotosUsers/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosUsers'),
(62, 'img/fotosUsers/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosUsers'),
(63, 'img/fotosUsers/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosUsers'),
(64, 'img/fotosUsers/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosUsers'),
(65, 'img/fotosUsers/43.jpg', 'photo-1526512340740-9217d0159da9.jpg', 'image/jpeg', 'fotosUsers'),
(66, 'img/fotosUsers/43.jpg', 'photo-1526512340740-9217d0159da9.jpg', 'image/jpeg', 'fotosUsers'),
(67, 'img/fotosUsers/43.jpg', 'photo-1526512340740-9217d0159da9.jpg', 'image/jpeg', 'fotosUsers'),
(68, 'img/fotosUsers/43.jpg', 'photo-1526512340740-9217d0159da9.jpg', 'image/jpeg', 'fotosUsers'),
(69, 'img/fotosUsers/43.jpg', 'photo-1526512340740-9217d0159da9.jpg', 'image/jpeg', 'fotosUsers'),
(70, 'img/fotosProyectos/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosProyectos'),
(71, 'img/fotosProyectos/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosProyectos'),
(72, 'img/fotosProyectos/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosProyectos'),
(73, 'img/fotosProyectos/43.jpg', 'photo-1526512340740-9217d0159da9.jpg', 'image/jpeg', 'fotosProyectos'),
(74, 'img/fotosProyectos/43.jpg', 'photo-1526512340740-9217d0159da9.jpg', 'image/jpeg', 'fotosProyectos'),
(75, 'img/fotosProyectos/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosProyectos'),
(76, 'img/fotosProyectos/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosProyectos'),
(77, 'img/fotosProyectos/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosProyectos'),
(78, 'img/fotosProyectos/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosProyectos'),
(79, 'img/fotosProyectos/42.jpg', 'imagen.jpg', 'image/jpeg', 'fotosProyectos'),
(80, 'img/fotosUsers/80.jpeg', 'maria.jpeg', 'image/jpeg', 'fotosUsers'),
(81, 'img/fotosProyectos/81.jpg', 'Innovacion.jpg', 'image/jpeg', 'fotosProyectos'),
(82, 'img/fotosProyectos/82.jpg', 'gestioct.jpg', 'image/jpeg', 'fotosProyectos'),
(83, 'img/fotosProyectos/83.jpg', 'libros-contables-1024x768.jpg', 'image/jpeg', 'fotosProyectos'),
(84, 'img/fotosProyectos/84.avif', 'tienda-ropa-tienda-ropa-perchas-tienda-boutique-moderna_1150-8886.avif', 'image/avif', 'fotosProyectos'),
(85, 'img/fotosProyectos/85.webp', 'E.webp', 'image/webp', 'fotosProyectos'),
(86, 'img/fotosProyectos/86.jpg', 'marketing-influencers-e1575015093698.jpg', 'image/jpeg', 'fotosProyectos'),
(87, 'img/fotosPost/87.png', 'how-to-write-a-good-blog-post.png', 'image/png', 'fotosPost'),
(88, 'img/fotosPost/88.jpg', 'spring-fashion-instagram-post-template-design-f2f73fd23a5383f5a337f315146def37_screen.jpg', 'image/jpeg', 'fotosPost'),
(89, 'img/fotosPost/89.webp', '1600w-BmxV0SZaNOU.webp', 'image/webp', 'fotosPost'),
(90, 'img/fotosUsers/90.jpeg', 'leire.jpeg', 'image/jpeg', 'fotosUsers'),
(91, 'img/fotosUsers/91.jpg', 'miriam.jpg', 'image/jpeg', 'fotosUsers'),
(92, 'img/fotosProyectos/92.jpeg', 'descarga.jpeg', 'image/jpeg', 'fotosProyectos'),
(93, 'img/fotosProyectos/93.jpg', 'torre-ordenador.jpg', 'image/jpeg', 'fotosProyectos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matches`
--

CREATE TABLE `matches` (
  `id_match` int(20) NOT NULL,
  `confirmadoProy` tinyint(1) NOT NULL DEFAULT 0,
  `confirmadoColab` tinyint(4) NOT NULL,
  `id_busqueda_colab` int(30) NOT NULL,
  `id_busqueda_proy` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `matches`
--

INSERT INTO `matches` (`id_match`, `confirmadoProy`, `confirmadoColab`, `id_busqueda_colab`, `id_busqueda_proy`) VALUES
(305796, 0, 0, 78, 32),
(305797, 0, 0, 79, 33),
(305798, 0, 0, 80, 34),
(305799, 0, 0, 82, 36),
(305800, 1, 0, 81, 37);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL,
  `id_padre` int(11) DEFAULT 0,
  `autor` int(30) NOT NULL,
  `fecha` text NOT NULL,
  `contenido` text NOT NULL,
  `titulo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`id`, `id_padre`, `autor`, `fecha`, `contenido`, `titulo`) VALUES
(36, NULL, 26, '2023-08-29 17:25:07', 'Hola! Estaría interesada en comenzar a invertir en algún proyecto.', 'INVERSIÓN'),
(39, 36, 25, '2023-08-29 17:31:19', 'Claro, Miriam. ¡Gracias por tu interés en la inversión! Estoy emocionado/a de que estés considerando comenzar a invertir en proyectos. Me gustaría saber un poco más sobre tus objetivos y preferencias de inversión para poder ofrecerte las mejores opciones.', 'invierte'),
(40, 36, 25, '2023-08-29 17:31:39', 'Por favor, ¿podrías proporcionarme más detalles sobre el tipo de proyecto en el que estás interesada en invertir? ¿Tienes alguna industria o sector en mente? Además, ¿cuál es tu horizonte de inversión y nivel de tolerancia al riesgo?', 'datos'),
(41, 36, 26, '2023-08-29 17:33:08', '¿Podrías proporcionar más información sobre el proyecto de CodeMentor en particular? ¿Cuál es su enfoque y cómo podrían los inversores potenciales como yo participar y beneficiarse?', 'code'),
(42, 36, 26, '2023-08-29 17:34:00', '¿Cómo puedo contactarte para discutir más detalles? Veo que has proporcionado tu dirección de correo electrónico (leire@gmail.com), ¿es la mejor forma de comunicarnos contigo?', 'contactar'),
(43, 36, 25, '2023-08-29 17:36:53', 'Sí!!  Además si quieres tienes más información sobre el proyecto en la pestaña Proyectos.', 'negocio'),
(44, 36, 26, '2023-08-29 17:41:46', 'Hola! Habíamos hecho match pero querría un tanto por ciento más alto de la empresa. Lo he rechazado. ¿Podrías incrementarlo en una nueva oferta?', 'match'),
(45, 36, 25, '2023-08-29 17:42:16', 'Claro!', 'oferta'),
(46, NULL, 24, '2023-08-29 17:59:11', '¡Hola a todos los entusiastas de la innovación! 🚀\r\n\r\n¿Estás listo para explorar el futuro impulsado por la tecnología y descubrir las tendencias más emocionantes? Te invitamos a unirte a nosotros en InnovateX, donde la innovación cobra vida.', 'Innovate X'),
(47, 46, 26, '2023-08-29 18:01:21', 'Me encantaría participar!!!', 'Participar'),
(48, 46, 25, '2023-08-29 18:01:59', 'A qué proyecto corresponde ese evento?', 'proyecto'),
(49, NULL, 25, '2023-08-29 18:02:50', 'Estaría interesada en aprender algo con respecto a la moda en relación con el área de emprendimiento.', 'Moda'),
(50, 49, 24, '2023-08-29 18:07:08', 'En estilo de vida puedes encontrar varios proyectos en relación a ese ámbito. He visto también el tuyo y me parece muy interesante.', 'estilo de vida'),
(51, 49, 26, '2023-08-29 18:09:11', 'Hola! Yo la verdad es que he visto ambos y  me gustaría saber más en profundidad sobre los mismos. ¿Cómo podría informarme?', 'moda'),
(52, 49, 25, '2023-08-29 18:10:12', 'En la pestaña de proyectos puedes observar todos los proyectos de los que disponemos.', 'proyecto'),
(53, 49, 24, '2023-08-29 18:10:56', 'Sí. Además, si así lo prefieres puedes filtrarlos por sector.', 'proyectos'),
(54, NULL, 24, '2023-08-29 18:11:55', 'Buenos días, Me gustaría saber si hay algún sitio donde se pueda tener acceso a información general de los ámbitos que aquí se tratan.', 'Información adicional'),
(55, 54, 25, '2023-08-29 18:14:33', 'De hecho, he estado explorando y me he dado cuenta de que en el sitio web, el administrador ha creado una sección muy interesante. En esta sección, se abordan una variedad de temas relacionados con estos entornos en forma de entradas de blog. Es realmente enriquecedor leer sobre las diversas perspectivas y análisis que se comparten allí. Las entradas abarcan desde tendencias tecnológicas hasta discusiones sobre innovación en diferentes industrias. Es un recurso valioso para mantenerse al día con los avances y las transformaciones en curso. Si estás interesado/a en sumergirte más en estos temas, definitivamente te recomendaría explorar esta sección. ¡Podrías encontrar muchas ideas y conocimientos fascinantes!', 'información'),
(56, NULL, 26, '2023-08-29 18:43:25', '¿Cómo puedo contactar con los administradores?', 'Contactar'),
(57, 56, 24, '2023-08-29 18:48:26', 'Hay un apartado arriba a la derecha donde encuentras la forma de contactar.', 'respuesta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id_post` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `short_description` text NOT NULL,
  `titulo` text NOT NULL,
  `imagen` int(15) DEFAULT NULL,
  `id_propietario` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id_post`, `descripcion`, `short_description`, `titulo`, `imagen`, `id_propietario`) VALUES
(6, 'En TechInsight, creemos que la tecnolog&iacute;a es mucho m&aacute;s que meros gadgets y l&iacute;neas de c&oacute;digo. Es una fuerza impulsora que cambia la forma en que vivimos, trabajamos y nos conectamos. A trav&eacute;s de an&aacute;lisis profundos, entrevistas exclusivas con l&iacute;deres de la industria y an&aacute;lisis de productos, nuestro objetivo es arrojar luz sobre el panorama tecnol&oacute;gico en constante evoluci&oacute;n.\r\n\r\n&iquest;Interesado en conocer las &uacute;ltimas innovaciones en inteligencia artificial y aprendizaje autom&aacute;tico? &iquest;Quieres explorar c&oacute;mo la tecnolog&iacute;a est&aacute; remodelando la atenci&oacute;n m&eacute;dica y la educaci&oacute;n? &iquest;O simplemente deseas conocer las mejores aplicaciones y dispositivos para mejorar tu productividad diaria? TechInsight tiene todo eso y m&aacute;s.\r\n\r\nNuestro equipo de escritores apasionados y expertos en tecnolog&iacute;a se sumerge en los detalles m&aacute;s finos, traduciendo el jerga t&eacute;cnico en contenido accesible y enriquecedor. Desde rese&ntilde;as exhaustivas de dispositivos hasta an&aacute;lisis profundos de las implicaciones &eacute;ticas y sociales de la tecnolog&iacute;a, nuestro objetivo es proporcionarte informaci&oacute;n valiosa y perspicaz que te ayude a tomar decisiones informadas en el mundo digital.\r\n\r\nAs&iacute; que &uacute;nete a nosotros en este viaje. Explora las tendencias emergentes, desentra&ntilde;a los enigmas tecnol&oacute;gicos y comparte tus propias perspectivas en la comunidad en l&iacute;nea de TechInsight. Juntos, exploraremos las maravillas del presente y las emocionantes posibilidades del futuro digital. &iexcl;Bienvenidos a TechInsight, donde la tecnolog&iacute;a cobra vida!', 'Bienvenidos a TechInsight, tu ventana al emocionante mundo de la tecnolog&iacute;a y la innovaci&oacute;n. En este blog, exploramos las tendencias m&aacute;s candentes, las &uacute;ltimas novedades y las perspicaces reflexiones que est&aacute;n dando forma al futuro digital. Si eres un apasionado de la tecnolog&iacute;a, un entusiasta curioso o simplemente alguien que busca mantenerse actualizado en este vertiginoso campo, has llegado al lugar correcto.', '&quot;TechInsight: Descubriendo el Futuro Digital&quot;', 87, 9),
(7, 'En ChicTrends, creemos que la moda no se trata solo de seguir las tendencias, sino de hacer una declaraci&oacute;n audaz y aut&eacute;ntica. Desde los desfiles de pasarela m&aacute;s prestigiosos hasta las influencias culturales que moldean la moda, nuestro objetivo es mantenerte conectado con lo &uacute;ltimo en el mundo del vestuario y la belleza.\r\n\r\n&iquest;Interesado en descubrir c&oacute;mo integrar las tendencias m&aacute;s recientes en tu guardarropa diario? &iquest;Quieres conocer los secretos detr&aacute;s de los looks ic&oacute;nicos de celebridades y c&oacute;mo recrearlos por menos? &iquest;O simplemente buscas consejos para lograr una apariencia elegante y sofisticada sin esfuerzo? ChicTrends est&aacute; aqu&iacute; para inspirarte y guiarte en cada paso de tu viaje de moda.\r\n\r\nNuestro equipo de apasionados escritores y expertos en moda te llevar&aacute; detr&aacute;s de bambalinas en el mundo de los dise&ntilde;adores, te presentar&aacute; nuevas marcas emergentes y te proporcionar&aacute; consejos pr&aacute;cticos para encontrar tu estilo personal. Desde combinaciones de colores hasta accesorios esenciales y consejos para todas las estaciones, ChicTrends te mantendr&aacute; actualizado y te ayudar&aacute; a perfeccionar tu estilo.\r\n\r\n&Uacute;nete a nosotros mientras exploramos las &uacute;ltimas tendencias, destilamos la moda de alta gama en opciones accesibles y creamos un espacio donde puedas compartir tu propio estilo &uacute;nico. ChicTrends es tu aliado en el emocionante viaje de autodescubrimiento a trav&eacute;s de la moda y el estilo. &iexcl;Prep&aacute;rate para reinventar tu armario y expresar tu personalidad a trav&eacute;s de la moda en ChicTrends!', '&iexcl;Bienvenidos a ChicTrends, el destino definitivo para los amantes de la moda y el estilo! En este blog, te sumergir&aacute;s en un mundo de tendencias en constante evoluci&oacute;n, inspiraci&oacute;n &uacute;nica y consejos para lucir siempre a la &uacute;ltima. Si te apasiona la moda, la creatividad y deseas expresarte a trav&eacute;s de tu estilo personal, has llegado al lugar adecuado.', '&quot;ChicTrends: Tu Gu&iacute;a de Moda y Estilo&quot;', 88, 9),
(8, 'En MarketMinds, comprendemos que el marketing va m&aacute;s all&aacute; de simplemente vender productos; es sobre conectar con las audiencias de manera significativa y construir relaciones duraderas. Desde estrategias digitales hasta campa&ntilde;as de marca, nuestro objetivo es explorar cada faceta del marketing y brindarte informaci&oacute;n valiosa para tomar decisiones informadas.\r\n\r\n&iquest;Deseas descubrir c&oacute;mo aprovechar al m&aacute;ximo las redes sociales para impulsar tu presencia en l&iacute;nea? &iquest;Quieres aprender sobre la psicolog&iacute;a del consumidor y c&oacute;mo influir en las decisiones de compra? &iquest;O tal vez buscas consejos para crear una estrategia de marketing integrada que resuene con tu audiencia? MarketMinds est&aacute; aqu&iacute; para proporcionarte ideas y conocimientos que te ayudar&aacute;n a navegar por el mundo del marketing con confianza.\r\n\r\nNuestro equipo de expertos en marketing y comunicaci&oacute;n se sumerge en los conceptos m&aacute;s profundos, desmitificando las t&aacute;cticas y tendencias para que puedas aplicarlas en tu propio negocio. Desde an&aacute;lisis de casos exitosos hasta gu&iacute;as paso a paso y consejos pr&aacute;cticos, MarketMinds est&aacute; dedicado a proporcionarte las herramientas necesarias para destacar en el competitivo mundo del marketing.\r\n\r\n&Uacute;nete a nosotros en este emocionante viaje. Explora las &uacute;ltimas tendencias, desentra&ntilde;a las estrategias detr&aacute;s de las campa&ntilde;as exitosas y comparte tus propias experiencias en la comunidad en l&iacute;nea de MarketMinds. Juntos, transformaremos el marketing de una disciplina en un arte, aprovechando la creatividad y la estrategia para alcanzar resultados sobresalientes. &iexcl;Bienvenidos a MarketMinds, donde el conocimiento del marketing se fusiona con la innovaci&oacute;n!', '&iexcl;Bienvenidos a MarketMinds, el espacio donde el marketing cobra vida y se convierte en una poderosa herramienta para impulsar el &eacute;xito empresarial! En este blog, exploraremos las estrategias m&aacute;s efectivas, las &uacute;ltimas tendencias y las ideas innovadoras que est&aacute;n redefiniendo el mundo del marketing. Si eres un apasionado del marketing, un empresario en ciernes o alguien que busca ampliar sus conocimientos en esta din&aacute;mica disciplina, has llegado al lugar adecuado.', '&quot;MarketMinds: Desentra&ntilde;ando el Arte del Marketing&quot;', 89, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id_proyecto` int(30) NOT NULL,
  `id_propietario` int(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `sector` int(30) NOT NULL,
  `short_description` varchar(500) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `needs_description` text DEFAULT NULL,
  `imagen` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id_proyecto`, `id_propietario`, `nombre`, `sector`, `short_description`, `description`, `needs_description`, `imagen`) VALUES
(60, 24, 'Libro contable', 5, 'Proyecto sobre como automatizar la contabilidad de una empresa.', 'Los libros contables son fundamentales para ordenar las finanzas de una empresa. Gracias a ellos la empresa puede llevar un registro contable, realizar el balance anual y cumplir con sus obligaciones fiscales de forma correcta.', 'Necesidad de tener conocimientos financieros, tecnológicos y contables.', 81),
(61, 24, 'Marketing', 3, 'Plan de marketing completo.', '&iquest;C&oacute;mo hacer un plan de marketing para una empresa de servicios?\r\nLa realizaci&oacute;n de un plan de marketing para una empresa de servicios es muy similar al desarrollo de un plan de marketing de producto, pero con alguna variaci&oacute;n.\r\nAn&aacute;lisis interno y externo del punto de partida en el que nos encontramos\r\nTener claro nuestro posicionamiento y ventaja competitiva\r\nDefinir nuestro p&uacute;blico objetivo\r\nObjetivos SMART bien definidos\r\nDefinir la estrategia de precios\r\nDefinir las estrategias de comunicaci&oacute;n\r\nDefinir las t&eacute;cnicas de venta\r\nPlan de acci&oacute;n y puesta en marcha\r\nPlan econ&oacute;mico\r\nEvaluaci&oacute;n del plan de marketing', 'Se necesitan conocimientos b&aacute;sicos de marketing.', 82),
(62, 24, 'Desafio', 2, 'Los videojuegos ponen a sus protagonistas en situaciones de mando, mejorando su capacidad para resolver conflictos, dirigir a otros personajes y tomar decisiones seg&uacute;n la Universidad de Pittsburgh.', '&quot;Realm of Command: Desaf&iacute;o Estrat&eacute;gico&quot; es un emocionante proyecto de videojuego que se enfoca en mejorar las habilidades de liderazgo y toma de decisiones de los jugadores. Ambientado en un mundo de fantas&iacute;a &eacute;pica, el juego sumerge a los protagonistas en situaciones de mando en las que deben resolver conflictos, dirigir a otros personajes y tomar decisiones estrat&eacute;gicas para avanzar en la historia.', 'Desarrollo Narrativo: Escritores y dise&ntilde;adores para crear una trama convincente y personajes memorables.\r\n\r\nDise&ntilde;o y Arte Gr&aacute;fico: Artistas para construir los entornos, personajes y objetos visuales.\r\n\r\nProgramaci&oacute;n y Desarrollo: Desarrolladores para implementar mec&aacute;nicas de juego, IA y sistemas de decisi&oacute;n.\r\n\r\nM&uacute;sica y Sonido: Compositores y dise&ntilde;adores de sonido para crear una experiencia auditiva envolvente.\r\n\r\nTesteo y Ajustes: Equipo de control de calidad para identificar errores y ajustar la jugabilidad.', 83),
(63, 24, 'Estilo de moda', 4, 'Proyecto de moda innovador', 'Proyecto de moda innovador que se centra en abordar los desaf&iacute;os ambientales y sociales a trav&eacute;s de dise&ntilde;os vanguardistas y pr&aacute;cticas sostenibles. El proyecto busca no solo crear prendas elegantes y modernas, sino tambi&eacute;n promover un cambio positivo en la industria de la moda.', 'Sostenibilidad en el Dise&ntilde;o: El proyecto se enfoca en la creaci&oacute;n de prendas de alta calidad utilizando materiales sostenibles, como algod&oacute;n org&aacute;nico, tejidos reciclados y tintes naturales. Los dise&ntilde;adores colaboran estrechamente con expertos en textiles sostenibles para garantizar la eco-amigabilidad de las prendas.\r\n\r\nModa Circular: Se implementa un enfoque de moda circular, que incluye dise&ntilde;os vers&aacute;tiles y duraderos, as&iacute; como programas de reciclaje y reutilizaci&oacute;n. Se promueve la idea de que la moda no tiene que ser desechable, alentando a los consumidores a invertir en prendas de calidad que perduren con el tiempo.\r\n\r\nTransparencia y &Eacute;tica: El proyecto se compromete a la transparencia en toda la cadena de suministro, desde la obtenci&oacute;n de materiales hasta la producci&oacute;n final. Se asegura que las condiciones de trabajo sean &eacute;ticas y seguras para todos los involucrados en la fabricaci&oacute;n de las prendas.\r\n\r\nInnovaci&oacute;n y Tecnolog&iacute;a: Se explora la innovaci&oacute;n en procesos de fabricaci&oacute;n de moda, como la impresi&oacute;n 3D de textiles y el uso de tecnolog&iacute;as avanzadas para minimizar el desperdicio de materiales.\r\n\r\nEducaci&oacute;n y Conciencia: Adem&aacute;s de la l&iacute;nea de moda, el proyecto tiene una dimensi&oacute;n educativa. Se organizan talleres y eventos para educar a la comunidad sobre la importancia de la moda sostenible y c&oacute;mo pueden hacer elecciones conscientes.', 84),
(64, 24, 'Camino al Conocimiento', 1, 'Ofrece educaci&oacute;n enriquecedora para todos, desde cursos t&eacute;cnicos hasta desarrollo personal, con enfoque en m&eacute;todos innovadores y tecnolog&iacute;a educativa avanzada. Prep&aacute;rate para un futuro prometedor.', 'Este proyecto de formaci&oacute;n acad&eacute;mica tiene como objetivo brindar oportunidades educativas enriquecedoras y accesibles para individuos de todas las edades y niveles. A trav&eacute;s de una variedad de cursos, talleres y recursos, buscamos fomentar el aprendizaje continuo, fortalecer las habilidades cognitivas y preparar a las personas para enfrentar los desaf&iacute;os de un mundo en constante evoluci&oacute;n. Nuestros programas se basan en m&eacute;todos pedag&oacute;gicos innovadores, tecnolog&iacute;a educativa de vanguardia y un enfoque en el desarrollo personal y profesional integral.', 'Expertos en Educaci&oacute;n: Profesionales con experiencia pedag&oacute;gica para dise&ntilde;ar planes de estudio efectivos y adaptados a diferentes niveles de aprendizaje.\r\n\r\nDesarrolladores de Contenido: Personas capaces de crear material educativo interactivo, incluyendo videos, presentaciones y ejercicios.\r\n\r\nTecnolog&iacute;a Educativa: Expertos en implementar plataformas de aprendizaje en l&iacute;nea, sistemas de gesti&oacute;n de cursos y herramientas de interacci&oacute;n virtual.\r\n\r\nInstructores Cualificados: Educadores competentes para ense&ntilde;ar cursos en l&iacute;nea y presenciales, asegurando una experiencia de aprendizaje valiosa.', 85),
(65, 24, 'Cora influencer', 4, 'Cora, una influencer apasionada por la moda y el estilo de vida sostenible. A trav&eacute;s de su contenido creativo en redes sociales, inspira a sus seguidores a adoptar decisiones conscientes y &eacute;ticas en su manera de vestir y vivir. Desde consejos de moda hasta recomendaciones ecoamigables, Cora se destaca por su autenticidad y compromiso con un mundo m&aacute;s verde y consciente.', 'Cora es mucho m&aacute;s que una influencer de moda; es una voz dedicada a promover un estilo de vida sostenible y responsable. Con una profunda pasi&oacute;n por la moda y la &eacute;tica, Cora se ha ganado el respeto y la admiraci&oacute;n de una comunidad creciente que busca adoptar decisiones m&aacute;s conscientes en su d&iacute;a a d&iacute;a.\r\n\r\nA trav&eacute;s de su contenido en redes sociales, Cora no solo presenta atuendos elegantes y tendencias de moda, sino que tambi&eacute;n destaca la importancia de la sostenibilidad en la industria. Sus publicaciones van m&aacute;s all&aacute; de lo superficial, ya que comparte informaci&oacute;n valiosa sobre materiales sostenibles, marcas &eacute;ticas y formas de reducir el impacto ambiental a trav&eacute;s de nuestras elecciones de vestimenta.\r\n\r\nLo que distingue a Cora es su autenticidad. No se trata solo de mostrar productos; se trata de mostrar c&oacute;mo las decisiones pueden hacer una diferencia significativa en el mundo. A menudo comparte sus propias experiencias y desaf&iacute;os en su viaje hacia un estilo de vida m&aacute;s sostenible, lo que hace que sus seguidores se sientan conectados y motivados para hacer cambios positivos en sus propias vidas.\r\n\r\nCora tambi&eacute;n colabora con organizaciones ben&eacute;ficas y marcas que comparten sus valores, lo que demuestra su compromiso genuino con la causa. Ya sea al presentar proyectos de reciclaje creativos, compartir consejos para prolongar la vida &uacute;til de la ropa o alentar a sus seguidores a comprar de manera m&aacute;s consciente, Cora se ha convertido en una gu&iacute;a confiable para aquellos que buscan un equilibrio entre el estilo y la sostenibilidad.\r\n\r\nEn un mundo donde la industria de la moda a menudo se ha centrado en lo ef&iacute;mero, Cora se erige como una voz influyente que impulsa el cambio. Su mensaje es claro: la moda puede ser hermosa y &eacute;tica al mismo tiempo, y cada peque&ntilde;a elecci&oacute;n importa en la construcci&oacute;n de un futuro m&aacute;s sostenible para todos.', 'Contenido Creativo: Cora necesita creatividad constante para generar contenido visualmente atractivo y significativo que resuene con su audiencia.\r\n\r\nInvestigaci&oacute;n y Educaci&oacute;n: Mantenerse informada sobre tendencias de moda sostenible, marcas &eacute;ticas y novedades en el campo para compartir informaci&oacute;n precisa y actualizada.\r\n\r\nColaboraciones Estrat&eacute;gicas: Colaboraciones con marcas alineadas con sus valores para fortalecer su mensaje y diversificar su contenido.\r\n\r\nHerramientas de Edici&oacute;n y Producci&oacute;n: Software y equipo de edici&oacute;n para crear contenido de alta calidad y coherente en diferentes plataformas.\r\n\r\nGesti&oacute;n de Comunidad: Tiempo y energ&iacute;a para interactuar con sus seguidores, responder preguntas y fomentar una comunidad comprometida.\r\n\r\nPlataformas de Distribuci&oacute;n: Acceso a diversas redes sociales y plataformas de contenido para llegar a un p&uacute;blico m&aacute;s amplio.\r\n\r\nEquilibrio Personal y Profesional: Estrategias para mantener un equilibrio saludable entre su vida personal y su trabajo como influencer.\r\n\r\nApoyo T&eacute;cnico: Recursos para manejar problemas t&eacute;cnicos y desaf&iacute;os relacionados con las plataformas digitales.\r\n\r\nInvestigaci&oacute;n de Audiencia: Herramientas para comprender mejor a su audiencia y adaptar su contenido a sus intereses y necesidades.\r\n\r\nCapacitaci&oacute;n Continua: Cursos y talleres relacionados con moda sostenible, &eacute;tica empresarial y marketing digital.', 86),
(66, 25, 'ExpressVibe', 4, '&quot;ExpressVibe&quot; es un proyecto de moda pensado exclusivamente para la generaci&oacute;n adolescente, fusionando las tendencias m&aacute;s frescas con la tecnolog&iacute;a interactiva.', 'Nuestro objetivo es ofrecer a los j&oacute;venes una experiencia &uacute;nica en moda que refleje su individualidad y les permita expresarse de manera aut&eacute;ntica en la era digital.', 'Caracter&iacute;sticas Clave:\r\n\r\nColecciones Adaptables: Dise&ntilde;amos ropa y accesorios adaptables que se pueden personalizar seg&uacute;n los gustos y estados de &aacute;nimo cambiantes de los adolescentes. Desde chaquetas con paneles LED hasta camisetas con gr&aacute;ficos interactivos, cada prenda es una pantalla en blanco para la creatividad personal.\r\n\r\nAplicaci&oacute;n de Moda Personalizada: A trav&eacute;s de nuestra aplicaci&oacute;n m&oacute;vil, los adolescentes pueden crear combinaciones &uacute;nicas de colores, patrones y efectos visuales para sus prendas. La aplicaci&oacute;n tambi&eacute;n se conecta con las prendas para mostrar mensajes y dise&ntilde;os personalizados en tiempo real.\r\n\r\nComunidad en L&iacute;nea: Creamos una plataforma en l&iacute;nea donde los adolescentes pueden compartir sus creaciones, descubrir las tendencias m&aacute;s candentes y conectarse con otros j&oacute;venes apasionados por la moda. La plataforma tambi&eacute;n presenta desaf&iacute;os y concursos para fomentar la creatividad.', 92),
(67, 25, 'CodeMentor', 1, 'CodeMentor es un innovador proyecto de formaci&oacute;n en el que aspiramos a transformarte en un experto en programaci&oacute;n a trav&eacute;s de clases particulares altamente personalizadas. Nuestro enfoque se basa en comprender tus objetivos, habilidades y estilo de aprendizaje para dise&ntilde;ar un plan de estudio que te lleve desde los conceptos b&aacute;sicos hasta el dominio de lenguajes y tecnolog&iacute;as avanzadas.', 'CodeMentor tiene como objetivo no solo ense&ntilde;arte a programar, sino tambi&eacute;n empoderarte con habilidades que te permitir&aacute;n sobresalir en la industria tecnol&oacute;gica en constante evoluci&oacute;n. A trav&eacute;s de la mentor&iacute;a personalizada y el enfoque en proyectos pr&aacute;cticos, estamos creando programadores seguros y capaces de abordar desaf&iacute;os reales.\n\nSi est&aacute;s listo para embarcarte en un viaje de aprendizaje que se adapte a ti y te lleve de principiante a experto en programaci&oacute;n, &quot;CodeMentor&quot; te espera. Prep&aacute;rate para transformar tus sue&ntilde;os en l&iacute;neas de c&oacute;digo y desbloquear un mundo de oportunidades en el &aacute;mbito tecnol&oacute;gico.', 'Conocimiento en diversos lenguajes de programaci&oacute;n', 93);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_usuario_aptitud`
--

CREATE TABLE `rel_usuario_aptitud` (
  `id_relacion` int(30) NOT NULL,
  `id_usuario` int(30) NOT NULL,
  `id_aptitud` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rel_usuario_aptitud`
--

INSERT INTO `rel_usuario_aptitud` (`id_relacion`, `id_usuario`, `id_aptitud`) VALUES
(18, 24, 2),
(19, 25, 2),
(20, 26, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sectores`
--

CREATE TABLE `sectores` (
  `id_sector` int(30) NOT NULL,
  `descripcion` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sectores`
--

INSERT INTO `sectores` (`id_sector`, `descripcion`) VALUES
(1, 'Formación'),
(2, 'Videojuegos'),
(3, 'Comunicación'),
(4, 'Estilo de Vida'),
(5, 'Tecnología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `ubicacion` varchar(15) DEFAULT NULL,
  `nombre_usuario` varchar(30) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `clave` varchar(75) NOT NULL,
  `rol` varchar(6) DEFAULT NULL,
  `imagen` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `ubicacion`, `nombre_usuario`, `correo`, `clave`, `rol`, `imagen`) VALUES
(9, 'Administrador', 'usuario', NULL, 'Administrador de usuario', 'admin@factoriastartup.com', '$2y$10$UhAZdQl.Yjlb2PFONGCaeelzuNpH6jMn57EmZi1PLC/3I0GqAuLKK', 'admin', NULL),
(24, 'Mar&iacute;a Bel&eacute;n', 'Herruzo Barroso', NULL, 'mherruzo@ucm.es', 'mherruzo@ucm.es', '$2y$10$ci46AmiC5XtG3MTnLq7r8.kFTsuwpQL3aaDJ6YrbbxK0evKpVl9hq', 'user', 80),
(25, 'Leire', 'Fernandez', NULL, 'leire@gmail.com', 'leire@gmail.com', '$2y$10$K32XgO43GVAS6jbF52PI0epT8xsoWCc70IxOABpbTizu8adlJXQrC', 'user', 90),
(26, 'Miriam', 'Garcia Godoy', NULL, 'miri@ucm.es', 'miri@ucm.es', '$2y$10$Cr/9koe9oKmBi3bcUYgxYOe/Ku6MePG455AWpVQruGTpJmkE2vsT2', 'user', 91);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aptitudes`
--
ALTER TABLE `aptitudes`
  ADD PRIMARY KEY (`id_aptitud`);

--
-- Indices de la tabla `busqueda_colaboradores`
--
ALTER TABLE `busqueda_colaboradores`
  ADD PRIMARY KEY (`id_busqueda`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_aptitud` (`id_aptitud`);

--
-- Indices de la tabla `busqueda_proyectos`
--
ALTER TABLE `busqueda_proyectos`
  ADD PRIMARY KEY (`id_busqueda`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `busqueda_sector`
--
ALTER TABLE `busqueda_sector`
  ADD PRIMARY KEY (`id_busqueda`),
  ADD KEY `id_sector` (`id_sector`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `id_propietario` (`id_propietario`),
  ADD KEY `id_proyecto` (`id_proyecto`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id_match`),
  ADD KEY `id_busqueda_colab` (`id_busqueda_colab`),
  ADD KEY `id_busqueda_proy` (`id_busqueda_proy`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_padre` (`id_padre`),
  ADD KEY `autor` (`autor`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `imagen` (`imagen`),
  ADD KEY `imagen_2` (`imagen`),
  ADD KEY `id_propietario` (`id_propietario`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id_proyecto`),
  ADD KEY `id_propietario` (`id_propietario`),
  ADD KEY `imagen` (`imagen`),
  ADD KEY `sector` (`sector`);

--
-- Indices de la tabla `rel_usuario_aptitud`
--
ALTER TABLE `rel_usuario_aptitud`
  ADD PRIMARY KEY (`id_relacion`),
  ADD KEY `id_usuario` (`id_usuario`,`id_aptitud`),
  ADD KEY `id_aptitud` (`id_aptitud`);

--
-- Indices de la tabla `sectores`
--
ALTER TABLE `sectores`
  ADD PRIMARY KEY (`id_sector`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`,`correo`),
  ADD KEY `imagen` (`imagen`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aptitudes`
--
ALTER TABLE `aptitudes`
  MODIFY `id_aptitud` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `busqueda_colaboradores`
--
ALTER TABLE `busqueda_colaboradores`
  MODIFY `id_busqueda` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT de la tabla `busqueda_proyectos`
--
ALTER TABLE `busqueda_proyectos`
  MODIFY `id_busqueda` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `busqueda_sector`
--
ALTER TABLE `busqueda_sector`
  MODIFY `id_busqueda` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de la tabla `matches`
--
ALTER TABLE `matches`
  MODIFY `id_match` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305801;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id_proyecto` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `rel_usuario_aptitud`
--
ALTER TABLE `rel_usuario_aptitud`
  MODIFY `id_relacion` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `sectores`
--
ALTER TABLE `sectores`
  MODIFY `id_sector` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `busqueda_colaboradores`
--
ALTER TABLE `busqueda_colaboradores`
  ADD CONSTRAINT `busqueda_colaboradores_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `busqueda_colaboradores_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id_proyecto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `busqueda_colaboradores_ibfk_3` FOREIGN KEY (`id_aptitud`) REFERENCES `aptitudes` (`id_aptitud`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `busqueda_proyectos`
--
ALTER TABLE `busqueda_proyectos`
  ADD CONSTRAINT `busqueda_proyectos_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id_proyecto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `busqueda_proyectos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `busqueda_sector`
--
ALTER TABLE `busqueda_sector`
  ADD CONSTRAINT `busqueda_sector_ibfk_1` FOREIGN KEY (`id_sector`) REFERENCES `sectores` (`id_sector`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `busqueda_sector_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eventos_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id_proyecto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`id_busqueda_proy`) REFERENCES `busqueda_proyectos` (`id_busqueda`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`id_busqueda_colab`) REFERENCES `busqueda_colaboradores` (`id_busqueda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`id_padre`) REFERENCES `mensajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`imagen`) REFERENCES `imagenes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`id_propietario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proyectos_ibfk_2` FOREIGN KEY (`imagen`) REFERENCES `imagenes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `proyectos_ibfk_3` FOREIGN KEY (`sector`) REFERENCES `sectores` (`id_sector`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rel_usuario_aptitud`
--
ALTER TABLE `rel_usuario_aptitud`
  ADD CONSTRAINT `rel_usuario_aptitud_ibfk_1` FOREIGN KEY (`id_aptitud`) REFERENCES `aptitudes` (`id_aptitud`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_usuario_aptitud_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`imagen`) REFERENCES `imagenes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
