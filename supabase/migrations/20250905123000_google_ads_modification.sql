alter table "public"."google_ads_lead_generations" drop constraint "google_ads_lead_generations_created_by_id_fk";

alter table "public"."google_ads_lead_generations" drop constraint "google_ads_lead_generations_updated_by_id_fk";

alter table "public"."google_ads_lead_generations" add column "mobile_number" text;

alter table "public"."google_ads_lead_generations" add constraint "google_ads_lead_generations_created_by_id_fk" FOREIGN KEY ("created_by_id") REFERENCES "public"."up_users" ("id");

alter table "public"."google_ads_lead_generations" add constraint "google_ads_lead_generations_updated_by_id_fk" FOREIGN KEY ("updated_by_id") REFERENCES "public"."up_users" ("id");