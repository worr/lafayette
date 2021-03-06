#Copyright 2012 Linkedin
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.
#

CREATE DATABASE arf CHARACTER SET utf8;

USE arf;

CREATE TABLE arfEmail (
emailId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
feedbackType ENUM('auth-failure'),
emailType ENUM('normal','bounce','auto-replied'),
reported INT DEFAULT '0',
originalMailFromLocalId INT,
originalMailFromDomainId INT,
originalRcptToLocalId INT,
originalRcptToDomainId INT,
arrivalDate DATETIME,
messageId VARCHAR(255),
authenticationResults varchar(255),
sourceIp VARBINARY(16),
sourceDomainId INT,
sourceAsn BIGINT,
countryCode CHAR(2),
deliveryResult ENUM('none','quarantine','reject'),
authFailure ENUM('dmarc'),
reportedDomainID INT,
originalFromLocalId INT,
originalFromDomainId INT,
subject VARCHAR(255),
content MEDIUMTEXT,
INDEX (emailType),
INDEX (reported),
INDEX (originalMailFromDomainId),
INDEX (originalRcptToDomainId),
INDEX (arrivalDate),
INDEX (sourceIp),
INDEX (sourceDomainId),
INDEX (sourceAsn),
INDEX (countryCode),
INDEX (reportedDomainID),
INDEX (subject)
) ENGINE=InnoDB;

CREATE TABLE emailLocal (
emailLocalId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
emailLocal VARCHAR(255) UNIQUE,
INDEX (emailLocal)
) ENGINE=InnoDB;

CREATE TABLE domain (
domainId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
domain VARCHAR(255) UNIQUE,
INDEX (domain)
) ENGINE=InnoDB;

CREATE TABLE emailUrl (
emailUrlId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
emailId INT,
urlId INT,
INDEX (emailId),
INDEX (urlId)
) ENGINE=InnoDB;

CREATE TABLE url (
urlId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
firstSeen DATETIME NULL,
lastSeen DATETIME NULL,
urlIp VARBINARY(16),
urlDomainId INT,
urlAsn BIGINT,
urlCountryCode CHAR(2),
url VARCHAR(1000),
INDEX url (url(255)),
INDEX (lastSeen),
INDEX (urlIp),
INDEX (urlDomainId),
INDEX (urlAsn)
) ENGINE=InnoDB;

CREATE TABLE emailFile (
emailFileId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
emailId INT,
fileId INT,
INDEX (emailId),
INDEX (fileId)
) ENGINE=InnoDB;

CREATE TABLE file (
fileId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
firstSeen DATETIME NULL,
lastSeen DATETIME NULL,
hash VARCHAR(255) UNIQUE,
filename VARCHAR(255),
INDEX (hash)
) ENGINE=InnoDB;

CREATE TABLE asn (
asn BIGINT NOT NULL PRIMARY KEY,
email VARCHAR(255)
) ENGINE=InnoDB;
