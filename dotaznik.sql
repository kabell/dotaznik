-- phpMyAdmin SQL Dump
-- version 4.4.4
-- http://www.phpmyadmin.net
--
-- Počítač: sql.endora.cz:3308
-- Vytvořeno: Sob 12. zář 2015, 23:24
-- Verze serveru: 5.5.38-35.2-log
-- Verze PHP: 5.4.42

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `dotaznik`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `answered`
--

CREATE TABLE IF NOT EXISTS `answered` (
  `id` int(11) NOT NULL,
  `testid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `answered`
--

INSERT INTO `answered` (`id`, `testid`, `groupid`, `userid`, `score`, `time`) VALUES
(5, 2, 0, 1, 67, 1442077773);

-- --------------------------------------------------------

--
-- Struktura tabulky `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `classes`
--

INSERT INTO `classes` (`id`, `name`) VALUES
(1, 'príma'),
(2, 'sekunda'),
(3, 'tercia'),
(4, 'kvarta'),
(5, 'kvinta'),
(6, 'sexta'),
(7, 'septima'),
(8, 'oktáva'),
(9, 'I.A'),
(10, 'I.B'),
(11, 'I.C'),
(12, 'II.A'),
(13, 'II.B'),
(14, 'II.C'),
(15, 'III.A'),
(16, 'III.B'),
(17, 'III.C'),
(18, 'IV.A'),
(19, 'IV.B'),
(20, 'IV.C');

-- --------------------------------------------------------

--
-- Struktura tabulky `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL,
  `password` varchar(40) NOT NULL,
  `trieda` int(11) NOT NULL,
  `admin` int(11) DEFAULT '0',
  `blocked` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `login`
--

INSERT INTO `login` (`id`, `password`, `trieda`, `admin`, `blocked`) VALUES
(1, '123456', 1, 0, 0),
(3, '1234', 2, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL,
  `task` varchar(500) NOT NULL,
  `expected` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `tasks`
--

INSERT INTO `tasks` (`id`, `task`, `expected`) VALUES
(1, 'Tento učiteľ prispieva k vytváraniu pekných vzťahov medzi žiakmi', 1),
(2, 'Tiež na hodinách jeho predmetu možno rozvíjať vzájomné priateľstvá', 1),
(3, 'Na hodinách tohto predmetu zažívame často zábavu', 1),
(4, 'Učiteľ a žiaci sa stretávajú tiež niekedy mimo vyučovania vo voľnom čase', 1),
(5, 'Keď žiaci majú nejaké problémy s vyučovaním tohto predmetu, tak si vzájomne pomáhajú', 1),
(6, 'Niektorým žiakom ostatní spolužiaci nadávajú alebo sa posmievajú aj na hodinách tohto predmetu', 2),
(7, 'U tohto učiteľa sa žiaci snažia dosiahnuť čo najlepšie výsledky', 1),
(8, 'S týmto učiteľom žiakov učenie sa a práca baví', 1),
(9, 'Keď si to učiteľ praje, pracujú žiaci viac ako inokedy', 1),
(10, 'Pri tomto učiteľovi sú žiaci dosť leniví', 2),
(11, 'Keď učiteľ zadá úlohu, žiaci hneď pracujú', 1),
(12, 'Pri tomto učiteľovi si žiaci sami snažia obstarávať rôzne učebné pomôcky', 1),
(13, 'Učiteľ podporuje, aby niektorí žiaci vynikali, neberúc ohľad na iných žiakov', 2),
(14, 'Učiteľ necháva žiakov často spolupracovať', 1),
(15, 'Na vyučovaní tohto predmetu sú žiaci vedení k vzájomnej tolerancii', 1),
(16, 'Pri tomto učiteľovi môžeme pomôcť spolužiakom, ktorí majú problémy', 1),
(17, 'Keď žiaci niečomu nerozumejú na hodinách tohto predmetu, samozrejme im pomáhajú aj spolužiaci', 1),
(18, 'Keď žiaci spoločne pracujú na hodinách tohto predmetu, potom majú férovo rozdelené úlohy', 1),
(19, 'Učiteľ zadáva žiakom také úlohy, ktoré sú schopní riešiť a vyriešiť', 1),
(20, 'Na vyučovaní tohto predmetu pracujeme s rôznymi pomôckami', 1),
(21, 'Skôr než učiteľ prejde k ďalšiemu učivu, zisťuje, či žiaci ovládajú staré učivo', 1),
(22, 'Na pomalších žiakov neberie tento učiteľ žiadny ohľad', 2),
(23, 'Učiteľ často prehliada osobitné úsilie žiakov', 2),
(24, 'Učiteľ má radosť spolu so žiakmi, keď podávajú dobré výkony', 1),
(25, 'Učiteľ očakáva od žiakov, že sa na vyučovaní sústredia', 1),
(26, 'Väčšina žiakov pozorne sleduje, čo učiteľ hovorí', 1),
(27, 'U tohto učiteľa sa na vyučovaní premárni veľa času pre zbytočné veci', 2),
(28, 'Učiteľ si nájde čas pre problémy triedy, ale po ich vyriešení sa ihneď zasa učíme', 1),
(29, 'Učiteľ dáva pozor, aby sme sa na vyučovaní skutočne učili', 1),
(30, 'Učiteľ sa ľahko nechá odpútať od hlavnej témy vyučovania', 2),
(31, 'Učiteľ predkladá jasné ciele a úlohy, každý vie, čo má robiť', 1),
(32, 'Tento učiteľ má dobre pripravené vyučovanie', 1),
(33, 'Na hodinách tohto predmetu mnohí žiaci vyrušujú, takže trpí úroveň vyučovania', 2),
(34, 'Na vyučovaní tohto predmetu často vládne zmätok', 2),
(35, 'Učiteľ musí žiakov často napomínať', 2),
(36, 'Strácame dôležitý vyučovací čas, pretože učiteľ prichádza na vyučovanie často neskoro', 2),
(37, 'Tento učiteľ má mnoho pravidiel, podľa ktorých sa majú študenti riadiť', 2),
(38, 'Pri tomto učiteľovi žiaci presne vedia čo sa stane, keď niečo podniknú', 1),
(39, 'Zákazy toho učiteľa musia byť rešpektované', 1),
(40, 'Tento učiteľ určuje pravidlá sám, bez zdôvodnenia a bez účasti triedy', 2),
(41, 'Závisí na nálade učiteľa, či pri previneniach proti poriadku je prísny, alebo veľkorysý', 2),
(42, 'Tento učiteľ stanovuje stále nové príkazy a zákazy', 2),
(43, 'Keď sú problémy, už dopredu vychádza učiteľ z toho, že žiaci nemajú pravdu', 2),
(44, 'Učiteľ máva nevhodné poznámky o žiakoch, ktorí nemôžu zodpovedať otázku', 2),
(45, 'Učiteľ spravodlivo hodnotí naše správanie a prácu', 1),
(46, 'Učiteľ často chváli výkony žiakov', 1),
(47, 'Učiteľ je k žiakom nepriateľský', 2),
(48, 'Učiteľ nám často nadáva a kričí', 2),
(49, 'Vyučovanie tohto predmetu prebieha väčšinou jednotvárne, nudne', 2),
(50, 'Neučíme sa len v triede, ale navštevujeme tiež niektoré miesta mimo školy', 1),
(51, 'Učiteľ pozýva na vyučovanie odborníkov z rôznych oblastí', 1),
(52, 'Vo vyučovaní sú žiaci aktívni a pracovití', 1),
(53, 'Učiteľ vyzýva tiež žiakov, aby navrhovali, čo a ako sa má vo vyučovaní robiť', 1),
(54, 'U tohto učiteľa sa zapájajú na vyučovaní stále tí istí žiaci', 2),
(55, 'Učiteľ vyučuje svoj predmet s nadšením', 1),
(56, 'Učiteľ dokáže veľmi dobre vysvetliť učivo', 1),
(57, 'Učiteľ učí nudne a nemá zmysel pre humor', 2),
(58, 'Keď učiteľ žiakom niečo vysvetľuje, často porovnáva rôzne myšlienky a informácie a tiež vyjadruje vlastný názor', 1),
(59, 'Keď sa žiaci pýtajú učiteľa na niektoré veci, ktoré súvisia s učivom, často im nedokáže odpovedať\r\n', 2),
(60, 'Učiteľ nám oznamuje len to, čo je v učebnici', 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `tests`
--

CREATE TABLE IF NOT EXISTS `tests` (
  `testid` int(11) NOT NULL,
  `trieda` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `nazov` varchar(40) NOT NULL,
  `ucitel` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=517 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `tests`
--

INSERT INTO `tests` (`testid`, `trieda`, `groupid`, `nazov`, `ucitel`) VALUES
(5, 1, 2, '34', 8),
(4, 1, 1, '13', 33),
(6, 1, 3, '1', 17),
(7, 1, 3, '1', 10),
(8, 1, 4, '22', 29),
(9, 1, 4, '22', 16),
(10, 1, 5, '39', 17),
(11, 1, 5, '39', 9),
(12, 1, 6, '19', 26),
(13, 1, 7, '20', 18),
(14, 1, 7, '7', 10),
(15, 1, 8, '2', 23),
(16, 1, 9, '11', 34),
(17, 1, 10, '3', 19),
(18, 1, 11, '14', 13),
(19, 1, 11, '14', 3),
(20, 1, 12, '10', 13),
(21, 1, 13, '12', 8),
(22, 1, 14, '42', 8),
(23, 1, 15, '23', 21),
(24, 2, 1, '1', 11),
(25, 2, 1, '1', 14),
(26, 2, 2, '22', 29),
(27, 2, 2, '22', 16),
(28, 2, 3, '34', 19),
(29, 2, 4, '10', 13),
(30, 2, 5, '39', 9),
(31, 2, 5, '39', 5),
(32, 2, 6, '19', 27),
(33, 2, 7, '2', 23),
(34, 2, 8, '3', 19),
(35, 2, 9, '12', 8),
(36, 2, 10, '7', 10),
(37, 2, 10, '20', 18),
(38, 2, 11, '14', 27),
(39, 2, 11, '14', 23),
(40, 2, 11, '14', 13),
(41, 2, 12, '23', 21),
(42, 2, 13, '13', 33),
(43, 2, 14, '11', 34),
(44, 2, 15, '38', 2),
(45, 2, 16, '42', 8),
(46, 3, 1, '10', 13),
(47, 3, 2, '1', 15),
(48, 3, 3, '19', 26),
(49, 3, 4, '34', 28),
(50, 3, 5, '39', 5),
(51, 3, 5, '39', 9),
(52, 3, 6, '20', 32),
(53, 3, 6, '7', 10),
(54, 3, 7, '22', 29),
(55, 3, 8, '38', 2),
(56, 3, 9, '11', 34),
(57, 3, 10, '13', 33),
(58, 3, 11, '3', 29),
(59, 3, 12, '23', 21),
(60, 3, 13, '41', 8),
(61, 3, 14, '14', 27),
(62, 3, 14, '14', 35),
(63, 3, 15, '2', 12),
(64, 4, 1, '19', 23),
(65, 4, 2, '22', 30),
(66, 4, 2, '22', 16),
(67, 4, 3, '13', 33),
(68, 4, 4, '34', 25),
(69, 4, 5, '39', 9),
(70, 4, 5, '39', 5),
(71, 4, 6, '10', 13),
(72, 4, 7, '20', 32),
(73, 4, 7, '7', 10),
(74, 4, 8, '41', 25),
(75, 4, 9, '2', 20),
(76, 4, 10, '1', 34),
(77, 4, 10, '1', 11),
(78, 4, 11, '11', 34),
(79, 4, 12, '3', 21),
(80, 4, 13, '23', 6),
(81, 4, 14, '14', 27),
(82, 4, 14, '14', 35),
(83, 5, 1, '1', 10),
(84, 5, 2, '19', 27),
(85, 5, 3, '22', 16),
(86, 5, 4, '10', 27),
(87, 5, 5, '2', 12),
(88, 5, 6, '39', 9),
(89, 5, 6, '39', 5),
(90, 5, 7, '3', 19),
(91, 5, 8, '34', 19),
(92, 5, 9, '11', 21),
(93, 5, 10, '13', 33),
(94, 5, 11, '40', 25),
(95, 5, 12, '7', 10),
(96, 5, 12, '20', 32),
(97, 5, 13, '5', 12),
(98, 5, 14, '14', 27),
(99, 5, 14, '14', 23),
(100, 6, 1, '1', 15),
(101, 6, 2, '19', 23),
(102, 6, 3, '34', 28),
(103, 6, 4, '22', 29),
(104, 6, 5, '11', 21),
(105, 6, 6, '39', 9),
(106, 6, 6, '39', 5),
(107, 6, 7, '10', 7),
(108, 6, 8, '2', 12),
(109, 6, 9, '14', 27),
(110, 6, 9, '14', 35),
(111, 6, 10, '13', 33),
(112, 6, 11, '7', 33),
(113, 6, 11, '20', 32),
(114, 1, 1, '13', 33),
(115, 1, 2, '34', 8),
(116, 1, 3, '1', 17),
(117, 1, 3, '1', 10),
(118, 1, 4, '22', 29),
(119, 1, 4, '22', 16),
(120, 1, 5, '39', 17),
(121, 1, 5, '39', 9),
(122, 1, 6, '19', 26),
(123, 1, 7, '20', 18),
(124, 1, 7, '7', 10),
(125, 1, 8, '2', 23),
(126, 1, 9, '11', 34),
(127, 1, 10, '3', 19),
(128, 1, 11, '14', 13),
(129, 1, 11, '14', 3),
(130, 1, 12, '10', 13),
(131, 1, 13, '12', 8),
(132, 1, 14, '42', 8),
(133, 1, 15, '23', 21),
(134, 2, 1, '1', 11),
(135, 2, 1, '1', 14),
(136, 2, 2, '22', 29),
(137, 2, 2, '22', 16),
(138, 2, 3, '34', 19),
(139, 2, 4, '10', 13),
(140, 2, 5, '39', 9),
(141, 2, 5, '39', 5),
(142, 2, 6, '19', 27),
(143, 2, 7, '2', 23),
(144, 2, 8, '3', 19),
(145, 2, 9, '12', 8),
(146, 2, 10, '7', 10),
(147, 2, 10, '20', 18),
(148, 2, 11, '14', 27),
(149, 2, 11, '14', 23),
(150, 2, 11, '14', 13),
(151, 2, 12, '23', 21),
(152, 2, 13, '13', 33),
(153, 2, 14, '11', 34),
(154, 2, 15, '38', 2),
(155, 2, 16, '42', 8),
(156, 3, 1, '10', 13),
(157, 3, 2, '1', 15),
(158, 3, 3, '19', 26),
(159, 3, 4, '34', 28),
(160, 3, 5, '39', 5),
(161, 3, 5, '39', 9),
(162, 3, 6, '20', 32),
(163, 3, 6, '7', 10),
(164, 3, 7, '22', 29),
(165, 3, 8, '38', 2),
(166, 3, 9, '11', 34),
(167, 3, 10, '13', 33),
(168, 3, 11, '3', 29),
(169, 3, 12, '23', 21),
(170, 3, 13, '41', 8),
(171, 3, 14, '14', 27),
(172, 3, 14, '14', 35),
(173, 3, 15, '2', 12),
(174, 4, 1, '19', 23),
(175, 4, 2, '22', 30),
(176, 4, 2, '22', 16),
(177, 4, 3, '13', 33),
(178, 4, 4, '34', 25),
(179, 4, 5, '39', 9),
(180, 4, 5, '39', 5),
(181, 4, 6, '10', 13),
(182, 4, 7, '20', 32),
(183, 4, 7, '7', 10),
(184, 4, 8, '41', 25),
(185, 4, 9, '2', 20),
(186, 4, 10, '1', 34),
(187, 4, 10, '1', 11),
(188, 4, 11, '11', 34),
(189, 4, 12, '3', 21),
(190, 4, 13, '23', 6),
(191, 4, 14, '14', 27),
(192, 4, 14, '14', 35),
(193, 5, 1, '1', 10),
(194, 5, 2, '19', 27),
(195, 5, 3, '22', 16),
(196, 5, 4, '10', 27),
(197, 5, 5, '2', 12),
(198, 5, 6, '39', 9),
(199, 5, 6, '39', 5),
(200, 5, 7, '3', 19),
(201, 5, 8, '34', 19),
(202, 5, 9, '11', 21),
(203, 5, 10, '13', 33),
(204, 5, 11, '40', 25),
(205, 5, 12, '7', 10),
(206, 5, 12, '20', 32),
(207, 5, 13, '5', 12),
(208, 5, 14, '14', 27),
(209, 5, 14, '14', 23),
(210, 6, 1, '1', 15),
(211, 6, 2, '19', 23),
(212, 6, 3, '34', 28),
(213, 6, 4, '22', 29),
(214, 6, 5, '11', 21),
(215, 6, 6, '39', 9),
(216, 6, 6, '39', 5),
(217, 6, 7, '10', 7),
(218, 6, 8, '2', 12),
(219, 6, 9, '14', 27),
(220, 6, 9, '14', 35),
(221, 6, 10, '13', 33),
(222, 6, 11, '7', 33),
(223, 6, 11, '20', 32),
(224, 6, 12, '40', 25),
(225, 8, 1, '1', 11),
(226, 8, 1, '1', 15),
(227, 8, 2, '34', 19),
(228, 8, 3, '22', 3),
(229, 8, 4, '8', 3),
(230, 8, 5, '19', 23),
(231, 8, 6, '39', 5),
(232, 8, 6, '39', 9),
(233, 8, 7, '40', 25),
(234, 8, 8, '23', 6),
(235, 8, 9, '18', 19),
(236, 9, 1, '13', 24),
(237, 9, 2, '1', 14),
(238, 9, 2, '1', 10),
(239, 9, 3, '5', 12),
(240, 9, 4, '19', 7),
(241, 9, 5, '22', 20),
(242, 1, 1, '13', 33),
(243, 1, 2, '34', 8),
(244, 1, 3, '1', 17),
(245, 1, 3, '1', 10),
(246, 1, 4, '22', 29),
(247, 1, 4, '22', 16),
(248, 1, 5, '39', 17),
(249, 1, 5, '39', 9),
(250, 1, 6, '19', 26),
(251, 1, 7, '20', 18),
(252, 1, 7, '7', 10),
(253, 1, 8, '2', 23),
(254, 1, 9, '11', 34),
(255, 1, 10, '3', 19),
(256, 1, 11, '14', 13),
(257, 1, 11, '14', 3),
(258, 1, 12, '10', 13),
(259, 1, 13, '12', 8),
(260, 1, 14, '42', 8),
(261, 1, 15, '23', 21),
(262, 2, 1, '1', 11),
(263, 2, 1, '1', 14),
(264, 2, 2, '22', 29),
(265, 2, 2, '22', 16),
(266, 2, 3, '34', 19),
(267, 2, 4, '10', 13),
(268, 2, 5, '39', 9),
(269, 2, 5, '39', 5),
(270, 2, 6, '19', 27),
(271, 2, 7, '2', 23),
(272, 2, 8, '3', 19),
(273, 2, 9, '12', 8),
(274, 2, 10, '7', 10),
(275, 2, 10, '20', 18),
(276, 2, 11, '14', 27),
(277, 2, 11, '14', 23),
(278, 2, 11, '14', 13),
(279, 2, 12, '23', 21),
(280, 2, 13, '13', 33),
(281, 2, 14, '11', 34),
(282, 2, 15, '38', 2),
(283, 2, 16, '42', 8),
(284, 3, 1, '10', 13),
(285, 3, 2, '1', 15),
(286, 3, 3, '19', 26),
(287, 3, 4, '34', 28),
(288, 3, 5, '39', 5),
(289, 3, 5, '39', 9),
(290, 3, 6, '20', 32),
(291, 3, 6, '7', 10),
(292, 3, 7, '22', 29),
(293, 3, 8, '38', 2),
(294, 3, 9, '11', 34),
(295, 3, 10, '13', 33),
(296, 3, 11, '3', 29),
(297, 3, 12, '23', 21),
(298, 3, 13, '41', 8),
(299, 3, 14, '14', 27),
(300, 3, 14, '14', 35),
(301, 3, 15, '2', 12),
(302, 4, 1, '19', 23),
(303, 4, 2, '22', 30),
(304, 4, 2, '22', 16),
(305, 4, 3, '13', 33),
(306, 4, 4, '34', 25),
(307, 4, 5, '39', 9),
(308, 4, 5, '39', 5),
(309, 4, 6, '10', 13),
(310, 4, 7, '20', 32),
(311, 4, 7, '7', 10),
(312, 4, 8, '41', 25),
(313, 4, 9, '2', 20),
(314, 4, 10, '1', 34),
(315, 4, 10, '1', 11),
(316, 4, 11, '11', 34),
(317, 4, 12, '3', 21),
(318, 4, 13, '23', 6),
(319, 4, 14, '14', 27),
(320, 4, 14, '14', 35),
(321, 5, 1, '1', 10),
(322, 5, 2, '19', 27),
(323, 5, 3, '22', 16),
(324, 5, 4, '10', 27),
(325, 5, 5, '2', 12),
(326, 5, 6, '39', 9),
(327, 5, 6, '39', 5),
(328, 5, 7, '3', 19),
(329, 5, 8, '34', 19),
(330, 5, 9, '11', 21),
(331, 5, 10, '13', 33),
(332, 5, 11, '40', 25),
(333, 5, 12, '7', 10),
(334, 5, 12, '20', 32),
(335, 5, 13, '5', 12),
(336, 5, 14, '14', 27),
(337, 5, 14, '14', 23),
(338, 6, 1, '1', 15),
(339, 6, 2, '19', 23),
(340, 6, 3, '34', 28),
(341, 6, 4, '22', 29),
(342, 6, 5, '11', 21),
(343, 6, 6, '39', 9),
(344, 6, 6, '39', 5),
(345, 6, 7, '10', 7),
(346, 6, 8, '2', 12),
(347, 6, 9, '14', 27),
(348, 6, 9, '14', 35),
(349, 6, 10, '13', 33),
(350, 6, 11, '7', 33),
(351, 6, 11, '20', 32),
(352, 6, 12, '40', 25),
(353, 8, 1, '1', 11),
(354, 8, 1, '1', 15),
(355, 8, 2, '34', 19),
(356, 8, 3, '22', 3),
(357, 8, 4, '8', 3),
(358, 8, 5, '19', 23),
(359, 8, 6, '39', 5),
(360, 8, 6, '39', 9),
(361, 8, 7, '40', 25),
(362, 8, 8, '23', 6),
(363, 8, 9, '18', 19),
(364, 9, 1, '13', 24),
(365, 9, 2, '1', 14),
(366, 9, 2, '1', 10),
(367, 9, 3, '5', 12),
(368, 9, 4, '19', 7),
(369, 9, 5, '22', 20),
(370, 9, 5, '22', 29),
(371, 9, 6, '10', 7),
(372, 9, 7, '20', 18),
(373, 9, 7, '7', 10),
(374, 9, 8, '34', 28),
(375, 9, 9, '14', 27),
(376, 9, 9, '14', 3),
(377, 9, 10, '2', 20),
(378, 9, 11, '3', 28),
(379, 9, 12, '11', 21),
(380, 9, 13, '39', 17),
(381, 9, 13, '39', 9),
(382, 9, 14, '40', 25),
(383, 10, 1, '3', 21),
(384, 10, 2, '34', 25),
(385, 10, 3, '1', 34),
(386, 10, 3, '1', 14),
(387, 10, 4, '2', 20),
(388, 10, 5, '13', 33),
(389, 10, 6, '14', 35),
(390, 10, 6, '14', 23),
(391, 10, 7, '22', 16),
(392, 10, 7, '37', 4),
(393, 10, 8, '19', 7),
(394, 10, 9, '10', 35),
(395, 10, 10, '39', 9),
(396, 10, 11, '7', 10),
(397, 10, 11, '20', 18),
(398, 10, 12, '11', 34),
(399, 10, 13, '40', 25),
(400, 10, 14, '5', 12),
(401, 12, 1, '22', 29),
(402, 12, 1, '22', 16),
(403, 12, 2, '3', 21),
(404, 12, 3, '19', 7),
(405, 12, 4, '13', 33),
(406, 12, 5, '34', 8),
(407, 12, 6, '40', 8),
(408, 12, 7, '10', 35),
(409, 12, 8, '2', 12),
(410, 12, 9, '7', 33),
(411, 12, 9, '20', 18),
(412, 12, 10, '1', 11),
(413, 12, 10, '1', 17),
(414, 12, 11, '39', 9),
(415, 12, 11, '39', 26),
(416, 12, 12, '14', 27),
(417, 12, 12, '14', 23),
(418, 12, 12, '14', 35),
(419, 12, 13, '11', 21),
(420, 13, 1, '19', 1),
(421, 13, 2, '22', 29),
(422, 13, 2, '1', 14),
(423, 13, 3, '34', 19),
(424, 13, 4, '11', 34),
(425, 13, 5, '3', 19),
(426, 13, 6, '10', 35),
(427, 13, 7, '13', 24),
(428, 13, 8, '1', 31),
(429, 13, 8, '37', 4),
(430, 13, 9, '2', 20),
(431, 13, 10, '40', 25),
(432, 13, 11, '7', 33),
(433, 13, 11, '20', 32),
(434, 13, 12, '14', 27),
(435, 13, 12, '14', 23),
(436, 13, 12, '14', 35),
(437, 13, 13, '39', 9),
(438, 13, 13, '39', 5),
(439, 15, 1, '1', 31),
(440, 15, 1, '22', 20),
(441, 15, 2, '13', 33),
(442, 15, 3, '34', 25),
(443, 15, 4, '23', 6),
(444, 15, 5, '3', 28),
(445, 15, 6, '19', 26),
(446, 15, 7, '1', 14),
(447, 15, 7, '22', 30),
(448, 15, 8, '10', 7),
(449, 15, 9, '14', 27),
(450, 15, 9, '14', 1),
(451, 15, 9, '14', 35),
(452, 15, 10, '40', 25),
(453, 15, 11, '2', 12),
(454, 15, 12, '11', 34),
(455, 15, 13, '39', 9),
(456, 15, 13, '39', 17),
(457, 16, 1, '34', 3),
(458, 16, 2, '1', 34),
(459, 16, 2, '1', 31),
(460, 16, 3, '23', 6),
(461, 16, 4, '2', 12),
(462, 16, 5, '10', 35),
(463, 16, 6, '13', 33),
(464, 16, 7, '19', 26),
(465, 16, 8, '3', 21),
(466, 16, 9, '14', 27),
(467, 16, 9, '14', 35),
(468, 16, 10, '22', 30),
(469, 16, 10, '22', 16),
(470, 16, 11, '19', 26),
(471, 16, 12, '11', 21),
(472, 16, 12, '39', 9),
(473, 16, 12, '39', 5),
(474, 16, 13, '40', 25),
(475, 17, 1, '40', 25),
(476, 17, 2, '19', 26),
(477, 17, 3, '14', 27),
(478, 17, 3, '14', 2),
(479, 17, 3, '14', 35),
(480, 17, 4, '1', 31),
(481, 17, 4, '1', 17),
(482, 17, 5, '10', 7),
(483, 17, 6, '34', 28),
(484, 17, 7, '23', 6),
(485, 17, 8, '39', 9),
(486, 17, 8, '39', 26),
(487, 17, 9, '3', 19),
(488, 17, 10, '37', 4),
(489, 17, 10, '26', 16),
(490, 17, 11, '2', 20),
(491, 17, 12, '11', 34),
(492, 17, 13, '13', 33),
(493, 18, 1, '22', 20),
(494, 18, 1, '22', 29),
(495, 18, 2, '34', 8),
(496, 18, 3, '1', 31),
(497, 18, 3, '1', 14),
(498, 18, 4, '19', 7),
(499, 18, 5, '18', 8),
(500, 18, 6, '8', 3),
(501, 18, 7, '40', 8),
(502, 18, 8, '23', 6),
(503, 18, 9, '39', 9),
(504, 18, 9, '39', 26),
(505, 19, 1, '34', 8),
(506, 19, 2, '19', 23),
(507, 19, 3, '1', 10),
(508, 19, 3, '1', 15),
(509, 19, 4, '26', 16),
(510, 19, 4, '37', 4),
(511, 19, 5, '23', 6),
(512, 19, 6, '39', 5),
(513, 19, 6, '39', 9),
(514, 19, 7, '8', 3),
(515, 19, 8, '40', 8),
(516, 19, 9, '18', 8);

-- --------------------------------------------------------

--
-- Struktura tabulky `triedy`
--

CREATE TABLE IF NOT EXISTS `triedy` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `pocetziakov` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `triedy`
--

INSERT INTO `triedy` (`id`, `name`, `pocetziakov`) VALUES
(2, 'sekunda', 20),
(1, 'príma', 20),
(3, 'tercia', 20),
(4, 'kvarta', 20),
(5, 'kvinta', 20),
(6, 'sexta', 20),
(7, 'septima', 20),
(8, 'oktáva', 20),
(9, 'I.A', 20),
(10, 'I.B', 20),
(11, 'I.C', 20),
(12, 'II.A', 20),
(13, 'II.B', 20),
(14, 'II.C', 20),
(15, 'III.A', 20),
(16, 'III.B', 20),
(17, 'III.C', 20),
(18, 'IV.A', 20),
(19, 'IV.B', 20),
(20, 'IV.C', 20);

-- --------------------------------------------------------

--
-- Struktura tabulky `ucitelia`
--

CREATE TABLE IF NOT EXISTS `ucitelia` (
  `ucitelid` int(11) NOT NULL,
  `meno` varchar(60) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `ucitelia`
--

INSERT INTO `ucitelia` (`ucitelid`, `meno`) VALUES
(1, 'RNDr. Elena Kacvinská'),
(3, 'PaedDr. Dušan Zajac'),
(2, 'Ing. Igor Marko'),
(4, 'Ing. Stella Aschengeschvandtnerová'),
(5, 'Mgr. Ján Bacho'),
(6, 'PaedDr. Magdaléna Dobiašová'),
(7, 'RNDr. Terézia Dolanová'),
(8, 'Mgr. Andrea Dúcka'),
(9, 'Mgr. Ján Ďuračka'),
(10, 'Mgr. Monika Filová'),
(11, 'Mgr. Miroslava Flimelová'),
(12, 'Ing. Tatiana Gerbelová'),
(13, 'Mgr. Emília Hlavinková'),
(14, 'Mgr. Michaela Hlavinová'),
(15, 'Mgr. Marcela Hlbočanová'),
(16, 'Mgr. Sláva Hrebíčková'),
(17, 'Mgr. Lenka Janáčová'),
(18, 'Mgr. Ondrej Kellner'),
(19, 'PaedDr. Elena Košíková'),
(20, 'Mgr. Katarína Kováčová'),
(21, 'Mgr. Mário Kutiš'),
(22, 'Mgr. Ivo Madzin'),
(23, 'Mgr. Elena Masárová'),
(24, 'Mgr. Ľubomíra Mezovská'),
(25, 'PhDr. Rudolfa Novotná'),
(26, 'Mgr. Miroslava Rešková'),
(27, 'RNDr. Silvia Rosenbergová'),
(28, 'Mgr. Branko Rurák'),
(29, 'Mgr. Zuzana Sedláková'),
(30, 'PhDr. Daniela Schmidtová'),
(31, 'Mgr. Dana Švančarová'),
(32, 'Mgr. Michal Vlček'),
(33, 'Ing. Jaroslava Žemberová'),
(34, 'Mgr. Denisa Žitňanská'),
(35, 'PaedDr. Juraj Žitňanský');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `answered`
--
ALTER TABLE `answered`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `tasks`
--
ALTER TABLE `tasks`
  ADD UNIQUE KEY `id` (`id`);

--
-- Klíče pro tabulku `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `tests`
--
ALTER TABLE `tests`
  ADD UNIQUE KEY `id` (`testid`),
  ADD KEY `id_2` (`testid`);

--
-- Klíče pro tabulku `triedy`
--
ALTER TABLE `triedy`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Klíče pro tabulku `ucitelia`
--
ALTER TABLE `ucitelia`
  ADD PRIMARY KEY (`ucitelid`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `answered`
--
ALTER TABLE `answered`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pro tabulku `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pro tabulku `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pro tabulku `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT pro tabulku `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `tests`
--
ALTER TABLE `tests`
  MODIFY `testid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=517;
--
-- AUTO_INCREMENT pro tabulku `triedy`
--
ALTER TABLE `triedy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pro tabulku `ucitelia`
--
ALTER TABLE `ucitelia`
  MODIFY `ucitelid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
