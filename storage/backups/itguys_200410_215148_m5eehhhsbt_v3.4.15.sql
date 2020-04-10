-- MySQL dump 10.17  Distrib 10.3.20-MariaDB, for Linux (x86_64)
--
-- Host: mysql    Database: itguys.ro
-- ------------------------------------------------------
-- Server version	5.7.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `assetindexdata_volumeId_idx` (`volumeId`),
  CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  KEY `assets_folderId_idx` (`folderId`),
  KEY `assets_volumeId_idx` (`volumeId`),
  KEY `assets_uploaderId_fk` (`uploaderId`),
  CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories_groupId_idx` (`groupId`),
  KEY `categories_parentId_fk` (`parentId`),
  CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categorygroups_name_idx` (`name`),
  KEY `categorygroups_handle_idx` (`handle`),
  KEY `categorygroups_structureId_idx` (`structureId`),
  KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `categorygroups_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedattributes_siteId_fk` (`siteId`),
  KEY `changedattributes_userId_fk` (`userId`),
  CONSTRAINT `changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedfields_siteId_fk` (`siteId`),
  KEY `changedfields_fieldId_fk` (`fieldId`),
  KEY `changedfields_userId_fk` (`userId`),
  CONSTRAINT `changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cloudflare_rules`
--

DROP TABLE IF EXISTS `cloudflare_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloudflare_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `siteId` int(11) NOT NULL,
  `trigger` varchar(255) NOT NULL,
  `urlsToClear` varchar(255) NOT NULL,
  `refresh` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cloudflare_rules_siteId_fk` (`siteId`),
  CONSTRAINT `cloudflare_rules_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `content_siteId_idx` (`siteId`),
  KEY `content_title_idx` (`title`),
  CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drafts_creatorId_fk` (`creatorId`),
  KEY `drafts_sourceId_fk` (`sourceId`),
  CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `elements_dateDeleted_idx` (`dateDeleted`),
  KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `elements_type_idx` (`type`),
  KEY `elements_enabled_idx` (`enabled`),
  KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  KEY `elements_draftId_fk` (`draftId`),
  KEY `elements_revisionId_fk` (`revisionId`),
  KEY `elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `elements_sites_siteId_idx` (`siteId`),
  KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `elements_sites_enabled_idx` (`enabled`),
  KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entries_postDate_idx` (`postDate`),
  KEY `entries_expiryDate_idx` (`expiryDate`),
  KEY `entries_authorId_idx` (`authorId`),
  KEY `entries_sectionId_idx` (`sectionId`),
  KEY `entries_typeId_idx` (`typeId`),
  KEY `entries_parentId_fk` (`parentId`),
  CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  KEY `entrytypes_sectionId_idx` (`sectionId`),
  KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `entrytypes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  KEY `fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `fields_groupId_idx` (`groupId`),
  KEY `fields_context_idx` (`context`),
  CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `globalsets_name_idx` (`name`),
  KEY `globalsets_handle_idx` (`handle`),
  KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gqlschemas_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `gqltokens_schemaId_fk` (`schemaId`),
  CONSTRAINT `gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configMap` mediumtext,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocks_ownerId_idx` (`ownerId`),
  KEY `matrixblocks_fieldId_idx` (`fieldId`),
  KEY `matrixblocks_typeId_idx` (`typeId`),
  KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `migrations_pluginId_idx` (`pluginId`),
  KEY `migrations_type_pluginId_idx` (`type`,`pluginId`),
  CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `relations_sourceId_idx` (`sourceId`),
  KEY `relations_targetId_idx` (`targetId`),
  KEY `relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  KEY `revisions_creatorId_fk` (`creatorId`),
  CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sections_handle_idx` (`handle`),
  KEY `sections_name_idx` (`name`),
  KEY `sections_structureId_idx` (`structureId`),
  KEY `sections_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sessions_uid_idx` (`uid`),
  KEY `sessions_token_idx` (`token`),
  KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `sessions_userId_idx` (`userId`),
  CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sitegroups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sites_dateDeleted_idx` (`dateDeleted`),
  KEY `sites_handle_idx` (`handle`),
  KEY `sites_sortOrder_idx` (`sortOrder`),
  KEY `sites_groupId_fk` (`groupId`),
  CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `structureelements_root_idx` (`root`),
  KEY `structureelements_lft_idx` (`lft`),
  KEY `structureelements_rgt_idx` (`rgt`),
  KEY `structureelements_level_idx` (`level`),
  KEY `structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taggroups_name_idx` (`name`),
  KEY `taggroups_handle_idx` (`handle`),
  KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tags_groupId_idx` (`groupId`),
  CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `templatecachequeries_type_idx` (`type`),
  CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `templatecaches_siteId_idx` (`siteId`),
  CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unq_idx` (`token`),
  KEY `tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  UNIQUE KEY `usergroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_uid_idx` (`uid`),
  KEY `users_verificationCode_idx` (`verificationCode`),
  KEY `users_email_idx` (`email`),
  KEY `users_username_idx` (`username`),
  KEY `users_photoId_fk` (`photoId`),
  CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `volumefolders_parentId_idx` (`parentId`),
  KEY `volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `volumes_name_idx` (`name`),
  KEY `volumes_handle_idx` (`handle`),
  KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `volumes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `widgets_userId_idx` (`userId`),
  CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'itguys.ro'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-10 21:51:48
-- MySQL dump 10.17  Distrib 10.3.20-MariaDB, for Linux (x86_64)
--
-- Host: mysql    Database: itguys.ro
-- ------------------------------------------------------
-- Server version	5.7.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (2,1,1,1,'240031_363734177085867_1075952931_o.jpg','image',1685,1594,110138,NULL,0,0,'2020-04-10 20:53:30','2020-04-10 20:53:30','2020-04-10 20:53:30','32b00dd7-d65f-4fbf-8c5e-27f1c242e63d'),(3,1,1,NULL,'240031_363734177085867_1075952931_o_200410_205503.jpg','image',1685,1594,110138,NULL,0,0,'2020-04-10 20:55:04','2020-04-10 20:55:04','2020-04-10 20:55:04','e11fe420-61c5-4ccf-9321-b1f091ab99bd'),(4,1,1,NULL,'240031_363734177085867_1075952931_o.jpg','image',1685,1594,110138,NULL,NULL,NULL,'2020-04-10 20:55:30','2020-04-10 20:55:30','2020-04-10 20:55:30','e0134fc6-4916-403d-878a-5dcfe6d3c9aa');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (5,1,'authorId','2020-04-10 21:01:25',1,1),(5,1,'expiryDate','2020-04-10 21:01:25',1,1),(5,1,'id','2020-04-10 21:01:25',1,1),(5,1,'postDate','2020-04-10 21:01:25',1,1),(5,1,'sectionId','2020-04-10 21:01:25',1,1),(5,1,'title','2020-04-10 21:01:25',1,1),(5,1,'typeId','2020-04-10 21:01:25',1,1),(5,3,'authorId','2020-04-10 21:01:25',1,1),(5,3,'expiryDate','2020-04-10 21:01:25',1,1),(5,3,'id','2020-04-10 21:01:25',1,1),(5,3,'postDate','2020-04-10 21:01:25',1,1),(5,3,'sectionId','2020-04-10 21:01:25',1,1),(5,3,'title','2020-04-10 21:01:25',1,1),(5,3,'typeId','2020-04-10 21:01:25',1,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cloudflare_rules`
--

LOCK TABLES `cloudflare_rules` WRITE;
/*!40000 ALTER TABLE `cloudflare_rules` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cloudflare_rules` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2020-01-22 00:54:16','2020-04-10 20:55:32','2e22945d-b160-4109-83da-d8012ba1e1fc'),(2,2,1,'240031 363734177085867 1075952931 o','2020-04-10 20:53:30','2020-04-10 20:53:30','ea8bb8d7-1e74-42c6-9754-5d2dc3fd8cb4'),(3,3,1,'240031 363734177085867 1075952931 o 200410 205503','2020-04-10 20:55:03','2020-04-10 20:55:03','4f02cd37-91d1-445c-8f88-8798a50cff0a'),(4,4,1,'240031 363734177085867 1075952931 o','2020-04-10 20:55:30','2020-04-10 20:55:30','63a2a4b1-84df-45f5-88e0-9988b6c068ea'),(5,4,2,'240031 363734177085867 1075952931 o','2020-04-10 20:57:56','2020-04-10 20:57:56','b5eef025-d27c-4dd9-a18e-1ccbd702dbf3'),(6,4,3,'240031 363734177085867 1075952931 o','2020-04-10 21:00:39','2020-04-10 21:00:39','2ad8c3c9-f58a-4465-9ddc-104a33a5c2d1'),(7,5,2,'Home','2020-04-10 21:01:25','2020-04-10 21:01:25','7862e5dc-1eba-4e06-92c1-ab221b0c8f82'),(8,5,1,'Home','2020-04-10 21:01:25','2020-04-10 21:01:25','09641756-16fa-4219-8b62-61932a31a69a'),(9,5,3,'Home','2020-04-10 21:01:25','2020-04-10 21:01:25','32b1853b-026b-4ac0-9c75-6e495185a044'),(10,6,2,'Home','2020-04-10 21:01:25','2020-04-10 21:01:25','7dae2638-b0f9-4a4a-9669-694d80bf45a0'),(11,6,1,'Home','2020-04-10 21:01:25','2020-04-10 21:01:25','7201766e-9b6f-4bac-be36-c28a2a26a945'),(12,6,3,'Home','2020-04-10 21:01:25','2020-04-10 21:01:25','a8e15ca5-7ab7-49a6-8ddb-7dbfc1242911');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `craftidtokens` VALUES (2,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjNmNDBmZmZiMWNmOTU4YjRmMDc5N2QxNTE3NjJlMWU2YjVjMGJhODZmNTEzZWU2MTBkZDJlZDg2ZTgxNzlmZjM4Y2RkMjJmMTVjYjU5NTFjIn0.eyJhdWQiOiI2RHZFcmE3ZXFSS0xZaWM5Zm92eUQyRldGall4UndabiIsImp0aSI6IjNmNDBmZmZiMWNmOTU4YjRmMDc5N2QxNTE3NjJlMWU2YjVjMGJhODZmNTEzZWU2MTBkZDJlZDg2ZTgxNzlmZjM4Y2RkMjJmMTVjYjU5NTFjIiwiaWF0IjoxNTg2NTUzNjU5LCJuYmYiOjE1ODY1NTM2NTksImV4cCI6MTU4OTE0NTY1OSwic3ViIjoiMTIzNjkyIiwic2NvcGVzIjpbInB1cmNoYXNlUGx1Z2lucyIsImV4aXN0aW5nUGx1Z2lucyIsInRyYW5zZmVyUGx1Z2luTGljZW5zZSIsImRlYXNzb2NpYXRlUGx1Z2luTGljZW5zZSJdfQ.bJIA_d4C0u664cyhdUOc-PjN-CGaKX_G1SkaDbEImVPiM0pJciRbBNxwSpJ2YLFhhZ9cT4jZNBICNX192effeLnQzz2uMVx_9sGOLwsbgQIYL-QW-Wo0KWJS22rp-lGeOdSe1qQCTDhnEawYX5jHLbDoz-sVnHS90PfAqyeGeLc','2020-05-10 21:21:39','2020-04-10 21:21:39','2020-04-10 21:21:39','2825cf9d-e59d-489e-a3b4-ca6ef271eb2d');
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2020-01-22 00:54:16','2020-04-10 20:55:32',NULL,'aec0b35e-7225-4dbc-b6f6-c214ae91cdbd'),(2,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-04-10 20:53:30','2020-04-10 20:53:30','2020-04-10 20:55:22','b4e14804-13ed-4422-a8d9-80c80ca8ddc9'),(3,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-04-10 20:55:03','2020-04-10 20:55:03','2020-04-10 20:55:22','8fd241ce-2be0-4cbf-aabf-d40789f36d9f'),(4,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-04-10 20:55:30','2020-04-10 20:55:30',NULL,'0fbff791-05f2-4e4e-bac7-7d5393dac13e'),(5,NULL,NULL,NULL,'craft\\elements\\Entry',1,0,'2020-04-10 21:01:25','2020-04-10 21:01:25',NULL,'2720b103-7e03-4e0f-abd2-3351e75d6a19'),(6,NULL,1,NULL,'craft\\elements\\Entry',1,0,'2020-04-10 21:01:25','2020-04-10 21:01:25',NULL,'f098d3f3-86b0-40b9-9931-1bb2c16ad344');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2020-01-22 00:54:16','2020-01-22 00:54:16','d356bde1-c61f-4c2a-a124-338f565fa84d'),(2,2,1,NULL,NULL,1,'2020-04-10 20:53:30','2020-04-10 20:53:30','5bae9e89-f4ca-463c-a640-d9d357ba0d90'),(3,3,1,NULL,NULL,1,'2020-04-10 20:55:03','2020-04-10 20:55:03','9de85299-56cb-4c80-9b76-54dc27326180'),(4,4,1,NULL,NULL,1,'2020-04-10 20:55:30','2020-04-10 20:55:30','e607b22d-40b0-4cd7-bfb4-a904eaca5636'),(5,4,2,NULL,NULL,1,'2020-04-10 20:57:56','2020-04-10 20:57:56','3d20c4da-0ce3-4587-bf70-c60c685d8a99'),(6,4,3,NULL,NULL,1,'2020-04-10 21:00:39','2020-04-10 21:00:39','8eb5181c-8fc4-4f0a-8398-99560e1a81f0'),(7,5,2,'home','__home__',1,'2020-04-10 21:01:25','2020-04-10 21:01:25','92692e8f-a1e7-4aeb-96c1-4b0f65806edb'),(8,5,1,'home','__home__',1,'2020-04-10 21:01:25','2020-04-10 21:01:25','0d306562-e9ba-480b-a227-cf1fcc8b15bd'),(9,5,3,'home','__home__',1,'2020-04-10 21:01:25','2020-04-10 21:01:25','bf4da4b9-cc16-4265-b6ab-b4abf041075c'),(10,6,2,'home','__home__',1,'2020-04-10 21:01:25','2020-04-10 21:01:25','668677c5-f5f4-4f9f-9cfe-9627dad4e687'),(11,6,1,'home','__home__',1,'2020-04-10 21:01:25','2020-04-10 21:01:25','1880ec22-d076-433c-bf54-9a6e6359f15c'),(12,6,3,'home','__home__',1,'2020-04-10 21:01:25','2020-04-10 21:01:25','fcf67048-5ecc-4402-84ef-69dadbab7775');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (5,1,NULL,1,NULL,'2020-04-10 21:01:00',NULL,NULL,'2020-04-10 21:01:25','2020-04-10 21:01:25','c6f28600-5e56-46bb-846c-4e2465d8a56e'),(6,1,NULL,1,NULL,'2020-04-10 21:01:00',NULL,NULL,'2020-04-10 21:01:25','2020-04-10 21:01:25','6361358c-93f0-4061-9cc7-be771a64b8f0');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,NULL,'Home','home',0,NULL,'{section.name|raw}',1,'2020-04-10 21:01:25','2020-04-10 21:01:25',NULL,'adeeb369-f633-437f-beee-674156ada575');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2020-01-22 00:54:15','2020-01-22 00:54:15','1e48a75f-39b5-40f4-984a-09cf20c9fae5');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'3.4.15','3.5.0',0,'[]','zAcOHtA5trYP','2020-01-22 00:54:15','2020-04-10 20:48:25','75655db4-87bc-4c0a-a878-68ceb68d42b7');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,NULL,'app','Install','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','93a44ff2-7104-469e-9b72-bfb6da8c5961'),(2,NULL,'app','m150403_183908_migrations_table_changes','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','d1eeb983-0b6c-4c05-8faa-8df683e37fab'),(3,NULL,'app','m150403_184247_plugins_table_changes','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','53464240-0d5e-4fff-bf1e-12c3edd2483b'),(4,NULL,'app','m150403_184533_field_version','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','cb85f502-8bc6-45a2-89ca-ef474dbca750'),(5,NULL,'app','m150403_184729_type_columns','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','bfcae55b-1699-4bee-8f9f-14d29d8cb7d0'),(6,NULL,'app','m150403_185142_volumes','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','79f9c912-6395-4ecf-8dc0-1ed5005c545d'),(7,NULL,'app','m150428_231346_userpreferences','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','073b6fc5-1cc2-4508-b137-27752c82d0f7'),(8,NULL,'app','m150519_150900_fieldversion_conversion','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','0ca5d467-b964-49f2-9a3a-2e67d9237ac0'),(9,NULL,'app','m150617_213829_update_email_settings','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','30f3abdf-6aee-48a5-9045-4abc05a9763e'),(10,NULL,'app','m150721_124739_templatecachequeries','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','1f02e135-a43a-4cff-bd6a-b01beff4c813'),(11,NULL,'app','m150724_140822_adjust_quality_settings','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','cfc0e0ec-d302-4e57-8c35-7ee82414188b'),(12,NULL,'app','m150815_133521_last_login_attempt_ip','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','c09e2cbd-91ad-49a1-aa59-83115c2a88f8'),(13,NULL,'app','m151002_095935_volume_cache_settings','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','22c07a25-4cac-4774-9eb0-45c9a4b5450c'),(14,NULL,'app','m151005_142750_volume_s3_storage_settings','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','66b09dc9-4a83-4ce8-94f6-4861f6f1fc7c'),(15,NULL,'app','m151016_133600_delete_asset_thumbnails','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','33ea46b2-270a-4670-83fc-9f5984c9ae33'),(16,NULL,'app','m151209_000000_move_logo','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','04814e54-f5ff-4541-9085-a71baee52719'),(17,NULL,'app','m151211_000000_rename_fileId_to_assetId','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','b0c826d2-247d-4e92-8c5a-db2c64b9d41d'),(18,NULL,'app','m151215_000000_rename_asset_permissions','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','2f7308d0-9f4c-4cc5-b7a0-2ebf7a7d5a97'),(19,NULL,'app','m160707_000001_rename_richtext_assetsource_setting','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','1713a239-fa4d-4bab-abb3-e0040d875780'),(20,NULL,'app','m160708_185142_volume_hasUrls_setting','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','846b5370-e3ed-4b3f-b72d-af9377115557'),(21,NULL,'app','m160714_000000_increase_max_asset_filesize','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','11ea4b5a-79a2-4c78-8240-06fe3a3dd9cf'),(22,NULL,'app','m160727_194637_column_cleanup','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','478745f5-831b-498d-8cb1-f0fbf93567e5'),(23,NULL,'app','m160804_110002_userphotos_to_assets','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','f9c55a1a-e559-4423-ab43-3a65e03bf4ce'),(24,NULL,'app','m160807_144858_sites','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','aa6b4285-7a21-4f31-a466-cd262616ccc8'),(25,NULL,'app','m160829_000000_pending_user_content_cleanup','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','4da74f19-94df-42fa-b2b5-6b0e6ad04224'),(26,NULL,'app','m160830_000000_asset_index_uri_increase','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','dd52a452-d840-448e-92be-a569f9c043d3'),(27,NULL,'app','m160912_230520_require_entry_type_id','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','d115781d-344d-4133-9586-97093d15fb56'),(28,NULL,'app','m160913_134730_require_matrix_block_type_id','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','e571875c-5258-47b5-b6e0-e5c186eb76e9'),(29,NULL,'app','m160920_174553_matrixblocks_owner_site_id_nullable','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','837b76ae-b6d0-4c5d-b395-b2407b0f84e5'),(30,NULL,'app','m160920_231045_usergroup_handle_title_unique','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','266b299a-2e19-446b-9ec6-3d35b786bfae'),(31,NULL,'app','m160925_113941_route_uri_parts','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','7607df5d-c242-42f5-9dd6-1e66320f34e5'),(32,NULL,'app','m161006_205918_schemaVersion_not_null','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','8f9f1111-e101-4f16-95dd-c82324988a59'),(33,NULL,'app','m161007_130653_update_email_settings','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','8e642f3f-6b21-4199-b4b1-87b8b803fa23'),(34,NULL,'app','m161013_175052_newParentId','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','eeb2a64f-fe0f-477a-8ba1-f077b82bd81a'),(35,NULL,'app','m161021_102916_fix_recent_entries_widgets','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','6d968904-3185-4940-b652-0f4792e21d4e'),(36,NULL,'app','m161021_182140_rename_get_help_widget','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','b8c492a3-23f0-4c72-9fb5-99ac27174301'),(37,NULL,'app','m161025_000000_fix_char_columns','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','00bcf5bb-914b-4719-a87d-5da610a27205'),(38,NULL,'app','m161029_124145_email_message_languages','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','a5b7427d-0295-4fbf-9035-4c27f7fc5d70'),(39,NULL,'app','m161108_000000_new_version_format','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','dfcc517a-fba3-4c9b-ab30-24d516bfe46c'),(40,NULL,'app','m161109_000000_index_shuffle','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','9802ad66-56f9-48fc-8e30-3fc71b8735cd'),(41,NULL,'app','m161122_185500_no_craft_app','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','1d588aa3-f682-4608-9359-2b6f767ba3fa'),(42,NULL,'app','m161125_150752_clear_urlmanager_cache','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','c494a06f-e49b-45f8-abd2-c18b3bc0822e'),(43,NULL,'app','m161220_000000_volumes_hasurl_notnull','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','f9826488-c6c2-47a8-a83c-918ed1a7b3f1'),(44,NULL,'app','m170114_161144_udates_permission','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','053ad711-3352-4c5a-8d5f-44e061e16dd1'),(45,NULL,'app','m170120_000000_schema_cleanup','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','1d70edd5-b539-45f7-aebf-f472219dddc5'),(46,NULL,'app','m170126_000000_assets_focal_point','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','6fdf9bd4-543b-4b86-9981-0a2c3865fce2'),(47,NULL,'app','m170206_142126_system_name','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','794a9d27-5326-4e4e-aaca-318467ad9f97'),(48,NULL,'app','m170217_044740_category_branch_limits','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','5b7e8647-a9cd-431c-8dc2-20b7a9d4d6a8'),(49,NULL,'app','m170217_120224_asset_indexing_columns','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','4436f8dd-4519-488f-893b-e4f76c967480'),(50,NULL,'app','m170223_224012_plain_text_settings','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','cb08e899-5a7b-4493-83d3-af9f7eb2e19e'),(51,NULL,'app','m170227_120814_focal_point_percentage','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','c45f3045-5238-48c3-a95f-e147fe557f58'),(52,NULL,'app','m170228_171113_system_messages','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','94c263e8-9722-417b-b658-06e04ec699fb'),(53,NULL,'app','m170303_140500_asset_field_source_settings','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','ae8e41a0-e64f-4905-8dc4-08bbcda3eddd'),(54,NULL,'app','m170306_150500_asset_temporary_uploads','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','715fe7ea-c39e-477f-940b-822cc8f7413a'),(55,NULL,'app','m170523_190652_element_field_layout_ids','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','8759f308-1629-4731-b06c-e9ac8acbd075'),(56,NULL,'app','m170612_000000_route_index_shuffle','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','d2605c5e-c8b6-45c9-b90f-be147814a653'),(57,NULL,'app','m170621_195237_format_plugin_handles','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','c3b6bd87-3e85-43aa-b900-9166d756c6c3'),(58,NULL,'app','m170630_161027_deprecation_line_nullable','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','8abff78c-ecea-4caf-b76a-72655a6b905f'),(59,NULL,'app','m170630_161028_deprecation_changes','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','f82dd98f-6063-4edc-b1a6-69a67f04e6a8'),(60,NULL,'app','m170703_181539_plugins_table_tweaks','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','645a58ba-3259-4bda-ab8c-7520e16c7399'),(61,NULL,'app','m170704_134916_sites_tables','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','8479158d-6123-4d20-8852-9b1e6d719d07'),(62,NULL,'app','m170706_183216_rename_sequences','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','d1299400-5d8e-48f8-8563-23223313b5a9'),(63,NULL,'app','m170707_094758_delete_compiled_traits','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','5a6556ea-2a24-4f3f-b61c-0e186973bcc5'),(64,NULL,'app','m170731_190138_drop_asset_packagist','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','6f7ae323-4baf-4acc-9182-2c2248dfd7c9'),(65,NULL,'app','m170810_201318_create_queue_table','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','5f7f35cb-19a3-4d72-b2ad-9703fe1b4ca1'),(66,NULL,'app','m170816_133741_delete_compiled_behaviors','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','2aae5d55-a93e-4027-b02e-a63d8c9b339a'),(67,NULL,'app','m170903_192801_longblob_for_queue_jobs','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','7ddbf940-2f10-435a-9791-2df8401c89f9'),(68,NULL,'app','m170914_204621_asset_cache_shuffle','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','4c39552e-b07a-48ad-aa9a-ca682dca0524'),(69,NULL,'app','m171011_214115_site_groups','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','90bab00f-263e-4fbe-a296-c70bb2d37ef7'),(70,NULL,'app','m171012_151440_primary_site','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','2ccf1cd2-3bca-4a50-b624-e6b42708840e'),(71,NULL,'app','m171013_142500_transform_interlace','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','220ea074-c856-44ab-a522-9dbdddb52be4'),(72,NULL,'app','m171016_092553_drop_position_select','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','4eb761d1-e403-4fb5-86b4-2e86fef1349b'),(73,NULL,'app','m171016_221244_less_strict_translation_method','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','2618e61f-148e-4815-bae5-c50670072de0'),(74,NULL,'app','m171107_000000_assign_group_permissions','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','171c1cad-95e2-40f8-9124-86060499bc2f'),(75,NULL,'app','m171117_000001_templatecache_index_tune','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','d70fce22-e78f-4407-814e-e1a91a27254e'),(76,NULL,'app','m171126_105927_disabled_plugins','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','36164a75-6327-4c08-be45-91e14fe1ce0b'),(77,NULL,'app','m171130_214407_craftidtokens_table','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','ba5be7dc-1a25-40de-b252-c5874aa8200f'),(78,NULL,'app','m171202_004225_update_email_settings','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','31fa0574-721c-433a-b247-71a4063029e7'),(79,NULL,'app','m171204_000001_templatecache_index_tune_deux','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','7231e476-c530-4d2a-9a5a-88e93a559f83'),(80,NULL,'app','m171205_130908_remove_craftidtokens_refreshtoken_column','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','cc52e408-8b86-4ac3-8f65-7662b4a9e26b'),(81,NULL,'app','m171218_143135_longtext_query_column','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','d977dd42-c88a-43b3-9214-8f409d573e1c'),(82,NULL,'app','m171231_055546_environment_variables_to_aliases','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','9fcd946a-bf48-4128-8b37-aa67ab1a82e1'),(83,NULL,'app','m180113_153740_drop_users_archived_column','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','7d4ec18e-f628-4e03-ad9b-91cf0349d6be'),(84,NULL,'app','m180122_213433_propagate_entries_setting','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','b52c135b-4d07-46f1-9088-d4e59fa16f1a'),(85,NULL,'app','m180124_230459_fix_propagate_entries_values','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','b89ba140-c56c-4623-a252-64e495cc57bf'),(86,NULL,'app','m180128_235202_set_tag_slugs','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','aab7ba38-0dff-4f43-9a58-1b031e4f4f67'),(87,NULL,'app','m180202_185551_fix_focal_points','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','b0367d40-bf8a-484f-9444-f1d10bf09b70'),(88,NULL,'app','m180217_172123_tiny_ints','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','5979acd0-60be-41dc-9e60-40d47a6ed6ca'),(89,NULL,'app','m180321_233505_small_ints','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','e0c3c7d4-aeec-4e28-a1e3-c4278829d7ff'),(90,NULL,'app','m180328_115523_new_license_key_statuses','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','d05ba1f6-ec9b-4f3f-8532-24d603fa2347'),(91,NULL,'app','m180404_182320_edition_changes','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','e4c1996a-6be0-4fba-9d6d-7582ad8d5c04'),(92,NULL,'app','m180411_102218_fix_db_routes','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','bfdfcf0e-ebf6-4185-bb49-5a363acecb76'),(93,NULL,'app','m180416_205628_resourcepaths_table','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','698bf3f7-28e1-42e6-aa8f-2938dbcf4d37'),(94,NULL,'app','m180418_205713_widget_cleanup','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','020ab4cc-dbd8-4766-bc07-bfa7017d76e6'),(95,NULL,'app','m180425_203349_searchable_fields','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','ab0549b6-4665-452c-bd16-1021e0d14c8d'),(96,NULL,'app','m180516_153000_uids_in_field_settings','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','68bd4e74-599c-40fd-a8a5-95354736a395'),(97,NULL,'app','m180517_173000_user_photo_volume_to_uid','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','ac73c5fa-2f70-4827-81ed-676e4c1aee1e'),(98,NULL,'app','m180518_173000_permissions_to_uid','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','7a693fb2-476f-494f-aa6b-fa50c8e2777d'),(99,NULL,'app','m180520_173000_matrix_context_to_uids','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','25880930-1c98-462a-92b7-33a803e4050a'),(100,NULL,'app','m180521_173000_initial_yml_and_snapshot','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','7f239897-b6ce-4af0-930f-7b574db33798'),(101,NULL,'app','m180731_162030_soft_delete_sites','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','6e581e0d-a8b5-401e-a3de-18189ac4d0df'),(102,NULL,'app','m180810_214427_soft_delete_field_layouts','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','1f8e123a-637b-4383-a075-57985f1f8cfa'),(103,NULL,'app','m180810_214439_soft_delete_elements','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','50523641-30e5-44db-94c1-3bea30756c98'),(104,NULL,'app','m180824_193422_case_sensitivity_fixes','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','216b9984-7db0-4f84-80db-992a9ec8320b'),(105,NULL,'app','m180901_151639_fix_matrixcontent_tables','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','c9260f71-0fde-4cc6-a50e-372ba1cdcb13'),(106,NULL,'app','m180904_112109_permission_changes','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','d7cbe151-7353-4baa-aecd-e35a16311fef'),(107,NULL,'app','m180910_142030_soft_delete_sitegroups','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','65c19c20-b9da-4c74-a53c-1c377cba822e'),(108,NULL,'app','m181011_160000_soft_delete_asset_support','2020-01-22 00:54:16','2020-01-22 00:54:16','2020-01-22 00:54:16','db2a7ae7-74bc-401b-8ee5-1a515878aae5'),(109,NULL,'app','m181016_183648_set_default_user_settings','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','219f3657-6a92-4aac-9b07-d6eb91d4a7a4'),(110,NULL,'app','m181017_225222_system_config_settings','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','21c0b7d4-0eeb-4ca5-a217-344803b0bfba'),(111,NULL,'app','m181018_222343_drop_userpermissions_from_config','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','17467ba1-63a6-48bc-a5a1-327f014ec755'),(112,NULL,'app','m181029_130000_add_transforms_routes_to_config','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','bbdd3677-8c67-4e20-9c6d-5df9bbfecf8f'),(113,NULL,'app','m181112_203955_sequences_table','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','be0b0a46-e5d1-4906-b1aa-3c94bf8a43e7'),(114,NULL,'app','m181121_001712_cleanup_field_configs','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','ed76c829-df6a-4114-a279-9a09f6a2b813'),(115,NULL,'app','m181128_193942_fix_project_config','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','8b2bb1cd-533b-47d1-962d-069757f5b33c'),(116,NULL,'app','m181130_143040_fix_schema_version','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','1f36fe80-5b97-4fbe-a3fc-2ace4c3be46c'),(117,NULL,'app','m181211_143040_fix_entry_type_uids','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','448a3090-e35e-4344-9ace-42ad2d7dd377'),(118,NULL,'app','m181213_102500_config_map_aliases','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','2e1fd299-a175-499f-93d4-4b8f0431a6ce'),(119,NULL,'app','m181217_153000_fix_structure_uids','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','5bf96bd1-2d62-4753-97ed-c33945097969'),(120,NULL,'app','m190104_152725_store_licensed_plugin_editions','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','3badcdb4-4bbc-47fb-830b-9996e1ad19f7'),(121,NULL,'app','m190108_110000_cleanup_project_config','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','6fc78e25-1b7e-4523-ba50-1bb4b832a7fc'),(122,NULL,'app','m190108_113000_asset_field_setting_change','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','bca1ce9e-b313-404a-aa59-cd191d5c0ecf'),(123,NULL,'app','m190109_172845_fix_colspan','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','adc4f06d-dd9d-4dfd-a23f-1081ddcc7490'),(124,NULL,'app','m190110_150000_prune_nonexisting_sites','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','a7c7b225-dc4b-4f27-9c30-146b647ddbca'),(125,NULL,'app','m190110_214819_soft_delete_volumes','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','13759465-b23e-437f-b76c-fe0bcad675f9'),(126,NULL,'app','m190112_124737_fix_user_settings','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','21aa7fa2-61c5-4b68-b413-55df8a713162'),(127,NULL,'app','m190112_131225_fix_field_layouts','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','5813490b-ed58-4296-954b-cf1649f10832'),(128,NULL,'app','m190112_201010_more_soft_deletes','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','69a924a1-5925-474e-91af-46b372feb9a7'),(129,NULL,'app','m190114_143000_more_asset_field_setting_changes','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','5fef7e4d-6ab1-418f-88d1-3f78fff8d71a'),(130,NULL,'app','m190121_120000_rich_text_config_setting','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','cb6ffc2b-1ca1-4d03-b4e5-99392c8cc858'),(131,NULL,'app','m190125_191628_fix_email_transport_password','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','2580d2f8-6c92-47cb-9a46-fd9c2e79ea70'),(132,NULL,'app','m190128_181422_cleanup_volume_folders','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','3458587f-58b2-4136-8d4e-16c811489f63'),(133,NULL,'app','m190205_140000_fix_asset_soft_delete_index','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','0295a64f-7ac8-4e5a-beb1-8d9109228ea6'),(134,NULL,'app','m190208_140000_reset_project_config_mapping','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','f6db4827-4d8a-46eb-88fa-7710e369f6be'),(135,NULL,'app','m190218_143000_element_index_settings_uid','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','3c319413-0812-417f-a505-ee5dfa320ac1'),(136,NULL,'app','m190312_152740_element_revisions','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','71ad73d2-a14e-42de-8af2-afab12cfe0a2'),(137,NULL,'app','m190327_235137_propagation_method','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','bf820ab5-d9c8-4480-943a-0f1fe22cb716'),(138,NULL,'app','m190401_223843_drop_old_indexes','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','2543e8c8-64b0-4b97-abd1-b0b599984da9'),(139,NULL,'app','m190416_014525_drop_unique_global_indexes','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','a214165d-6f19-40c1-ae36-5c8aea70e4f8'),(140,NULL,'app','m190417_085010_add_image_editor_permissions','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','7f039315-0e41-4bff-b30c-5dbdce5ba69a'),(141,NULL,'app','m190502_122019_store_default_user_group_uid','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','ab0099e1-49d4-4e6f-bbeb-65bda71a8632'),(142,NULL,'app','m190504_150349_preview_targets','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','1dd41cf2-cf40-4568-88c3-5ae70bab33ba'),(143,NULL,'app','m190516_184711_job_progress_label','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','f75737a4-ab62-4f68-91c7-e399d328ffcd'),(144,NULL,'app','m190523_190303_optional_revision_creators','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','b4cd76f8-372c-4486-98fd-f1ce04b0e94a'),(145,NULL,'app','m190529_204501_fix_duplicate_uids','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','564ef0cc-3019-4d09-b895-19b7ec4682a1'),(146,NULL,'app','m190605_223807_unsaved_drafts','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','5e0030d5-d5c1-481e-8a80-04ee765d492b'),(147,NULL,'app','m190607_230042_entry_revision_error_tables','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','1d74faba-1fed-4374-b72f-0e097bb0622a'),(148,NULL,'app','m190608_033429_drop_elements_uid_idx','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','f9981110-9021-48d3-a3eb-361707d9872e'),(149,NULL,'app','m190617_164400_add_gqlschemas_table','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','aff561e8-559e-4210-8f22-a161c182a8d6'),(150,NULL,'app','m190624_234204_matrix_propagation_method','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','32d8291e-1e19-4a4d-b263-d2175cec11f3'),(151,NULL,'app','m190711_153020_drop_snapshots','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','acba6625-c069-49bd-9b69-20a8b8ce9e25'),(152,NULL,'app','m190712_195914_no_draft_revisions','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','c9a28e4a-f58c-49c3-bf24-217791aa5de0'),(153,NULL,'app','m190723_140314_fix_preview_targets_column','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','ec9ffc3b-6d5a-4f09-b84d-5304c3fa2f50'),(154,NULL,'app','m190820_003519_flush_compiled_templates','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','1df6dafe-3fe8-4953-8369-433c3f008ebc'),(155,NULL,'app','m190823_020339_optional_draft_creators','2020-01-22 00:54:17','2020-01-22 00:54:17','2020-01-22 00:54:17','718f8d33-86d6-4ba9-8fab-300d8e8df0e4'),(156,NULL,'app','m180521_172900_project_config_table','2020-04-10 20:48:24','2020-04-10 20:48:24','2020-04-10 20:48:24','5e7d39cb-b671-4e4d-91a2-f728735d22bb'),(157,NULL,'app','m190913_152146_update_preview_targets','2020-04-10 20:48:24','2020-04-10 20:48:24','2020-04-10 20:48:24','e5760ef6-002f-4c3c-af5d-d86768ae84b5'),(158,NULL,'app','m191107_122000_add_gql_project_config_support','2020-04-10 20:48:24','2020-04-10 20:48:24','2020-04-10 20:48:24','6a4087d5-5bde-481e-b6b6-b499f5a4ca49'),(159,NULL,'app','m191204_085100_pack_savable_component_settings','2020-04-10 20:48:24','2020-04-10 20:48:24','2020-04-10 20:48:24','4d2b9d29-7dcc-4b97-b743-5e74b77fbdd4'),(160,NULL,'app','m191206_001148_change_tracking','2020-04-10 20:48:25','2020-04-10 20:48:25','2020-04-10 20:48:25','6fcb8210-9c01-49d0-af99-9538b906d43d'),(161,NULL,'app','m191216_191635_asset_upload_tracking','2020-04-10 20:48:25','2020-04-10 20:48:25','2020-04-10 20:48:25','769b08ba-fd7d-42e9-8dea-8921f4c33545'),(162,NULL,'app','m191222_002848_peer_asset_permissions','2020-04-10 20:48:25','2020-04-10 20:48:25','2020-04-10 20:48:25','8ce7594d-b9d3-41e2-bc30-9b1b1b65ec76'),(163,NULL,'app','m200127_172522_queue_channels','2020-04-10 20:48:25','2020-04-10 20:48:25','2020-04-10 20:48:25','b9ec721b-b8d5-4fc1-abf7-9bd18b0e8c51'),(164,NULL,'app','m200211_175048_truncate_element_query_cache','2020-04-10 20:48:25','2020-04-10 20:48:25','2020-04-10 20:48:25','3277c13e-e4b6-48e0-9553-51b9ff38d1c9'),(165,NULL,'app','m200213_172522_new_elements_index','2020-04-10 20:48:25','2020-04-10 20:48:25','2020-04-10 20:48:25','2d6f8cf2-c9e1-4a61-89bc-4f70a7096135'),(166,NULL,'app','m200228_195211_long_deprecation_messages','2020-04-10 20:48:25','2020-04-10 20:48:25','2020-04-10 20:48:25','fbd96ad4-9925-48c4-8df5-408fd27972d6'),(167,NULL,'app','m200306_054652_disabled_sites','2020-04-10 20:48:25','2020-04-10 20:48:25','2020-04-10 20:48:25','695c1027-c3fa-4464-a5f4-8d4822cefacd'),(168,6,'plugin','Install','2020-04-10 21:25:18','2020-04-10 21:25:18','2020-04-10 21:25:18','a8d308b0-7a1c-4b04-bd39-fc888dd62944'),(169,6,'plugin','m200307_232253_purge_element_settings','2020-04-10 21:25:19','2020-04-10 21:25:19','2020-04-10 21:25:19','12d22687-26ff-4138-987d-836c316ac868');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'sendgrid','1.2.0','1.0.0','unknown',NULL,'2020-01-22 03:44:17','2020-01-22 03:44:17','2020-04-10 21:50:07','7d38059b-331b-47a3-b68a-a08f75cb2617'),(3,'wordsmith','3.1.2','0.0.0.0','unknown',NULL,'2020-01-22 04:39:35','2020-01-22 04:39:35','2020-04-10 21:50:07','c9dcea20-c41c-443e-bf81-70a1ecbe9c0a'),(4,'sentry','1.5.1','1.0.0','unknown',NULL,'2020-01-22 04:42:09','2020-01-22 04:42:09','2020-04-10 21:50:07','6feea3eb-3e23-4ba9-b142-658dd764763f'),(5,'twig-profiler','1.0.1','1.0.0','unknown',NULL,'2020-01-22 04:45:23','2020-01-22 04:45:23','2020-04-10 21:50:07','c9066c18-20bd-4046-a7fc-10763953e13a'),(6,'cloudflare','0.5.0','1.0.1','unknown',NULL,'2020-04-10 21:25:18','2020-04-10 21:25:18','2020-04-10 21:50:07','e725bd57-eb1c-4895-8e91-4240f678f203'),(7,'healthz','v1.0.3','1.0.0','unknown',NULL,'2020-04-10 21:25:43','2020-04-10 21:25:43','2020-04-10 21:50:07','17e6ef11-795e-4992-ba90-adae68e8f54c'),(8,'pagination','1.0.2','1.0.0','unknown',NULL,'2020-04-10 21:25:47','2020-04-10 21:25:47','2020-04-10 21:50:07','d54d63a3-d6aa-4945-a5d8-8ae05d1e2ba0');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1586555096'),('email.fromEmail','\"$EMAIL_SYSTEM_ADDRESS\"'),('email.fromName','\"$EMAIL_SENDER_NAME\"'),('email.template','null'),('email.transportSettings.apiKey','\"$EMAIL_PASSWORD\"'),('email.transportType','\"putyourlightson\\\\sendgrid\\\\mail\\\\SendgridAdapter\"'),('fieldGroups.1e48a75f-39b5-40f4-984a-09cf20c9fae5.name','\"Common\"'),('plugins.cloudflare.edition','\"standard\"'),('plugins.cloudflare.enabled','true'),('plugins.cloudflare.schemaVersion','\"1.0.1\"'),('plugins.cloudflare.settings.apiKey','null'),('plugins.cloudflare.settings.apiToken','\"40KsUXU4W3QY7aPcuFLENTCfGH52UIOkmA8gYgGl\"'),('plugins.cloudflare.settings.authType','\"token\"'),('plugins.cloudflare.settings.email','null'),('plugins.cloudflare.settings.fetchZonesActionUri','\"cloudflare/default/fetch-zones\"'),('plugins.cloudflare.settings.purgeAllActionUri','\"cloudflare/default/purge-all\"'),('plugins.cloudflare.settings.purgeElements.0','\"craft\\\\elements\\\\Asset\"'),('plugins.cloudflare.settings.purgeElements.1','\"craft\\\\elements\\\\Category\"'),('plugins.cloudflare.settings.purgeElements.2','\"craft\\\\elements\\\\Entry\"'),('plugins.cloudflare.settings.purgeElements.3','\"craft\\\\elements\\\\Tag\"'),('plugins.cloudflare.settings.purgeUrlsActionUri','\"cloudflare/default/purge-urls\"'),('plugins.cloudflare.settings.saveRulesActionUri','\"cloudflare/default/save-rules\"'),('plugins.cloudflare.settings.userServiceKey','\"\"'),('plugins.cloudflare.settings.verifyCredentialsUri','\"cloudflare/default/verify-connection\"'),('plugins.cloudflare.settings.zone','\"e8837d8069c26c5c950034ed5ee36799\"'),('plugins.cloudflare.settings.zoneName','\"itguys.ro\"'),('plugins.healthz.edition','\"standard\"'),('plugins.healthz.enabled','true'),('plugins.healthz.schemaVersion','\"1.0.0\"'),('plugins.pagination.edition','\"standard\"'),('plugins.pagination.enabled','true'),('plugins.pagination.schemaVersion','\"1.0.0\"'),('plugins.sendgrid.edition','\"standard\"'),('plugins.sendgrid.enabled','true'),('plugins.sendgrid.schemaVersion','\"1.0.0\"'),('plugins.sentry.edition','\"standard\"'),('plugins.sentry.enabled','true'),('plugins.sentry.schemaVersion','\"1.0.0\"'),('plugins.twig-profiler.edition','\"standard\"'),('plugins.twig-profiler.enabled','true'),('plugins.twig-profiler.schemaVersion','\"1.0.0\"'),('plugins.wordsmith.edition','\"standard\"'),('plugins.wordsmith.enabled','true'),('plugins.wordsmith.schemaVersion','\"0.0.0.0\"'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.enableVersioning','true'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.entryTypes.adeeb369-f633-437f-beee-674156ada575.handle','\"home\"'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.entryTypes.adeeb369-f633-437f-beee-674156ada575.hasTitleField','false'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.entryTypes.adeeb369-f633-437f-beee-674156ada575.name','\"Home\"'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.entryTypes.adeeb369-f633-437f-beee-674156ada575.sortOrder','1'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.entryTypes.adeeb369-f633-437f-beee-674156ada575.titleFormat','\"{section.name|raw}\"'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.entryTypes.adeeb369-f633-437f-beee-674156ada575.titleLabel','null'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.handle','\"home\"'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.name','\"Home\"'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.propagationMethod','\"all\"'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.siteSettings.b1bdf281-40db-4049-9e3c-2ccecc57578b.enabledByDefault','true'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.siteSettings.b1bdf281-40db-4049-9e3c-2ccecc57578b.hasUrls','true'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.siteSettings.b1bdf281-40db-4049-9e3c-2ccecc57578b.template','\"index\"'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.siteSettings.b1bdf281-40db-4049-9e3c-2ccecc57578b.uriFormat','\"__home__\"'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.siteSettings.ea446b43-ad03-4b76-8afd-0f5355e68dcb.enabledByDefault','true'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.siteSettings.ea446b43-ad03-4b76-8afd-0f5355e68dcb.hasUrls','true'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.siteSettings.ea446b43-ad03-4b76-8afd-0f5355e68dcb.template','\"index\"'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.siteSettings.ea446b43-ad03-4b76-8afd-0f5355e68dcb.uriFormat','\"__home__\"'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.siteSettings.ffd3ee73-58ca-40dc-8dba-8bbaa6cd2459.enabledByDefault','true'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.siteSettings.ffd3ee73-58ca-40dc-8dba-8bbaa6cd2459.hasUrls','true'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.siteSettings.ffd3ee73-58ca-40dc-8dba-8bbaa6cd2459.template','\"index\"'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.siteSettings.ffd3ee73-58ca-40dc-8dba-8bbaa6cd2459.uriFormat','\"__home__\"'),('sections.fba95a32-5b94-424d-95e3-cce0e3219201.type','\"single\"'),('siteGroups.8482b645-742f-4966-b6e2-c9d819756cf3.name','\"FirstManager\"'),('siteGroups.9f287ede-bdbd-4412-bc91-d36dc4096a79.name','\"ITGuys\"'),('sites.b1bdf281-40db-4049-9e3c-2ccecc57578b.baseUrl','\"https://www.first-manager.com\"'),('sites.b1bdf281-40db-4049-9e3c-2ccecc57578b.enabled','true'),('sites.b1bdf281-40db-4049-9e3c-2ccecc57578b.handle','\"wwwFirstManagerCom\"'),('sites.b1bdf281-40db-4049-9e3c-2ccecc57578b.hasUrls','true'),('sites.b1bdf281-40db-4049-9e3c-2ccecc57578b.language','\"en\"'),('sites.b1bdf281-40db-4049-9e3c-2ccecc57578b.name','\"www.first-manager.com\"'),('sites.b1bdf281-40db-4049-9e3c-2ccecc57578b.primary','false'),('sites.b1bdf281-40db-4049-9e3c-2ccecc57578b.siteGroup','\"8482b645-742f-4966-b6e2-c9d819756cf3\"'),('sites.b1bdf281-40db-4049-9e3c-2ccecc57578b.sortOrder','3'),('sites.ea446b43-ad03-4b76-8afd-0f5355e68dcb.baseUrl','\"$ROOT_URL\"'),('sites.ea446b43-ad03-4b76-8afd-0f5355e68dcb.enabled','true'),('sites.ea446b43-ad03-4b76-8afd-0f5355e68dcb.handle','\"default\"'),('sites.ea446b43-ad03-4b76-8afd-0f5355e68dcb.hasUrls','true'),('sites.ea446b43-ad03-4b76-8afd-0f5355e68dcb.language','\"en\"'),('sites.ea446b43-ad03-4b76-8afd-0f5355e68dcb.name','\"ITGuys\"'),('sites.ea446b43-ad03-4b76-8afd-0f5355e68dcb.primary','true'),('sites.ea446b43-ad03-4b76-8afd-0f5355e68dcb.siteGroup','\"9f287ede-bdbd-4412-bc91-d36dc4096a79\"'),('sites.ea446b43-ad03-4b76-8afd-0f5355e68dcb.sortOrder','1'),('sites.ffd3ee73-58ca-40dc-8dba-8bbaa6cd2459.baseUrl','\"https://first-manager.com\"'),('sites.ffd3ee73-58ca-40dc-8dba-8bbaa6cd2459.enabled','true'),('sites.ffd3ee73-58ca-40dc-8dba-8bbaa6cd2459.handle','\"firstManager\"'),('sites.ffd3ee73-58ca-40dc-8dba-8bbaa6cd2459.hasUrls','true'),('sites.ffd3ee73-58ca-40dc-8dba-8bbaa6cd2459.language','\"en\"'),('sites.ffd3ee73-58ca-40dc-8dba-8bbaa6cd2459.name','\"First Manager\"'),('sites.ffd3ee73-58ca-40dc-8dba-8bbaa6cd2459.primary','false'),('sites.ffd3ee73-58ca-40dc-8dba-8bbaa6cd2459.siteGroup','\"8482b645-742f-4966-b6e2-c9d819756cf3\"'),('sites.ffd3ee73-58ca-40dc-8dba-8bbaa6cd2459.sortOrder','2'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"$SYSTEM_NAME\"'),('system.schemaVersion','\"3.5.0\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','\"\"'),('users.photoVolumeUid','\"00e150d3-3614-4cbd-b9ab-95b38f4d11d5\"'),('users.requireEmailVerification','true'),('volumes.00e150d3-3614-4cbd-b9ab-95b38f4d11d5.handle','\"users\"'),('volumes.00e150d3-3614-4cbd-b9ab-95b38f4d11d5.hasUrls','true'),('volumes.00e150d3-3614-4cbd-b9ab-95b38f4d11d5.name','\"Users\"'),('volumes.00e150d3-3614-4cbd-b9ab-95b38f4d11d5.settings.path','\"@root/web/assets/images/users\"'),('volumes.00e150d3-3614-4cbd-b9ab-95b38f4d11d5.sortOrder','1'),('volumes.00e150d3-3614-4cbd-b9ab-95b38f4d11d5.type','\"craft\\\\volumes\\\\Local\"'),('volumes.00e150d3-3614-4cbd-b9ab-95b38f4d11d5.url','\"@web/assets/images/users\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `resourcepaths` VALUES ('17210a45','@craft/web/assets/edituser/dist'),('1af48ac0','@lib/garnishjs'),('1bf9a90','@lib/jquery-touch-events'),('1ef3a7ac','@lib/fileupload'),('1fd293df','@lib/element-resize-detector'),('2100919','@craft/web/assets/cp/dist'),('21cdcf57','@lib/velocity'),('2c80cb36','@craft/web/assets/editentry/dist'),('2e4545bb','@lib/fabric'),('2fa9811d','@app/web/assets/utilities/dist'),('3042382a','@bower/jquery/dist'),('30a91ecb','@workingconcept/cloudflare/assetbundles/cloudflare/dist'),('31e66907','@app/web/assets/clearcaches/dist'),('33888a18','@app/web/assets/dbbackup/dist'),('33a783fe','@lib/iframe-resizer'),('34c98832','@app/web/assets/feed/dist'),('35f75660','@craft/web/assets/updates/dist'),('39a6f4eb','@app/web/assets/plugins/dist'),('3b039185','@lib/garnishjs'),('3dea60bf','@lib/jquery.payment'),('43a877a','@craft/web/assets/updater/dist'),('442536db','@app/web/assets/dbbackup/dist'),('4858b7ce','@lib/vue'),('4a7012b9','@craft/web/assets/craftsupport/dist'),('4fbd254a','@app/web/assets/updates/dist'),('509fe401','@app/web/assets/recententries/dist'),('52658bd6','@lib/selectize'),('56f9e81','@app/web/assets/pluginstoreoauth/dist'),('5809cf5c','@lib/xregexp'),('60b70aae','@app/web/assets/craftsupport/dist'),('61ba652','@lib/picturefill'),('6596fc6','@craft/web/assets/admintable/dist'),('65b314bb','@lib/axios'),('668d83b5','@app/web/assets/sites/dist'),('68c1d402','@craft/web/assets/plugins/dist'),('6e188810','@craft/web/assets/editsection/dist'),('6e25a66f','@app/web/assets/updateswidget/dist'),('6f6454f2','@lib/jquery-ui'),('7026bf08','@craft/web/assets/pluginstoreoauth/dist'),('75652ffd','@craft/web/assets/feed/dist'),('75bdb5da','@craft/web/assets/cp/dist'),('7617da0d','@app/web/assets/findreplace/dist'),('7b6db9f8','@app/web/assets/dashboard/dist'),('7cc685a7','@craft/web/assets/pluginstore/dist'),('80d71bc5','@craft/web/assets/feed/dist'),('8719c240','@lib/jquery.payment'),('8ab19ad5','@bower/jquery/dist'),('8be8603','@lib/d3'),('8d95d639','@app/web/assets/installer/dist'),('8e0083fa','@app/web/assets/recententries/dist'),('8edf8dc0','@app/web/assets/dashboard/dist'),('8f33fe46','@app/web/assets/generalsettings/dist'),('912242b1','@app/web/assets/updates/dist'),('94b6e744','@lib/fabric'),('95053e96','@app/web/assets/craftsupport/dist'),('9b3e6da8','@lib/velocity'),('9d73e03a','@craft/web/assets/plugins/dist'),('a0ef93ab','@app/web/assets/updater/dist'),('a358ba9f','@app/web/assets/pluginstore/dist'),('a4000553','@lib/fileupload'),('a5213120','@lib/element-resize-detector'),('ad5005eb','@craft/web/assets/utilities/dist'),('b0bac194','@app/web/assets/updateswidget/dist'),('b24d24fc','@lib/d3'),('b38897c8','@craft/web/assets/sites/dist'),('b6b3964','@craft/web/assets/pluginstore/dist'),('b860f7b4','@app/web/assets/cp/dist'),('b8a368f8','@workingconcept/cloudflare/assetbundles/cloudflare/dist'),('b9ca32e6','@lib/prismjs'),('bb4c386f','@lib/jquery-touch-events'),('bc5ee2ca','@app/web/assets/login/dist'),('bce804ad','@lib/picturefill'),('bfc22681','@craft/web/assets/craftsupport/dist'),('c0692d8f','@craft/web/assets/login/dist'),('c17bbc0a','@app/web/assets/feed/dist'),('c260936','@craft/web/assets/dashboard/dist'),('c65b8705','@lib/axios'),('cc14c0d3','@app/web/assets/plugins/dist'),('cfcd4b77','@app/web/assets/cp/dist'),('d366a6de','@craft/web/assets/recententries/dist'),('d4f5065c','@app/web/assets/pluginstore/dist'),('d597f60d','@lib/jquery-ui'),('daa5e081','@craft/web/assets/updater/dist'),('df9c125','@craft/web/assets/recententries/dist'),('e2fa6da3','@lib/xregexp'),('e8962929','@lib/selectize'),('f136e6e6','@app/web/assets/utilities/dist'),('f2ab1531','@lib/vue'),('f9943d0e','@craft/web/assets/dashboard/dist'),('fade66f7','@craft/web/assets/installer/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,5,1,1,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'slug',0,1,''),(1,'firstname',0,1,' catalin '),(1,'lastname',0,1,' teodorescu '),(1,'fullname',0,1,' catalin teodorescu '),(2,'filename',0,1,' 240031 363734177085867 1075952931 o jpg '),(2,'extension',0,1,' jpg '),(2,'kind',0,1,' image '),(2,'slug',0,1,''),(2,'title',0,1,' 240031 363734177085867 1075952931 o '),(1,'username',0,1,' admin '),(3,'filename',0,1,' 240031 363734177085867 1075952931 o 200410 205503 jpg '),(3,'extension',0,1,' jpg '),(3,'kind',0,1,' image '),(3,'slug',0,1,''),(3,'title',0,1,' 240031 363734177085867 1075952931 o 200410 205503 '),(4,'filename',0,2,' 240031 363734177085867 1075952931 o jpg '),(1,'email',0,1,' contact itguys ro '),(4,'filename',0,1,' 240031 363734177085867 1075952931 o jpg '),(4,'extension',0,1,' jpg '),(4,'kind',0,1,' image '),(4,'slug',0,1,''),(4,'title',0,1,' 240031 363734177085867 1075952931 o '),(4,'extension',0,2,' jpg '),(4,'kind',0,2,' image '),(4,'slug',0,2,''),(4,'title',0,2,' 240031 363734177085867 1075952931 o '),(4,'filename',0,3,' 240031 363734177085867 1075952931 o jpg '),(4,'extension',0,3,' jpg '),(4,'kind',0,3,' image '),(4,'slug',0,3,''),(4,'title',0,3,' 240031 363734177085867 1075952931 o '),(5,'slug',0,1,' home '),(5,'title',0,3,' home '),(5,'slug',0,2,' home '),(5,'slug',0,3,' home '),(5,'title',0,1,' home '),(5,'title',0,2,' home ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',1,'all',NULL,'2020-04-10 21:01:25','2020-04-10 21:01:25',NULL,'fba95a32-5b94-424d-95e3-cce0e3219201');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,3,1,'__home__','index',1,'2020-04-10 21:01:25','2020-04-10 21:01:25','d1573772-d1fa-4294-b0b9-50348020aae5'),(2,1,1,1,'__home__','index',1,'2020-04-10 21:01:25','2020-04-10 21:01:25','6a6b8352-5c18-461b-96c2-e4e01b1559b9'),(3,1,2,1,'__home__','index',1,'2020-04-10 21:01:25','2020-04-10 21:01:25','0c31decd-9e95-428c-92f1-ad993de605e0');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'ITGuys','2020-01-22 00:54:16','2020-01-22 00:54:16',NULL,'9f287ede-bdbd-4412-bc91-d36dc4096a79'),(2,'FirstManager','2020-04-10 20:57:21','2020-04-10 20:57:21',NULL,'8482b645-742f-4966-b6e2-c9d819756cf3');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,1,'ITGuys','default','en',1,'$ROOT_URL',1,'2020-01-22 00:54:16','2020-04-10 20:56:51',NULL,'ea446b43-ad03-4b76-8afd-0f5355e68dcb'),(2,2,0,1,'First Manager','firstManager','en',1,'https://first-manager.com',2,'2020-04-10 20:57:56','2020-04-10 20:57:56',NULL,'ffd3ee73-58ca-40dc-8dba-8bbaa6cd2459'),(3,2,0,1,'www.first-manager.com','wwwFirstManagerCom','en',1,'https://www.first-manager.com',3,'2020-04-10 21:00:38','2020-04-10 21:00:38',NULL,'b1bdf281-40db-4049-9e3c-2ccecc57578b');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\",\"weekStartDay\":\"1\",\"roundIcons\":true,\"useShapes\":true,\"enableDebugToolbarForSite\":true,\"enableDebugToolbarForCp\":true,\"showExceptionView\":true,\"profileTemplates\":true}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,'admin',4,'Catalin','Teodorescu','contact@itguys.ro','$2y$13$EGPRdgZ508P99GQKFLVNXeKCMh9AVKNUJ5GGOOANi5hSBGDnwmr7G',1,0,0,0,'2020-04-10 20:48:40',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2020-01-22 00:54:16','2020-01-22 00:54:16','2020-04-10 20:55:30','68f62cda-6cc6-48ac-b32e-f4280ff63afe');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Users','','2020-04-10 20:53:17','2020-04-10 20:53:17','211ce1ec-1535-4027-aad0-691fb4360983'),(2,NULL,NULL,'Temporary source',NULL,'2020-04-10 20:53:23','2020-04-10 20:53:23','bea98c14-feec-497a-ad41-e50ca8d5abe5'),(3,2,NULL,'user_1','user_1/','2020-04-10 20:53:23','2020-04-10 20:53:23','830337cd-8385-4f38-b657-aeb8bd0be426');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,NULL,'Users','users','craft\\volumes\\Local',1,'@web/assets/images/users','{\"path\":\"@root/web/assets/images/users\"}',1,'2020-04-10 20:53:17','2020-04-10 20:53:17',NULL,'00e150d3-3614-4cbd-b9ab-95b38f4d11d5');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}',1,'2020-01-22 01:17:29','2020-01-22 01:17:29','c9a02bea-aef9-4d82-a770-b02d04917e91'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2020-01-22 01:17:29','2020-01-22 01:17:29','41d3ba80-1ee5-440d-91a7-e9c20d69e402'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2020-01-22 01:17:29','2020-01-22 01:17:29','94fa85a4-64d4-4b34-8d91-11535c5985e6'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2020-01-22 01:17:29','2020-01-22 01:17:29','2f87e495-6c6a-4f59-a598-cfb81a4bb278');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'itguys.ro'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-10 21:51:48
