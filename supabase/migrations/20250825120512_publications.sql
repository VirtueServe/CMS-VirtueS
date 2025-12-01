-- Create a new sequence for the publications table
CREATE SEQUENCE "public"."publications_id_seq"
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    CACHE 1;

-- Create the publications table
CREATE TABLE "public"."publications" (
    "id" integer NOT NULL DEFAULT nextval('publications_id_seq'::regclass),
    "document_id" character varying(255),
    "title" character varying(255),
    "posted" timestamp(6) without time zone,
    "author" character varying(255),
    "content" text,
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255),
    CONSTRAINT "publications_pkey" PRIMARY KEY ("id")
);

-- Link the sequence to the table's ID column
ALTER SEQUENCE "public"."publications_id_seq" OWNED BY "public"."publications"."id";

-- Add foreign key constraints
ALTER TABLE "public"."publications" ADD CONSTRAINT "publications_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id);
ALTER TABLE "public"."publications" ADD CONSTRAINT "publications_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id);

-- Create indexes for improved query performance
CREATE INDEX publications_created_by_id_fk ON public.publications USING btree (created_by_id);
CREATE INDEX publications_documents_idx ON public.publications USING btree (document_id, locale, published_at);
CREATE INDEX publications_updated_by_id_fk ON public.publications USING btree (updated_by_id);

-- Grant permissions to Supabase roles
GRANT DELETE, INSERT, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."publications" TO "anon";
GRANT DELETE, INSERT, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."publications" TO "authenticated";
GRANT DELETE, INSERT, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."publications" TO "service_role";
