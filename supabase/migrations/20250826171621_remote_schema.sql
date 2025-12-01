drop extension if exists "pg_net";

alter table "public"."publications" alter column "context" set data type jsonb using "context"::jsonb;


