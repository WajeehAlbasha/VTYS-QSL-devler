------------- SQLite3 Dump File -------------

-- ------------------------------------------
-- Dump of "negatif oylar"
-- ------------------------------------------

CREATE TABLE "negatif oylar"(
	"negatif oy " Integer,
	"soru id" Integer,
	"cevap id" Integer,
	"negatif oylar_id" Integer PRIMARY KEY,
	"cevap_id" Integer,
	CONSTRAINT "lnk_cevap_negatif oylar" FOREIGN KEY ( "cevap_id" ) REFERENCES "cevap"( "cevap_id" )
 );

CREATE INDEX "index_cevap_id" ON "negatif oylar"( "cevap_id" );

-- ------------------------------------------
-- Dump of "pozitif oylar"
-- ------------------------------------------

CREATE TABLE "pozitif oylar"(
	"pozitif oy" Integer,
	"soru id" Integer,
	"cevap id" Integer,
	"pozitif oylar_id" Integer PRIMARY KEY,
	"cevap_id" Integer,
	"negatif oylar_id" Integer,
	CONSTRAINT "lnk_cevap_pozitif oylar" FOREIGN KEY ( "cevap_id" ) REFERENCES "cevap"( "cevap_id" )
,
CONSTRAINT "unique_negatif oylar_id" UNIQUE ( "negatif oylar_id" ) );

CREATE INDEX "index_cevap_id1" ON "pozitif oylar"( "cevap_id" );

-- ------------------------------------------
-- Dump of "taglar"
-- ------------------------------------------

CREATE TABLE "taglar"(
	"tag" Text,
	"taglenme sayisi" Integer,
	"taglar_id" Integer PRIMARY KEY );


-- ------------------------------------------
-- Dump of "tbl_soru_MM_taglar"
-- ------------------------------------------

CREATE TABLE "tbl_soru_MM_taglar"(
	"soru_id" Integer,
	"taglar_id" Integer,
	CONSTRAINT "lnk_taglar_MM_soru" FOREIGN KEY ( "taglar_id" ) REFERENCES "taglar"( "taglar_id" ),
	CONSTRAINT "lnk_soru_MM_taglar" FOREIGN KEY ( "soru_id" ) REFERENCES "soru"( "soru_id" )
 );


-- ------------------------------------------
-- Dump of "cevap"
-- ------------------------------------------

CREATE TABLE "cevap"(
	"cevap id" Integer,
	"cevap tarihi" DateTime,
	"pozitif oy sayisi" Integer,
	"negatif oy sayisi" Integer,
	"cevap_id" Integer PRIMARY KEY,
	"soru_id" Integer,
	"kisi id" Integer,
	CONSTRAINT "lnk_soru_cevap" FOREIGN KEY ( "soru_id" ) REFERENCES "soru"( "soru_id" )
 );

CREATE INDEX "index_soru_id" ON "cevap"( "soru_id" );

-- ------------------------------------------
-- Dump of "soru"
-- ------------------------------------------

CREATE TABLE "soru"(
	"soru id" Integer,
	"soru tarihi" DateTime,
	"pozitif oy sayisi" Integer,
	"negatif oy sayisi" Integer,
	"negatif oylar_id" Integer,
	"pozitif oylar_id" Integer,
	"soru_id" Integer PRIMARY KEY,
	"taglar_id" Integer,
	"kisi id" Integer,
	CONSTRAINT "lnk_negatif oylar_soru" FOREIGN KEY ( "negatif oylar_id" ) REFERENCES "negatif oylar"( "negatif oylar_id" ),
	CONSTRAINT "lnk_pozitif oylar_soru" FOREIGN KEY ( "pozitif oylar_id" ) REFERENCES "pozitif oylar"( "pozitif oylar_id" )
 );

CREATE INDEX "index_pozitif oylar_id" ON "soru"( "pozitif oylar_id" );
CREATE INDEX "index_taglar_id" ON "soru"( "taglar_id" );

-- ------------------------------------------
-- Dump of "profil"
-- ------------------------------------------

CREATE TABLE "profil"(
	"profil id" Integer,
	"rozet" Text,
	"profil_id" Integer PRIMARY KEY,
	"kisi id" Integer );


-- ------------------------------------------
-- Dump of "rozet"
-- ------------------------------------------

CREATE TABLE "rozet"(
	"rozet" Text,
	"rozet sayisi" Integer,
	"kisi id" Integer );


-- ------------------------------------------
-- Dump of "mesaj"
-- ------------------------------------------

CREATE TABLE "mesaj"(
	"mesaj" Text DEFAULT string,
	"mesaj id" Integer,
	"mesaj kutusu_id" Integer,
	"kisi id" Integer,
	"kisi_id" Integer,
	CONSTRAINT "lnk_mesaj kutusu_mesaj" FOREIGN KEY ( "mesaj kutusu_id" ) REFERENCES "mesaj kutusu"( "mesaj kutusu_id" ),
	CONSTRAINT "lnk_kişi_mesaj" FOREIGN KEY ( "kisi_id" ) REFERENCES "kişi"( "kişi_id" )
 );

CREATE INDEX "index_kişi_id1" ON "mesaj"( "kisi_id" );

-- ------------------------------------------
-- Dump of "mesaj kutusu"
-- ------------------------------------------

CREATE TABLE "mesaj kutusu"(
	"profil id" Integer,
	"mesaj kutusu_id" Integer PRIMARY KEY );


-- ------------------------------------------
-- Dump of "duzeltme"
-- ------------------------------------------

CREATE TABLE "duzeltme"(
	"soru id" Integer,
	"duzeltme tarihi" DateTime,
	"editor_id" Integer );

CREATE INDEX "index_editör_id" ON "duzeltme"( "editor_id" );

-- ------------------------------------------
-- Dump of "editor"
-- ------------------------------------------

CREATE TABLE "editor"(
	"eposta" Text,
	"editor_id" Integer PRIMARY KEY,
	"sifre" Text );


-- ------------------------------------------
-- Dump of "goruntulenme"
-- ------------------------------------------

CREATE TABLE "goruntulenme"(
	"soru id" Integer,
	"cevap_id" Integer,
	"soru_id" Integer,
	"goruntulenme sayisi" Integer );

CREATE INDEX "index_cevap_id2" ON "goruntulenme"( "cevap_id" );
CREATE INDEX "index_soru_id1" ON "goruntulenme"( "soru_id" );

-- ------------------------------------------
-- Dump of "iletisim bilgileri"
-- ------------------------------------------

CREATE TABLE "iletisim bilgileri"(
	"eposta" Text DEFAULT string,
	"iletisim bilgileri_id" Integer PRIMARY KEY );


-- ------------------------------------------
-- Dump of "kisi"
-- ------------------------------------------

CREATE TABLE "kisi"(
	"username" Text,
	"profil id" Integer,
	"mesaj kutusu_id" Integer,
	"kisi id" Integer,
	"kisi_id" Integer PRIMARY KEY,
	"iletisim bilgileri_id" Integer,
	"moderator_id" Integer,
CONSTRAINT "unique_mesaj kutusu_id" UNIQUE ( "mesaj kutusu_id" ),
CONSTRAINT "unique_iletişim bilgileri_id" UNIQUE ( "iletisim bilgileri_id" ) );

CREATE INDEX "index_moderatör_id" ON "kisi"( "moderator_id" );

-- ------------------------------------------
-- Dump of "moderator"
-- ------------------------------------------

CREATE TABLE "moderator"(
	"eposta" Text,
	"sifre" Text,
	"moderator_id" Integer PRIMARY KEY );


