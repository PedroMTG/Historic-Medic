-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 19-Set-2019 às 13:38
-- Versão do servidor: 10.3.16-MariaDB
-- versão do PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id10657600_historic_medic`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE `consulta` (
  `idconsulta` int(10) UNSIGNED NOT NULL,
  `paciente_idpaciente` int(10) UNSIGNED NOT NULL,
  `medico_idmedico` int(10) UNSIGNED NOT NULL,
  `dt_consulta` date NOT NULL,
  `sintomas` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `anotacoes` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exames_solicitados` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicamentos_indicados` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `consulta`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `doenca`
--

CREATE TABLE `doenca` (
  `iddoenca` int(10) UNSIGNED NOT NULL,
  `paciente_idpaciente` int(10) UNSIGNED NOT NULL,
  `nome` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `medico`
--

CREATE TABLE `medico` (
  `idmedico` int(10) UNSIGNED NOT NULL,
  `nome` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `crm` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `uf` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `especialidade` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `medico`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE `paciente` (
  `idpaciente` int(10) UNSIGNED NOT NULL,
  `nome` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `cpf` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `dt_nascimento` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `sexo` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_sanguineo` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `telefone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `paciente`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`idconsulta`,`paciente_idpaciente`,`medico_idmedico`),
  ADD KEY `consultas_FKIndex2` (`paciente_idpaciente`),
  ADD KEY `consultas_FKIndex3` (`medico_idmedico`);

--
-- Indexes for table `doenca`
--
ALTER TABLE `doenca`
  ADD PRIMARY KEY (`iddoenca`,`paciente_idpaciente`),
  ADD KEY `doenca_FKIndex1` (`paciente_idpaciente`);

--
-- Indexes for table `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`idmedico`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`idpaciente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consulta`
--
ALTER TABLE `consulta`
  MODIFY `idconsulta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `doenca`
--
ALTER TABLE `doenca`
  MODIFY `iddoenca` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medico`
--
ALTER TABLE `medico`
  MODIFY `idmedico` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `paciente`
--
ALTER TABLE `paciente`
  MODIFY `idpaciente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`paciente_idpaciente`) REFERENCES `paciente` (`idpaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`medico_idmedico`) REFERENCES `medico` (`idmedico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `doenca`
--
ALTER TABLE `doenca`
  ADD CONSTRAINT `doenca_ibfk_1` FOREIGN KEY (`paciente_idpaciente`) REFERENCES `paciente` (`idpaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
