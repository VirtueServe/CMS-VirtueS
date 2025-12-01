-- Drop existing (incorrect) constraints if they were created
ALTER TABLE IF EXISTS "public"."publications_website_lnk" DROP CONSTRAINT IF EXISTS "publications_website_lnk_fk";
ALTER TABLE IF EXISTS "public"."publications_website_lnk" DROP CONSTRAINT IF EXISTS "publications_website_lnk_ifk";
ALTER TABLE IF EXISTS "public"."websites" DROP CONSTRAINT IF EXISTS "websites_created_by_id_fk";
ALTER TABLE IF EXISTS "public"."websites" DROP CONSTRAINT IF EXISTS "websites_updated_by_id_fk";

-- ========= SEQUENCES =========
-- Create sequences for auto-incrementing primary keys
CREATE SEQUENCE IF NOT EXISTS "public"."publications_website_lnk_id_seq";
CREATE SEQUENCE IF NOT EXISTS "public"."websites_id_seq";

-- ========= WEBSITES TABLE =========
-- Defines the 'websites' content type
CREATE TABLE IF NOT EXISTS "public"."websites" (
    "id" integer NOT NULL DEFAULT nextval('websites_id_seq'::regclass),
    "document_id" character varying(255),
    "name" character varying(255),
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
);

-- ========= PUBLICATIONS_WEBSITE_LNK TABLE =========
-- This is the join table for the many-to-many relationship
-- between 'publications' and 'websites'
CREATE TABLE IF NOT EXISTS "public"."publications_website_lnk" (
    "id" integer NOT NULL DEFAULT nextval('publications_website_lnk_id_seq'::regclass),
    "publication_id" integer,
    "website_id" integer,
    "publication_ord" double precision
);

-- ========= OWNERSHIP & PRIMARY KEYS =========
-- Associate sequences with their respective table ID columns
ALTER SEQUENCE "public"."publications_website_lnk_id_seq" OWNED BY "public"."publications_website_lnk"."id";
ALTER SEQUENCE "public"."websites_id_seq" OWNED BY "public"."websites"."id";

-- Add Primary Key constraints
ALTER TABLE "public"."websites" ADD CONSTRAINT "websites_pkey" PRIMARY KEY ("id");
ALTER TABLE "public"."publications_website_lnk" ADD CONSTRAINT "publications_website_lnk_pkey" PRIMARY KEY ("id");

-- ========= INDEXES =========
-- Indexes on the join table for faster lookups
CREATE INDEX IF NOT EXISTS "publications_website_lnk_publication_id_fk" ON "public"."publications_website_lnk" USING btree ("publication_id");
CREATE INDEX IF NOT EXISTS "publications_website_lnk_website_id_ifk" ON "public"."publications_website_lnk" USING btree ("website_id");

-- Index on the order column
CREATE INDEX IF NOT EXISTS "publications_website_lnk_order_oifk" ON "public"."publications_website_lnk" USING btree ("publication_ord");

-- Unique constraint to prevent linking the same publication and website more than once
ALTER TABLE "public"."publications_website_lnk" ADD CONSTRAINT "publications_website_lnk_unique" UNIQUE ("publication_id", "website_id");

-- Indexes on the websites table for foreign keys and common query patterns
CREATE INDEX IF NOT EXISTS "websites_created_by_id_fk" ON "public"."websites" USING btree ("created_by_id");
CREATE INDEX IF NOT EXISTS "websites_updated_by_id_fk" ON "public"."websites" USING btree ("updated_by_id");
CREATE INDEX IF NOT EXISTS "websites_documents_idx" ON "public"."websites" USING btree ("document_id", "locale", "published_at");

-- ========= FOREIGN KEYS (CORRECTED) =========
-- This section contains the primary fixes.
-- NOTE: Assumes your publications table is named 'publications' and your Strapi admin user table is 'admin_users'.
-- Please verify these table names and adjust if necessary.

ALTER TABLE "public"."publications_website_lnk"
    ADD CONSTRAINT "publications_website_lnk_publication_fk"
    FOREIGN KEY ("publication_id") REFERENCES "public"."publications"("id") ON DELETE CASCADE;

ALTER TABLE "public"."publications_website_lnk"
    ADD CONSTRAINT "publications_website_lnk_website_fk"
    FOREIGN KEY ("website_id") REFERENCES "public"."websites"("id") ON DELETE CASCADE;

ALTER TABLE "public"."websites"
    ADD CONSTRAINT "websites_created_by_id_fk"
    FOREIGN KEY ("created_by_id") REFERENCES "public"."admin_users"("id") ON DELETE SET NULL;

ALTER TABLE "public"."websites"
    ADD CONSTRAINT "websites_updated_by_id_fk"
    FOREIGN KEY ("updated_by_id") REFERENCES "public"."admin_users"("id") ON DELETE SET NULL;


-- ========= PERMISSIONS (CORRECTED) =========
-- This section is intentionally left blank. The overly permissive GRANT statements
-- from the original script have been removed. You should rely on Supabase's
-- Row Level Security (RLS) policies to grant specific, query-based access
-- to roles like 'anon' and 'authenticated' instead of giving them broad table-level permissions.

-- Example: To enable RLS on your tables (run this in the Supabase SQL Editor)
-- ALTER TABLE "public"."websites" ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE "public"."publications_website_lnk" ENABLE ROW LEVEL SECURITY;

-- CREATE POLICY "Allow public read access" ON "public"."websites"
-- FOR SELECT USING (true);
