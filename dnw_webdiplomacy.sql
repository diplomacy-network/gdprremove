-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 22. Jul 2019 um 21:05
-- Server-Version: 5.7.26-0ubuntu0.16.04.1
-- PHP-Version: 7.1.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `dnw_webdiplomacy`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_AccessLog`
--

CREATE TABLE `wD_AccessLog` (
  `userID` mediumint(8) UNSIGNED NOT NULL,
  `lastRequest` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` smallint(5) UNSIGNED NOT NULL,
  `cookieCode` int(10) UNSIGNED NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL,
  `userAgent` binary(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_AccessLogAdvanced`
--

CREATE TABLE `wD_AccessLogAdvanced` (
  `userID` mediumint(8) UNSIGNED NOT NULL,
  `request` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` int(10) UNSIGNED NOT NULL,
  `action` enum('LogOn','LogOff','Board') NOT NULL DEFAULT 'LogOn',
  `memberID` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_AdminLog`
--

CREATE TABLE `wD_AdminLog` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `userID` mediumint(8) UNSIGNED NOT NULL,
  `time` int(10) UNSIGNED NOT NULL,
  `details` text NOT NULL,
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Backup_GameMessages`
--

CREATE TABLE `wD_Backup_GameMessages` (
  `id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `timeSent` int(10) UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8 NOT NULL,
  `turn` smallint(5) UNSIGNED NOT NULL,
  `toCountryID` tinyint(3) UNSIGNED NOT NULL,
  `fromCountryID` tinyint(3) UNSIGNED NOT NULL,
  `gameID` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Backup_Games`
--

CREATE TABLE `wD_Backup_Games` (
  `variantID` tinyint(3) UNSIGNED NOT NULL,
  `id` mediumint(5) UNSIGNED NOT NULL DEFAULT '0',
  `turn` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `phase` enum('Finished','Pre-game','Diplomacy','Retreats','Builds') CHARACTER SET utf8 NOT NULL DEFAULT 'Pre-game',
  `processTime` int(10) UNSIGNED DEFAULT NULL,
  `pot` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `gameOver` enum('No','Won','Drawn') CHARACTER SET utf8 NOT NULL DEFAULT 'No',
  `processStatus` enum('Not-processing','Processing','Crashed','Paused') CHARACTER SET utf8 NOT NULL DEFAULT 'Not-processing',
  `password` varbinary(16) DEFAULT NULL,
  `potType` enum('Winner-takes-all','Points-per-supply-center') CHARACTER SET utf8 NOT NULL,
  `pauseTimeRemaining` mediumint(8) UNSIGNED DEFAULT NULL,
  `minimumBet` smallint(5) UNSIGNED DEFAULT NULL,
  `phaseMinutes` smallint(5) UNSIGNED NOT NULL DEFAULT '1440',
  `anon` enum('Yes','No') CHARACTER SET utf8 NOT NULL DEFAULT 'No',
  `pressType` enum('Regular','PublicPressOnly','NoPress') CHARACTER SET utf8 NOT NULL DEFAULT 'Regular',
  `attempts` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `missingPlayerPolicy` enum('Normal','Strict','Wait') CHARACTER SET utf8 NOT NULL DEFAULT 'Normal',
  `directorUserID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `maxTurns` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `minRating` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `minPhases` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `targetSCs` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `specialCDcount` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `specialCDturn` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `rlPolicy` enum('None','Strict','Friends') CHARACTER SET utf8 NOT NULL DEFAULT 'None',
  `chessTime` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `lastProcessed` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `adminLock` enum('Yes','No') CHARACTER SET utf8 NOT NULL DEFAULT 'No',
  `minNoCD` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `minNoNMR` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `chooseYourCountry` enum('Yes','No') NOT NULL DEFAULT 'No',
  `description` text NOT NULL,
  `noProcess` set('1','2','3','4','5','6','0') NOT NULL DEFAULT '',
  `fixStart` enum('Yes','No') CHARACTER SET utf8 NOT NULL DEFAULT 'No',
  `blockVotes` set('Draw','Pause','Cancel','Extend','Concede') CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Backup_Members`
--

CREATE TABLE `wD_Backup_Members` (
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `userID` mediumint(8) UNSIGNED NOT NULL,
  `gameID` mediumint(8) UNSIGNED NOT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL,
  `status` enum('Playing','Defeated','Left','Won','Drawn','Survived','Resigned') CHARACTER SET utf8 NOT NULL DEFAULT 'Playing',
  `timeLoggedIn` int(10) UNSIGNED NOT NULL,
  `bet` mediumint(8) UNSIGNED NOT NULL,
  `missedPhases` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `newMessagesFrom` set('0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','43','44','45','46','47','48','49','50','51','52','53','54','55','56','57','58','59','60','61','62','63') CHARACTER SET utf8 NOT NULL,
  `supplyCenterNo` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `unitNo` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `votes` set('Draw','Pause','Cancel') CHARACTER SET utf8 NOT NULL,
  `pointsWon` mediumint(8) UNSIGNED DEFAULT NULL,
  `gameMessagesSent` mediumint(8) UNSIGNED DEFAULT NULL,
  `orderStatus` set('None','Saved','Completed','Ready') CHARACTER SET utf8 NOT NULL DEFAULT 'None',
  `chessTime` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `ccMatch` tinyint(3) UNSIGNED NOT NULL,
  `ipMatch` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Backup_MovesArchive`
--

CREATE TABLE `wD_Backup_MovesArchive` (
  `orderID` int(10) UNSIGNED NOT NULL,
  `gameID` mediumint(8) UNSIGNED NOT NULL,
  `turn` smallint(5) UNSIGNED NOT NULL,
  `terrID` smallint(5) UNSIGNED NOT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL,
  `unitType` enum('Army','Fleet') CHARACTER SET utf8 DEFAULT NULL,
  `success` enum('Yes','No') CHARACTER SET utf8 NOT NULL,
  `dislodged` enum('Yes','No') CHARACTER SET utf8 NOT NULL DEFAULT 'No',
  `type` enum('Hold','Move','Support hold','Support move','Convoy','Retreat','Disband','Build Army','Build Fleet','Wait','Destroy') CHARACTER SET utf8 NOT NULL,
  `toTerrID` smallint(5) UNSIGNED DEFAULT NULL,
  `fromTerrID` smallint(5) UNSIGNED DEFAULT NULL,
  `viaConvoy` enum('No','Yes') CHARACTER SET utf8 NOT NULL DEFAULT 'No'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Backup_Orders`
--

CREATE TABLE `wD_Backup_Orders` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gameID` mediumint(8) UNSIGNED NOT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('Hold','Move','Support hold','Support move','Convoy','Retreat','Disband','Build Army','Build Fleet','Wait','Destroy') CHARACTER SET utf8 NOT NULL,
  `unitID` int(10) UNSIGNED DEFAULT NULL,
  `toTerrID` smallint(5) UNSIGNED DEFAULT NULL,
  `fromTerrID` smallint(5) UNSIGNED DEFAULT NULL,
  `viaConvoy` enum('No','Yes') CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Backup_TerrStatus`
--

CREATE TABLE `wD_Backup_TerrStatus` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `terrID` smallint(5) UNSIGNED NOT NULL,
  `occupiedFromTerrID` smallint(5) UNSIGNED DEFAULT NULL,
  `standoff` enum('No','Yes') CHARACTER SET utf8 NOT NULL DEFAULT 'No',
  `gameID` mediumint(8) UNSIGNED NOT NULL,
  `occupyingUnitID` int(10) UNSIGNED DEFAULT NULL,
  `retreatingUnitID` int(10) UNSIGNED DEFAULT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Backup_TerrStatusArchive`
--

CREATE TABLE `wD_Backup_TerrStatusArchive` (
  `terrID` smallint(5) UNSIGNED NOT NULL,
  `turn` smallint(5) UNSIGNED NOT NULL,
  `standoff` enum('No','Yes') CHARACTER SET utf8 NOT NULL DEFAULT 'No',
  `gameID` mediumint(8) UNSIGNED NOT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Backup_Units`
--

CREATE TABLE `wD_Backup_Units` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` enum('Army','Fleet') CHARACTER SET utf8 NOT NULL,
  `terrID` smallint(5) UNSIGNED NOT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL,
  `gameID` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_BannedNumbers`
--

CREATE TABLE `wD_BannedNumbers` (
  `number` int(10) UNSIGNED NOT NULL,
  `numberType` enum('CookieCode','IP') NOT NULL,
  `userID` mediumint(8) UNSIGNED NOT NULL,
  `hasResponded` enum('Yes','No') NOT NULL DEFAULT 'No'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_BlockUser`
--

CREATE TABLE `wD_BlockUser` (
  `userID` mediumint(8) UNSIGNED NOT NULL,
  `blockUserID` mediumint(8) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Borders`
--

CREATE TABLE `wD_Borders` (
  `mapID` tinyint(3) UNSIGNED NOT NULL,
  `fromTerrID` smallint(5) UNSIGNED NOT NULL,
  `toTerrID` smallint(5) UNSIGNED NOT NULL,
  `fleetsPass` enum('No','Yes') NOT NULL,
  `armysPass` enum('No','Yes') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_CivilDisorders`
--

CREATE TABLE `wD_CivilDisorders` (
  `gameID` smallint(5) UNSIGNED NOT NULL,
  `userID` mediumint(8) UNSIGNED NOT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL,
  `turn` smallint(5) UNSIGNED NOT NULL,
  `bet` smallint(5) UNSIGNED NOT NULL,
  `SCCount` smallint(5) UNSIGNED NOT NULL,
  `forcedByMod` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_CoastalBorders`
--

CREATE TABLE `wD_CoastalBorders` (
  `mapID` tinyint(3) UNSIGNED NOT NULL,
  `fromTerrID` smallint(5) UNSIGNED NOT NULL,
  `toTerrID` smallint(5) UNSIGNED NOT NULL,
  `fleetsPass` enum('No','Yes') NOT NULL,
  `armysPass` enum('No','Yes') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_CountrySwitch`
--

CREATE TABLE `wD_CountrySwitch` (
  `id` int(10) UNSIGNED NOT NULL,
  `gameID` int(10) UNSIGNED DEFAULT NULL,
  `fromID` int(10) UNSIGNED DEFAULT NULL,
  `toID` int(10) UNSIGNED DEFAULT NULL,
  `status` set('Send','Active','Rejected','Canceled','Returned','ClaimedBack') CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_DATC`
--

CREATE TABLE `wD_DATC` (
  `testID` smallint(6) NOT NULL,
  `variantID` tinyint(3) UNSIGNED NOT NULL,
  `testName` char(15) NOT NULL,
  `testDesc` text,
  `status` enum('NotPassed','Passed','Invalid') DEFAULT 'NotPassed'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_DATCOrders`
--

CREATE TABLE `wD_DATCOrders` (
  `testID` smallint(6) NOT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL,
  `unitType` enum('Army','Fleet') NOT NULL,
  `terrID` smallint(5) UNSIGNED NOT NULL,
  `moveType` enum('Hold','Move','Support hold','Support move','Convoy','Retreat','Disband','Build Army','Build Fleet','Wait','Destroy') NOT NULL,
  `toTerrID` smallint(5) UNSIGNED DEFAULT NULL,
  `fromTerrID` smallint(5) UNSIGNED DEFAULT NULL,
  `viaConvoy` enum('No','Yes') DEFAULT NULL,
  `criteria` enum('Success','Dislodged','Hold') DEFAULT NULL,
  `legal` enum('No','Yes') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_FailedLookups`
--

CREATE TABLE `wD_FailedLookups` (
  `id` int(10) UNSIGNED NOT NULL,
  `lookupString` text NOT NULL,
  `count` int(11) NOT NULL,
  `aggregateFlag` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_ForceReply`
--

CREATE TABLE `wD_ForceReply` (
  `id` int(10) UNSIGNED NOT NULL,
  `toUserID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `forceReply` enum('Yes','No','Done') NOT NULL DEFAULT 'No',
  `status` enum('Sent','Read','Replied') NOT NULL DEFAULT 'Sent',
  `readIP` int(10) UNSIGNED NOT NULL,
  `readTime` int(10) UNSIGNED NOT NULL,
  `replyIP` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_ForumMessages`
--

CREATE TABLE `wD_ForumMessages` (
  `id` int(10) UNSIGNED NOT NULL,
  `toID` int(10) UNSIGNED NOT NULL,
  `fromUserID` mediumint(8) UNSIGNED NOT NULL,
  `timeSent` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `subject` varchar(100) NOT NULL,
  `type` enum('ThreadStart','ThreadReply') NOT NULL,
  `replies` smallint(5) UNSIGNED NOT NULL,
  `latestReplySent` int(10) UNSIGNED NOT NULL,
  `silenceID` int(10) UNSIGNED DEFAULT NULL,
  `likeCount` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `anon` enum('Yes','No') NOT NULL DEFAULT 'No'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_GameMessages`
--

CREATE TABLE `wD_GameMessages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `timeSent` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `turn` smallint(5) UNSIGNED NOT NULL,
  `toCountryID` tinyint(3) UNSIGNED NOT NULL,
  `fromCountryID` tinyint(3) UNSIGNED NOT NULL,
  `gameID` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Games`
--

CREATE TABLE `wD_Games` (
  `variantID` tinyint(3) UNSIGNED NOT NULL,
  `id` mediumint(5) UNSIGNED NOT NULL,
  `turn` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `phase` enum('Finished','Pre-game','Diplomacy','Retreats','Builds') NOT NULL DEFAULT 'Pre-game',
  `processTime` int(10) UNSIGNED DEFAULT NULL,
  `pot` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `gameOver` enum('No','Won','Drawn') NOT NULL DEFAULT 'No',
  `processStatus` enum('Not-processing','Processing','Crashed','Paused') NOT NULL DEFAULT 'Not-processing',
  `password` varbinary(16) DEFAULT NULL,
  `potType` enum('Winner-takes-all','Points-per-supply-center') NOT NULL,
  `pauseTimeRemaining` mediumint(8) UNSIGNED DEFAULT NULL,
  `minimumBet` smallint(5) UNSIGNED DEFAULT NULL,
  `phaseMinutes` smallint(5) UNSIGNED NOT NULL DEFAULT '1440',
  `anon` enum('Yes','No') NOT NULL DEFAULT 'No',
  `pressType` enum('Regular','PublicPressOnly','NoPress') NOT NULL DEFAULT 'Regular',
  `attempts` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `missingPlayerPolicy` enum('Normal','Strict','Wait') NOT NULL DEFAULT 'Normal',
  `directorUserID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `maxTurns` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `minRating` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `minPhases` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `targetSCs` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `specialCDcount` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `specialCDturn` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `rlPolicy` enum('None','Strict','Friends') NOT NULL DEFAULT 'None',
  `chessTime` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `lastProcessed` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `adminLock` enum('Yes','No') NOT NULL DEFAULT 'No',
  `minNoCD` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `minNoNMR` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `chooseYourCountry` enum('Yes','No') NOT NULL DEFAULT 'No',
  `description` text NOT NULL,
  `noProcess` set('1','2','3','4','5','6','0') NOT NULL DEFAULT '',
  `fixStart` enum('Yes','No') NOT NULL DEFAULT 'No',
  `blockVotes` set('Draw','Pause','Cancel','Extend','Concede') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_LikePost`
--

CREATE TABLE `wD_LikePost` (
  `userID` mediumint(8) UNSIGNED NOT NULL,
  `likeMessageID` int(10) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Members`
--

CREATE TABLE `wD_Members` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `userID` mediumint(8) UNSIGNED DEFAULT NULL,
  `gameID` mediumint(8) UNSIGNED DEFAULT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` enum('Playing','Defeated','Left','Won','Drawn','Survived','Resigned') NOT NULL DEFAULT 'Playing',
  `timeLoggedIn` int(10) UNSIGNED DEFAULT NULL,
  `bet` mediumint(8) UNSIGNED DEFAULT NULL,
  `missedPhases` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `newMessagesFrom` set('0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','43','44','45','46','47','48','49','50','51','52','53','54','55','56','57','58','59','60','61','62','63') NOT NULL DEFAULT '',
  `supplyCenterNo` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `unitNo` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `votes` set('Draw','Pause','Cancel','Extend','Concede') NOT NULL DEFAULT '',
  `pointsWon` mediumint(8) UNSIGNED DEFAULT NULL,
  `gameMessagesSent` mediumint(8) UNSIGNED DEFAULT NULL,
  `orderStatus` set('None','Saved','Completed','Ready') NOT NULL DEFAULT 'None',
  `chessTime` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `ccMatch` tinyint(3) UNSIGNED DEFAULT NULL,
  `ipMatch` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Misc`
--

CREATE TABLE `wD_Misc` (
  `name` enum('Version','Hits','Panic','Notice','Maintenance','LastProcessTime','GamesNew','GamesActive','GamesFinished','RankingPlayers','OnlinePlayers','ActivePlayers','TotalPlayers','ErrorLogs','GamesPaused','GamesOpen','GamesCrashed','LastModAction','ForumThreads','ThreadActiveThreshold','ThreadAliveThreshold','GameFeaturedThreshold') NOT NULL,
  `value` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_ModeratorNotes`
--

CREATE TABLE `wD_ModeratorNotes` (
  `linkIDType` enum('Game','User','rlGroup') COLLATE utf8_bin DEFAULT NULL,
  `linkID` mediumint(8) UNSIGNED NOT NULL,
  `type` enum('Report','PrivateNote','PublicNote') COLLATE utf8_bin NOT NULL,
  `fromUserID` mediumint(9) NOT NULL,
  `note` text COLLATE utf8_bin NOT NULL,
  `timeSent` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_ModForumMessages`
--

CREATE TABLE `wD_ModForumMessages` (
  `id` int(10) UNSIGNED NOT NULL,
  `toID` int(10) UNSIGNED NOT NULL,
  `fromUserID` mediumint(8) UNSIGNED NOT NULL,
  `timeSent` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `subject` varchar(100) NOT NULL,
  `type` enum('ThreadStart','ThreadReply') NOT NULL,
  `replies` smallint(5) UNSIGNED NOT NULL,
  `latestReplySent` int(10) UNSIGNED NOT NULL,
  `silenceID` int(10) UNSIGNED DEFAULT NULL,
  `adminReply` enum('Yes','No') NOT NULL DEFAULT 'No',
  `status` enum('New','Open','Resolved','Bugs','Sticky') NOT NULL DEFAULT 'New',
  `assigned` mediumint(8) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Moves`
--

CREATE TABLE `wD_Moves` (
  `id` int(10) UNSIGNED NOT NULL,
  `gameID` mediumint(8) UNSIGNED NOT NULL,
  `orderID` int(10) UNSIGNED NOT NULL,
  `unitID` int(10) UNSIGNED NOT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL,
  `moveType` enum('Hold','Move','Support hold','Support move','Convoy','Retreat','Disband','Build Army','Build Fleet','Wait','Destroy') NOT NULL,
  `terrID` smallint(5) UNSIGNED DEFAULT NULL,
  `toTerrID` smallint(5) UNSIGNED DEFAULT NULL,
  `fromTerrID` smallint(5) UNSIGNED DEFAULT NULL,
  `viaConvoy` enum('No','Yes') NOT NULL DEFAULT 'No',
  `success` enum('No','Yes','Undecided') NOT NULL DEFAULT 'Undecided',
  `dislodged` enum('No','Yes','Undecided') NOT NULL DEFAULT 'Undecided',
  `path` enum('No','Yes','Undecided') NOT NULL DEFAULT 'Undecided'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_MovesArchive`
--

CREATE TABLE `wD_MovesArchive` (
  `orderID` int(10) UNSIGNED NOT NULL,
  `gameID` mediumint(8) UNSIGNED NOT NULL,
  `turn` smallint(5) UNSIGNED NOT NULL,
  `terrID` smallint(5) UNSIGNED NOT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL,
  `unitType` enum('Army','Fleet') DEFAULT NULL,
  `success` enum('Yes','No') NOT NULL,
  `dislodged` enum('Yes','No') NOT NULL DEFAULT 'No',
  `type` enum('Hold','Move','Support hold','Support move','Convoy','Retreat','Disband','Build Army','Build Fleet','Wait','Destroy') NOT NULL,
  `toTerrID` smallint(5) UNSIGNED DEFAULT NULL,
  `fromTerrID` smallint(5) UNSIGNED DEFAULT NULL,
  `viaConvoy` enum('No','Yes') NOT NULL DEFAULT 'No'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_MuteCountry`
--

CREATE TABLE `wD_MuteCountry` (
  `userID` mediumint(8) UNSIGNED NOT NULL,
  `gameID` mediumint(8) UNSIGNED NOT NULL,
  `muteCountryID` tinyint(3) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_MuteThread`
--

CREATE TABLE `wD_MuteThread` (
  `userID` mediumint(8) UNSIGNED NOT NULL,
  `muteThreadID` int(10) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_MuteUser`
--

CREATE TABLE `wD_MuteUser` (
  `userID` mediumint(8) UNSIGNED NOT NULL,
  `muteUserID` mediumint(8) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_NMRs`
--

CREATE TABLE `wD_NMRs` (
  `gameID` mediumint(5) UNSIGNED NOT NULL,
  `userID` mediumint(8) UNSIGNED NOT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL,
  `turn` smallint(5) UNSIGNED NOT NULL,
  `bet` smallint(5) UNSIGNED NOT NULL,
  `SCCount` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Notices`
--

CREATE TABLE `wD_Notices` (
  `toUserID` mediumint(8) UNSIGNED NOT NULL,
  `fromID` mediumint(8) UNSIGNED NOT NULL,
  `type` enum('PM','Game','User') NOT NULL,
  `keep` enum('Yes','No') NOT NULL,
  `private` enum('Yes','No') NOT NULL,
  `text` text NOT NULL,
  `linkName` varchar(100) NOT NULL,
  `linkID` mediumint(8) UNSIGNED DEFAULT NULL,
  `timeSent` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Orders`
--

CREATE TABLE `wD_Orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `gameID` mediumint(8) UNSIGNED NOT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('Hold','Move','Support hold','Support move','Convoy','Retreat','Disband','Build Army','Build Fleet','Wait','Destroy') NOT NULL,
  `unitID` int(10) UNSIGNED DEFAULT NULL,
  `toTerrID` smallint(5) UNSIGNED DEFAULT NULL,
  `fromTerrID` smallint(5) UNSIGNED DEFAULT NULL,
  `viaConvoy` enum('No','Yes') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_PointsTransactions`
--

CREATE TABLE `wD_PointsTransactions` (
  `type` enum('Supplement','Bet','Won','Returned','Trigger','Correction') NOT NULL,
  `userID` mediumint(9) NOT NULL,
  `gameID` mediumint(9) DEFAULT NULL,
  `memberID` mediumint(9) DEFAULT NULL,
  `points` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Ratings`
--

CREATE TABLE `wD_Ratings` (
  `userID` mediumint(8) UNSIGNED NOT NULL,
  `ratingType` enum('VDip') NOT NULL DEFAULT 'VDip',
  `gameID` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `rating` smallint(5) UNSIGNED NOT NULL DEFAULT '1500',
  `fixed` enum('variantID','potType','pressType') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Sessions`
--

CREATE TABLE `wD_Sessions` (
  `userID` mediumint(8) UNSIGNED NOT NULL,
  `lastRequest` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hits` smallint(5) UNSIGNED NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL,
  `userAgent` binary(2) NOT NULL,
  `cookieCode` int(10) UNSIGNED NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Silences`
--

CREATE TABLE `wD_Silences` (
  `id` int(10) UNSIGNED NOT NULL,
  `userID` int(10) UNSIGNED DEFAULT NULL,
  `postID` int(10) UNSIGNED DEFAULT NULL,
  `moderatorUserID` mediumint(8) UNSIGNED NOT NULL,
  `enabled` bit(1) NOT NULL DEFAULT b'1',
  `startTime` bigint(20) UNSIGNED NOT NULL,
  `length` smallint(5) UNSIGNED NOT NULL DEFAULT '7',
  `reason` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_TelegramService`
--

CREATE TABLE `wD_TelegramService` (
  `UserID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `ChatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Territories`
--

CREATE TABLE `wD_Territories` (
  `mapID` tinyint(3) UNSIGNED NOT NULL,
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `type` enum('Sea','Land','Coast') NOT NULL,
  `supply` enum('No','Yes') NOT NULL,
  `mapX` smallint(5) UNSIGNED NOT NULL,
  `mapY` smallint(5) UNSIGNED NOT NULL,
  `smallMapX` smallint(5) UNSIGNED NOT NULL,
  `smallMapY` smallint(5) UNSIGNED NOT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL,
  `coast` enum('No','Parent','Child') NOT NULL,
  `coastParentID` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_TerrStatus`
--

CREATE TABLE `wD_TerrStatus` (
  `id` int(10) UNSIGNED NOT NULL,
  `terrID` smallint(5) UNSIGNED NOT NULL,
  `occupiedFromTerrID` smallint(5) UNSIGNED DEFAULT NULL,
  `standoff` enum('No','Yes') NOT NULL DEFAULT 'No',
  `gameID` mediumint(8) UNSIGNED NOT NULL,
  `occupyingUnitID` int(10) UNSIGNED DEFAULT NULL,
  `retreatingUnitID` int(10) UNSIGNED DEFAULT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_TerrStatusArchive`
--

CREATE TABLE `wD_TerrStatusArchive` (
  `terrID` smallint(5) UNSIGNED NOT NULL,
  `turn` smallint(5) UNSIGNED NOT NULL,
  `standoff` enum('No','Yes') NOT NULL DEFAULT 'No',
  `gameID` mediumint(8) UNSIGNED NOT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_UnitDestroyIndex`
--

CREATE TABLE `wD_UnitDestroyIndex` (
  `mapID` tinyint(3) UNSIGNED NOT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL,
  `terrID` smallint(5) UNSIGNED NOT NULL,
  `unitType` enum('Army','Fleet') NOT NULL,
  `destroyIndex` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Units`
--

CREATE TABLE `wD_Units` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('Army','Fleet') NOT NULL,
  `terrID` smallint(5) UNSIGNED NOT NULL,
  `countryID` tinyint(3) UNSIGNED NOT NULL,
  `gameID` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_Users`
--

CREATE TABLE `wD_Users` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(90) NOT NULL,
  `points` mediumint(8) UNSIGNED NOT NULL DEFAULT '100',
  `comment` text,
  `homepage` text,
  `hideEmail` enum('No','Yes') NOT NULL,
  `timeJoined` int(10) UNSIGNED NOT NULL,
  `locale` enum('English') NOT NULL,
  `timeLastSessionEnded` int(10) UNSIGNED NOT NULL,
  `lastMessageIDViewed` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `password` binary(16) DEFAULT NULL,
  `type` set('Banned','Guest','System','User','Moderator','Admin','Donator','DonatorBronze','DonatorSilver','DonatorGold','DonatorPlatinum','DevBronze','DevSilver','DevGold','ForumModerator','ModAlert') NOT NULL DEFAULT 'User',
  `notifications` set('PrivateMessage','GameMessage','Unfinalized','GameUpdate','ModForum','CountrySwitch','ForceModMessage') DEFAULT NULL,
  `ChanceEngland` float NOT NULL DEFAULT '0.142857',
  `ChanceFrance` float NOT NULL DEFAULT '0.142857',
  `ChanceItaly` float NOT NULL DEFAULT '0.142857',
  `ChanceGermany` float NOT NULL DEFAULT '0.142857',
  `ChanceAustria` float NOT NULL DEFAULT '0.142857',
  `ChanceRussia` float NOT NULL DEFAULT '0.142857',
  `ChanceTurkey` float NOT NULL DEFAULT '0.142857',
  `muteReports` enum('No','Yes') NOT NULL DEFAULT 'No',
  `silenceID` int(10) UNSIGNED DEFAULT NULL,
  `lastadnotice` int(10) NOT NULL,
  `infomail` int(10) NOT NULL,
  `cdCount` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `nmrCount` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `cdTakenCount` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `phaseCount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gameCount` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `reliabilityRating` double NOT NULL DEFAULT '1',
  `deletedCDs` int(11) DEFAULT '0',
  `missedMoves` int(11) NOT NULL DEFAULT '0',
  `phasesPlayed` int(11) NOT NULL DEFAULT '0',
  `gamesLeft` int(11) NOT NULL DEFAULT '0',
  `lastModMessageIDViewed` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rlGroup` mediumint(8) NOT NULL DEFAULT '0',
  `showCountryNames` enum('Yes','No') NOT NULL DEFAULT 'No',
  `colorCorrect` enum('Off','Protanope','Deuteranope','Tritanope') NOT NULL DEFAULT 'Off',
  `showCountryNamesMap` enum('Yes','No') NOT NULL DEFAULT 'No',
  `sortOrder` enum('BuildOrder','TerrName','NorthSouth','EastWest') NOT NULL DEFAULT 'BuildOrder',
  `unitOrder` enum('Mixed','AF','FA') NOT NULL DEFAULT 'Mixed',
  `pointNClick` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `terrGrey` enum('all','selected','off') NOT NULL DEFAULT 'all',
  `greyOut` smallint(5) UNSIGNED NOT NULL DEFAULT '50',
  `scrollbars` enum('Yes','No') NOT NULL DEFAULT 'No',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `CDtakeover` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `directorLicense` enum('Yes','No') DEFAULT NULL,
  `tempBan` int(10) UNSIGNED DEFAULT NULL,
  `vpoints` mediumint(8) UNSIGNED NOT NULL DEFAULT '1000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_VariantData`
--

CREATE TABLE `wD_VariantData` (
  `variantID` tinyint(3) UNSIGNED NOT NULL,
  `gameID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `systemToken` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `typeID` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `userID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `offset` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `val_int` int(11) NOT NULL DEFAULT '0',
  `val_float` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wD_vDipMisc`
--

CREATE TABLE `wD_vDipMisc` (
  `name` enum('Version') NOT NULL,
  `value` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `wD_AccessLog`
--
ALTER TABLE `wD_AccessLog`
  ADD KEY `userID` (`userID`),
  ADD KEY `ip` (`ip`),
  ADD KEY `cookieCode` (`cookieCode`);

--
-- Indizes für die Tabelle `wD_AccessLogAdvanced`
--
ALTER TABLE `wD_AccessLogAdvanced`
  ADD KEY `userID` (`userID`),
  ADD KEY `ip` (`ip`);

--
-- Indizes für die Tabelle `wD_AdminLog`
--
ALTER TABLE `wD_AdminLog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`);

--
-- Indizes für die Tabelle `wD_BannedNumbers`
--
ALTER TABLE `wD_BannedNumbers`
  ADD UNIQUE KEY `numberType` (`numberType`,`number`),
  ADD KEY `userID` (`userID`);

--
-- Indizes für die Tabelle `wD_BlockUser`
--
ALTER TABLE `wD_BlockUser`
  ADD PRIMARY KEY (`userID`,`blockUserID`);

--
-- Indizes für die Tabelle `wD_Borders`
--
ALTER TABLE `wD_Borders`
  ADD KEY `fromTo` (`fromTerrID`,`toTerrID`),
  ADD KEY `toFrom` (`toTerrID`,`fromTerrID`);

--
-- Indizes für die Tabelle `wD_CivilDisorders`
--
ALTER TABLE `wD_CivilDisorders`
  ADD KEY `gameID` (`gameID`,`userID`),
  ADD KEY `userID` (`userID`);

--
-- Indizes für die Tabelle `wD_CoastalBorders`
--
ALTER TABLE `wD_CoastalBorders`
  ADD KEY `fromTo` (`fromTerrID`,`toTerrID`),
  ADD KEY `toFrom` (`toTerrID`,`fromTerrID`);

--
-- Indizes für die Tabelle `wD_CountrySwitch`
--
ALTER TABLE `wD_CountrySwitch`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `wD_DATC`
--
ALTER TABLE `wD_DATC`
  ADD PRIMARY KEY (`testID`);

--
-- Indizes für die Tabelle `wD_DATCOrders`
--
ALTER TABLE `wD_DATCOrders`
  ADD PRIMARY KEY (`testID`,`terrID`);

--
-- Indizes für die Tabelle `wD_FailedLookups`
--
ALTER TABLE `wD_FailedLookups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lookupString` (`lookupString`(1024));

--
-- Indizes für die Tabelle `wD_ForceReply`
--
ALTER TABLE `wD_ForceReply`
  ADD PRIMARY KEY (`id`,`toUserID`);

--
-- Indizes für die Tabelle `wD_ForumMessages`
--
ALTER TABLE `wD_ForumMessages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `latest` (`timeSent`),
  ADD KEY `threadReplies` (`type`,`toID`,`timeSent`),
  ADD KEY `latestReplySent` (`latestReplySent`),
  ADD KEY `profileLinks` (`type`,`fromUserID`,`timeSent`),
  ADD KEY `type` (`type`,`latestReplySent`);

--
-- Indizes für die Tabelle `wD_GameMessages`
--
ALTER TABLE `wD_GameMessages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `toMember` (`gameID`,`toCountryID`),
  ADD KEY `fromMember` (`gameID`,`fromCountryID`);

--
-- Indizes für die Tabelle `wD_Games`
--
ALTER TABLE `wD_Games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gname` (`name`),
  ADD KEY `processStatus` (`processStatus`,`processTime`),
  ADD KEY `minimumBet` (`minimumBet`),
  ADD KEY `turn` (`turn`),
  ADD KEY `phase` (`phase`),
  ADD KEY `pot` (`pot`),
  ADD KEY `password` (`password`),
  ADD KEY `potType` (`potType`,`turn`),
  ADD KEY `potType_2` (`potType`,`id`),
  ADD KEY `potType_3` (`potType`,`pot`),
  ADD KEY `phase_2` (`phase`,`turn`),
  ADD KEY `phase_3` (`phase`,`minimumBet`),
  ADD KEY `phase_4` (`phase`,`id`),
  ADD KEY `phase_5` (`phase`,`pot`),
  ADD KEY `phase_6` (`phase`,`password`),
  ADD KEY `phaseMinutes` (`phaseMinutes`),
  ADD KEY `phase_7` (`phase`,`phaseMinutes`),
  ADD KEY `anon` (`anon`),
  ADD KEY `pressType` (`pressType`);

--
-- Indizes für die Tabelle `wD_LikePost`
--
ALTER TABLE `wD_LikePost`
  ADD PRIMARY KEY (`userID`,`likeMessageID`);

--
-- Indizes für die Tabelle `wD_Members`
--
ALTER TABLE `wD_Members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gid` (`gameID`),
  ADD KEY `playingCount` (`status`,`userID`),
  ADD KEY `uid` (`userID`,`status`);

--
-- Indizes für die Tabelle `wD_Misc`
--
ALTER TABLE `wD_Misc`
  ADD PRIMARY KEY (`name`);

--
-- Indizes für die Tabelle `wD_ModeratorNotes`
--
ALTER TABLE `wD_ModeratorNotes`
  ADD KEY `linkIDType` (`linkIDType`,`linkID`,`timeSent`);

--
-- Indizes für die Tabelle `wD_ModForumMessages`
--
ALTER TABLE `wD_ModForumMessages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `latest` (`timeSent`),
  ADD KEY `threadReplies` (`type`,`toID`,`timeSent`),
  ADD KEY `latestReplySent` (`latestReplySent`),
  ADD KEY `profileLinks` (`type`,`fromUserID`,`timeSent`),
  ADD KEY `type` (`type`,`latestReplySent`);

--
-- Indizes für die Tabelle `wD_Moves`
--
ALTER TABLE `wD_Moves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unitID` (`unitID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `gameID` (`gameID`);

--
-- Indizes für die Tabelle `wD_MovesArchive`
--
ALTER TABLE `wD_MovesArchive`
  ADD KEY `Map` (`gameID`,`turn`);

--
-- Indizes für die Tabelle `wD_MuteCountry`
--
ALTER TABLE `wD_MuteCountry`
  ADD PRIMARY KEY (`userID`,`gameID`,`muteCountryID`);

--
-- Indizes für die Tabelle `wD_MuteThread`
--
ALTER TABLE `wD_MuteThread`
  ADD PRIMARY KEY (`userID`,`muteThreadID`);

--
-- Indizes für die Tabelle `wD_MuteUser`
--
ALTER TABLE `wD_MuteUser`
  ADD PRIMARY KEY (`userID`,`muteUserID`);

--
-- Indizes für die Tabelle `wD_NMRs`
--
ALTER TABLE `wD_NMRs`
  ADD KEY `gameID` (`gameID`,`userID`),
  ADD KEY `userID` (`userID`);

--
-- Indizes für die Tabelle `wD_Notices`
--
ALTER TABLE `wD_Notices`
  ADD KEY `homePageIndex` (`toUserID`,`timeSent`),
  ADD KEY `deleteIndex` (`keep`,`timeSent`);

--
-- Indizes für die Tabelle `wD_Orders`
--
ALTER TABLE `wD_Orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unitID` (`unitID`),
  ADD KEY `gameID` (`gameID`,`countryID`);

--
-- Indizes für die Tabelle `wD_PointsTransactions`
--
ALTER TABLE `wD_PointsTransactions`
  ADD KEY `userID` (`userID`),
  ADD KEY `gameID` (`gameID`);

--
-- Indizes für die Tabelle `wD_Ratings`
--
ALTER TABLE `wD_Ratings`
  ADD KEY `userID` (`userID`),
  ADD KEY `ratingType` (`ratingType`),
  ADD KEY `gameID` (`gameID`);

--
-- Indizes für die Tabelle `wD_Sessions`
--
ALTER TABLE `wD_Sessions`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `lastrequesttime` (`lastRequest`);

--
-- Indizes für die Tabelle `wD_Silences`
--
ALTER TABLE `wD_Silences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `postID` (`postID`);

--
-- Indizes für die Tabelle `wD_Territories`
--
ALTER TABLE `wD_Territories`
  ADD PRIMARY KEY (`mapID`,`id`);

--
-- Indizes für die Tabelle `wD_TerrStatus`
--
ALTER TABLE `wD_TerrStatus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gameID` (`gameID`,`terrID`),
  ADD KEY `retreatingUnitID` (`retreatingUnitID`),
  ADD KEY `occupyingUnitID` (`occupyingUnitID`);

--
-- Indizes für die Tabelle `wD_TerrStatusArchive`
--
ALTER TABLE `wD_TerrStatusArchive`
  ADD KEY `Map` (`gameID`,`turn`);

--
-- Indizes für die Tabelle `wD_UnitDestroyIndex`
--
ALTER TABLE `wD_UnitDestroyIndex`
  ADD PRIMARY KEY (`mapID`,`countryID`,`terrID`,`unitType`);

--
-- Indizes für die Tabelle `wD_Units`
--
ALTER TABLE `wD_Units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gameID` (`gameID`);

--
-- Indizes für die Tabelle `wD_Users`
--
ALTER TABLE `wD_Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uname` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `points` (`points`);

--
-- Indizes für die Tabelle `wD_VariantData`
--
ALTER TABLE `wD_VariantData`
  ADD PRIMARY KEY (`variantID`,`gameID`,`systemToken`,`typeID`,`userID`,`offset`);

--
-- Indizes für die Tabelle `wD_vDipMisc`
--
ALTER TABLE `wD_vDipMisc`
  ADD PRIMARY KEY (`name`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `wD_AdminLog`
--
ALTER TABLE `wD_AdminLog`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wD_CountrySwitch`
--
ALTER TABLE `wD_CountrySwitch`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wD_FailedLookups`
--
ALTER TABLE `wD_FailedLookups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wD_ForumMessages`
--
ALTER TABLE `wD_ForumMessages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wD_GameMessages`
--
ALTER TABLE `wD_GameMessages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wD_Games`
--
ALTER TABLE `wD_Games`
  MODIFY `id` mediumint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wD_Members`
--
ALTER TABLE `wD_Members`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wD_ModForumMessages`
--
ALTER TABLE `wD_ModForumMessages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wD_Moves`
--
ALTER TABLE `wD_Moves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wD_Orders`
--
ALTER TABLE `wD_Orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wD_Silences`
--
ALTER TABLE `wD_Silences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wD_TerrStatus`
--
ALTER TABLE `wD_TerrStatus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wD_Units`
--
ALTER TABLE `wD_Units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wD_Users`
--
ALTER TABLE `wD_Users`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
