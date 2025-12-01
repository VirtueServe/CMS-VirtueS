create extension if not exists "pg_net" with schema "extensions";

revoke delete on table "public"."test2s" from "anon";

revoke insert on table "public"."test2s" from "anon";

revoke references on table "public"."test2s" from "anon";

revoke select on table "public"."test2s" from "anon";

revoke trigger on table "public"."test2s" from "anon";

revoke truncate on table "public"."test2s" from "anon";

revoke update on table "public"."test2s" from "anon";

revoke delete on table "public"."test2s" from "authenticated";

revoke insert on table "public"."test2s" from "authenticated";

revoke references on table "public"."test2s" from "authenticated";

revoke select on table "public"."test2s" from "authenticated";

revoke trigger on table "public"."test2s" from "authenticated";

revoke truncate on table "public"."test2s" from "authenticated";

revoke update on table "public"."test2s" from "authenticated";

revoke delete on table "public"."test2s" from "service_role";

revoke insert on table "public"."test2s" from "service_role";

revoke references on table "public"."test2s" from "service_role";

revoke select on table "public"."test2s" from "service_role";

revoke trigger on table "public"."test2s" from "service_role";

revoke truncate on table "public"."test2s" from "service_role";

revoke update on table "public"."test2s" from "service_role";

alter table "public"."test2s" drop constraint "test2s_created_by_id_fk";

alter table "public"."test2s" drop constraint "test2s_updated_by_id_fk";

alter table "public"."test2s" drop constraint "test2s_pkey";

drop index if exists "public"."test2s_created_by_id_fk";

drop index if exists "public"."test2s_documents_idx";

drop index if exists "public"."test2s_pkey";

drop index if exists "public"."test2s_updated_by_id_fk";

drop table "public"."test2s";

drop sequence if exists "public"."test2s_id_seq";


