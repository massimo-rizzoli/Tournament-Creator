-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 12, 2018 alle 12:47
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
-- Database: `tournament creator`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `gioca`
--

CREATE TABLE `gioca` (
  `Numero_Squadra1` int(11) NOT NULL,
  `Numero_Squadra2` int(11) NOT NULL,
  `Numero_Partita` int(11) NOT NULL,
  `Punteggio` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `gioca`
--

INSERT INTO `gioca` (`Numero_Squadra1`, `Numero_Squadra2`, `Numero_Partita`, `Punteggio`) VALUES
(1, 2, 1, '2-0');

-- --------------------------------------------------------

--
-- Struttura della tabella `partita`
--

CREATE TABLE `partita` (
  `ID_Partita` int(11) NOT NULL,
  `FK_Torneo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `partita`
--

INSERT INTO `partita` (`ID_Partita`, `FK_Torneo`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `squadra`
--

CREATE TABLE `squadra` (
  `Numero` int(11) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `FK_Torneo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `squadra`
--

INSERT INTO `squadra` (`Numero`, `Nome`, `FK_Torneo`) VALUES
(1, 'Prova1', 1),
(2, 'Prova2', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `tipo`
--

CREATE TABLE `tipo` (
  `ID_Tipo` int(11) NOT NULL,
  `Nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `tipo`
--

INSERT INTO `tipo` (`ID_Tipo`, `Nome`) VALUES
(1, 'Eliminazione diretta');

-- --------------------------------------------------------

--
-- Struttura della tabella `torneo`
--

CREATE TABLE `torneo` (
  `ID_Torneo` int(11) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `FK_Tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `torneo`
--

INSERT INTO `torneo` (`ID_Torneo`, `Nome`, `FK_Tipo`) VALUES
(1, 'Prova', 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `gioca`
--
ALTER TABLE `gioca`
  ADD PRIMARY KEY (`Numero_Squadra1`,`Numero_Squadra2`,`Numero_Partita`),
  ADD KEY `Numero_Squadra` (`Numero_Squadra1`,`Numero_Partita`),
  ADD KEY `Numero_Partita` (`Numero_Partita`),
  ADD KEY `NOme_Squadra2` (`Numero_Squadra2`);

--
-- Indici per le tabelle `partita`
--
ALTER TABLE `partita`
  ADD PRIMARY KEY (`ID_Partita`),
  ADD KEY `FK_Torneo` (`FK_Torneo`);

--
-- Indici per le tabelle `squadra`
--
ALTER TABLE `squadra`
  ADD PRIMARY KEY (`Numero`),
  ADD KEY `FK_Torneo` (`FK_Torneo`);

--
-- Indici per le tabelle `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`ID_Tipo`);

--
-- Indici per le tabelle `torneo`
--
ALTER TABLE `torneo`
  ADD PRIMARY KEY (`ID_Torneo`),
  ADD KEY `FK_Tipo` (`FK_Tipo`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `partita`
--
ALTER TABLE `partita`
  MODIFY `ID_Partita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `squadra`
--
ALTER TABLE `squadra`
  MODIFY `Numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `tipo`
--
ALTER TABLE `tipo`
  MODIFY `ID_Tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `torneo`
--
ALTER TABLE `torneo`
  MODIFY `ID_Torneo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `gioca`
--
ALTER TABLE `gioca`
  ADD CONSTRAINT `gioca_ibfk_1` FOREIGN KEY (`Numero_Partita`) REFERENCES `partita` (`ID_Partita`),
  ADD CONSTRAINT `gioca_ibfk_2` FOREIGN KEY (`Numero_Squadra1`) REFERENCES `squadra` (`Numero`),
  ADD CONSTRAINT `gioca_ibfk_3` FOREIGN KEY (`Numero_Squadra2`) REFERENCES `squadra` (`Numero`);

--
-- Limiti per la tabella `partita`
--
ALTER TABLE `partita`
  ADD CONSTRAINT `partita_ibfk_1` FOREIGN KEY (`FK_Torneo`) REFERENCES `torneo` (`ID_Torneo`);

--
-- Limiti per la tabella `squadra`
--
ALTER TABLE `squadra`
  ADD CONSTRAINT `squadra_ibfk_1` FOREIGN KEY (`FK_Torneo`) REFERENCES `torneo` (`ID_Torneo`);

--
-- Limiti per la tabella `torneo`
--
ALTER TABLE `torneo`
  ADD CONSTRAINT `torneo_ibfk_1` FOREIGN KEY (`FK_Tipo`) REFERENCES `tipo` (`ID_Tipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
