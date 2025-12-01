-- Migration to add a 'context' column to the 'publications' table.
-- This script will safely drop, add a new column, and then re-add
-- the foreign key constraints, ensuring data integrity.

-- Step 1: Drop existing foreign key constraints.
-- This is necessary to modify the table's structure without conflicts.
ALTER TABLE "public"."publications"
DROP CONSTRAINT IF EXISTS "publications_created_by_id_fk",
DROP CONSTRAINT IF EXISTS "publications_updated_by_id_fk";

-- Step 2: Add the new 'context' column.
-- We use the TEXT data type, which is ideal for storing rich text content.
ALTER TABLE "public"."publications"
ADD COLUMN "context" TEXT;

-- Step 3: Re-add the foreign key constraints.
-- These constraints ensure that the 'created_by_id' and 'updated_by_id'
-- columns still correctly reference the 'admin_users' table.
ALTER TABLE "public"."publications"
ADD CONSTRAINT "publications_created_by_id_fk"
FOREIGN KEY ("created_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE SET NULL,
ADD CONSTRAINT "publications_updated_by_id_fk"
FOREIGN KEY ("updated_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE SET NULL;
