/*
 Navicat Premium Data Transfer

 Source Server         : POSTGRES LOCAL
 Source Server Type    : PostgreSQL
 Source Server Version : 150000 (150000)
 Source Host           : localhost:5433
 Source Catalog        : folkatech
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 150000 (150000)
 File Encoding         : 65001

 Date: 13/09/2023 06:49:45
*/


-- ----------------------------
-- Sequence structure for jenis_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."jenis_id_seq";
CREATE SEQUENCE "public"."jenis_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."migrations_id_seq";
CREATE SEQUENCE "public"."migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for personal_access_tokens_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."personal_access_tokens_id_seq";
CREATE SEQUENCE "public"."personal_access_tokens_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for products_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."products_id_seq";
CREATE SEQUENCE "public"."products_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for roles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."roles_id_seq";
CREATE SEQUENCE "public"."roles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for jenis
-- ----------------------------
DROP TABLE IF EXISTS "public"."jenis";
CREATE TABLE "public"."jenis" (
  "id" int8 NOT NULL DEFAULT nextval('jenis_id_seq'::regclass),
  "nama" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of jenis
-- ----------------------------
INSERT INTO "public"."jenis" VALUES (1, 'Bahan', '2023-09-13 02:16:33', '2023-09-13 02:16:33');
INSERT INTO "public"."jenis" VALUES (2, 'Aksesoris', '2023-09-13 02:16:33', '2023-09-13 02:16:33');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."migrations";
CREATE TABLE "public"."migrations" (
  "id" int4 NOT NULL DEFAULT nextval('migrations_id_seq'::regclass),
  "migration" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "batch" int4 NOT NULL
)
;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO "public"."migrations" VALUES (11, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO "public"."migrations" VALUES (12, '2023_09_12_203600_create_roles_table', 1);
INSERT INTO "public"."migrations" VALUES (13, '2023_09_12_223600_create_users_table', 1);
INSERT INTO "public"."migrations" VALUES (14, '2023_09_12_233321_create_jenis_table', 1);
INSERT INTO "public"."migrations" VALUES (15, '2023_09_12_262800_create_products_table', 1);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."personal_access_tokens";
CREATE TABLE "public"."personal_access_tokens" (
  "id" int8 NOT NULL DEFAULT nextval('personal_access_tokens_id_seq'::regclass),
  "tokenable_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tokenable_id" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "abilities" text COLLATE "pg_catalog"."default",
  "last_used_at" timestamp(0),
  "expires_at" timestamp(0),
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS "public"."products";
CREATE TABLE "public"."products" (
  "id" int8 NOT NULL DEFAULT nextval('products_id_seq'::regclass),
  "userId" int8 NOT NULL,
  "namaProduk" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "ratingProduk" int4,
  "jenisProduk" int8 NOT NULL,
  "deskripsi" text COLLATE "pg_catalog"."default",
  "harga" float8 NOT NULL,
  "stok" int4 NOT NULL,
  "gambarProduk" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO "public"."products" VALUES (1, 2, 'Testing', 10, 1, 'INI TEST DOANG', 50000, 300, 'http://testgambar.jpg', '2023-09-13 02:17:57', '2023-09-13 02:17:57');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."roles";
CREATE TABLE "public"."roles" (
  "id" int8 NOT NULL DEFAULT nextval('roles_id_seq'::regclass),
  "nama" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO "public"."roles" VALUES (1, 'Administrator', '2023-09-13 02:16:43', '2023-09-13 02:16:43');
INSERT INTO "public"."roles" VALUES (2, 'Penjual', '2023-09-13 02:16:43', '2023-09-13 02:16:43');
INSERT INTO "public"."roles" VALUES (3, 'Pembeli', '2023-09-13 02:16:43', '2023-09-13 02:16:43');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" int8 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  "namaDepan" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "namaBelakang" varchar(255) COLLATE "pg_catalog"."default",
  "namaToko" varchar(255) COLLATE "pg_catalog"."default",
  "noTelp" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "roleId" int8 NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES (1, 'Administrator', NULL, NULL, '123456', 1, 'admin@gmail.com', '$2y$10$GmptdQj./yVcvPe8uqr6qO/C0jY9QBN/CScvhYJfi1uA6IDe00OZW', '2023-09-13 02:16:58', '2023-09-13 02:16:58');
INSERT INTO "public"."users" VALUES (2, 'Daniel', 'Eka Putra', 'D''Shop', '081283927810', 2, 'danetra05@gmail.com', '$2y$10$96JyXDY8Y2oJiiDdxAsq5OIFiHSZRpnpjCx4.lfMHK/IYV.M53.sa', '2023-09-13 02:16:58', '2023-09-13 02:16:58');
INSERT INTO "public"."users" VALUES (3, 'Ezra', 'Michael Lainsamputty', NULL, '081287987023', 3, 'ezra@gmail.com', '$2a$10$cWlpKMTobyClE.2J5Wozk.d4SgRCrv7QfkGnGmJCT5o/9uF6DxPXK', '2023-09-13 05:43:19', '2023-09-13 05:43:19');
INSERT INTO "public"."users" VALUES (4, 'Alex', 'Al Munjabi', 'Jabi Shop', '081287987023', 3, 'alex@gmail.com', '$2a$10$ucDnlQuaqAfZy2.uXxfCiu0.bXyytfwTiBYZSL7/W9ZQCGCjoWEl2', '2023-09-13 05:47:01', '2023-09-13 05:47:01');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."jenis_id_seq"
OWNED BY "public"."jenis"."id";
SELECT setval('"public"."jenis_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."migrations_id_seq"
OWNED BY "public"."migrations"."id";
SELECT setval('"public"."migrations_id_seq"', 15, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."personal_access_tokens_id_seq"
OWNED BY "public"."personal_access_tokens"."id";
SELECT setval('"public"."personal_access_tokens_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."products_id_seq"
OWNED BY "public"."products"."id";
SELECT setval('"public"."products_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."roles_id_seq"
OWNED BY "public"."roles"."id";
SELECT setval('"public"."roles_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."users_id_seq"
OWNED BY "public"."users"."id";
SELECT setval('"public"."users_id_seq"', 4, true);

-- ----------------------------
-- Uniques structure for table jenis
-- ----------------------------
ALTER TABLE "public"."jenis" ADD CONSTRAINT "jenis_nama_unique" UNIQUE ("nama");

-- ----------------------------
-- Primary Key structure for table jenis
-- ----------------------------
ALTER TABLE "public"."jenis" ADD CONSTRAINT "jenis_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table migrations
-- ----------------------------
ALTER TABLE "public"."migrations" ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table personal_access_tokens
-- ----------------------------
CREATE INDEX "personal_access_tokens_tokenable_type_tokenable_id_index" ON "public"."personal_access_tokens" USING btree (
  "tokenable_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "tokenable_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table personal_access_tokens
-- ----------------------------
ALTER TABLE "public"."personal_access_tokens" ADD CONSTRAINT "personal_access_tokens_token_unique" UNIQUE ("token");

-- ----------------------------
-- Primary Key structure for table personal_access_tokens
-- ----------------------------
ALTER TABLE "public"."personal_access_tokens" ADD CONSTRAINT "personal_access_tokens_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table products
-- ----------------------------
ALTER TABLE "public"."products" ADD CONSTRAINT "products_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD CONSTRAINT "roles_nama_unique" UNIQUE ("nama");

-- ----------------------------
-- Primary Key structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_email_unique" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table products
-- ----------------------------
ALTER TABLE "public"."products" ADD CONSTRAINT "products_jenisproduk_foreign" FOREIGN KEY ("jenisProduk") REFERENCES "public"."jenis" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."products" ADD CONSTRAINT "products_userid_foreign" FOREIGN KEY ("userId") REFERENCES "public"."users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_roleid_foreign" FOREIGN KEY ("roleId") REFERENCES "public"."roles" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
