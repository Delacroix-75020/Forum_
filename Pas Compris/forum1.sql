-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 23 oct. 2020 à 17:10
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP :  7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `forum1`
--

-- --------------------------------------------------------

--
-- Structure de la table `f_categories`
--

CREATE TABLE `f_categories` (
  `id_categorie` int(11) NOT NULL,
  `nom` varchar(255)
  primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `f_messages`
--

CREATE TABLE `f_messages` (
  `id_messsage` int(11) NOT NULL,
  `id_topic` int(11),
  `id_posteur` int(11),
  `date_heure_post` datetime,
  `date_heure_edition` datetime,
  `meilleure_reponse` int(1),
  `contenu` text
  primary key (id_messsage),
  foreign key (id_topic) references f_topics (id_topics),
  foreign key (id_posteur) references ?????????? (id_posteur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `f_sous-categories`
--

CREATE TABLE f_sous_categories (
  `id_souscategorie` int(11) NOT NULL,
  `id_categorie` int(11),
  `nom` varchar(255)
  primary key (id_souscategorie)
  foreign key (id_categorie) references f_categories (id_categorie)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `f_sous-categories`
--

INSERT INTO `f_sous_categories` (`id`, `id_categorie`, `nom`) VALUES
(1, 1, 'test');

-- --------------------------------------------------------

--
-- Structure de la table `f_suivis`
--

CREATE TABLE `f_suivis` (
  `id_suivis` int(11) NOT NULL,
  `id_user` int(11),
  `id_topic` int(11)
  primary key (id_topic),
  foreign key (id_user) references ?????????? (id_user),
  foreign key (id_topic) references f_topics (id_topic)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `f_topics`
--

CREATE TABLE `f_topics` (
  `id_topic` int(11) NOT NULL,
  `id_createur` int(11) ,
  `sujet` text,
  `contenu` text,
  `date-heure-creation` datetime,
  `resolu` tinyint(1),
  `notif_createur` tinyint(1)
  primary key (id_topic),
  foreign key (id_createur) ?????????? (id_createur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `f_topics-categorie`

CREATE TABLE f_topics_categorie (
  `id_topics_categorie` int(11) NOT NULL,
  `id_topic` int(11),
  `id_categorie` int(11),
  `id_souscategorie` int(11)
  primary key (id_topics_categorie),
  foreign key (id_topics) references f_topics (id_topics),
  foreign key (id_categorie) references f_categories (id_categorie),
  foreign key (id_souscategorie) references f_sous_categories (id_souscategorie)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `f_categories`
--
ALTER TABLE `f_categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `f_messages`
--
ALTER TABLE `f_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `f_sous-categories`
--
ALTER TABLE `f_sous_categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `f_suivis`
--
ALTER TABLE `f_suivis`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `f_topics`
--
ALTER TABLE `f_topics`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `f_topics-categorie`
--
ALTER TABLE `f_topics_categorie`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `f_categories`
--
ALTER TABLE `f_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `f_messages`
--
ALTER TABLE `f_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `f_sous-categories`
--
ALTER TABLE `f_sous_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `f_suivis`
--
ALTER TABLE `f_suivis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `f_topics`
--
ALTER TABLE `f_topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `f_topics-categorie`
--
ALTER TABLE `f_topics_categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
