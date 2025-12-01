--
-- Create the sequence for the table's primary key
--
create sequence "public"."test2s_id_seq";

--
-- Create the 'test2s' table
--
create table "public"."test2s" (
    "id" integer not null default nextval('test2s_id_seq'::regclass),
    "document_id" character varying(255),
    "salary" integer,
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
);

--
-- Associate the sequence with the table's 'id' column
--
alter sequence "public"."test2s_id_seq" owned by "public"."test2s"."id";

--
-- Create indexes for performance
--
CREATE INDEX test2s_created_by_id_fk ON public.test2s USING btree (created_by_id);
CREATE INDEX test2s_documents_idx ON public.test2s USING btree (document_id, locale, published_at);
CREATE UNIQUE INDEX test2s_pkey ON public.test2s USING btree (id);
CREATE INDEX test2s_updated_by_id_fk ON public.test2s USING btree (updated_by_id);

--
-- Set the primary key for the table
--
alter table "public"."test2s" add constraint "test2s_pkey" PRIMARY KEY using index "test2s_pkey";

--
-- CORRECTED: Add foreign key constraints
-- This assumes you have an 'admin_users' table, which is standard in Strapi.
--
alter table "public"."test2s" add constraint "test2s_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
alter table "public"."test2s" add constraint "test2s_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;

--
-- Grant permissions to database roles
--
grant delete on table "public"."test2s" to "anon";
grant insert on table "public"."test2s" to "anon";
grant references on table "public"."test2s" to "anon";
grant select on table "public"."test2s" to "anon";
grant trigger on table "public"."test2s" to "anon";
grant truncate on table "public"."test2s" to "anon";
grant update on table "public"."test2s" to "anon";

grant delete on table "public"."test2s" to "authenticated";
grant insert on table "public"."test2s" to "authenticated";
grant references on table "public"."test2s" to "authenticated";
grant select on table "public"."test2s" to "authenticated";
grant trigger on table "public"."test2s" to "authenticated";
grant truncate on table "public"."test2s" to "authenticated";
grant update on table "public"."test2s" to "authenticated";

grant delete on table "public"."test2s" to "service_role";
grant insert on table "public"."test2s" to "service_role";
grant references on table "public"."test2s" to "service_role";
grant select on table "public"."test2s" to "service_role";
grant trigger on table "public"."test2s" to "service_role";
grant truncate on table "public"."test2s" to "service_role";
grant update on table "public"."test2s" to "service_role";