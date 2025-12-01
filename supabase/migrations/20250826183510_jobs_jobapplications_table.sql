-- Create sequences
create sequence "public"."job_applications_id_seq";
create sequence "public"."job_applications_job_lnk_id_seq";
create sequence "public"."jobs_id_seq";

-- Create tables
create table "public"."job_applications" (
  "id" integer not null default nextval('job_applications_id_seq'::regclass),
  "document_id" character varying(255),
  "full_name" character varying(255),
  "email" character varying(255),
  "phone" text,
  "experience" text,
  "created_at" timestamp(6) without time zone,
  "updated_at" timestamp(6) without time zone,
  "published_at" timestamp(6) without time zone,
  "created_by_id" integer,
  "updated_by_id" integer,
  "locale" character varying(255)
);

create table "public"."job_applications_job_lnk" (
  "id" integer not null default nextval('job_applications_job_lnk_id_seq'::regclass),
  "job_application_id" integer,
  "job_id" integer,
  "job_application_ord" double precision
);

create table "public"."jobs" (
  "id" integer not null default nextval('jobs_id_seq'::regclass),
  "document_id" character varying(255),
  "title" character varying(255),
  "company" character varying(255),
  "location" text,
  "type" character varying(255),
  "experience" text,
  "salary" text,
  "breif_description" jsonb,
  "benefits" text,
  "posted" timestamp(6) without time zone,
  "description" text,
  "created_at" timestamp(6) without time zone,
  "updated_at" timestamp(6) without time zone,
  "published_at" timestamp(6) without time zone,
  "created_by_id" integer,
  "updated_by_id" integer,
  "locale" character varying(255)
);

-- Alter sequences to be owned by tables
alter sequence "public"."job_applications_id_seq" owned by "public"."job_applications"."id";
alter sequence "public"."job_applications_job_lnk_id_seq" owned by "public"."job_applications_job_lnk"."id";
alter sequence "public"."jobs_id_seq" owned by "public"."jobs"."id";

-- Add primary key constraints
alter table "public"."job_applications" add constraint "job_applications_pkey" PRIMARY KEY ("id");
alter table "public"."job_applications_job_lnk" add constraint "job_applications_job_lnk_pkey" PRIMARY KEY ("id");
alter table "public"."jobs" add constraint "jobs_pkey" PRIMARY KEY ("id");

-- Create indexes and unique constraints
CREATE INDEX job_applications_created_by_id_fk ON public.job_applications USING btree (created_by_id);
CREATE INDEX job_applications_documents_idx ON public.job_applications USING btree (document_id, locale, published_at);
CREATE INDEX job_applications_job_lnk_fk ON public.job_applications_job_lnk USING btree (job_application_id);
CREATE INDEX job_applications_job_lnk_ifk ON public.job_applications_job_lnk USING btree (job_id);
CREATE INDEX job_applications_job_lnk_oifk ON public.job_applications_job_lnk USING btree (job_application_ord);
CREATE UNIQUE INDEX job_applications_job_lnk_uq ON public.job_applications_job_lnk USING btree (job_application_id, job_id);
CREATE INDEX job_applications_updated_by_id_fk ON public.job_applications USING btree (updated_by_id);
CREATE INDEX jobs_created_by_id_fk ON public.jobs USING btree (created_by_id);
CREATE INDEX jobs_documents_idx ON public.jobs USING btree (document_id, locale, published_at);
CREATE INDEX jobs_updated_by_id_fk ON public.jobs USING btree (updated_by_id);

-- Add foreign key constraints
alter table "public"."job_applications" add constraint "job_applications_created_by_id_fk" FOREIGN KEY ("created_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE SET NULL;
alter table "public"."job_applications" add constraint "job_applications_updated_by_id_fk" FOREIGN KEY ("updated_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE SET NULL;
alter table "public"."job_applications_job_lnk" add constraint "job_applications_job_lnk_fk" FOREIGN KEY ("job_application_id") REFERENCES "public"."job_applications" ("id") ON DELETE CASCADE;
alter table "public"."job_applications_job_lnk" add constraint "job_applications_job_lnk_ifk" FOREIGN KEY ("job_id") REFERENCES "public"."jobs" ("id") ON DELETE CASCADE;
alter table "public"."jobs" add constraint "jobs_created_by_id_fk" FOREIGN KEY ("created_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE SET NULL;
alter table "public"."jobs" add constraint "jobs_updated_by_id_fk" FOREIGN KEY ("updated_by_id") REFERENCES "public"."admin_users" ("id") ON DELETE SET NULL;

-- Grant permissions to roles
grant delete on table "public"."job_applications" to "anon";
grant insert on table "public"."job_applications" to "anon";
grant references on table "public"."job_applications" to "anon";
grant select on table "public"."job_applications" to "anon";
grant trigger on table "public"."job_applications" to "anon";
grant truncate on table "public"."job_applications" to "anon";
grant update on table "public"."job_applications" to "anon";
grant delete on table "public"."job_applications" to "authenticated";
grant insert on table "public"."job_applications" to "authenticated";
grant references on table "public"."job_applications" to "authenticated";
grant select on table "public"."job_applications" to "authenticated";
grant trigger on table "public"."job_applications" to "authenticated";
grant truncate on table "public"."job_applications" to "authenticated";
grant update on table "public"."job_applications" to "authenticated";
grant delete on table "public"."job_applications" to "service_role";
grant insert on table "public"."job_applications" to "service_role";
grant references on table "public"."job_applications" to "service_role";
grant select on table "public"."job_applications" to "service_role";
grant trigger on table "public"."job_applications" to "service_role";
grant truncate on table "public"."job_applications" to "service_role";
grant update on table "public"."job_applications" to "service_role";
grant delete on table "public"."job_applications_job_lnk" to "anon";
grant insert on table "public"."job_applications_job_lnk" to "anon";
grant references on table "public"."job_applications_job_lnk" to "anon";
grant select on table "public"."job_applications_job_lnk" to "anon";
grant trigger on table "public"."job_applications_job_lnk" to "anon";
grant truncate on table "public"."job_applications_job_lnk" to "anon";
grant update on table "public"."job_applications_job_lnk" to "anon";
grant delete on table "public"."job_applications_job_lnk" to "authenticated";
grant insert on table "public"."job_applications_job_lnk" to "authenticated";
grant references on table "public"."job_applications_job_lnk" to "authenticated";
grant select on table "public"."job_applications_job_lnk" to "authenticated";
grant trigger on table "public"."job_applications_job_lnk" to "authenticated";
grant truncate on table "public"."job_applications_job_lnk" to "authenticated";
grant update on table "public"."job_applications_job_lnk" to "authenticated";
grant delete on table "public"."job_applications_job_lnk" to "service_role";
grant insert on table "public"."job_applications_job_lnk" to "service_role";
grant references on table "public"."job_applications_job_lnk" to "service_role";
grant select on table "public"."job_applications_job_lnk" to "service_role";
grant trigger on table "public"."job_applications_job_lnk" to "service_role";
grant truncate on table "public"."job_applications_job_lnk" to "service_role";
grant update on table "public"."job_applications_job_lnk" to "service_role";
grant delete on table "public"."jobs" to "anon";
grant insert on table "public"."jobs" to "anon";
grant references on table "public"."jobs" to "anon";
grant select on table "public"."jobs" to "anon";
grant trigger on table "public"."jobs" to "anon";
grant truncate on table "public"."jobs" to "anon";
grant update on table "public"."jobs" to "anon";
grant delete on table "public"."jobs" to "authenticated";
grant insert on table "public"."jobs" to "authenticated";
grant references on table "public"."jobs" to "authenticated";
grant select on table "public"."jobs" to "authenticated";
grant trigger on table "public"."jobs" to "authenticated";
grant truncate on table "public"."jobs" to "authenticated";
grant update on table "public"."jobs" to "authenticated";
grant delete on table "public"."jobs" to "service_role";
grant insert on table "public"."jobs" to "service_role";
grant references on table "public"."jobs" to "service_role";
grant select on table "public"."jobs" to "service_role";
grant trigger on table "public"."jobs" to "service_role";
grant truncate on table "public"."jobs" to "service_role";
grant update on table "public"."jobs" to "service_role";
