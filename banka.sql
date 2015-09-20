-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.21 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for banka
CREATE DATABASE IF NOT EXISTS `banka` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `banka`;


-- Dumping structure for table banka.klijent
CREATE TABLE IF NOT EXISTS `klijent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `brojRacuna` varchar(255) DEFAULT NULL,
  `naziv` varchar(255) DEFAULT NULL,
  `trenutniStatus` varchar(255) DEFAULT NULL,
  `trenutnoStanje` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table banka.klijent: ~2 rows (approximately)
/*!40000 ALTER TABLE `klijent` DISABLE KEYS */;
REPLACE INTO `klijent` (`id`, `version`, `brojRacuna`, `naziv`, `trenutniStatus`, `trenutnoStanje`) VALUES
	(1, 0, '310-0400100071221-35', 'Klijent1', 'AKTIVAN', '10000'),
	(2, 0, '310-0000000000011-83', 'Klijent2', 'AKTIVAN', '20000'),
	(3, 0, '310-04001071221-35', 'Klijent3', 'AKTIVAN', '30000');
/*!40000 ALTER TABLE `klijent` ENABLE KEYS */;


-- Dumping structure for table banka.nalog_za_placanje
CREATE TABLE IF NOT EXISTS `nalog_za_placanje` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `datumNaloga` datetime DEFAULT NULL,
  `datumValute` datetime DEFAULT NULL,
  `duznik` varchar(255) DEFAULT NULL,
  `hitno` tinyint(1) DEFAULT NULL,
  `idNaloga` varchar(255) DEFAULT NULL,
  `iznos` double DEFAULT NULL,
  `modelOdobrenja` int(11) DEFAULT NULL,
  `modelZaduzenja` int(11) DEFAULT NULL,
  `oznakaValute` varchar(255) DEFAULT NULL,
  `pozivNaBrojOdobrenja` varchar(255) DEFAULT NULL,
  `pozivNaBrojZaduzenja` varchar(255) DEFAULT NULL,
  `primalac` varchar(255) DEFAULT NULL,
  `racunDuznika` varchar(255) DEFAULT NULL,
  `racunPoverioca` varchar(255) DEFAULT NULL,
  `svrhaPlacanja` varchar(255) DEFAULT NULL,
  `razlog` varchar(255) DEFAULT NULL,
  `statusNaloga` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table banka.nalog_za_placanje: ~0 rows (approximately)
/*!40000 ALTER TABLE `nalog_za_placanje` DISABLE KEYS */;
REPLACE INTO `nalog_za_placanje` (`id`, `version`, `datumNaloga`, `datumValute`, `duznik`, `hitno`, `idNaloga`, `iznos`, `modelOdobrenja`, `modelZaduzenja`, `oznakaValute`, `pozivNaBrojOdobrenja`, `pozivNaBrojZaduzenja`, `primalac`, `racunDuznika`, `racunPoverioca`, `svrhaPlacanja`, `razlog`, `statusNaloga`) VALUES
	(1, 0, '0034-02-03 00:00:00', '0034-02-03 00:00:00', 'Duznik', 1, '1112', 1200, 97, 97, 'RSD', '12-12', '1234-56', 'Primalac', '123-456-78', '123-123', 'Svrha placanja', NULL, 'REZERVISANO');
/*!40000 ALTER TABLE `nalog_za_placanje` ENABLE KEYS */;


-- Dumping structure for table banka.request_log
CREATE TABLE IF NOT EXISTS `request_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `request` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table banka.request_log: ~2 rows (approximately)
/*!40000 ALTER TABLE `request_log` DISABLE KEYS */;
REPLACE INTO `request_log` (`id`, `version`, `request`) VALUES
	(1, 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:prov="http://ws.banka.org/ws/schema/proveraStanja">\r\n   <soapenv:Header><wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"><wsse:BinarySecurityToken EncodingType="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary" ValueType="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-x509-token-profile-1.0#X509v3" wsu:Id="X509-B5872BC913AD6342311442781027888112">MIIFYDCCA0igAwIBAgIEVf6JFDANBgkqhkiG9w0BAQsFADByMRowGAYJKoZIhvcNAQkBFgtiYW5rYUAxLmNvbTELMAkGA1UEBhMCcnMxDDAKBgNVBAgMA3h3czEMMAoGA1UEBwwDeHdzMQwwCgYDVQQKDAN4d3MxDDAKBgNVBAsMA3h3czEPMA0GA1UEAwwGYmFua2ExMB4XDTE1MDkyMDEwMjMxOVoXDTE2MDkyMDEwMjMxOVowcjEaMBgGCSqGSIb3DQEJARYLZmlybWFAMS5jb20xCzAJBgNVBAYTAnJzMQwwCgYDVQQIDAN4d3MxDDAKBgNVBAcMA3h3czEMMAoGA1UECgwDeHdzMQwwCgYDVQQLDAN4d3MxDzANBgNVBAMMBmZpcm1hMTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAM7IlbWIJ1HSP+jkbrnb5EyQ4BkyHZXbD2wZnGY40rm21dtYlB0Cp0BEuapKnKZxu2uoOg1mpS36e8r0sXchlnuCt+w0tJupDjmfW0mgFXzCIKbEikmTjVwi43FLnfbTpEGgGDDXzmPeaXt2GijMoyaelr5vAAXydvpva5lx3UkZaB+pmTOrkIOZVnfm3KI+MLts5JU/pxXwzfSf9B0DyDh3Phr3qnogeTw38rFvp5Q3+yF4J+rsFmn+IN70okHY3mUaiw33S7lZPjaS0IsMaKVXDpkSNte1xpf2isLABKuoitEeNn/FdBX3HeKNMacgelRQdw0dOQAzC5qF7rAMrdq7ZbTETWdoZc8VpgB8YK4XopPcaj57ANWs8K7lMSSMfgwgSE30FVqJTmp4idRLaY3AsmwQgVN5lKZ1BID+hXTdC7ntEOyB3jvHJjSIoeAJ7QZPfKWjBUdA+HqpG3KpSniXCviecPMHiW+DL4t+wPSeuh5xAWgYDswBflE6BdTUvAyWdMZrB2qR+ZOG4CB3ynFeSomfRWagA75IzBp7AeRZoXpg5tuYY2p95f1Qq++dD4yxHKuPd8+33l4NOWJOOe3dEgz57PHZq87FgdAn68g/T/ZqppMKN8gRVzLz+NNGjoeJCM0VatfhSx5mqjs5X46bPubWZdZBoyPYA0nrRfJhAgMBAAEwDQYJKoZIhvcNAQELBQADggIBAFEQsFTAbsQsXpFGzFelwD4OxokpbGzUJ/+7EtxxkgJEShpBPOfK76EyalUFFGNaD9hRSObSVIHo1CKfzS51IVLk7iebpTvfI0ox4dE3sJZIP2IOzS9RH7CEe1TFBqM8a4VnZqZi7acd9P/O9X/fRTdEay0cEzaR1JZBVcrG+di/eKSjPQyUSEBSBsZq7Ac7sHDCsAakgsexNtyj65xTI3t83uz6wXsx37gwKk2PD4lauu0CO/EKwCPf9hYvMVDMGCpWZtCmk+IhrRIMv0LXE7Udarp6JXpIusLqR98LvlM4SdAteO1T7M49huF3hdL3+cSOGHKJeUPd70vNU1ooLkpJZ5ZLgrV0wIRFXvPGnXN2Mmt2fd5EM6v5hSRIhCD0GFBzz7MiGBUUgq+1FL98Amj4dwz2mFCgB+aMxgh1z9Ld1NdNd1UlBMK5HAPRAZikl6N4xQFvKRmmzGx9nrelmGwTouu5PZAO4M0jip24d5ri/FF09W9q702/bgqCgaZvpKDvelLndjqm1D+ZIqJJ8wmkYaYy48tJEiES+qsOK+zxNPEF0J6FL80VruuUaQ9Exe2NnGncTYAAZsYRvATO8TxtPmfjr1sn01yMYhpl9SysD6y/SO2xBEI+1g9eZH+Sqtnj+vfbIUDKVu242vOKwo2fD5l+6qiOFKdwFQ6uiA8A</wsse:BinarySecurityToken><ds:Signature xmlns:ds="http://www.w3.org/2000/09/xmldsig#" Id="SIG-56"><ds:SignedInfo><ds:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"><ec:InclusiveNamespaces xmlns:ec="http://www.w3.org/2001/10/xml-exc-c14n#" PrefixList="prov soapenv"/></ds:CanonicalizationMethod><ds:SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/><ds:Reference URI="#TS-55"><ds:Transforms><ds:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"><ec:InclusiveNamespaces xmlns:ec="http://www.w3.org/2001/10/xml-exc-c14n#" PrefixList="wsse prov soapenv"/></ds:Transform></ds:Transforms><ds:DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/><ds:DigestValue>cFNo+0a8uCn7VsLgowIcr5sw/fI=</ds:DigestValue></ds:Reference><ds:Reference URI="#id-4"><ds:Transforms><ds:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"><ec:InclusiveNamespaces xmlns:ec="http://www.w3.org/2001/10/xml-exc-c14n#" PrefixList="prov"/></ds:Transform></ds:Transforms><ds:DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/><ds:DigestValue>OhWsWlWa/A1MRgUv6gsDULUBTSY=</ds:DigestValue></ds:Reference></ds:SignedInfo><ds:SignatureValue>bqBg2S2S79o89Rj6w24RWcLdh0b5Dc1uWHTEjWnLLkQcNA7Dy8ppf/+ytb5QUL/Ed5IAThvlALdY\r\nrB532UkUK1FN08t/vNz21Smq3O47BtoIO/gBFzbjWKmq1+L1uwL3FMxfpsbxQfphQJfkWhU9ctPW\r\nVYWDXw0sdUjoS2q/S3WABT9OS/Dvf7civz3lU06aQyqFmjyqcEZ1g0HEMT4K5YcAYYTcfpHmCfZA\r\nFGzQKBuwmrcLspbU+kJsX9S5UAc1VhuJDZNktp3j4lnSpocgT30B7F3PA1H2IhCKpNgwmnzdR8mb\r\n1NKCfcUUJhZpSkD+NW17kbFP0hxAJojmHuTplib8KrO3YG/d2qe4J26qHjFAdGA74VNrdEjdM3An\r\n1GAb75ep6Z0K+3dMOd1f/jkkWLISA/+Z6zpz++obicJRCOfINTEFCut9etdcJMmHu1Mnuxp7j/Kg\r\n5zkqKr5ysgwX+ti5zf6Aget2/x9nsI4vMl/ClpBpzhdEeJKZcek7+UmRfeXrmL+4D0S++oB5OfhA\r\nj8a/dI4mc8D3gOFa4hmiBpsUiZjlnQLi8coTJSTfq3KgVICUmZaGFwHc1JYP8OAxFDzaV+IVVqIZ\r\nzYyy/e03A0DbqLXKUAGDCVWhNnG8XnSwLoXqZyyYKuFwncdvRnuecrVEZl93jZEH+qS7j0VDsVg=</ds:SignatureValue><ds:KeyInfo Id="KI-B5872BC913AD6342311442781027888113"><wsse:SecurityTokenReference wsu:Id="STR-B5872BC913AD6342311442781027888114"><wsse:Reference URI="#X509-B5872BC913AD6342311442781027888112" ValueType="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-x509-token-profile-1.0#X509v3"/></wsse:SecurityTokenReference></ds:KeyInfo></ds:Signature><wsu:Timestamp wsu:Id="TS-55"><wsu:Created>2015-09-20T20:30:27.882Z</wsu:Created><wsu:Expires>2015-09-20T20:31:27.882Z</wsu:Expires></wsu:Timestamp></wsse:Security></soapenv:Header>\r\n   <soapenv:Body xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" wsu:Id="id-4">\r\n      <prov:proveraStanjaRequest>\r\n         <prov:brojRacuna>310-04001071221-35</prov:brojRacuna>\r\n      </prov:proveraStanjaRequest>\r\n   </soapenv:Body>\r\n</soapenv:Envelope>'),
	(2, 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:prov="http://ws.banka.org/ws/schema/proveraStanja">\r\n   <soapenv:Header><wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"><wsse:BinarySecurityToken EncodingType="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary" ValueType="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-x509-token-profile-1.0#X509v3" wsu:Id="X509-B5872BC913AD6342311442781148119115">MIIFYDCCA0igAwIBAgIEVf6JFDANBgkqhkiG9w0BAQsFADByMRowGAYJKoZIhvcNAQkBFgtiYW5rYUAxLmNvbTELMAkGA1UEBhMCcnMxDDAKBgNVBAgMA3h3czEMMAoGA1UEBwwDeHdzMQwwCgYDVQQKDAN4d3MxDDAKBgNVBAsMA3h3czEPMA0GA1UEAwwGYmFua2ExMB4XDTE1MDkyMDEwMjMxOVoXDTE2MDkyMDEwMjMxOVowcjEaMBgGCSqGSIb3DQEJARYLZmlybWFAMS5jb20xCzAJBgNVBAYTAnJzMQwwCgYDVQQIDAN4d3MxDDAKBgNVBAcMA3h3czEMMAoGA1UECgwDeHdzMQwwCgYDVQQLDAN4d3MxDzANBgNVBAMMBmZpcm1hMTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAM7IlbWIJ1HSP+jkbrnb5EyQ4BkyHZXbD2wZnGY40rm21dtYlB0Cp0BEuapKnKZxu2uoOg1mpS36e8r0sXchlnuCt+w0tJupDjmfW0mgFXzCIKbEikmTjVwi43FLnfbTpEGgGDDXzmPeaXt2GijMoyaelr5vAAXydvpva5lx3UkZaB+pmTOrkIOZVnfm3KI+MLts5JU/pxXwzfSf9B0DyDh3Phr3qnogeTw38rFvp5Q3+yF4J+rsFmn+IN70okHY3mUaiw33S7lZPjaS0IsMaKVXDpkSNte1xpf2isLABKuoitEeNn/FdBX3HeKNMacgelRQdw0dOQAzC5qF7rAMrdq7ZbTETWdoZc8VpgB8YK4XopPcaj57ANWs8K7lMSSMfgwgSE30FVqJTmp4idRLaY3AsmwQgVN5lKZ1BID+hXTdC7ntEOyB3jvHJjSIoeAJ7QZPfKWjBUdA+HqpG3KpSniXCviecPMHiW+DL4t+wPSeuh5xAWgYDswBflE6BdTUvAyWdMZrB2qR+ZOG4CB3ynFeSomfRWagA75IzBp7AeRZoXpg5tuYY2p95f1Qq++dD4yxHKuPd8+33l4NOWJOOe3dEgz57PHZq87FgdAn68g/T/ZqppMKN8gRVzLz+NNGjoeJCM0VatfhSx5mqjs5X46bPubWZdZBoyPYA0nrRfJhAgMBAAEwDQYJKoZIhvcNAQELBQADggIBAFEQsFTAbsQsXpFGzFelwD4OxokpbGzUJ/+7EtxxkgJEShpBPOfK76EyalUFFGNaD9hRSObSVIHo1CKfzS51IVLk7iebpTvfI0ox4dE3sJZIP2IOzS9RH7CEe1TFBqM8a4VnZqZi7acd9P/O9X/fRTdEay0cEzaR1JZBVcrG+di/eKSjPQyUSEBSBsZq7Ac7sHDCsAakgsexNtyj65xTI3t83uz6wXsx37gwKk2PD4lauu0CO/EKwCPf9hYvMVDMGCpWZtCmk+IhrRIMv0LXE7Udarp6JXpIusLqR98LvlM4SdAteO1T7M49huF3hdL3+cSOGHKJeUPd70vNU1ooLkpJZ5ZLgrV0wIRFXvPGnXN2Mmt2fd5EM6v5hSRIhCD0GFBzz7MiGBUUgq+1FL98Amj4dwz2mFCgB+aMxgh1z9Ld1NdNd1UlBMK5HAPRAZikl6N4xQFvKRmmzGx9nrelmGwTouu5PZAO4M0jip24d5ri/FF09W9q702/bgqCgaZvpKDvelLndjqm1D+ZIqJJ8wmkYaYy48tJEiES+qsOK+zxNPEF0J6FL80VruuUaQ9Exe2NnGncTYAAZsYRvATO8TxtPmfjr1sn01yMYhpl9SysD6y/SO2xBEI+1g9eZH+Sqtnj+vfbIUDKVu242vOKwo2fD5l+6qiOFKdwFQ6uiA8A</wsse:BinarySecurityToken><ds:Signature xmlns:ds="http://www.w3.org/2000/09/xmldsig#" Id="SIG-58"><ds:SignedInfo><ds:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"><ec:InclusiveNamespaces xmlns:ec="http://www.w3.org/2001/10/xml-exc-c14n#" PrefixList="prov soapenv"/></ds:CanonicalizationMethod><ds:SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/><ds:Reference URI="#TS-57"><ds:Transforms><ds:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"><ec:InclusiveNamespaces xmlns:ec="http://www.w3.org/2001/10/xml-exc-c14n#" PrefixList="wsse prov soapenv"/></ds:Transform></ds:Transforms><ds:DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/><ds:DigestValue>c2rfPG25R70aKzZ+DG1WlrNWElI=</ds:DigestValue></ds:Reference><ds:Reference URI="#id-4"><ds:Transforms><ds:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"><ec:InclusiveNamespaces xmlns:ec="http://www.w3.org/2001/10/xml-exc-c14n#" PrefixList="prov"/></ds:Transform></ds:Transforms><ds:DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/><ds:DigestValue>OhWsWlWa/A1MRgUv6gsDULUBTSY=</ds:DigestValue></ds:Reference></ds:SignedInfo><ds:SignatureValue>mMlqcgrav+GMezghw1SG/SSZbsZTpXUXQfXF9Qte2QDYQu4nBtaWUgC/rkugechY6WBuVr7ttrFS\r\nPJDQjLiq/WiPpWm/uTEfVVPJa1ijpP3Q/trJvIZ/t0FqbCzKMKIOS4LnGoPrZA6cY7La98W94L6g\r\nM1mwmN9IoahRlQ6HtaWz1ww/x3RB3JZ0f8KuRIxBJ5xV0K0FrnC+B61JAhhLWXY8qeVFiGp7M2E9\r\nY04jGObrL/sLp3ab7C1x6lsEIxa7GcomSSgBa197nAFHKcg4t2JLobOvMwJSkzfODWAVYiixpU6z\r\nS4sym8i5hZMlilObE7rSIA5Hgh6Th5ZKXBGZERx/yj4qxBulAkddAO1AKU19Ul9DEy85eivfs5TL\r\nkHkKFKLUdtqO4z3nphJRglaKSn8r0EKwC7Kc6+Q1lfz3l1kQnNrdkZf39cpyRI9WBUXWOE/+p4Ea\r\nCpYK9yFt50onhucMKcNFkGcvEuM/9sfXrVP6/5BClrmZcZKYXvjjhJAP3XmSrHWxgkciCxQr4mTl\r\nKE3gOM0jAVAFNLpDUbzIxz73kleXD0OSTMXuUbtt7NA1q0ORp7xN06T5HOY25v6Gx04dWoEhQSnq\r\nr/EzdqZFM9YBIpQG6LDR6QrcNlFXTxFGVdi87JVXMzpj5IHTm6l8xEPSQWWd5lcfs5fe3/14eA8=</ds:SignatureValue><ds:KeyInfo Id="KI-B5872BC913AD6342311442781148119116"><wsse:SecurityTokenReference wsu:Id="STR-B5872BC913AD6342311442781148119117"><wsse:Reference URI="#X509-B5872BC913AD6342311442781148119115" ValueType="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-x509-token-profile-1.0#X509v3"/></wsse:SecurityTokenReference></ds:KeyInfo></ds:Signature><wsu:Timestamp wsu:Id="TS-57"><wsu:Created>2015-09-20T20:32:28.115Z</wsu:Created><wsu:Expires>2015-09-20T20:33:28.115Z</wsu:Expires></wsu:Timestamp></wsse:Security></soapenv:Header>\r\n   <soapenv:Body xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" wsu:Id="id-4">\r\n      <prov:proveraStanjaRequest>\r\n         <prov:brojRacuna>310-04001071221-35</prov:brojRacuna>\r\n      </prov:proveraStanjaRequest>\r\n   </soapenv:Body>\r\n</soapenv:Envelope>');
/*!40000 ALTER TABLE `request_log` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
