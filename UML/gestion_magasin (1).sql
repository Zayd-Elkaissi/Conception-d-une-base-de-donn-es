-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 01 mars 2022 à 10:28
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_magasin`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `codeDeClient` char(4) NOT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `prenom` varchar(25) DEFAULT NULL,
  `clientsAdresse` char(30) DEFAULT NULL,
  `numeroDeTelephone` varchar(25) DEFAULT NULL,
  `email` char(30) DEFAULT NULL,
  `motDePasse` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`codeDeClient`, `nom`, `prenom`, `clientsAdresse`, `numeroDeTelephone`, `email`, `motDePasse`) VALUES
('C123', 'elbokiro ', 'karim', 'Rue ibn chaga nr 17', '0642395019', 'elbokirokarim@gmail.com', 'kariM091'),
('C124', 'elwahabi', 'marwa', 'El widadiya nr 5', '0639201529', 'elwahabimarma@gmail.com', 'Marwa120'),
('C125', 'Elkalil', 'Kamal', 'Rue elwahda nr 20', '0658392743', 'elkalilkamal@gmail.com', 'Karim234');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `idCommande` char(4) NOT NULL,
  `codeDeClient` char(4) DEFAULT NULL,
  `datePrecise` datetime DEFAULT NULL,
  `adsDeCommande` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idCommande`, `codeDeClient`, `datePrecise`, `adsDeCommande`) VALUES
('M123', 'C123', '2022-03-26 15:07:00', 'Rue ibn tilal nr 21'),
('M124', 'C124', '2022-04-26 01:07:32', 'Rue elgchra nr 28'),
('M125', 'C125', '2023-02-26 15:00:00', 'Rue elwahda nr 20');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `codeDeProduit` char(4) NOT NULL,
  `libelle` varchar(25) DEFAULT NULL,
  `description` varchar(25) DEFAULT NULL,
  `prixDeProduit` decimal(10,0) DEFAULT NULL,
  `qteStock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`codeDeProduit`, `libelle`, `description`, `prixDeProduit`, `qteStock`) VALUES
('P123', 'HYDRA ZEN', 'Le meilleur hydratant ', '350', 8),
('P124', 'fond de teint', 'Cette incroyable formule ', '250', 10),
('P125', 'Masque', 'Le meilleur masque', '200', 6);

-- --------------------------------------------------------

--
-- Structure de la table `quantitecommandee`
--

CREATE TABLE `quantitecommandee` (
  `idCommande` char(4) NOT NULL,
  `codeDeProduit` char(4) NOT NULL,
  `qtyCommand` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `quantitecommandee`
--

INSERT INTO `quantitecommandee` (`idCommande`, `codeDeProduit`, `qtyCommand`) VALUES
('M123', 'P123', '3'),
('M123', 'P124', '6'),
('M124', 'P124', '10'),
('M125', 'P125', '6');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`codeDeClient`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`idCommande`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`codeDeProduit`);

--
-- Index pour la table `quantitecommandee`
--
ALTER TABLE `quantitecommandee`
  ADD PRIMARY KEY (`idCommande`,`codeDeProduit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
