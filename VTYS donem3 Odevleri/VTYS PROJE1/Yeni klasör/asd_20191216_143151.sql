------------- SQLite3 Dump File -------------

-- ------------------------------------------
-- Dump of "Ana Kart"
-- ------------------------------------------

CREATE TABLE "Ana Kart"(
	"model" Text PRIMARY KEY,
	"hız" Integer,
	"ram giriş sayisi" Integer,
	"m2 giriş sayisi" Integer,
	"usb sayisi" Integer,
	"fiyat" Integer );


-- ------------------------------------------
-- Dump of "ekran kartı"
-- ------------------------------------------

CREATE TABLE "ekran kartı"(
	"model" Text,
	"hız" Integer,
	"kapasite" Integer,
	"fan sayisi" Integer,
	"fiyat" Integer,
PRIMARY KEY ( "kapasite", "model" ) );


-- ------------------------------------------
-- Dump of "islemci"
-- ------------------------------------------

CREATE TABLE "islemci"(
	"marka" Text,
	"model" Text PRIMARY KEY,
	"hız" Integer,
	"fiyat" Integer );


-- ------------------------------------------
-- Dump of "kasa"
-- ------------------------------------------

CREATE TABLE "kasa"(
	"model" Text PRIMARY KEY,
	"usb sayisi" Integer,
	"fan sayisi" Integer,
	"fiyat" Integer );


-- ------------------------------------------
-- Dump of "keyboard"
-- ------------------------------------------

CREATE TABLE "keyboard"(
	"model" Text PRIMARY KEY,
	"tus sayisi" Integer,
	"dil" Text,
	"fiyat" Integer );


-- ------------------------------------------
-- Dump of "kulaklik"
-- ------------------------------------------

CREATE TABLE "kulaklik"(
	"model" Text PRIMARY KEY,
	"max hertz" Integer,
	"min hertz" Integer,
	"fiyat" Integer );


-- ------------------------------------------
-- Dump of "m2 ssd"
-- ------------------------------------------

CREATE TABLE "m2 ssd"(
	"cm" Integer PRIMARY KEY );


-- ------------------------------------------
-- Dump of "monitor"
-- ------------------------------------------

CREATE TABLE "monitor"(
	"model" Text PRIMARY KEY,
	"kalite" Text,
	"ms" Integer,
	"fiyat" Integer );


-- ------------------------------------------
-- Dump of "mouse"
-- ------------------------------------------

CREATE TABLE "mouse"(
	"model" Text PRIMARY KEY,
	"sensitivity" Integer,
	"kablo uzunlugu" Double,
	"fiyat" Integer );


-- ------------------------------------------
-- Dump of "power supply"
-- ------------------------------------------

CREATE TABLE "power supply"(
	"model" Text PRIMARY KEY,
	"wat" Integer,
	"fiyat" Integer );


-- ------------------------------------------
-- Dump of "ram"
-- ------------------------------------------

CREATE TABLE "ram"(
	"marka" Text PRIMARY KEY,
	"hız" Integer,
	"kapasite" Integer,
	"fiyat" Integer );


-- ------------------------------------------
-- Dump of "ssd"
-- ------------------------------------------

CREATE TABLE "ssd"(
	"kapasite" Integer,
	"okuma hiziı" Integer,
	"yazma hizi" Integer,
	"fiyat" Integer,
	"model" Text PRIMARY KEY,
	CONSTRAINT "lnk_m2 ssd_ssd" FOREIGN KEY ( "kapasite" ) REFERENCES "m2 ssd"( "cm" )
		ON DELETE Cascade
		ON UPDATE Cascade
 );


