-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 13, 2018 alle 09:25
-- Versione del server: 10.1.25-MariaDB
-- Versione PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tournament`
--
CREATE DATABASE IF NOT EXISTS `tournament` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tournament`;

-- --------------------------------------------------------

--
-- Struttura della tabella `gioca`
--

CREATE TABLE `gioca` (
  `NumeroSquadra` int(11) NOT NULL,
  `IDTorneoSquadra` int(11) NOT NULL,
  `NumeroPartita` int(11) NOT NULL,
  `IDTorneoPartita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `partita`
--

CREATE TABLE `partita` (
  `Numero` int(11) NOT NULL,
  `IDTorneo` int(11) NOT NULL,
  `NumeroVincitrice` int(11) NOT NULL,
  `IDTorneoVincitrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `squadra`
--

CREATE TABLE `squadra` (
  `Numero` int(11) NOT NULL,
  `IDTorneo` int(11) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `tipo`
--

CREATE TABLE `tipo` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `torneo`
--

CREATE TABLE `torneo` (
  `ID` int(11) NOT NULL,
  `IDTipo` int(11) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `PwdAdmin` varchar(50) DEFAULT NULL,
  `DataCreazione` date DEFAULT NULL,
  `NomeGioco` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `gioca`
--
ALTER TABLE `gioca`
  ADD PRIMARY KEY (`NumeroSquadra`,`IDTorneoSquadra`,`NumeroPartita`,`IDTorneoPartita`),
  ADD KEY `NumeroPartita` (`NumeroPartita`,`IDTorneoPartita`);

--
-- Indici per le tabelle `partita`
--
ALTER TABLE `partita`
  ADD PRIMARY KEY (`Numero`,`IDTorneo`),
  ADD KEY `IDTorneo` (`IDTorneo`),
  ADD KEY `NumeroVincitrice` (`NumeroVincitrice`,`IDTorneoVincitrice`);

--
-- Indici per le tabelle `squadra`
--
ALTER TABLE `squadra`
  ADD PRIMARY KEY (`Numero`,`IDTorneo`),
  ADD KEY `IDTorneo` (`IDTorneo`);

--
-- Indici per le tabelle `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `torneo`
--
ALTER TABLE `torneo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDTipo` (`IDTipo`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `tipo`
--
ALTER TABLE `tipo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `torneo`
--
ALTER TABLE `torneo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `gioca`
--
ALTER TABLE `gioca`
  ADD CONSTRAINT `gioca_ibfk_1` FOREIGN KEY (`NumeroSquadra`,`IDTorneoSquadra`) REFERENCES `squadra` (`Numero`, `IDTorneo`),
  ADD CONSTRAINT `gioca_ibfk_2` FOREIGN KEY (`NumeroPartita`,`IDTorneoPartita`) REFERENCES `partita` (`Numero`, `IDTorneo`);

--
-- Limiti per la tabella `partita`
--
ALTER TABLE `partita`
  ADD CONSTRAINT `partita_ibfk_1` FOREIGN KEY (`IDTorneo`) REFERENCES `torneo` (`ID`),
  ADD CONSTRAINT `partita_ibfk_2` FOREIGN KEY (`NumeroVincitrice`,`IDTorneoVincitrice`) REFERENCES `squadra` (`Numero`, `IDTorneo`);

--
-- Limiti per la tabella `squadra`
--
ALTER TABLE `squadra`
  ADD CONSTRAINT `squadra_ibfk_1` FOREIGN KEY (`IDTorneo`) REFERENCES `torneo` (`ID`);

--
-- Limiti per la tabella `torneo`
--
ALTER TABLE `torneo`
  ADD CONSTRAINT `torneo_ibfk_1` FOREIGN KEY (`IDTipo`) REFERENCES `tipo` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
