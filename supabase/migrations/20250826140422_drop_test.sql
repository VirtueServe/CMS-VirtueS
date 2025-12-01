-- This migration script will safely delete the 'testingtables' table
-- and remove any associated entries from the Strapi store table.

-- Step 1: Safely drop the 'testingtables' table.
-- The CASCADE option ensures that any dependent objects, like the index,
-- are also deleted to prevent errors.
DROP TABLE IF EXISTS "public"."testingtables" CASCADE;

-- Step 2: Delete the Strapi entry for the 'testingtables' content type.
-- This command removes the configuration data that Strapi uses to manage
-- the table. It's essential for preventing Strapi from trying to access
-- a non-existent table.
DELETE FROM "public"."strapi_core_store_settings"
WHERE "key" = 'plugin_content_manager_configuration_content_types::api::testingtable.testingtable';
