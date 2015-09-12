-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Hostiteľ: localhost
-- Vygenerované: So 12.Sep 2015, 19:12
-- Verzia serveru: 5.5.44-MariaDB-1ubuntu0.14.04.1
-- Verzia PHP: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáza: `dotaznik`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `answered`
--

CREATE TABLE IF NOT EXISTS `answered` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Sťahujem dáta pre tabuľku `answered`
--

INSERT INTO `answered` (`id`, `testid`, `groupid`, `userid`, `score`, `time`) VALUES
(5, 2, 0, 1, 67, 1442077773);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(40) NOT NULL,
  `trieda` int(11) NOT NULL,
  `admin` int(11) DEFAULT '0',
  `blocked` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Sťahujem dáta pre tabuľku `login`
--

INSERT INTO `login` (`id`, `password`, `trieda`, `admin`, `blocked`) VALUES
(1, '123456', 1, 0, 0),
(3, '1234', 2, 0, 0);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `stats`
--

CREATE TABLE IF NOT EXISTS `stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testid` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Sťahujem dáta pre tabuľku `stats`
--

INSERT INTO `stats` (`id`, `testid`, `value`, `time`) VALUES
(1, 2, 3, 1442068612),
(2, 2, 0, 1442068685),
(3, 2, 10, 1442068698);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task` varchar(500) NOT NULL,
  `expected` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- Sťahujem dáta pre tabuľku `tasks`
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
-- Štruktúra tabuľky pre tabuľku `tests`
--

CREATE TABLE IF NOT EXISTS `tests` (
  `testid` int(11) NOT NULL AUTO_INCREMENT,
  `trieda` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `nazov` varchar(40) NOT NULL,
  `ucitel` int(11) NOT NULL,
  UNIQUE KEY `id` (`testid`),
  KEY `id_2` (`testid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Sťahujem dáta pre tabuľku `tests`
--

INSERT INTO `tests` (`testid`, `trieda`, `groupid`, `nazov`, `ucitel`) VALUES
(2, 1, 1, 'Fyzika', 1),
(3, 1, 2, 'SLJ', 3);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `triedy`
--

CREATE TABLE IF NOT EXISTS `triedy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `pocetziakov` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Sťahujem dáta pre tabuľku `triedy`
--

INSERT INTO `triedy` (`id`, `name`, `pocetziakov`) VALUES
(1, 'Oktáva', 25),
(2, '1.B', 0);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `ucitelia`
--

CREATE TABLE IF NOT EXISTS `ucitelia` (
  `ucitelid` int(11) NOT NULL AUTO_INCREMENT,
  `meno` varchar(60) NOT NULL,
  PRIMARY KEY (`ucitelid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Sťahujem dáta pre tabuľku `ucitelia`
--

INSERT INTO `ucitelia` (`ucitelid`, `meno`) VALUES
(1, 'Rndr. Juraj Žitňanský'),
(3, 'Dúcka');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
