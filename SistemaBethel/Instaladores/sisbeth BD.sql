/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : sisbeth

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2014-11-20 22:43:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for applications
-- ----------------------------
DROP TABLE IF EXISTS `applications`;
CREATE TABLE `applications` (
  `ApplicationId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ApplicationName` varchar(235) NOT NULL,
  `Description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ApplicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for celulas
-- ----------------------------
DROP TABLE IF EXISTS `celulas`;
CREATE TABLE `celulas` (
  `IdCelula` bigint(20) NOT NULL AUTO_INCREMENT,
  `IdLider` bigint(20) DEFAULT NULL,
  `IdAnfitrion` bigint(20) DEFAULT NULL,
  `FechaRealizacion` date DEFAULT NULL,
  PRIMARY KEY (`IdCelula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for memberships
-- ----------------------------
DROP TABLE IF EXISTS `memberships`;
CREATE TABLE `memberships` (
  `UserId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ApplicationId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Password` varchar(128) NOT NULL,
  `PasswordFormat` int(11) NOT NULL,
  `PasswordSalt` varchar(128) NOT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `PasswordQuestion` varchar(256) DEFAULT NULL,
  `PasswordAnswer` varchar(128) DEFAULT NULL,
  `IsApproved` tinyint(1) NOT NULL,
  `IsLockedOut` tinyint(1) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `LastLoginDate` datetime NOT NULL,
  `LastPasswordChangedDate` datetime NOT NULL,
  `LastLockoutDate` datetime NOT NULL,
  `FailedPasswordAttemptCount` int(11) NOT NULL,
  `FailedPasswordAttemptWindowStart` datetime NOT NULL,
  `FailedPasswordAnswerAttemptCount` int(11) NOT NULL,
  `FailedPasswordAnswerAttemptWindowsStart` datetime NOT NULL,
  `Comment` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`UserId`),
  KEY `ApplicationId` (`ApplicationId`),
  CONSTRAINT `MembershipEntity_User` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `MembershipEntity_Application` FOREIGN KEY (`ApplicationId`) REFERENCES `applications` (`ApplicationId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for miembros
-- ----------------------------
DROP TABLE IF EXISTS `miembros`;
CREATE TABLE `miembros` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IdPadre` bigint(255) DEFAULT NULL,
  `PNombre` varchar(255) DEFAULT NULL,
  `SNombre` varchar(255) DEFAULT NULL,
  `PApellido` varchar(255) DEFAULT NULL,
  `SApellido` varchar(255) DEFAULT NULL,
  `NumCelular` varchar(20) DEFAULT NULL,
  `CompaniaCelular` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for profiles
-- ----------------------------
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `UserId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PropertyNames` longtext NOT NULL,
  `PropertyValueStrings` longtext NOT NULL,
  `PropertyValueBinary` longblob NOT NULL,
  `LastUpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`UserId`),
  CONSTRAINT `ProfileEntity_User` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for reportes
-- ----------------------------
DROP TABLE IF EXISTS `reportes`;
CREATE TABLE `reportes` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IdCelula` bigint(20) DEFAULT NULL,
  `Hermanos` int(11) DEFAULT NULL,
  `Invitados` int(11) DEFAULT NULL,
  `Ninos` int(11) DEFAULT NULL,
  `Conversiones` int(11) DEFAULT NULL,
  `Reconcilios` int(11) DEFAULT NULL,
  `BAgua` int(11) DEFAULT NULL,
  `BEspiritu` int(11) DEFAULT NULL,
  `Ofrenda` decimal(20,2) DEFAULT NULL,
  `Encuentristas` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `RoleId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ApplicationId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `RoleName` varchar(256) NOT NULL,
  `Description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`RoleId`),
  KEY `ApplicationId` (`ApplicationId`),
  CONSTRAINT `RoleEntity_Application` FOREIGN KEY (`ApplicationId`) REFERENCES `applications` (`ApplicationId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `UserId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ApplicationId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `IsAnonymous` tinyint(1) NOT NULL,
  `LastActivityDate` datetime NOT NULL,
  PRIMARY KEY (`UserId`),
  KEY `ApplicationId` (`ApplicationId`),
  CONSTRAINT `User_Application` FOREIGN KEY (`ApplicationId`) REFERENCES `applications` (`ApplicationId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for usersinroles
-- ----------------------------
DROP TABLE IF EXISTS `usersinroles`;
CREATE TABLE `usersinroles` (
  `UserId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `RoleId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `UsersInRole_Role` (`RoleId`),
  CONSTRAINT `UsersInRole_User` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UsersInRole_Role` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`RoleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for usersopenauthaccounts
-- ----------------------------
DROP TABLE IF EXISTS `usersopenauthaccounts`;
CREATE TABLE `usersopenauthaccounts` (
  `ApplicationName` varchar(128) NOT NULL,
  `ProviderName` varchar(128) NOT NULL,
  `ProviderUserId` varchar(128) NOT NULL,
  `ProviderUserName` longtext NOT NULL,
  `MembershipUserName` varchar(128) NOT NULL,
  `LastUsedUtc` datetime DEFAULT NULL,
  PRIMARY KEY (`ApplicationName`,`ProviderName`,`ProviderUserId`),
  KEY `MembershipUserName` (`MembershipUserName`),
  KEY `OpenAuthUserData_Accounts` (`ApplicationName`,`MembershipUserName`),
  CONSTRAINT `OpenAuthUserData_Accounts` FOREIGN KEY (`ApplicationName`, `MembershipUserName`) REFERENCES `usersopenauthdata` (`ApplicationName`, `MembershipUserName`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for usersopenauthdata
-- ----------------------------
DROP TABLE IF EXISTS `usersopenauthdata`;
CREATE TABLE `usersopenauthdata` (
  `ApplicationName` varchar(128) NOT NULL,
  `MembershipUserName` varchar(128) NOT NULL,
  `HasLocalPassword` tinyint(1) NOT NULL,
  PRIMARY KEY (`ApplicationName`,`MembershipUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- View structure for v_miembros
-- ----------------------------
DROP VIEW IF EXISTS `v_miembros`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_miembros` AS select 
m.Id,
CASE 
	WHEN m.IdPadre>0 THEN f_Pastor(m.Id,'Nombre')
	WHEN m.IdPadre=(SELECT id FROM miembros WHERE IdPadre=0) 
		THEN (SELECT CONCAT(ifnull(PNombre,''),' ',ifnull(SNombre,''),' ',ifnull(PApellido,''),' ',ifnull(SApellido,''))
				 FROM miembros WHERE IdPadre=0)
	ELSE '' 
END Pastor,
CASE 
	WHEN f_LiderRed(m.Id,f_Pastor(m.Id,'Id'),'Id')=li.Id THEN 
			 CONCAT(ifnull(li.PNombre,''),' ',ifnull(li.SNombre,''),' ',ifnull(li.PApellido,''),' ',ifnull(li.SApellido,''))
  WHEN f_Pastor(m.Id,'Id')=li.Id THEN
			 CONCAT(ifnull(li.PNombre,''),' ',ifnull(li.SNombre,''),' ',ifnull(li.PApellido,''),' ',ifnull(li.SApellido,''))
	ELSE IFNULL(f_LiderRed(m.Id,f_Pastor(m.Id,'Id'),'Nombre'),'') 
END Red,
CONCAT(ifnull(li.PNombre,''),' ',ifnull(li.SNombre,''),' ',ifnull(li.PApellido,''),' ',ifnull(li.SApellido,'')) LiderInmediato,
CONCAT(ifnull(m.PNombre,''),' ',ifnull(m.SNombre,''),' ',ifnull(m.PApellido,''),' ',ifnull(m.SApellido,'')) NombreCompleto,
m.PNombre,m.SNombre,m.PApellido,m.SApellido,
m.NumCelular,
case m.CompaniaCelular
		 when 'M' then 'Movistar'
		 when 'C' then 'Claro'
end Company
from miembros m
left join miembros li on li.Id=m.IdPadre ;

-- ----------------------------
-- Function structure for f_LiderRed
-- ----------------------------
DROP FUNCTION IF EXISTS `f_LiderRed`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_LiderRed`(id_miembro BIGINT, id_pastor BIGINT, Resultado Varchar(50)) RETURNS varchar(255) CHARSET utf8
BEGIN 

DECLARE nombre_lider0 varchar (255);
DECLARE nombre_lider varchar (255);
DECLARE valor varchar(255);
DECLARE id_padre int;
DECLARE nombre_pastor varchar (255);

While id_miembro > 0 Do

	SELECT 
	idPadre, 
	CONCAT(IFNULL(PNombre,''),' ',IFNULL(SNombre,''),' ',IFNULL(PApellido,''),' ',IFNULL(SApellido,'')) as NombreCompleto
	into id_miembro, nombre_lider0 
	from miembros where Id=id_miembro;

	if id_miembro>id_pastor then
		set id_padre=id_miembro;
		set nombre_lider=nombre_lider0;
	end if;

END WHILE;

IF Resultado='Nombre' THEN 
	set valor=nombre_lider;
ELSEIF Resultado='Id' THEN
	set valor=id_padre;
END IF;

RETURN valor;

 RETURN nombre_lider;
 
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for f_Pastor
-- ----------------------------
DROP FUNCTION IF EXISTS `f_Pastor`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_Pastor`(id_miembro BIGINT, Resultado Varchar(50)) RETURNS varchar(255) CHARSET utf8
BEGIN 

DECLARE nombre_lider0 varchar (255);
DECLARE nombre_lider varchar (255);
DECLARE valor varchar(255);
DECLARE id_pastor_general int;
DECLARE contador int;
DECLARE id_padre int;

SET contador=0;

lbWhile: While id_miembro > 0 Do

	SELECT 
	idPadre, 
	CONCAT(IFNULL(PNombre,''),' ',IFNULL(SNombre,''),' ',IFNULL(PApellido,''),' ',IFNULL(SApellido,'')) as NombreCompleto
	into id_miembro, nombre_lider0 
	from miembros where Id=id_miembro;

	if id_miembro=0 and contador=1 then
		SELECT CONCAT(IFNULL(PNombre,''),' ',IFNULL(SNombre,''),' ',IFNULL(PApellido,''),' ',IFNULL(SApellido,'')) into nombre_lider
		FROM miembros WHERE idpadre=0;

		LEAVE lbWhile;
	ELSEIF id_miembro>0 then
		set id_padre=id_miembro;
		set nombre_lider=nombre_lider0;
	End if;

	set contador=contador+1;
END WHILE;

IF Resultado='Nombre' THEN 
	set valor=nombre_lider;
ELSEIF Resultado='Id' THEN
	set valor=id_padre;
END IF;

RETURN valor;
 
END
;;
DELIMITER ;
