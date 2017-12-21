-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 21 Décembre 2017 à 20:30
-- Version du serveur :  10.1.16-MariaDB
-- Version de PHP :  5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ges_client`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `ID_CLIENT` int(11) NOT NULL,
  `NUM_CLIENT` varchar(45) DEFAULT NULL COMMENT 'Numéro metier identifiant le client',
  `NOM` varchar(45) NOT NULL,
  `PRENOM` varchar(45) DEFAULT NULL,
  `SEXE` int(11) DEFAULT NULL,
  `ADRESSE` varchar(45) DEFAULT NULL,
  `CODE_POSTAL` varchar(5) DEFAULT NULL,
  `LOGIN` varchar(30) DEFAULT NULL,
  `PASSWORD` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`ID_CLIENT`, `NUM_CLIENT`, `NOM`, `PRENOM`, `SEXE`, `ADRESSE`, `CODE_POSTAL`, `LOGIN`, `PASSWORD`) VALUES
(1, '1254C', 'TCHOFFO', 'Merlin', 1, '22 Rue Marechal Le FOCH', '35700', 'czo', 'czo'),
(2, '56983J', 'LECLERC', 'Edouard', 1, '45 Rue François PIGNON', '75012', 'led', 'led'),
(3, '58967O', 'MAZURAIS', 'Ludivine', 2, '15 Rue Marechal Le Foch', '35640', 'mlu', 'mlu'),
(6, '56789U', 'SARKOZY', 'Nicolas', 1, '34 Avenue Martin Luther King', '95360', 'sni', 'sarko'),
(7, '56776K', 'TARTAMPION', 'Yves Maieul', 1, '56 Boulevard Jean Luc', '44230', 'tar', 'tYv'),
(8, '26789N', 'LOINSARD', 'Olivia', 2, '89 Rue Jean Jaurès', '56100', 'loi', 'oli'),
(9, '10789Q', 'LETERTRE', 'Yannick', 1, '56 Place de Corps-Nuds', '35600', 'ylet', '107yan'),
(10, '90787G', 'QUEGUINER', 'Charles', 1, '32 Rue COMPOSTEL', '75020', 'queg', 'queg75'),
(11, '12089V', 'PLACIDE', 'Fresnais', 1, '23 Rue LEGRAND MARCHAL', '72001', 'pfr', 'f720'),
(12, '12299A', 'SHEMATSI', 'Johnny', 1, '45 RUE DU LOYAL', '72010', 'shem', 'jshem'),
(13, '12089V', 'NEVO', 'Stéphane', 1, '33 RUE DU CLERC', '44000', 'snv', 'stnev'),
(14, '12285D', 'CHEVAL', 'Martine', 2, '67 Rue du vin', '33063', 'chm', 'chm'),
(15, '300890G', 'ELBAZ', 'Michelle', 2, '167 Rue Vercingétorix', '75016', 'mel', 'melB'),
(22, '34289C', 'Barack', 'OBAMA', 1, '4 Rue du Puisatier', '72010', 'bob', 'bob2016'),
(26, 'NUM_CMI_SWING', 'NOBI', 'GUY', 1, '34 RUE DE PARIS', '44000', 'ngu', 'gnb'),
(27, 'NUM_CLIENT_SWING', 'DEPARDIEU', 'Gerard', 1, '34 Rue de Paris', '44000', 'dge', 'dge'),
(28, NULL, 'MerlinEnchanteur', NULL, 0, NULL, NULL, 'MerlinEnchanteur', NULL),
(29, '0', 'Merlin', 'LeBelge', 0, NULL, NULL, NULL, NULL),
(30, '1', 'Frank', 'Langlais', 0, NULL, NULL, NULL, NULL),
(31, '2', 'Patrick', 'Lefracasseur', 0, NULL, NULL, NULL, NULL),
(32, '0', 'Syncha', 'TAGNE', 0, NULL, NULL, NULL, NULL),
(33, '1', '', '', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `ID_COMMANDE` int(11) NOT NULL,
  `NUM_COMMANDE` varchar(45) NOT NULL,
  `DATE` datetime NOT NULL,
  `QUANTITE` int(11) DEFAULT NULL,
  `ID_CLIENT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`ID_COMMANDE`, `NUM_COMMANDE`, `DATE`, `QUANTITE`, `ID_CLIENT`) VALUES
(1, 'CMD_01', '2015-11-10 15:00:00', 10, 1),
(2, 'CMD_02', '2015-12-09 10:00:00', 30, 1),
(3, 'CMD_03', '2016-01-09 09:00:00', 40, 2),
(4, 'CMD_04', '2016-02-15 14:30:00', 30, 2),
(5, 'CMD_05', '2016-06-17 17:30:00', 5, 10);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `ID_PRODUIT` int(11) NOT NULL,
  `REF_PRODUIT` varchar(45) DEFAULT NULL,
  `MARQUE` varchar(45) DEFAULT NULL,
  `GAMME` varchar(45) DEFAULT NULL,
  `LIBELLE` varchar(45) DEFAULT NULL,
  `PRIX_UNITAIRE` double DEFAULT NULL,
  `ID_COMMANDE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`ID_PRODUIT`, `REF_PRODUIT`, `MARQUE`, `GAMME`, `LIBELLE`, `PRIX_UNITAIRE`, `ID_COMMANDE`) VALUES
(2, 'REF_PRD01', 'RENAULT', 'LAGUNA', 'RENAULT LAGUNA COUPE', 7000, 1),
(3, 'REF_PRD02', 'RENAULT', 'MEGANE', 'RENAULT MEGANE I', 8900, 1),
(4, 'REF_PRD03', 'BMW', 'Serie 1', 'BMW Serie 1 Berline', 15000, 2),
(5, 'REF_PRD04', 'FORD', 'FIESTA', 'FORD FIESTA Break', 12000, 2),
(6, 'REF_PRD05', 'FORD', 'CMAX', 'FORD CMAX MONOSPACE', 18000, 3),
(7, 'REF_PRD06', 'NISSAN', 'QASHQAI', 'NISSAN QASHQAI ACENTA', 12500, 4),
(8, 'REF_PRD07', 'NISSAN', 'EVALIA', 'NISSAN EVALIA BERLINE', 23000, 4),
(9, 'REF_PRD07', 'NISSAN', 'JUKE', 'NISSAN JUKE CROSSOVER', 30000, 5),
(10, 'REF_PRD08', 'PEUGEOT', '108', 'PEUGEOT 108 CITADINE', 22000, 5),
(11, 'REF_PRD09', 'PEUGEOT', '2008', 'PEUGEOT 2008 CROSSOVER', 32000, 5);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID_CLIENT`),
  ADD KEY `NUM_CLIENT` (`NUM_CLIENT`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`ID_COMMANDE`),
  ADD KEY `fk_COMMANDE_Client_idx` (`ID_CLIENT`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`ID_PRODUIT`),
  ADD KEY `fk_PRODUIT_COMMANDE1_idx` (`ID_COMMANDE`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `ID_CLIENT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `ID_COMMANDE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `ID_PRODUIT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_COMMANDE_Client` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_PRODUIT_COMMANDE1` FOREIGN KEY (`ID_COMMANDE`) REFERENCES `commande` (`ID_COMMANDE`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
