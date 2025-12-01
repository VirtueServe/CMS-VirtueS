create sequence "public"."google_ads_lead_generations_id_seq";

create table "public"."google_ads_lead_generations" (
  "id" integer not null default nextval('google_ads_lead_generations_id_seq'::regclass),
  "document_id" character varying(255),
  "full_name" character varying(255),
  "company_email_id" character varying(255),
  "designation" text,
  "created_at" timestamp(6) without time zone,
  "updated_at" timestamp(6) without time zone,
  "published_at" timestamp(6) without time zone,
  "created_by_id" integer,
  "updated_by_id" integer,
  "locale" character varying(255)
);

alter sequence "public"."google_ads_lead_generations_id_seq" owned by "public"."google_ads_lead_generations"."id";

CREATE INDEX google_ads_lead_generations_created_by_id_fk ON public.google_ads_lead_generations USING btree (created_by_id);

CREATE INDEX google_ads_lead_generations_documents_idx ON public.google_ads_lead_generations USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX google_ads_lead_generations_pkey ON public.google_ads_lead_generations USING btree (id);

CREATE INDEX google_ads_lead_generations_updated_by_id_fk ON public.google_ads_lead_generations USING btree (updated_by_id);


alter table "public"."google_ads_lead_generations" add constraint "google_ads_lead_generations_pkey" PRIMARY KEY using index "google_ads_lead_generations_pkey";

-- Corrected Foreign Key constraints. The 'USING INDEX' clause has been removed.
alter table "public"."google_ads_lead_generations" add constraint "google_ads_lead_generations_created_by_id_fk" FOREIGN KEY ("created_by_id") REFERENCES "public"."up_users" ("id");

alter table "public"."google_ads_lead_generations" add constraint "google_ads_lead_generations_updated_by_id_fk" FOREIGN KEY ("updated_by_id") REFERENCES "public"."up_users" ("id");

-- The following constraints related to 'publications_website_lnk' have been removed as they were not part of the provided table's definition and would cause errors.


grant delete on table "public"."google_ads_lead_generations" to "anon";

grant insert on table "public"."google_ads_lead_generations" to "anon";

grant references on table "public"."google_ads_lead_generations" to "anon";

grant select on table "public"."google_ads_lead_generations" to "anon";

grant trigger on table "public"."google_ads_lead_generations" to "anon";

grant truncate on table "public"."google_ads_lead_generations" to "anon";

grant update on table "public"."google_ads_lead_generations" to "anon";

grant delete on table "public"."google_ads_lead_generations" to "authenticated";

grant insert on table "public"."google_ads_lead_generations" to "authenticated";

grant references on table "public"."google_ads_lead_generations" to "authenticated";

grant select on table "public"."google_ads_lead_generations" to "authenticated";

grant trigger on table "public"."google_ads_lead_generations" to "authenticated";

grant truncate on table "public"."google_ads_lead_generations" to "authenticated";

grant update on table "public"."google_ads_lead_generations" to "authenticated";

grant delete on table "public"."google_ads_lead_generations" to "service_role";

grant insert on table "public"."google_ads_lead_generations" to "service_role";

grant references on table "public"."google_ads_lead_generations" to "service_role";

grant select on table "public"."google_ads_lead_generations" to "service_role";

grant trigger on table "public"."google_ads_lead_generations" to "service_role";

grant truncate on table "public"."google_ads_lead_generations" to "service_role";

grant update on table "public"."google_ads_lead_generations" to "service_role";