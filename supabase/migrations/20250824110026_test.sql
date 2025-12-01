create sequence "public"."admin_permissions_id_seq";

create sequence "public"."admin_permissions_role_lnk_id_seq";

create sequence "public"."admin_roles_id_seq";

create sequence "public"."admin_users_id_seq";

create sequence "public"."admin_users_roles_lnk_id_seq";

create sequence "public"."files_folder_lnk_id_seq";

create sequence "public"."files_id_seq";

create sequence "public"."files_related_mph_id_seq";

create sequence "public"."i18n_locale_id_seq";

create sequence "public"."strapi_api_token_permissions_id_seq";

create sequence "public"."strapi_api_token_permissions_token_lnk_id_seq";

create sequence "public"."strapi_api_tokens_id_seq";

create sequence "public"."strapi_core_store_settings_id_seq";

create sequence "public"."strapi_database_schema_id_seq";

create sequence "public"."strapi_history_versions_id_seq";

create sequence "public"."strapi_migrations_id_seq";

create sequence "public"."strapi_migrations_internal_id_seq";

create sequence "public"."strapi_release_actions_id_seq";

create sequence "public"."strapi_release_actions_release_lnk_id_seq";

create sequence "public"."strapi_releases_id_seq";

create sequence "public"."strapi_transfer_token_permissions_id_seq";

create sequence "public"."strapi_transfer_token_permissions_token_lnk_id_seq";

create sequence "public"."strapi_transfer_tokens_id_seq";

create sequence "public"."strapi_webhooks_id_seq";

create sequence "public"."strapi_workflows_id_seq";

create sequence "public"."strapi_workflows_stage_required_to_publish_lnk_id_seq";

create sequence "public"."strapi_workflows_stages_id_seq";

create sequence "public"."strapi_workflows_stages_permissions_lnk_id_seq";

create sequence "public"."strapi_workflows_stages_workflow_lnk_id_seq";

create sequence "public"."tests_id_seq";

create sequence "public"."up_permissions_id_seq";

create sequence "public"."up_permissions_role_lnk_id_seq";

create sequence "public"."up_roles_id_seq";

create sequence "public"."up_users_id_seq";

create sequence "public"."up_users_role_lnk_id_seq";

create sequence "public"."upload_folders_id_seq";

create sequence "public"."upload_folders_parent_lnk_id_seq";


  create table "public"."admin_permissions" (
    "id" integer not null default nextval('admin_permissions_id_seq'::regclass),
    "document_id" character varying(255),
    "action" character varying(255),
    "action_parameters" jsonb,
    "subject" character varying(255),
    "properties" jsonb,
    "conditions" jsonb,
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."admin_permissions_role_lnk" (
    "id" integer not null default nextval('admin_permissions_role_lnk_id_seq'::regclass),
    "permission_id" integer,
    "role_id" integer,
    "permission_ord" double precision
      );



  create table "public"."admin_roles" (
    "id" integer not null default nextval('admin_roles_id_seq'::regclass),
    "document_id" character varying(255),
    "name" character varying(255),
    "code" character varying(255),
    "description" character varying(255),
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."admin_users" (
    "id" integer not null default nextval('admin_users_id_seq'::regclass),
    "document_id" character varying(255),
    "firstname" character varying(255),
    "lastname" character varying(255),
    "username" character varying(255),
    "email" character varying(255),
    "password" character varying(255),
    "reset_password_token" character varying(255),
    "registration_token" character varying(255),
    "is_active" boolean,
    "blocked" boolean,
    "prefered_language" character varying(255),
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."admin_users_roles_lnk" (
    "id" integer not null default nextval('admin_users_roles_lnk_id_seq'::regclass),
    "user_id" integer,
    "role_id" integer,
    "role_ord" double precision,
    "user_ord" double precision
      );



  create table "public"."files" (
    "id" integer not null default nextval('files_id_seq'::regclass),
    "document_id" character varying(255),
    "name" character varying(255),
    "alternative_text" character varying(255),
    "caption" character varying(255),
    "width" integer,
    "height" integer,
    "formats" jsonb,
    "hash" character varying(255),
    "ext" character varying(255),
    "mime" character varying(255),
    "size" numeric(10,2),
    "url" character varying(255),
    "preview_url" character varying(255),
    "provider" character varying(255),
    "provider_metadata" jsonb,
    "folder_path" character varying(255),
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."files_folder_lnk" (
    "id" integer not null default nextval('files_folder_lnk_id_seq'::regclass),
    "file_id" integer,
    "folder_id" integer,
    "file_ord" double precision
      );



  create table "public"."files_related_mph" (
    "id" integer not null default nextval('files_related_mph_id_seq'::regclass),
    "file_id" integer,
    "related_id" integer,
    "related_type" character varying(255),
    "field" character varying(255),
    "order" double precision
      );



  create table "public"."i18n_locale" (
    "id" integer not null default nextval('i18n_locale_id_seq'::regclass),
    "document_id" character varying(255),
    "name" character varying(255),
    "code" character varying(255),
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."strapi_api_token_permissions" (
    "id" integer not null default nextval('strapi_api_token_permissions_id_seq'::regclass),
    "document_id" character varying(255),
    "action" character varying(255),
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."strapi_api_token_permissions_token_lnk" (
    "id" integer not null default nextval('strapi_api_token_permissions_token_lnk_id_seq'::regclass),
    "api_token_permission_id" integer,
    "api_token_id" integer,
    "api_token_permission_ord" double precision
      );



  create table "public"."strapi_api_tokens" (
    "id" integer not null default nextval('strapi_api_tokens_id_seq'::regclass),
    "document_id" character varying(255),
    "name" character varying(255),
    "description" character varying(255),
    "type" character varying(255),
    "access_key" character varying(255),
    "encrypted_key" text,
    "last_used_at" timestamp(6) without time zone,
    "expires_at" timestamp(6) without time zone,
    "lifespan" bigint,
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."strapi_core_store_settings" (
    "id" integer not null default nextval('strapi_core_store_settings_id_seq'::regclass),
    "key" character varying(255),
    "value" text,
    "type" character varying(255),
    "environment" character varying(255),
    "tag" character varying(255)
      );



  create table "public"."strapi_database_schema" (
    "id" integer not null default nextval('strapi_database_schema_id_seq'::regclass),
    "schema" json,
    "time" timestamp without time zone,
    "hash" character varying(255)
      );



  create table "public"."strapi_history_versions" (
    "id" integer not null default nextval('strapi_history_versions_id_seq'::regclass),
    "content_type" character varying(255) not null,
    "related_document_id" character varying(255),
    "locale" character varying(255),
    "status" character varying(255),
    "data" jsonb,
    "schema" jsonb,
    "created_at" timestamp(6) without time zone,
    "created_by_id" integer
      );



  create table "public"."strapi_migrations" (
    "id" integer not null default nextval('strapi_migrations_id_seq'::regclass),
    "name" character varying(255),
    "time" timestamp without time zone
      );



  create table "public"."strapi_migrations_internal" (
    "id" integer not null default nextval('strapi_migrations_internal_id_seq'::regclass),
    "name" character varying(255),
    "time" timestamp without time zone
      );



  create table "public"."strapi_release_actions" (
    "id" integer not null default nextval('strapi_release_actions_id_seq'::regclass),
    "document_id" character varying(255),
    "type" character varying(255),
    "content_type" character varying(255),
    "entry_document_id" character varying(255),
    "locale" character varying(255),
    "is_entry_valid" boolean,
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer
      );



  create table "public"."strapi_release_actions_release_lnk" (
    "id" integer not null default nextval('strapi_release_actions_release_lnk_id_seq'::regclass),
    "release_action_id" integer,
    "release_id" integer,
    "release_action_ord" double precision
      );



  create table "public"."strapi_releases" (
    "id" integer not null default nextval('strapi_releases_id_seq'::regclass),
    "document_id" character varying(255),
    "name" character varying(255),
    "released_at" timestamp(6) without time zone,
    "scheduled_at" timestamp(6) without time zone,
    "timezone" character varying(255),
    "status" character varying(255),
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."strapi_transfer_token_permissions" (
    "id" integer not null default nextval('strapi_transfer_token_permissions_id_seq'::regclass),
    "document_id" character varying(255),
    "action" character varying(255),
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."strapi_transfer_token_permissions_token_lnk" (
    "id" integer not null default nextval('strapi_transfer_token_permissions_token_lnk_id_seq'::regclass),
    "transfer_token_permission_id" integer,
    "transfer_token_id" integer,
    "transfer_token_permission_ord" double precision
      );



  create table "public"."strapi_transfer_tokens" (
    "id" integer not null default nextval('strapi_transfer_tokens_id_seq'::regclass),
    "document_id" character varying(255),
    "name" character varying(255),
    "description" character varying(255),
    "access_key" character varying(255),
    "last_used_at" timestamp(6) without time zone,
    "expires_at" timestamp(6) without time zone,
    "lifespan" bigint,
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."strapi_webhooks" (
    "id" integer not null default nextval('strapi_webhooks_id_seq'::regclass),
    "name" character varying(255),
    "url" text,
    "headers" jsonb,
    "events" jsonb,
    "enabled" boolean
      );



  create table "public"."strapi_workflows" (
    "id" integer not null default nextval('strapi_workflows_id_seq'::regclass),
    "document_id" character varying(255),
    "name" character varying(255),
    "content_types" jsonb,
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."strapi_workflows_stage_required_to_publish_lnk" (
    "id" integer not null default nextval('strapi_workflows_stage_required_to_publish_lnk_id_seq'::regclass),
    "workflow_id" integer,
    "workflow_stage_id" integer
      );



  create table "public"."strapi_workflows_stages" (
    "id" integer not null default nextval('strapi_workflows_stages_id_seq'::regclass),
    "document_id" character varying(255),
    "name" character varying(255),
    "color" character varying(255),
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."strapi_workflows_stages_permissions_lnk" (
    "id" integer not null default nextval('strapi_workflows_stages_permissions_lnk_id_seq'::regclass),
    "workflow_stage_id" integer,
    "permission_id" integer,
    "permission_ord" double precision
      );



  create table "public"."strapi_workflows_stages_workflow_lnk" (
    "id" integer not null default nextval('strapi_workflows_stages_workflow_lnk_id_seq'::regclass),
    "workflow_stage_id" integer,
    "workflow_id" integer,
    "workflow_stage_ord" double precision
      );



  create table "public"."tests" (
    "id" integer not null default nextval('tests_id_seq'::regclass),
    "document_id" character varying(255),
    "test_name" character varying(255),
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."up_permissions" (
    "id" integer not null default nextval('up_permissions_id_seq'::regclass),
    "document_id" character varying(255),
    "action" character varying(255),
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."up_permissions_role_lnk" (
    "id" integer not null default nextval('up_permissions_role_lnk_id_seq'::regclass),
    "permission_id" integer,
    "role_id" integer,
    "permission_ord" double precision
      );



  create table "public"."up_roles" (
    "id" integer not null default nextval('up_roles_id_seq'::regclass),
    "document_id" character varying(255),
    "name" character varying(255),
    "description" character varying(255),
    "type" character varying(255),
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."up_users" (
    "id" integer not null default nextval('up_users_id_seq'::regclass),
    "document_id" character varying(255),
    "username" character varying(255),
    "email" character varying(255),
    "provider" character varying(255),
    "password" character varying(255),
    "reset_password_token" character varying(255),
    "confirmation_token" character varying(255),
    "confirmed" boolean,
    "blocked" boolean,
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."up_users_role_lnk" (
    "id" integer not null default nextval('up_users_role_lnk_id_seq'::regclass),
    "user_id" integer,
    "role_id" integer,
    "user_ord" double precision
      );



  create table "public"."upload_folders" (
    "id" integer not null default nextval('upload_folders_id_seq'::regclass),
    "document_id" character varying(255),
    "name" character varying(255),
    "path_id" integer,
    "path" character varying(255),
    "created_at" timestamp(6) without time zone,
    "updated_at" timestamp(6) without time zone,
    "published_at" timestamp(6) without time zone,
    "created_by_id" integer,
    "updated_by_id" integer,
    "locale" character varying(255)
      );



  create table "public"."upload_folders_parent_lnk" (
    "id" integer not null default nextval('upload_folders_parent_lnk_id_seq'::regclass),
    "folder_id" integer,
    "inv_folder_id" integer,
    "folder_ord" double precision
      );


alter sequence "public"."admin_permissions_id_seq" owned by "public"."admin_permissions"."id";

alter sequence "public"."admin_permissions_role_lnk_id_seq" owned by "public"."admin_permissions_role_lnk"."id";

alter sequence "public"."admin_roles_id_seq" owned by "public"."admin_roles"."id";

alter sequence "public"."admin_users_id_seq" owned by "public"."admin_users"."id";

alter sequence "public"."admin_users_roles_lnk_id_seq" owned by "public"."admin_users_roles_lnk"."id";

alter sequence "public"."files_folder_lnk_id_seq" owned by "public"."files_folder_lnk"."id";

alter sequence "public"."files_id_seq" owned by "public"."files"."id";

alter sequence "public"."files_related_mph_id_seq" owned by "public"."files_related_mph"."id";

alter sequence "public"."i18n_locale_id_seq" owned by "public"."i18n_locale"."id";

alter sequence "public"."strapi_api_token_permissions_id_seq" owned by "public"."strapi_api_token_permissions"."id";

alter sequence "public"."strapi_api_token_permissions_token_lnk_id_seq" owned by "public"."strapi_api_token_permissions_token_lnk"."id";

alter sequence "public"."strapi_api_tokens_id_seq" owned by "public"."strapi_api_tokens"."id";

alter sequence "public"."strapi_core_store_settings_id_seq" owned by "public"."strapi_core_store_settings"."id";

alter sequence "public"."strapi_database_schema_id_seq" owned by "public"."strapi_database_schema"."id";

alter sequence "public"."strapi_history_versions_id_seq" owned by "public"."strapi_history_versions"."id";

alter sequence "public"."strapi_migrations_id_seq" owned by "public"."strapi_migrations"."id";

alter sequence "public"."strapi_migrations_internal_id_seq" owned by "public"."strapi_migrations_internal"."id";

alter sequence "public"."strapi_release_actions_id_seq" owned by "public"."strapi_release_actions"."id";

alter sequence "public"."strapi_release_actions_release_lnk_id_seq" owned by "public"."strapi_release_actions_release_lnk"."id";

alter sequence "public"."strapi_releases_id_seq" owned by "public"."strapi_releases"."id";

alter sequence "public"."strapi_transfer_token_permissions_id_seq" owned by "public"."strapi_transfer_token_permissions"."id";

alter sequence "public"."strapi_transfer_token_permissions_token_lnk_id_seq" owned by "public"."strapi_transfer_token_permissions_token_lnk"."id";

alter sequence "public"."strapi_transfer_tokens_id_seq" owned by "public"."strapi_transfer_tokens"."id";

alter sequence "public"."strapi_webhooks_id_seq" owned by "public"."strapi_webhooks"."id";

alter sequence "public"."strapi_workflows_id_seq" owned by "public"."strapi_workflows"."id";

alter sequence "public"."strapi_workflows_stage_required_to_publish_lnk_id_seq" owned by "public"."strapi_workflows_stage_required_to_publish_lnk"."id";

alter sequence "public"."strapi_workflows_stages_id_seq" owned by "public"."strapi_workflows_stages"."id";

alter sequence "public"."strapi_workflows_stages_permissions_lnk_id_seq" owned by "public"."strapi_workflows_stages_permissions_lnk"."id";

alter sequence "public"."strapi_workflows_stages_workflow_lnk_id_seq" owned by "public"."strapi_workflows_stages_workflow_lnk"."id";

alter sequence "public"."tests_id_seq" owned by "public"."tests"."id";

alter sequence "public"."up_permissions_id_seq" owned by "public"."up_permissions"."id";

alter sequence "public"."up_permissions_role_lnk_id_seq" owned by "public"."up_permissions_role_lnk"."id";

alter sequence "public"."up_roles_id_seq" owned by "public"."up_roles"."id";

alter sequence "public"."up_users_id_seq" owned by "public"."up_users"."id";

alter sequence "public"."up_users_role_lnk_id_seq" owned by "public"."up_users_role_lnk"."id";

alter sequence "public"."upload_folders_id_seq" owned by "public"."upload_folders"."id";

alter sequence "public"."upload_folders_parent_lnk_id_seq" owned by "public"."upload_folders_parent_lnk"."id";

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);

CREATE INDEX admin_permissions_documents_idx ON public.admin_permissions USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX admin_permissions_pkey ON public.admin_permissions USING btree (id);

CREATE INDEX admin_permissions_role_lnk_fk ON public.admin_permissions_role_lnk USING btree (permission_id);

CREATE INDEX admin_permissions_role_lnk_ifk ON public.admin_permissions_role_lnk USING btree (role_id);

CREATE INDEX admin_permissions_role_lnk_oifk ON public.admin_permissions_role_lnk USING btree (permission_ord);

CREATE UNIQUE INDEX admin_permissions_role_lnk_pkey ON public.admin_permissions_role_lnk USING btree (id);

CREATE UNIQUE INDEX admin_permissions_role_lnk_uq ON public.admin_permissions_role_lnk USING btree (permission_id, role_id);

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);

CREATE INDEX admin_roles_documents_idx ON public.admin_roles USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX admin_roles_pkey ON public.admin_roles USING btree (id);

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);

CREATE INDEX admin_users_documents_idx ON public.admin_users USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX admin_users_pkey ON public.admin_users USING btree (id);

CREATE INDEX admin_users_roles_lnk_fk ON public.admin_users_roles_lnk USING btree (user_id);

CREATE INDEX admin_users_roles_lnk_ifk ON public.admin_users_roles_lnk USING btree (role_id);

CREATE INDEX admin_users_roles_lnk_ofk ON public.admin_users_roles_lnk USING btree (role_ord);

CREATE INDEX admin_users_roles_lnk_oifk ON public.admin_users_roles_lnk USING btree (user_ord);

CREATE UNIQUE INDEX admin_users_roles_lnk_pkey ON public.admin_users_roles_lnk USING btree (id);

CREATE UNIQUE INDEX admin_users_roles_lnk_uq ON public.admin_users_roles_lnk USING btree (user_id, role_id);

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);

CREATE INDEX files_documents_idx ON public.files USING btree (document_id, locale, published_at);

CREATE INDEX files_folder_lnk_fk ON public.files_folder_lnk USING btree (file_id);

CREATE INDEX files_folder_lnk_ifk ON public.files_folder_lnk USING btree (folder_id);

CREATE INDEX files_folder_lnk_oifk ON public.files_folder_lnk USING btree (file_ord);

CREATE UNIQUE INDEX files_folder_lnk_pkey ON public.files_folder_lnk USING btree (id);

CREATE UNIQUE INDEX files_folder_lnk_uq ON public.files_folder_lnk USING btree (file_id, folder_id);

CREATE UNIQUE INDEX files_pkey ON public.files USING btree (id);

CREATE INDEX files_related_mph_fk ON public.files_related_mph USING btree (file_id);

CREATE INDEX files_related_mph_idix ON public.files_related_mph USING btree (related_id);

CREATE INDEX files_related_mph_oidx ON public.files_related_mph USING btree ("order");

CREATE UNIQUE INDEX files_related_mph_pkey ON public.files_related_mph USING btree (id);

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);

CREATE INDEX i18n_locale_documents_idx ON public.i18n_locale USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX i18n_locale_pkey ON public.i18n_locale USING btree (id);

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);

CREATE INDEX strapi_api_token_permissions_documents_idx ON public.strapi_api_token_permissions USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX strapi_api_token_permissions_pkey ON public.strapi_api_token_permissions USING btree (id);

CREATE INDEX strapi_api_token_permissions_token_lnk_fk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_id);

CREATE INDEX strapi_api_token_permissions_token_lnk_ifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_id);

CREATE INDEX strapi_api_token_permissions_token_lnk_oifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_ord);

CREATE UNIQUE INDEX strapi_api_token_permissions_token_lnk_pkey ON public.strapi_api_token_permissions_token_lnk USING btree (id);

CREATE UNIQUE INDEX strapi_api_token_permissions_token_lnk_uq ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_id, api_token_id);

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);

CREATE INDEX strapi_api_tokens_documents_idx ON public.strapi_api_tokens USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX strapi_api_tokens_pkey ON public.strapi_api_tokens USING btree (id);

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);

CREATE UNIQUE INDEX strapi_core_store_settings_pkey ON public.strapi_core_store_settings USING btree (id);

CREATE UNIQUE INDEX strapi_database_schema_pkey ON public.strapi_database_schema USING btree (id);

CREATE INDEX strapi_history_versions_created_by_id_fk ON public.strapi_history_versions USING btree (created_by_id);

CREATE UNIQUE INDEX strapi_history_versions_pkey ON public.strapi_history_versions USING btree (id);

CREATE UNIQUE INDEX strapi_migrations_internal_pkey ON public.strapi_migrations_internal USING btree (id);

CREATE UNIQUE INDEX strapi_migrations_pkey ON public.strapi_migrations USING btree (id);

CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);

CREATE INDEX strapi_release_actions_documents_idx ON public.strapi_release_actions USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX strapi_release_actions_pkey ON public.strapi_release_actions USING btree (id);

CREATE INDEX strapi_release_actions_release_lnk_fk ON public.strapi_release_actions_release_lnk USING btree (release_action_id);

CREATE INDEX strapi_release_actions_release_lnk_ifk ON public.strapi_release_actions_release_lnk USING btree (release_id);

CREATE INDEX strapi_release_actions_release_lnk_oifk ON public.strapi_release_actions_release_lnk USING btree (release_action_ord);

CREATE UNIQUE INDEX strapi_release_actions_release_lnk_pkey ON public.strapi_release_actions_release_lnk USING btree (id);

CREATE UNIQUE INDEX strapi_release_actions_release_lnk_uq ON public.strapi_release_actions_release_lnk USING btree (release_action_id, release_id);

CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);

CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);

CREATE INDEX strapi_releases_documents_idx ON public.strapi_releases USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX strapi_releases_pkey ON public.strapi_releases USING btree (id);

CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);

CREATE INDEX strapi_transfer_token_permissions_documents_idx ON public.strapi_transfer_token_permissions USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX strapi_transfer_token_permissions_pkey ON public.strapi_transfer_token_permissions USING btree (id);

CREATE INDEX strapi_transfer_token_permissions_token_lnk_fk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_id);

CREATE INDEX strapi_transfer_token_permissions_token_lnk_ifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_id);

CREATE INDEX strapi_transfer_token_permissions_token_lnk_oifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_ord);

CREATE UNIQUE INDEX strapi_transfer_token_permissions_token_lnk_pkey ON public.strapi_transfer_token_permissions_token_lnk USING btree (id);

CREATE UNIQUE INDEX strapi_transfer_token_permissions_token_lnk_uq ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_id, transfer_token_id);

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);

CREATE INDEX strapi_transfer_tokens_documents_idx ON public.strapi_transfer_tokens USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX strapi_transfer_tokens_pkey ON public.strapi_transfer_tokens USING btree (id);

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);

CREATE UNIQUE INDEX strapi_webhooks_pkey ON public.strapi_webhooks USING btree (id);

CREATE INDEX strapi_workflows_created_by_id_fk ON public.strapi_workflows USING btree (created_by_id);

CREATE INDEX strapi_workflows_documents_idx ON public.strapi_workflows USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX strapi_workflows_pkey ON public.strapi_workflows USING btree (id);

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_fk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_id);

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_ifk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_stage_id);

CREATE UNIQUE INDEX strapi_workflows_stage_required_to_publish_lnk_pkey ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (id);

CREATE UNIQUE INDEX strapi_workflows_stage_required_to_publish_lnk_uq ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_id, workflow_stage_id);

CREATE INDEX strapi_workflows_stages_created_by_id_fk ON public.strapi_workflows_stages USING btree (created_by_id);

CREATE INDEX strapi_workflows_stages_documents_idx ON public.strapi_workflows_stages USING btree (document_id, locale, published_at);

CREATE INDEX strapi_workflows_stages_permissions_lnk_fk ON public.strapi_workflows_stages_permissions_lnk USING btree (workflow_stage_id);

CREATE INDEX strapi_workflows_stages_permissions_lnk_ifk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_id);

CREATE INDEX strapi_workflows_stages_permissions_lnk_ofk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_ord);

CREATE UNIQUE INDEX strapi_workflows_stages_permissions_lnk_pkey ON public.strapi_workflows_stages_permissions_lnk USING btree (id);

CREATE UNIQUE INDEX strapi_workflows_stages_permissions_lnk_uq ON public.strapi_workflows_stages_permissions_lnk USING btree (workflow_stage_id, permission_id);

CREATE UNIQUE INDEX strapi_workflows_stages_pkey ON public.strapi_workflows_stages USING btree (id);

CREATE INDEX strapi_workflows_stages_updated_by_id_fk ON public.strapi_workflows_stages USING btree (updated_by_id);

CREATE INDEX strapi_workflows_stages_workflow_lnk_fk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_id);

CREATE INDEX strapi_workflows_stages_workflow_lnk_ifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_id);

CREATE INDEX strapi_workflows_stages_workflow_lnk_oifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_ord);

CREATE UNIQUE INDEX strapi_workflows_stages_workflow_lnk_pkey ON public.strapi_workflows_stages_workflow_lnk USING btree (id);

CREATE UNIQUE INDEX strapi_workflows_stages_workflow_lnk_uq ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_id, workflow_id);

CREATE INDEX strapi_workflows_updated_by_id_fk ON public.strapi_workflows USING btree (updated_by_id);

CREATE INDEX tests_created_by_id_fk ON public.tests USING btree (created_by_id);

CREATE INDEX tests_documents_idx ON public.tests USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX tests_pkey ON public.tests USING btree (id);

CREATE INDEX tests_updated_by_id_fk ON public.tests USING btree (updated_by_id);

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);

CREATE INDEX up_permissions_documents_idx ON public.up_permissions USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX up_permissions_pkey ON public.up_permissions USING btree (id);

CREATE INDEX up_permissions_role_lnk_fk ON public.up_permissions_role_lnk USING btree (permission_id);

CREATE INDEX up_permissions_role_lnk_ifk ON public.up_permissions_role_lnk USING btree (role_id);

CREATE INDEX up_permissions_role_lnk_oifk ON public.up_permissions_role_lnk USING btree (permission_ord);

CREATE UNIQUE INDEX up_permissions_role_lnk_pkey ON public.up_permissions_role_lnk USING btree (id);

CREATE UNIQUE INDEX up_permissions_role_lnk_uq ON public.up_permissions_role_lnk USING btree (permission_id, role_id);

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);

CREATE INDEX up_roles_documents_idx ON public.up_roles USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX up_roles_pkey ON public.up_roles USING btree (id);

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);

CREATE INDEX up_users_documents_idx ON public.up_users USING btree (document_id, locale, published_at);

CREATE UNIQUE INDEX up_users_pkey ON public.up_users USING btree (id);

CREATE INDEX up_users_role_lnk_fk ON public.up_users_role_lnk USING btree (user_id);

CREATE INDEX up_users_role_lnk_ifk ON public.up_users_role_lnk USING btree (role_id);

CREATE INDEX up_users_role_lnk_oifk ON public.up_users_role_lnk USING btree (user_ord);

CREATE UNIQUE INDEX up_users_role_lnk_pkey ON public.up_users_role_lnk USING btree (id);

CREATE UNIQUE INDEX up_users_role_lnk_uq ON public.up_users_role_lnk USING btree (user_id, role_id);

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);

CREATE INDEX upload_files_name_index ON public.files USING btree (name);

CREATE INDEX upload_files_size_index ON public.files USING btree (size);

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);

CREATE INDEX upload_folders_documents_idx ON public.upload_folders USING btree (document_id, locale, published_at);

CREATE INDEX upload_folders_parent_lnk_fk ON public.upload_folders_parent_lnk USING btree (folder_id);

CREATE INDEX upload_folders_parent_lnk_ifk ON public.upload_folders_parent_lnk USING btree (inv_folder_id);

CREATE INDEX upload_folders_parent_lnk_oifk ON public.upload_folders_parent_lnk USING btree (folder_ord);

CREATE UNIQUE INDEX upload_folders_parent_lnk_pkey ON public.upload_folders_parent_lnk USING btree (id);

CREATE UNIQUE INDEX upload_folders_parent_lnk_uq ON public.upload_folders_parent_lnk USING btree (folder_id, inv_folder_id);

CREATE UNIQUE INDEX upload_folders_path_id_index ON public.upload_folders USING btree (path_id);

CREATE UNIQUE INDEX upload_folders_path_index ON public.upload_folders USING btree (path);

CREATE UNIQUE INDEX upload_folders_pkey ON public.upload_folders USING btree (id);

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


grant delete on table "public"."admin_permissions" to "anon";

grant insert on table "public"."admin_permissions" to "anon";

grant references on table "public"."admin_permissions" to "anon";

grant select on table "public"."admin_permissions" to "anon";

grant trigger on table "public"."admin_permissions" to "anon";

grant truncate on table "public"."admin_permissions" to "anon";

grant update on table "public"."admin_permissions" to "anon";

grant delete on table "public"."admin_permissions" to "authenticated";

grant insert on table "public"."admin_permissions" to "authenticated";

grant references on table "public"."admin_permissions" to "authenticated";

grant select on table "public"."admin_permissions" to "authenticated";

grant trigger on table "public"."admin_permissions" to "authenticated";

grant truncate on table "public"."admin_permissions" to "authenticated";

grant update on table "public"."admin_permissions" to "authenticated";

grant delete on table "public"."admin_permissions" to "service_role";

grant insert on table "public"."admin_permissions" to "service_role";

grant references on table "public"."admin_permissions" to "service_role";

grant select on table "public"."admin_permissions" to "service_role";

grant trigger on table "public"."admin_permissions" to "service_role";

grant truncate on table "public"."admin_permissions" to "service_role";

grant update on table "public"."admin_permissions" to "service_role";

grant delete on table "public"."admin_permissions_role_lnk" to "anon";

grant insert on table "public"."admin_permissions_role_lnk" to "anon";

grant references on table "public"."admin_permissions_role_lnk" to "anon";

grant select on table "public"."admin_permissions_role_lnk" to "anon";

grant trigger on table "public"."admin_permissions_role_lnk" to "anon";

grant truncate on table "public"."admin_permissions_role_lnk" to "anon";

grant update on table "public"."admin_permissions_role_lnk" to "anon";

grant delete on table "public"."admin_permissions_role_lnk" to "authenticated";

grant insert on table "public"."admin_permissions_role_lnk" to "authenticated";

grant references on table "public"."admin_permissions_role_lnk" to "authenticated";

grant select on table "public"."admin_permissions_role_lnk" to "authenticated";

grant trigger on table "public"."admin_permissions_role_lnk" to "authenticated";

grant truncate on table "public"."admin_permissions_role_lnk" to "authenticated";

grant update on table "public"."admin_permissions_role_lnk" to "authenticated";

grant delete on table "public"."admin_permissions_role_lnk" to "service_role";

grant insert on table "public"."admin_permissions_role_lnk" to "service_role";

grant references on table "public"."admin_permissions_role_lnk" to "service_role";

grant select on table "public"."admin_permissions_role_lnk" to "service_role";

grant trigger on table "public"."admin_permissions_role_lnk" to "service_role";

grant truncate on table "public"."admin_permissions_role_lnk" to "service_role";

grant update on table "public"."admin_permissions_role_lnk" to "service_role";

grant delete on table "public"."admin_roles" to "anon";

grant insert on table "public"."admin_roles" to "anon";

grant references on table "public"."admin_roles" to "anon";

grant select on table "public"."admin_roles" to "anon";

grant trigger on table "public"."admin_roles" to "anon";

grant truncate on table "public"."admin_roles" to "anon";

grant update on table "public"."admin_roles" to "anon";

grant delete on table "public"."admin_roles" to "authenticated";

grant insert on table "public"."admin_roles" to "authenticated";

grant references on table "public"."admin_roles" to "authenticated";

grant select on table "public"."admin_roles" to "authenticated";

grant trigger on table "public"."admin_roles" to "authenticated";

grant truncate on table "public"."admin_roles" to "authenticated";

grant update on table "public"."admin_roles" to "authenticated";

grant delete on table "public"."admin_roles" to "service_role";

grant insert on table "public"."admin_roles" to "service_role";

grant references on table "public"."admin_roles" to "service_role";

grant select on table "public"."admin_roles" to "service_role";

grant trigger on table "public"."admin_roles" to "service_role";

grant truncate on table "public"."admin_roles" to "service_role";

grant update on table "public"."admin_roles" to "service_role";

grant delete on table "public"."admin_users" to "anon";

grant insert on table "public"."admin_users" to "anon";

grant references on table "public"."admin_users" to "anon";

grant select on table "public"."admin_users" to "anon";

grant trigger on table "public"."admin_users" to "anon";

grant truncate on table "public"."admin_users" to "anon";

grant update on table "public"."admin_users" to "anon";

grant delete on table "public"."admin_users" to "authenticated";

grant insert on table "public"."admin_users" to "authenticated";

grant references on table "public"."admin_users" to "authenticated";

grant select on table "public"."admin_users" to "authenticated";

grant trigger on table "public"."admin_users" to "authenticated";

grant truncate on table "public"."admin_users" to "authenticated";

grant update on table "public"."admin_users" to "authenticated";

grant delete on table "public"."admin_users" to "service_role";

grant insert on table "public"."admin_users" to "service_role";

grant references on table "public"."admin_users" to "service_role";

grant select on table "public"."admin_users" to "service_role";

grant trigger on table "public"."admin_users" to "service_role";

grant truncate on table "public"."admin_users" to "service_role";

grant update on table "public"."admin_users" to "service_role";

grant delete on table "public"."admin_users_roles_lnk" to "anon";

grant insert on table "public"."admin_users_roles_lnk" to "anon";

grant references on table "public"."admin_users_roles_lnk" to "anon";

grant select on table "public"."admin_users_roles_lnk" to "anon";

grant trigger on table "public"."admin_users_roles_lnk" to "anon";

grant truncate on table "public"."admin_users_roles_lnk" to "anon";

grant update on table "public"."admin_users_roles_lnk" to "anon";

grant delete on table "public"."admin_users_roles_lnk" to "authenticated";

grant insert on table "public"."admin_users_roles_lnk" to "authenticated";

grant references on table "public"."admin_users_roles_lnk" to "authenticated";

grant select on table "public"."admin_users_roles_lnk" to "authenticated";

grant trigger on table "public"."admin_users_roles_lnk" to "authenticated";

grant truncate on table "public"."admin_users_roles_lnk" to "authenticated";

grant update on table "public"."admin_users_roles_lnk" to "authenticated";

grant delete on table "public"."admin_users_roles_lnk" to "service_role";

grant insert on table "public"."admin_users_roles_lnk" to "service_role";

grant references on table "public"."admin_users_roles_lnk" to "service_role";

grant select on table "public"."admin_users_roles_lnk" to "service_role";

grant trigger on table "public"."admin_users_roles_lnk" to "service_role";

grant truncate on table "public"."admin_users_roles_lnk" to "service_role";

grant update on table "public"."admin_users_roles_lnk" to "service_role";

grant delete on table "public"."files" to "anon";

grant insert on table "public"."files" to "anon";

grant references on table "public"."files" to "anon";

grant select on table "public"."files" to "anon";

grant trigger on table "public"."files" to "anon";

grant truncate on table "public"."files" to "anon";

grant update on table "public"."files" to "anon";

grant delete on table "public"."files" to "authenticated";

grant insert on table "public"."files" to "authenticated";

grant references on table "public"."files" to "authenticated";

grant select on table "public"."files" to "authenticated";

grant trigger on table "public"."files" to "authenticated";

grant truncate on table "public"."files" to "authenticated";

grant update on table "public"."files" to "authenticated";

grant delete on table "public"."files" to "service_role";

grant insert on table "public"."files" to "service_role";

grant references on table "public"."files" to "service_role";

grant select on table "public"."files" to "service_role";

grant trigger on table "public"."files" to "service_role";

grant truncate on table "public"."files" to "service_role";

grant update on table "public"."files" to "service_role";

grant delete on table "public"."files_folder_lnk" to "anon";

grant insert on table "public"."files_folder_lnk" to "anon";

grant references on table "public"."files_folder_lnk" to "anon";

grant select on table "public"."files_folder_lnk" to "anon";

grant trigger on table "public"."files_folder_lnk" to "anon";

grant truncate on table "public"."files_folder_lnk" to "anon";

grant update on table "public"."files_folder_lnk" to "anon";

grant delete on table "public"."files_folder_lnk" to "authenticated";

grant insert on table "public"."files_folder_lnk" to "authenticated";

grant references on table "public"."files_folder_lnk" to "authenticated";

grant select on table "public"."files_folder_lnk" to "authenticated";

grant trigger on table "public"."files_folder_lnk" to "authenticated";

grant truncate on table "public"."files_folder_lnk" to "authenticated";

grant update on table "public"."files_folder_lnk" to "authenticated";

grant delete on table "public"."files_folder_lnk" to "service_role";

grant insert on table "public"."files_folder_lnk" to "service_role";

grant references on table "public"."files_folder_lnk" to "service_role";

grant select on table "public"."files_folder_lnk" to "service_role";

grant trigger on table "public"."files_folder_lnk" to "service_role";

grant truncate on table "public"."files_folder_lnk" to "service_role";

grant update on table "public"."files_folder_lnk" to "service_role";

grant delete on table "public"."files_related_mph" to "anon";

grant insert on table "public"."files_related_mph" to "anon";

grant references on table "public"."files_related_mph" to "anon";

grant select on table "public"."files_related_mph" to "anon";

grant trigger on table "public"."files_related_mph" to "anon";

grant truncate on table "public"."files_related_mph" to "anon";

grant update on table "public"."files_related_mph" to "anon";

grant delete on table "public"."files_related_mph" to "authenticated";

grant insert on table "public"."files_related_mph" to "authenticated";

grant references on table "public"."files_related_mph" to "authenticated";

grant select on table "public"."files_related_mph" to "authenticated";

grant trigger on table "public"."files_related_mph" to "authenticated";

grant truncate on table "public"."files_related_mph" to "authenticated";

grant update on table "public"."files_related_mph" to "authenticated";

grant delete on table "public"."files_related_mph" to "service_role";

grant insert on table "public"."files_related_mph" to "service_role";

grant references on table "public"."files_related_mph" to "service_role";

grant select on table "public"."files_related_mph" to "service_role";

grant trigger on table "public"."files_related_mph" to "service_role";

grant truncate on table "public"."files_related_mph" to "service_role";

grant update on table "public"."files_related_mph" to "service_role";

grant delete on table "public"."i18n_locale" to "anon";

grant insert on table "public"."i18n_locale" to "anon";

grant references on table "public"."i18n_locale" to "anon";

grant select on table "public"."i18n_locale" to "anon";

grant trigger on table "public"."i18n_locale" to "anon";

grant truncate on table "public"."i18n_locale" to "anon";

grant update on table "public"."i18n_locale" to "anon";

grant delete on table "public"."i18n_locale" to "authenticated";

grant insert on table "public"."i18n_locale" to "authenticated";

grant references on table "public"."i18n_locale" to "authenticated";

grant select on table "public"."i18n_locale" to "authenticated";

grant trigger on table "public"."i18n_locale" to "authenticated";

grant truncate on table "public"."i18n_locale" to "authenticated";

grant update on table "public"."i18n_locale" to "authenticated";

grant delete on table "public"."i18n_locale" to "service_role";

grant insert on table "public"."i18n_locale" to "service_role";

grant references on table "public"."i18n_locale" to "service_role";

grant select on table "public"."i18n_locale" to "service_role";

grant trigger on table "public"."i18n_locale" to "service_role";

grant truncate on table "public"."i18n_locale" to "service_role";

grant update on table "public"."i18n_locale" to "service_role";

grant delete on table "public"."strapi_api_token_permissions" to "anon";

grant insert on table "public"."strapi_api_token_permissions" to "anon";

grant references on table "public"."strapi_api_token_permissions" to "anon";

grant select on table "public"."strapi_api_token_permissions" to "anon";

grant trigger on table "public"."strapi_api_token_permissions" to "anon";

grant truncate on table "public"."strapi_api_token_permissions" to "anon";

grant update on table "public"."strapi_api_token_permissions" to "anon";

grant delete on table "public"."strapi_api_token_permissions" to "authenticated";

grant insert on table "public"."strapi_api_token_permissions" to "authenticated";

grant references on table "public"."strapi_api_token_permissions" to "authenticated";

grant select on table "public"."strapi_api_token_permissions" to "authenticated";

grant trigger on table "public"."strapi_api_token_permissions" to "authenticated";

grant truncate on table "public"."strapi_api_token_permissions" to "authenticated";

grant update on table "public"."strapi_api_token_permissions" to "authenticated";

grant delete on table "public"."strapi_api_token_permissions" to "service_role";

grant insert on table "public"."strapi_api_token_permissions" to "service_role";

grant references on table "public"."strapi_api_token_permissions" to "service_role";

grant select on table "public"."strapi_api_token_permissions" to "service_role";

grant trigger on table "public"."strapi_api_token_permissions" to "service_role";

grant truncate on table "public"."strapi_api_token_permissions" to "service_role";

grant update on table "public"."strapi_api_token_permissions" to "service_role";

grant delete on table "public"."strapi_api_token_permissions_token_lnk" to "anon";

grant insert on table "public"."strapi_api_token_permissions_token_lnk" to "anon";

grant references on table "public"."strapi_api_token_permissions_token_lnk" to "anon";

grant select on table "public"."strapi_api_token_permissions_token_lnk" to "anon";

grant trigger on table "public"."strapi_api_token_permissions_token_lnk" to "anon";

grant truncate on table "public"."strapi_api_token_permissions_token_lnk" to "anon";

grant update on table "public"."strapi_api_token_permissions_token_lnk" to "anon";

grant delete on table "public"."strapi_api_token_permissions_token_lnk" to "authenticated";

grant insert on table "public"."strapi_api_token_permissions_token_lnk" to "authenticated";

grant references on table "public"."strapi_api_token_permissions_token_lnk" to "authenticated";

grant select on table "public"."strapi_api_token_permissions_token_lnk" to "authenticated";

grant trigger on table "public"."strapi_api_token_permissions_token_lnk" to "authenticated";

grant truncate on table "public"."strapi_api_token_permissions_token_lnk" to "authenticated";

grant update on table "public"."strapi_api_token_permissions_token_lnk" to "authenticated";

grant delete on table "public"."strapi_api_token_permissions_token_lnk" to "service_role";

grant insert on table "public"."strapi_api_token_permissions_token_lnk" to "service_role";

grant references on table "public"."strapi_api_token_permissions_token_lnk" to "service_role";

grant select on table "public"."strapi_api_token_permissions_token_lnk" to "service_role";

grant trigger on table "public"."strapi_api_token_permissions_token_lnk" to "service_role";

grant truncate on table "public"."strapi_api_token_permissions_token_lnk" to "service_role";

grant update on table "public"."strapi_api_token_permissions_token_lnk" to "service_role";

grant delete on table "public"."strapi_api_tokens" to "anon";

grant insert on table "public"."strapi_api_tokens" to "anon";

grant references on table "public"."strapi_api_tokens" to "anon";

grant select on table "public"."strapi_api_tokens" to "anon";

grant trigger on table "public"."strapi_api_tokens" to "anon";

grant truncate on table "public"."strapi_api_tokens" to "anon";

grant update on table "public"."strapi_api_tokens" to "anon";

grant delete on table "public"."strapi_api_tokens" to "authenticated";

grant insert on table "public"."strapi_api_tokens" to "authenticated";

grant references on table "public"."strapi_api_tokens" to "authenticated";

grant select on table "public"."strapi_api_tokens" to "authenticated";

grant trigger on table "public"."strapi_api_tokens" to "authenticated";

grant truncate on table "public"."strapi_api_tokens" to "authenticated";

grant update on table "public"."strapi_api_tokens" to "authenticated";

grant delete on table "public"."strapi_api_tokens" to "service_role";

grant insert on table "public"."strapi_api_tokens" to "service_role";

grant references on table "public"."strapi_api_tokens" to "service_role";

grant select on table "public"."strapi_api_tokens" to "service_role";

grant trigger on table "public"."strapi_api_tokens" to "service_role";

grant truncate on table "public"."strapi_api_tokens" to "service_role";

grant update on table "public"."strapi_api_tokens" to "service_role";

grant delete on table "public"."strapi_core_store_settings" to "anon";

grant insert on table "public"."strapi_core_store_settings" to "anon";

grant references on table "public"."strapi_core_store_settings" to "anon";

grant select on table "public"."strapi_core_store_settings" to "anon";

grant trigger on table "public"."strapi_core_store_settings" to "anon";

grant truncate on table "public"."strapi_core_store_settings" to "anon";

grant update on table "public"."strapi_core_store_settings" to "anon";

grant delete on table "public"."strapi_core_store_settings" to "authenticated";

grant insert on table "public"."strapi_core_store_settings" to "authenticated";

grant references on table "public"."strapi_core_store_settings" to "authenticated";

grant select on table "public"."strapi_core_store_settings" to "authenticated";

grant trigger on table "public"."strapi_core_store_settings" to "authenticated";

grant truncate on table "public"."strapi_core_store_settings" to "authenticated";

grant update on table "public"."strapi_core_store_settings" to "authenticated";

grant delete on table "public"."strapi_core_store_settings" to "service_role";

grant insert on table "public"."strapi_core_store_settings" to "service_role";

grant references on table "public"."strapi_core_store_settings" to "service_role";

grant select on table "public"."strapi_core_store_settings" to "service_role";

grant trigger on table "public"."strapi_core_store_settings" to "service_role";

grant truncate on table "public"."strapi_core_store_settings" to "service_role";

grant update on table "public"."strapi_core_store_settings" to "service_role";

grant delete on table "public"."strapi_database_schema" to "anon";

grant insert on table "public"."strapi_database_schema" to "anon";

grant references on table "public"."strapi_database_schema" to "anon";

grant select on table "public"."strapi_database_schema" to "anon";

grant trigger on table "public"."strapi_database_schema" to "anon";

grant truncate on table "public"."strapi_database_schema" to "anon";

grant update on table "public"."strapi_database_schema" to "anon";

grant delete on table "public"."strapi_database_schema" to "authenticated";

grant insert on table "public"."strapi_database_schema" to "authenticated";

grant references on table "public"."strapi_database_schema" to "authenticated";

grant select on table "public"."strapi_database_schema" to "authenticated";

grant trigger on table "public"."strapi_database_schema" to "authenticated";

grant truncate on table "public"."strapi_database_schema" to "authenticated";

grant update on table "public"."strapi_database_schema" to "authenticated";

grant delete on table "public"."strapi_database_schema" to "service_role";

grant insert on table "public"."strapi_database_schema" to "service_role";

grant references on table "public"."strapi_database_schema" to "service_role";

grant select on table "public"."strapi_database_schema" to "service_role";

grant trigger on table "public"."strapi_database_schema" to "service_role";

grant truncate on table "public"."strapi_database_schema" to "service_role";

grant update on table "public"."strapi_database_schema" to "service_role";

grant delete on table "public"."strapi_history_versions" to "anon";

grant insert on table "public"."strapi_history_versions" to "anon";

grant references on table "public"."strapi_history_versions" to "anon";

grant select on table "public"."strapi_history_versions" to "anon";

grant trigger on table "public"."strapi_history_versions" to "anon";

grant truncate on table "public"."strapi_history_versions" to "anon";

grant update on table "public"."strapi_history_versions" to "anon";

grant delete on table "public"."strapi_history_versions" to "authenticated";

grant insert on table "public"."strapi_history_versions" to "authenticated";

grant references on table "public"."strapi_history_versions" to "authenticated";

grant select on table "public"."strapi_history_versions" to "authenticated";

grant trigger on table "public"."strapi_history_versions" to "authenticated";

grant truncate on table "public"."strapi_history_versions" to "authenticated";

grant update on table "public"."strapi_history_versions" to "authenticated";

grant delete on table "public"."strapi_history_versions" to "service_role";

grant insert on table "public"."strapi_history_versions" to "service_role";

grant references on table "public"."strapi_history_versions" to "service_role";

grant select on table "public"."strapi_history_versions" to "service_role";

grant trigger on table "public"."strapi_history_versions" to "service_role";

grant truncate on table "public"."strapi_history_versions" to "service_role";

grant update on table "public"."strapi_history_versions" to "service_role";

grant delete on table "public"."strapi_migrations" to "anon";

grant insert on table "public"."strapi_migrations" to "anon";

grant references on table "public"."strapi_migrations" to "anon";

grant select on table "public"."strapi_migrations" to "anon";

grant trigger on table "public"."strapi_migrations" to "anon";

grant truncate on table "public"."strapi_migrations" to "anon";

grant update on table "public"."strapi_migrations" to "anon";

grant delete on table "public"."strapi_migrations" to "authenticated";

grant insert on table "public"."strapi_migrations" to "authenticated";

grant references on table "public"."strapi_migrations" to "authenticated";

grant select on table "public"."strapi_migrations" to "authenticated";

grant trigger on table "public"."strapi_migrations" to "authenticated";

grant truncate on table "public"."strapi_migrations" to "authenticated";

grant update on table "public"."strapi_migrations" to "authenticated";

grant delete on table "public"."strapi_migrations" to "service_role";

grant insert on table "public"."strapi_migrations" to "service_role";

grant references on table "public"."strapi_migrations" to "service_role";

grant select on table "public"."strapi_migrations" to "service_role";

grant trigger on table "public"."strapi_migrations" to "service_role";

grant truncate on table "public"."strapi_migrations" to "service_role";

grant update on table "public"."strapi_migrations" to "service_role";

grant delete on table "public"."strapi_migrations_internal" to "anon";

grant insert on table "public"."strapi_migrations_internal" to "anon";

grant references on table "public"."strapi_migrations_internal" to "anon";

grant select on table "public"."strapi_migrations_internal" to "anon";

grant trigger on table "public"."strapi_migrations_internal" to "anon";

grant truncate on table "public"."strapi_migrations_internal" to "anon";

grant update on table "public"."strapi_migrations_internal" to "anon";

grant delete on table "public"."strapi_migrations_internal" to "authenticated";

grant insert on table "public"."strapi_migrations_internal" to "authenticated";

grant references on table "public"."strapi_migrations_internal" to "authenticated";

grant select on table "public"."strapi_migrations_internal" to "authenticated";

grant trigger on table "public"."strapi_migrations_internal" to "authenticated";

grant truncate on table "public"."strapi_migrations_internal" to "authenticated";

grant update on table "public"."strapi_migrations_internal" to "authenticated";

grant delete on table "public"."strapi_migrations_internal" to "service_role";

grant insert on table "public"."strapi_migrations_internal" to "service_role";

grant references on table "public"."strapi_migrations_internal" to "service_role";

grant select on table "public"."strapi_migrations_internal" to "service_role";

grant trigger on table "public"."strapi_migrations_internal" to "service_role";

grant truncate on table "public"."strapi_migrations_internal" to "service_role";

grant update on table "public"."strapi_migrations_internal" to "service_role";

grant delete on table "public"."strapi_release_actions" to "anon";

grant insert on table "public"."strapi_release_actions" to "anon";

grant references on table "public"."strapi_release_actions" to "anon";

grant select on table "public"."strapi_release_actions" to "anon";

grant trigger on table "public"."strapi_release_actions" to "anon";

grant truncate on table "public"."strapi_release_actions" to "anon";

grant update on table "public"."strapi_release_actions" to "anon";

grant delete on table "public"."strapi_release_actions" to "authenticated";

grant insert on table "public"."strapi_release_actions" to "authenticated";

grant references on table "public"."strapi_release_actions" to "authenticated";

grant select on table "public"."strapi_release_actions" to "authenticated";

grant trigger on table "public"."strapi_release_actions" to "authenticated";

grant truncate on table "public"."strapi_release_actions" to "authenticated";

grant update on table "public"."strapi_release_actions" to "authenticated";

grant delete on table "public"."strapi_release_actions" to "service_role";

grant insert on table "public"."strapi_release_actions" to "service_role";

grant references on table "public"."strapi_release_actions" to "service_role";

grant select on table "public"."strapi_release_actions" to "service_role";

grant trigger on table "public"."strapi_release_actions" to "service_role";

grant truncate on table "public"."strapi_release_actions" to "service_role";

grant update on table "public"."strapi_release_actions" to "service_role";

grant delete on table "public"."strapi_release_actions_release_lnk" to "anon";

grant insert on table "public"."strapi_release_actions_release_lnk" to "anon";

grant references on table "public"."strapi_release_actions_release_lnk" to "anon";

grant select on table "public"."strapi_release_actions_release_lnk" to "anon";

grant trigger on table "public"."strapi_release_actions_release_lnk" to "anon";

grant truncate on table "public"."strapi_release_actions_release_lnk" to "anon";

grant update on table "public"."strapi_release_actions_release_lnk" to "anon";

grant delete on table "public"."strapi_release_actions_release_lnk" to "authenticated";

grant insert on table "public"."strapi_release_actions_release_lnk" to "authenticated";

grant references on table "public"."strapi_release_actions_release_lnk" to "authenticated";

grant select on table "public"."strapi_release_actions_release_lnk" to "authenticated";

grant trigger on table "public"."strapi_release_actions_release_lnk" to "authenticated";

grant truncate on table "public"."strapi_release_actions_release_lnk" to "authenticated";

grant update on table "public"."strapi_release_actions_release_lnk" to "authenticated";

grant delete on table "public"."strapi_release_actions_release_lnk" to "service_role";

grant insert on table "public"."strapi_release_actions_release_lnk" to "service_role";

grant references on table "public"."strapi_release_actions_release_lnk" to "service_role";

grant select on table "public"."strapi_release_actions_release_lnk" to "service_role";

grant trigger on table "public"."strapi_release_actions_release_lnk" to "service_role";

grant truncate on table "public"."strapi_release_actions_release_lnk" to "service_role";

grant update on table "public"."strapi_release_actions_release_lnk" to "service_role";

grant delete on table "public"."strapi_releases" to "anon";

grant insert on table "public"."strapi_releases" to "anon";

grant references on table "public"."strapi_releases" to "anon";

grant select on table "public"."strapi_releases" to "anon";

grant trigger on table "public"."strapi_releases" to "anon";

grant truncate on table "public"."strapi_releases" to "anon";

grant update on table "public"."strapi_releases" to "anon";

grant delete on table "public"."strapi_releases" to "authenticated";

grant insert on table "public"."strapi_releases" to "authenticated";

grant references on table "public"."strapi_releases" to "authenticated";

grant select on table "public"."strapi_releases" to "authenticated";

grant trigger on table "public"."strapi_releases" to "authenticated";

grant truncate on table "public"."strapi_releases" to "authenticated";

grant update on table "public"."strapi_releases" to "authenticated";

grant delete on table "public"."strapi_releases" to "service_role";

grant insert on table "public"."strapi_releases" to "service_role";

grant references on table "public"."strapi_releases" to "service_role";

grant select on table "public"."strapi_releases" to "service_role";

grant trigger on table "public"."strapi_releases" to "service_role";

grant truncate on table "public"."strapi_releases" to "service_role";

grant update on table "public"."strapi_releases" to "service_role";

grant delete on table "public"."strapi_transfer_token_permissions" to "anon";

grant insert on table "public"."strapi_transfer_token_permissions" to "anon";

grant references on table "public"."strapi_transfer_token_permissions" to "anon";

grant select on table "public"."strapi_transfer_token_permissions" to "anon";

grant trigger on table "public"."strapi_transfer_token_permissions" to "anon";

grant truncate on table "public"."strapi_transfer_token_permissions" to "anon";

grant update on table "public"."strapi_transfer_token_permissions" to "anon";

grant delete on table "public"."strapi_transfer_token_permissions" to "authenticated";

grant insert on table "public"."strapi_transfer_token_permissions" to "authenticated";

grant references on table "public"."strapi_transfer_token_permissions" to "authenticated";

grant select on table "public"."strapi_transfer_token_permissions" to "authenticated";

grant trigger on table "public"."strapi_transfer_token_permissions" to "authenticated";

grant truncate on table "public"."strapi_transfer_token_permissions" to "authenticated";

grant update on table "public"."strapi_transfer_token_permissions" to "authenticated";

grant delete on table "public"."strapi_transfer_token_permissions" to "service_role";

grant insert on table "public"."strapi_transfer_token_permissions" to "service_role";

grant references on table "public"."strapi_transfer_token_permissions" to "service_role";

grant select on table "public"."strapi_transfer_token_permissions" to "service_role";

grant trigger on table "public"."strapi_transfer_token_permissions" to "service_role";

grant truncate on table "public"."strapi_transfer_token_permissions" to "service_role";

grant update on table "public"."strapi_transfer_token_permissions" to "service_role";

grant delete on table "public"."strapi_transfer_token_permissions_token_lnk" to "anon";

grant insert on table "public"."strapi_transfer_token_permissions_token_lnk" to "anon";

grant references on table "public"."strapi_transfer_token_permissions_token_lnk" to "anon";

grant select on table "public"."strapi_transfer_token_permissions_token_lnk" to "anon";

grant trigger on table "public"."strapi_transfer_token_permissions_token_lnk" to "anon";

grant truncate on table "public"."strapi_transfer_token_permissions_token_lnk" to "anon";

grant update on table "public"."strapi_transfer_token_permissions_token_lnk" to "anon";

grant delete on table "public"."strapi_transfer_token_permissions_token_lnk" to "authenticated";

grant insert on table "public"."strapi_transfer_token_permissions_token_lnk" to "authenticated";

grant references on table "public"."strapi_transfer_token_permissions_token_lnk" to "authenticated";

grant select on table "public"."strapi_transfer_token_permissions_token_lnk" to "authenticated";

grant trigger on table "public"."strapi_transfer_token_permissions_token_lnk" to "authenticated";

grant truncate on table "public"."strapi_transfer_token_permissions_token_lnk" to "authenticated";

grant update on table "public"."strapi_transfer_token_permissions_token_lnk" to "authenticated";

grant delete on table "public"."strapi_transfer_token_permissions_token_lnk" to "service_role";

grant insert on table "public"."strapi_transfer_token_permissions_token_lnk" to "service_role";

grant references on table "public"."strapi_transfer_token_permissions_token_lnk" to "service_role";

grant select on table "public"."strapi_transfer_token_permissions_token_lnk" to "service_role";

grant trigger on table "public"."strapi_transfer_token_permissions_token_lnk" to "service_role";

grant truncate on table "public"."strapi_transfer_token_permissions_token_lnk" to "service_role";

grant update on table "public"."strapi_transfer_token_permissions_token_lnk" to "service_role";

grant delete on table "public"."strapi_transfer_tokens" to "anon";

grant insert on table "public"."strapi_transfer_tokens" to "anon";

grant references on table "public"."strapi_transfer_tokens" to "anon";

grant select on table "public"."strapi_transfer_tokens" to "anon";

grant trigger on table "public"."strapi_transfer_tokens" to "anon";

grant truncate on table "public"."strapi_transfer_tokens" to "anon";

grant update on table "public"."strapi_transfer_tokens" to "anon";

grant delete on table "public"."strapi_transfer_tokens" to "authenticated";

grant insert on table "public"."strapi_transfer_tokens" to "authenticated";

grant references on table "public"."strapi_transfer_tokens" to "authenticated";

grant select on table "public"."strapi_transfer_tokens" to "authenticated";

grant trigger on table "public"."strapi_transfer_tokens" to "authenticated";

grant truncate on table "public"."strapi_transfer_tokens" to "authenticated";

grant update on table "public"."strapi_transfer_tokens" to "authenticated";

grant delete on table "public"."strapi_transfer_tokens" to "service_role";

grant insert on table "public"."strapi_transfer_tokens" to "service_role";

grant references on table "public"."strapi_transfer_tokens" to "service_role";

grant select on table "public"."strapi_transfer_tokens" to "service_role";

grant trigger on table "public"."strapi_transfer_tokens" to "service_role";

grant truncate on table "public"."strapi_transfer_tokens" to "service_role";

grant update on table "public"."strapi_transfer_tokens" to "service_role";

grant delete on table "public"."strapi_webhooks" to "anon";

grant insert on table "public"."strapi_webhooks" to "anon";

grant references on table "public"."strapi_webhooks" to "anon";

grant select on table "public"."strapi_webhooks" to "anon";

grant trigger on table "public"."strapi_webhooks" to "anon";

grant truncate on table "public"."strapi_webhooks" to "anon";

grant update on table "public"."strapi_webhooks" to "anon";

grant delete on table "public"."strapi_webhooks" to "authenticated";

grant insert on table "public"."strapi_webhooks" to "authenticated";

grant references on table "public"."strapi_webhooks" to "authenticated";

grant select on table "public"."strapi_webhooks" to "authenticated";

grant trigger on table "public"."strapi_webhooks" to "authenticated";

grant truncate on table "public"."strapi_webhooks" to "authenticated";

grant update on table "public"."strapi_webhooks" to "authenticated";

grant delete on table "public"."strapi_webhooks" to "service_role";

grant insert on table "public"."strapi_webhooks" to "service_role";

grant references on table "public"."strapi_webhooks" to "service_role";

grant select on table "public"."strapi_webhooks" to "service_role";

grant trigger on table "public"."strapi_webhooks" to "service_role";

grant truncate on table "public"."strapi_webhooks" to "service_role";

grant update on table "public"."strapi_webhooks" to "service_role";

grant delete on table "public"."strapi_workflows" to "anon";

grant insert on table "public"."strapi_workflows" to "anon";

grant references on table "public"."strapi_workflows" to "anon";

grant select on table "public"."strapi_workflows" to "anon";

grant trigger on table "public"."strapi_workflows" to "anon";

grant truncate on table "public"."strapi_workflows" to "anon";

grant update on table "public"."strapi_workflows" to "anon";

grant delete on table "public"."strapi_workflows" to "authenticated";

grant insert on table "public"."strapi_workflows" to "authenticated";

grant references on table "public"."strapi_workflows" to "authenticated";

grant select on table "public"."strapi_workflows" to "authenticated";

grant trigger on table "public"."strapi_workflows" to "authenticated";

grant truncate on table "public"."strapi_workflows" to "authenticated";

grant update on table "public"."strapi_workflows" to "authenticated";

grant delete on table "public"."strapi_workflows" to "service_role";

grant insert on table "public"."strapi_workflows" to "service_role";

grant references on table "public"."strapi_workflows" to "service_role";

grant select on table "public"."strapi_workflows" to "service_role";

grant trigger on table "public"."strapi_workflows" to "service_role";

grant truncate on table "public"."strapi_workflows" to "service_role";

grant update on table "public"."strapi_workflows" to "service_role";

grant delete on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "anon";

grant insert on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "anon";

grant references on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "anon";

grant select on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "anon";

grant trigger on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "anon";

grant truncate on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "anon";

grant update on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "anon";

grant delete on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "authenticated";

grant insert on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "authenticated";

grant references on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "authenticated";

grant select on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "authenticated";

grant trigger on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "authenticated";

grant truncate on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "authenticated";

grant update on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "authenticated";

grant delete on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "service_role";

grant insert on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "service_role";

grant references on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "service_role";

grant select on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "service_role";

grant trigger on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "service_role";

grant truncate on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "service_role";

grant update on table "public"."strapi_workflows_stage_required_to_publish_lnk" to "service_role";

grant delete on table "public"."strapi_workflows_stages" to "anon";

grant insert on table "public"."strapi_workflows_stages" to "anon";

grant references on table "public"."strapi_workflows_stages" to "anon";

grant select on table "public"."strapi_workflows_stages" to "anon";

grant trigger on table "public"."strapi_workflows_stages" to "anon";

grant truncate on table "public"."strapi_workflows_stages" to "anon";

grant update on table "public"."strapi_workflows_stages" to "anon";

grant delete on table "public"."strapi_workflows_stages" to "authenticated";

grant insert on table "public"."strapi_workflows_stages" to "authenticated";

grant references on table "public"."strapi_workflows_stages" to "authenticated";

grant select on table "public"."strapi_workflows_stages" to "authenticated";

grant trigger on table "public"."strapi_workflows_stages" to "authenticated";

grant truncate on table "public"."strapi_workflows_stages" to "authenticated";

grant update on table "public"."strapi_workflows_stages" to "authenticated";

grant delete on table "public"."strapi_workflows_stages" to "service_role";

grant insert on table "public"."strapi_workflows_stages" to "service_role";

grant references on table "public"."strapi_workflows_stages" to "service_role";

grant select on table "public"."strapi_workflows_stages" to "service_role";

grant trigger on table "public"."strapi_workflows_stages" to "service_role";

grant truncate on table "public"."strapi_workflows_stages" to "service_role";

grant update on table "public"."strapi_workflows_stages" to "service_role";

grant delete on table "public"."strapi_workflows_stages_permissions_lnk" to "anon";

grant insert on table "public"."strapi_workflows_stages_permissions_lnk" to "anon";

grant references on table "public"."strapi_workflows_stages_permissions_lnk" to "anon";

grant select on table "public"."strapi_workflows_stages_permissions_lnk" to "anon";

grant trigger on table "public"."strapi_workflows_stages_permissions_lnk" to "anon";

grant truncate on table "public"."strapi_workflows_stages_permissions_lnk" to "anon";

grant update on table "public"."strapi_workflows_stages_permissions_lnk" to "anon";

grant delete on table "public"."strapi_workflows_stages_permissions_lnk" to "authenticated";

grant insert on table "public"."strapi_workflows_stages_permissions_lnk" to "authenticated";

grant references on table "public"."strapi_workflows_stages_permissions_lnk" to "authenticated";

grant select on table "public"."strapi_workflows_stages_permissions_lnk" to "authenticated";

grant trigger on table "public"."strapi_workflows_stages_permissions_lnk" to "authenticated";

grant truncate on table "public"."strapi_workflows_stages_permissions_lnk" to "authenticated";

grant update on table "public"."strapi_workflows_stages_permissions_lnk" to "authenticated";

grant delete on table "public"."strapi_workflows_stages_permissions_lnk" to "service_role";

grant insert on table "public"."strapi_workflows_stages_permissions_lnk" to "service_role";

grant references on table "public"."strapi_workflows_stages_permissions_lnk" to "service_role";

grant select on table "public"."strapi_workflows_stages_permissions_lnk" to "service_role";

grant trigger on table "public"."strapi_workflows_stages_permissions_lnk" to "service_role";

grant truncate on table "public"."strapi_workflows_stages_permissions_lnk" to "service_role";

grant update on table "public"."strapi_workflows_stages_permissions_lnk" to "service_role";

grant delete on table "public"."strapi_workflows_stages_workflow_lnk" to "anon";

grant insert on table "public"."strapi_workflows_stages_workflow_lnk" to "anon";

grant references on table "public"."strapi_workflows_stages_workflow_lnk" to "anon";

grant select on table "public"."strapi_workflows_stages_workflow_lnk" to "anon";

grant trigger on table "public"."strapi_workflows_stages_workflow_lnk" to "anon";

grant truncate on table "public"."strapi_workflows_stages_workflow_lnk" to "anon";

grant update on table "public"."strapi_workflows_stages_workflow_lnk" to "anon";

grant delete on table "public"."strapi_workflows_stages_workflow_lnk" to "authenticated";

grant insert on table "public"."strapi_workflows_stages_workflow_lnk" to "authenticated";

grant references on table "public"."strapi_workflows_stages_workflow_lnk" to "authenticated";

grant select on table "public"."strapi_workflows_stages_workflow_lnk" to "authenticated";

grant trigger on table "public"."strapi_workflows_stages_workflow_lnk" to "authenticated";

grant truncate on table "public"."strapi_workflows_stages_workflow_lnk" to "authenticated";

grant update on table "public"."strapi_workflows_stages_workflow_lnk" to "authenticated";

grant delete on table "public"."strapi_workflows_stages_workflow_lnk" to "service_role";

grant insert on table "public"."strapi_workflows_stages_workflow_lnk" to "service_role";

grant references on table "public"."strapi_workflows_stages_workflow_lnk" to "service_role";

grant select on table "public"."strapi_workflows_stages_workflow_lnk" to "service_role";

grant trigger on table "public"."strapi_workflows_stages_workflow_lnk" to "service_role";

grant truncate on table "public"."strapi_workflows_stages_workflow_lnk" to "service_role";

grant update on table "public"."strapi_workflows_stages_workflow_lnk" to "service_role";

grant delete on table "public"."tests" to "anon";

grant insert on table "public"."tests" to "anon";

grant references on table "public"."tests" to "anon";

grant select on table "public"."tests" to "anon";

grant trigger on table "public"."tests" to "anon";

grant truncate on table "public"."tests" to "anon";

grant update on table "public"."tests" to "anon";

grant delete on table "public"."tests" to "authenticated";

grant insert on table "public"."tests" to "authenticated";

grant references on table "public"."tests" to "authenticated";

grant select on table "public"."tests" to "authenticated";

grant trigger on table "public"."tests" to "authenticated";

grant truncate on table "public"."tests" to "authenticated";

grant update on table "public"."tests" to "authenticated";

grant delete on table "public"."tests" to "service_role";

grant insert on table "public"."tests" to "service_role";

grant references on table "public"."tests" to "service_role";

grant select on table "public"."tests" to "service_role";

grant trigger on table "public"."tests" to "service_role";

grant truncate on table "public"."tests" to "service_role";

grant update on table "public"."tests" to "service_role";

grant delete on table "public"."up_permissions" to "anon";

grant insert on table "public"."up_permissions" to "anon";

grant references on table "public"."up_permissions" to "anon";

grant select on table "public"."up_permissions" to "anon";

grant trigger on table "public"."up_permissions" to "anon";

grant truncate on table "public"."up_permissions" to "anon";

grant update on table "public"."up_permissions" to "anon";

grant delete on table "public"."up_permissions" to "authenticated";

grant insert on table "public"."up_permissions" to "authenticated";

grant references on table "public"."up_permissions" to "authenticated";

grant select on table "public"."up_permissions" to "authenticated";

grant trigger on table "public"."up_permissions" to "authenticated";

grant truncate on table "public"."up_permissions" to "authenticated";

grant update on table "public"."up_permissions" to "authenticated";

grant delete on table "public"."up_permissions" to "service_role";

grant insert on table "public"."up_permissions" to "service_role";

grant references on table "public"."up_permissions" to "service_role";

grant select on table "public"."up_permissions" to "service_role";

grant trigger on table "public"."up_permissions" to "service_role";

grant truncate on table "public"."up_permissions" to "service_role";

grant update on table "public"."up_permissions" to "service_role";

grant delete on table "public"."up_permissions_role_lnk" to "anon";

grant insert on table "public"."up_permissions_role_lnk" to "anon";

grant references on table "public"."up_permissions_role_lnk" to "anon";

grant select on table "public"."up_permissions_role_lnk" to "anon";

grant trigger on table "public"."up_permissions_role_lnk" to "anon";

grant truncate on table "public"."up_permissions_role_lnk" to "anon";

grant update on table "public"."up_permissions_role_lnk" to "anon";

grant delete on table "public"."up_permissions_role_lnk" to "authenticated";

grant insert on table "public"."up_permissions_role_lnk" to "authenticated";

grant references on table "public"."up_permissions_role_lnk" to "authenticated";

grant select on table "public"."up_permissions_role_lnk" to "authenticated";

grant trigger on table "public"."up_permissions_role_lnk" to "authenticated";

grant truncate on table "public"."up_permissions_role_lnk" to "authenticated";

grant update on table "public"."up_permissions_role_lnk" to "authenticated";

grant delete on table "public"."up_permissions_role_lnk" to "service_role";

grant insert on table "public"."up_permissions_role_lnk" to "service_role";

grant references on table "public"."up_permissions_role_lnk" to "service_role";

grant select on table "public"."up_permissions_role_lnk" to "service_role";

grant trigger on table "public"."up_permissions_role_lnk" to "service_role";

grant truncate on table "public"."up_permissions_role_lnk" to "service_role";

grant update on table "public"."up_permissions_role_lnk" to "service_role";

grant delete on table "public"."up_roles" to "anon";

grant insert on table "public"."up_roles" to "anon";

grant references on table "public"."up_roles" to "anon";

grant select on table "public"."up_roles" to "anon";

grant trigger on table "public"."up_roles" to "anon";

grant truncate on table "public"."up_roles" to "anon";

grant update on table "public"."up_roles" to "anon";

grant delete on table "public"."up_roles" to "authenticated";

grant insert on table "public"."up_roles" to "authenticated";

grant references on table "public"."up_roles" to "authenticated";

grant select on table "public"."up_roles" to "authenticated";

grant trigger on table "public"."up_roles" to "authenticated";

grant truncate on table "public"."up_roles" to "authenticated";

grant update on table "public"."up_roles" to "authenticated";

grant delete on table "public"."up_roles" to "service_role";

grant insert on table "public"."up_roles" to "service_role";

grant references on table "public"."up_roles" to "service_role";

grant select on table "public"."up_roles" to "service_role";

grant trigger on table "public"."up_roles" to "service_role";

grant truncate on table "public"."up_roles" to "service_role";

grant update on table "public"."up_roles" to "service_role";

grant delete on table "public"."up_users" to "anon";

grant insert on table "public"."up_users" to "anon";

grant references on table "public"."up_users" to "anon";

grant select on table "public"."up_users" to "anon";

grant trigger on table "public"."up_users" to "anon";

grant truncate on table "public"."up_users" to "anon";

grant update on table "public"."up_users" to "anon";

grant delete on table "public"."up_users" to "authenticated";

grant insert on table "public"."up_users" to "authenticated";

grant references on table "public"."up_users" to "authenticated";

grant select on table "public"."up_users" to "authenticated";

grant trigger on table "public"."up_users" to "authenticated";

grant truncate on table "public"."up_users" to "authenticated";

grant update on table "public"."up_users" to "authenticated";

grant delete on table "public"."up_users" to "service_role";

grant insert on table "public"."up_users" to "service_role";

grant references on table "public"."up_users" to "service_role";

grant select on table "public"."up_users" to "service_role";

grant trigger on table "public"."up_users" to "service_role";

grant truncate on table "public"."up_users" to "service_role";

grant update on table "public"."up_users" to "service_role";

grant delete on table "public"."up_users_role_lnk" to "anon";

grant insert on table "public"."up_users_role_lnk" to "anon";

grant references on table "public"."up_users_role_lnk" to "anon";

grant select on table "public"."up_users_role_lnk" to "anon";

grant trigger on table "public"."up_users_role_lnk" to "anon";

grant truncate on table "public"."up_users_role_lnk" to "anon";

grant update on table "public"."up_users_role_lnk" to "anon";

grant delete on table "public"."up_users_role_lnk" to "authenticated";

grant insert on table "public"."up_users_role_lnk" to "authenticated";

grant references on table "public"."up_users_role_lnk" to "authenticated";

grant select on table "public"."up_users_role_lnk" to "authenticated";

grant trigger on table "public"."up_users_role_lnk" to "authenticated";

grant truncate on table "public"."up_users_role_lnk" to "authenticated";

grant update on table "public"."up_users_role_lnk" to "authenticated";

grant delete on table "public"."up_users_role_lnk" to "service_role";

grant insert on table "public"."up_users_role_lnk" to "service_role";

grant references on table "public"."up_users_role_lnk" to "service_role";

grant select on table "public"."up_users_role_lnk" to "service_role";

grant trigger on table "public"."up_users_role_lnk" to "service_role";

grant truncate on table "public"."up_users_role_lnk" to "service_role";

grant update on table "public"."up_users_role_lnk" to "service_role";

grant delete on table "public"."upload_folders" to "anon";

grant insert on table "public"."upload_folders" to "anon";

grant references on table "public"."upload_folders" to "anon";

grant select on table "public"."upload_folders" to "anon";

grant trigger on table "public"."upload_folders" to "anon";

grant truncate on table "public"."upload_folders" to "anon";

grant update on table "public"."upload_folders" to "anon";

grant delete on table "public"."upload_folders" to "authenticated";

grant insert on table "public"."upload_folders" to "authenticated";

grant references on table "public"."upload_folders" to "authenticated";

grant select on table "public"."upload_folders" to "authenticated";

grant trigger on table "public"."upload_folders" to "authenticated";

grant truncate on table "public"."upload_folders" to "authenticated";

grant update on table "public"."upload_folders" to "authenticated";

grant delete on table "public"."upload_folders" to "service_role";

grant insert on table "public"."upload_folders" to "service_role";

grant references on table "public"."upload_folders" to "service_role";

grant select on table "public"."upload_folders" to "service_role";

grant trigger on table "public"."upload_folders" to "service_role";

grant truncate on table "public"."upload_folders" to "service_role";

grant update on table "public"."upload_folders" to "service_role";

grant delete on table "public"."upload_folders_parent_lnk" to "anon";

grant insert on table "public"."upload_folders_parent_lnk" to "anon";

grant references on table "public"."upload_folders_parent_lnk" to "anon";

grant select on table "public"."upload_folders_parent_lnk" to "anon";

grant trigger on table "public"."upload_folders_parent_lnk" to "anon";

grant truncate on table "public"."upload_folders_parent_lnk" to "anon";

grant update on table "public"."upload_folders_parent_lnk" to "anon";

grant delete on table "public"."upload_folders_parent_lnk" to "authenticated";

grant insert on table "public"."upload_folders_parent_lnk" to "authenticated";

grant references on table "public"."upload_folders_parent_lnk" to "authenticated";

grant select on table "public"."upload_folders_parent_lnk" to "authenticated";

grant trigger on table "public"."upload_folders_parent_lnk" to "authenticated";

grant truncate on table "public"."upload_folders_parent_lnk" to "authenticated";

grant update on table "public"."upload_folders_parent_lnk" to "authenticated";

grant delete on table "public"."upload_folders_parent_lnk" to "service_role";

grant insert on table "public"."upload_folders_parent_lnk" to "service_role";

grant references on table "public"."upload_folders_parent_lnk" to "service_role";

grant select on table "public"."upload_folders_parent_lnk" to "service_role";

grant trigger on table "public"."upload_folders_parent_lnk" to "service_role";

grant truncate on table "public"."upload_folders_parent_lnk" to "service_role";

grant update on table "public"."upload_folders_parent_lnk" to "service_role";

-- Corrected Foreign Key Constraints

ALTER TABLE "public"."admin_permissions" ADD CONSTRAINT "admin_permissions_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."admin_permissions" ADD CONSTRAINT "admin_permissions_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."admin_permissions_role_lnk" ADD CONSTRAINT "admin_permissions_role_lnk_fk" FOREIGN KEY (permission_id) REFERENCES "public"."admin_permissions"(id) ON DELETE CASCADE;
ALTER TABLE "public"."admin_permissions_role_lnk" ADD CONSTRAINT "admin_permissions_role_lnk_ifk" FOREIGN KEY (role_id) REFERENCES "public"."admin_roles"(id) ON DELETE CASCADE;
ALTER TABLE "public"."admin_roles" ADD CONSTRAINT "admin_roles_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."admin_roles" ADD CONSTRAINT "admin_roles_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."admin_users" ADD CONSTRAINT "admin_users_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."admin_users" ADD CONSTRAINT "admin_users_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."admin_users_roles_lnk" ADD CONSTRAINT "admin_users_roles_lnk_fk" FOREIGN KEY (user_id) REFERENCES "public"."admin_users"(id) ON DELETE CASCADE;
ALTER TABLE "public"."admin_users_roles_lnk" ADD CONSTRAINT "admin_users_roles_lnk_ifk" FOREIGN KEY (role_id) REFERENCES "public"."admin_roles"(id) ON DELETE CASCADE;
ALTER TABLE "public"."files" ADD CONSTRAINT "files_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."files" ADD CONSTRAINT "files_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."files_folder_lnk" ADD CONSTRAINT "files_folder_lnk_fk" FOREIGN KEY (file_id) REFERENCES "public"."files"(id) ON DELETE CASCADE;
ALTER TABLE "public"."files_folder_lnk" ADD CONSTRAINT "files_folder_lnk_ifk" FOREIGN KEY (folder_id) REFERENCES "public"."upload_folders"(id) ON DELETE CASCADE;
ALTER TABLE "public"."files_related_mph" ADD CONSTRAINT "files_related_mph_fk" FOREIGN KEY (file_id) REFERENCES "public"."files"(id) ON DELETE CASCADE;
ALTER TABLE "public"."i18n_locale" ADD CONSTRAINT "i18n_locale_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."i18n_locale" ADD CONSTRAINT "i18n_locale_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_api_token_permissions" ADD CONSTRAINT "strapi_api_token_permissions_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_api_token_permissions" ADD CONSTRAINT "strapi_api_token_permissions_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_api_token_permissions_token_lnk" ADD CONSTRAINT "strapi_api_token_permissions_token_lnk_fk" FOREIGN KEY (api_token_permission_id) REFERENCES "public"."strapi_api_token_permissions"(id) ON DELETE CASCADE;
ALTER TABLE "public"."strapi_api_token_permissions_token_lnk" ADD CONSTRAINT "strapi_api_token_permissions_token_lnk_ifk" FOREIGN KEY (api_token_id) REFERENCES "public"."strapi_api_tokens"(id) ON DELETE CASCADE;
ALTER TABLE "public"."strapi_api_tokens" ADD CONSTRAINT "strapi_api_tokens_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_api_tokens" ADD CONSTRAINT "strapi_api_tokens_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_history_versions" ADD CONSTRAINT "strapi_history_versions_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_release_actions" ADD CONSTRAINT "strapi_release_actions_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_release_actions" ADD CONSTRAINT "strapi_release_actions_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_release_actions_release_lnk" ADD CONSTRAINT "strapi_release_actions_release_lnk_fk" FOREIGN KEY (release_action_id) REFERENCES "public"."strapi_release_actions"(id) ON DELETE CASCADE;
ALTER TABLE "public"."strapi_release_actions_release_lnk" ADD CONSTRAINT "strapi_release_actions_release_lnk_ifk" FOREIGN KEY (release_id) REFERENCES "public"."strapi_releases"(id) ON DELETE CASCADE;
ALTER TABLE "public"."strapi_releases" ADD CONSTRAINT "strapi_releases_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_releases" ADD CONSTRAINT "strapi_releases_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_transfer_token_permissions" ADD CONSTRAINT "strapi_transfer_token_permissions_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_transfer_token_permissions" ADD CONSTRAINT "strapi_transfer_token_permissions_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_transfer_token_permissions_token_lnk" ADD CONSTRAINT "strapi_transfer_token_permissions_token_lnk_fk" FOREIGN KEY (transfer_token_permission_id) REFERENCES "public"."strapi_transfer_token_permissions"(id) ON DELETE CASCADE;
ALTER TABLE "public"."strapi_transfer_token_permissions_token_lnk" ADD CONSTRAINT "strapi_transfer_token_permissions_token_lnk_ifk" FOREIGN KEY (transfer_token_id) REFERENCES "public"."strapi_transfer_tokens"(id) ON DELETE CASCADE;
ALTER TABLE "public"."strapi_transfer_tokens" ADD CONSTRAINT "strapi_transfer_tokens_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_transfer_tokens" ADD CONSTRAINT "strapi_transfer_tokens_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_workflows" ADD CONSTRAINT "strapi_workflows_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_workflows" ADD CONSTRAINT "strapi_workflows_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_workflows_stage_required_to_publish_lnk" ADD CONSTRAINT "strapi_workflows_stage_required_to_publish_lnk_fk" FOREIGN KEY (workflow_id) REFERENCES "public"."strapi_workflows"(id) ON DELETE CASCADE;
ALTER TABLE "public"."strapi_workflows_stage_required_to_publish_lnk" ADD CONSTRAINT "strapi_workflows_stage_required_to_publish_lnk_ifk" FOREIGN KEY (workflow_stage_id) REFERENCES "public"."strapi_workflows_stages"(id) ON DELETE CASCADE;
ALTER TABLE "public"."strapi_workflows_stages" ADD CONSTRAINT "strapi_workflows_stages_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_workflows_stages" ADD CONSTRAINT "strapi_workflows_stages_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."strapi_workflows_stages_permissions_lnk" ADD CONSTRAINT "strapi_workflows_stages_permissions_lnk_fk" FOREIGN KEY (workflow_stage_id) REFERENCES "public"."strapi_workflows_stages"(id) ON DELETE CASCADE;
ALTER TABLE "public"."strapi_workflows_stages_permissions_lnk" ADD CONSTRAINT "strapi_workflows_stages_permissions_lnk_ifk" FOREIGN KEY (permission_id) REFERENCES "public"."admin_permissions"(id) ON DELETE CASCADE;
ALTER TABLE "public"."strapi_workflows_stages_workflow_lnk" ADD CONSTRAINT "strapi_workflows_stages_workflow_lnk_fk" FOREIGN KEY (workflow_stage_id) REFERENCES "public"."strapi_workflows_stages"(id) ON DELETE CASCADE;
ALTER TABLE "public"."strapi_workflows_stages_workflow_lnk" ADD CONSTRAINT "strapi_workflows_stages_workflow_lnk_ifk" FOREIGN KEY (workflow_id) REFERENCES "public"."strapi_workflows"(id) ON DELETE CASCADE;
ALTER TABLE "public"."tests" ADD CONSTRAINT "tests_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."tests" ADD CONSTRAINT "tests_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."up_permissions" ADD CONSTRAINT "up_permissions_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."up_permissions" ADD CONSTRAINT "up_permissions_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."up_permissions_role_lnk" ADD CONSTRAINT "up_permissions_role_lnk_fk" FOREIGN KEY (permission_id) REFERENCES "public"."up_permissions"(id) ON DELETE CASCADE;
ALTER TABLE "public"."up_permissions_role_lnk" ADD CONSTRAINT "up_permissions_role_lnk_ifk" FOREIGN KEY (role_id) REFERENCES "public"."up_roles"(id) ON DELETE CASCADE;
ALTER TABLE "public"."up_roles" ADD CONSTRAINT "up_roles_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."up_roles" ADD CONSTRAINT "up_roles_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."up_users" ADD CONSTRAINT "up_users_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."up_users" ADD CONSTRAINT "up_users_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."up_users_role_lnk" ADD CONSTRAINT "up_users_role_lnk_fk" FOREIGN KEY (user_id) REFERENCES "public"."up_users"(id) ON DELETE CASCADE;
ALTER TABLE "public"."up_users_role_lnk" ADD CONSTRAINT "up_users_role_lnk_ifk" FOREIGN KEY (role_id) REFERENCES "public"."up_roles"(id) ON DELETE CASCADE;
ALTER TABLE "public"."upload_folders" ADD CONSTRAINT "upload_folders_created_by_id_fk" FOREIGN KEY (created_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."upload_folders" ADD CONSTRAINT "upload_folders_updated_by_id_fk" FOREIGN KEY (updated_by_id) REFERENCES "public"."admin_users"(id) ON DELETE SET NULL;
ALTER TABLE "public"."upload_folders_parent_lnk" ADD CONSTRAINT "upload_folders_parent_lnk_fk" FOREIGN KEY (folder_id) REFERENCES "public"."upload_folders"(id) ON DELETE CASCADE;
ALTER TABLE "public"."upload_folders_parent_lnk" ADD CONSTRAINT "upload_folders_parent_lnk_ifk" FOREIGN KEY (inv_folder_id) REFERENCES "public"."upload_folders"(id) ON DELETE CASCADE;
