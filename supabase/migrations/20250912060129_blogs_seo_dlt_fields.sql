

alter table "public"."blogs" drop column "keywords";

alter table "public"."blogs" drop column "seo_description";

alter table "public"."blogs" drop column "seo_title";

alter table "public"."blogs" alter column "created_at" set data type timestamp(6) without time zone using "created_at"::timestamp(6) without time zone;

alter table "public"."blogs" alter column "published_at" set data type timestamp(6) without time zone using "published_at"::timestamp(6) without time zone;

alter table "public"."blogs" alter column "updated_at" set data type timestamp(6) without time zone using "updated_at"::timestamp(6) without time zone;



