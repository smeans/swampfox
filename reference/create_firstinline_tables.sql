--
-- SQL script to create firstinline tables
--




-------------------------------------------------------------------------
-------------------------------------------------------------------------
--   PROCEDURES
-------------------------------------------------------------------------

-------------------------------------------------------------
--
-- Types
--
-------------------------------------------------------------


CREATE TYPE public.table_sizes AS (
  "table"  varchar,
  "rows"   varchar,
  size     varchar
);

ALTER TYPE public.table_sizes
  OWNER TO smeans;

 

-------------------------------------------------------------------------
--
-- config_params - contains global parameters for firstinline
--
-------------------------------------------------------------------------

DROP TABLE IF EXISTS public.config_params;

CREATE TABLE public.config_params (
  "name"         varchar NOT NULL,
  value          varchar,
  "type"         varchar DEFAULT 'String'::character varying,
  valid_values   varchar,
  default_value  varchar,
  description    varchar,
  "encrypted"    boolean DEFAULT false,
  hidden         boolean DEFAULT false,
  app_visible    boolean DEFAULT false,
  /* Keys */
  CONSTRAINT pk_config_params
    PRIMARY KEY ("name")
) WITH (
    OIDS = FALSE
  );


ALTER TABLE public.config_params
  OWNER TO smeans;
  
--
-- default parameter values
--
  
  
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('app.transfer.vdn.error', '4548', 'String', NULL, NULL, NULL, '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('gui.userdata.types', 'Converse,converse;CTI,cti;UUI,uui', 'String', NULL, NULL, 'Use by web gui to provide dropdown selection list of app.offere.userdata.source.', '0', '0', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('gui.offervdn.types', 'DNIS,dnis;UUI,uui', 'String', NULL, NULL, 'Use by web gui to provide dropdown selection list of app.offere.offervdn.source.', '0', '0', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('app.transfer.h323.converse_return_code', '', 'String', '', '', 'Return code to be sent back to the PBX (only 0-9,*,#)', '0', '1', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('callback.app.name', 'SF_FIL_IVR', 'String', NULL, '', 'Experience Portal application name used for callbacks.', '0', '1', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('fil.prompt.talents', 'Danielle;Callie', 'String', NULL, '', 'Voice Talent ', '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('queue.max.ewt', '02:02:02', 'String', '', '', 'Callback offer maximum Estimated Wait Time', '0', '1', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('fil.time.zones', 'US/Alaska;US/Aleutian;US/Arizona;US/Central;US/Eastern;US/East-Indiana;US/Hawaii;US/Indiana-Starke;US/Michigan;US/Mountain;US/Pacific;US/Samoa', 'String', NULL, '', 'Time zones ', '0', '0', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('queue.app.name', 'SF_FIL_IVR', 'String', '', '', '', '0', '0', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('app.is_ask_for_name', 'true', 'boolean', NULL, 'true', 'If enabled, the Offer IVR application will prompt the caller to record their name.  This recording is played back by the Callback IVR application.', '0', '1', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('monitor.polltime', '5', NULL, NULL, NULL, NULL, '0', '0', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('app.transfer.h323.converse.hangup_code', '', 'String', '', '', 'Hangup return code to be sent back to the PBX (only 0-9,*,#)', '0', '1', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('qa-mvp-fil.monitor.state', 'RUNNING', 'String', NULL, NULL, NULL, '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('tomcat.port', '8080', 'String', '', '', '', '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('tomcat.host', 'localhost', 'String', NULL, NULL, NULL, '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('ewt.monitor.listener.config.port', '10000', 'String', NULL, NULL, NULL, '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('db.maintenance.times', '2:00', 'String', NULL, NULL, NULL, '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('alarm.delivery.schedule', '0:15:0', 'String', NULL, NULL, NULL, '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('alarm.level', 'WARN', 'String', NULL, NULL, NULL, '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('alarm.recipient.list', 'rick.ulmer@swampfoxinc.com', 'String', NULL, NULL, NULL, '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('email.from.uri', 'firstinline@swampfoxinc.com', 'String', '', '', '', '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('log.level', 'debug', 'String', NULL, NULL, NULL, '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('ewt.monitor.listener.port', '10000', 'String', NULL, NULL, NULL, '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('app.install.name', NULL, 'String', NULL, NULL, NULL, '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('fox-rulmer.monitor.state', 'STOPPED', 'String', NULL, NULL, NULL, '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('app.offer.userdata.offervdn.start', '0', 'String', NULL, NULL, 'Only needs to be set if  offervdn is set to uui', '0', '1', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('app.offer.userdata.offervdn.length', '6', 'String', NULL, NULL, 'Only needs to be set if  offervdn is set to uui', '0', '1', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('app.callback.userdata.outbound', NULL, 'String', NULL, NULL, 'Specifies how User Data is sent back to the PBX when call is transferred but the offer is not accepted.', '0', '1', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('app.transfer.h323.is_converse', 'false', 'boolean', '', '', 'Are transfers using converse steps from PBX Vector', '0', '1', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('app.offer.userdata.outbound', 'cti', 'String', NULL, NULL, 'Valid values: <empty>,cti,sipuui', '0', '1', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('testKNew', 'e540431b6324144bd8b9f89b93187b87', 'String', NULL, '', 'testingfaratest', '1', '0', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('app.offer.userdata.inbound', 'cti', 'String', NULL, NULL, 'Valid values: <empty>,converse,cti,sipuui', '0', '1', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('app.offer.offervdn.inbound', 'userdata', 'String', NULL, NULL, 'Valid values: dnis,userdata', '0', '1', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('queue.min.agent.count', '0', NULL, NULL, NULL, NULL, '0', '0', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('app.offer.userdata.offervdn.issubstring', 'true', 'boolean', NULL, NULL, 'If app.offer.userdata.offervdn.inbound is set to userdata, than this determines if the OfferVDN is the whole userdata or if the app.offer.userdata.offervdn.start and app.offer.userdata.offervdn.length are use to pull the OfferVDN from the user data.', '0', '1', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('test.param-1', 'test value6', NULL, NULL, NULL, NULL, '0', '0', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('callback.retry.count', '3', 'int', NULL, NULL, 'Number of retries for callbacks.  (0 or more, 0 means initial try only)', '1', '1', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('callback.retry.busy.delay', '00:05:00', 'String', '', '', 'Amount of time to wait before retrying a call on a busy.  (hrs:min:sec)', '0', '1', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('callback.retry.no_answer.delay', '00:05:00', 'String', NULL, NULL, 'Amount of time to wait before retrying a call on a no answer.  (hrs:min:sec)', '0', '1', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('misplaced.expiration.age', '900', 'String', NULL, NULL, NULL, '0', '0', '1');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('callback.from_uri', '', 'String', NULL, NULL, 'Callback URI', '0', '1', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('queue.min.ewt', '00:01:05', 'String', NULL, NULL, 'Callback offer minimum Estimated Wait Time', '0', '1', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('ulmer-3d.monitor.state', 'RUNNING', 'String', NULL, NULL, NULL, '0', '0', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('queue.ewt.bracket.after.percent', '20', 'String', '', '', 'Maximum Offer Estimation', '0', '1', '0');
INSERT INTO config_params ("name", value, "type", valid_values, default_value, description, "encrypted", hidden, app_visible) VALUES ('queue.ewt.bracket.before.percent', '10', 'String', '', '', 'Minimum Offer Estimation', '0', '1', '0');

  
-------------------------------------------------------------------------
--
-- ewt_history - contains ewt_history list for firstinline
--
-------------------------------------------------------------------------
    
  
DROP TABLE IF EXISTS public.ewt_history;

CREATE TABLE public.ewt_history (
  id               bigserial NOT NULL,
  "timestamp"      timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  event_xml        varchar,
  event_type       varchar,
  aes              varchar,
  vdn              varchar,
  skill_extension  varchar,
  ucid             varchar,
  /* Keys */
  CONSTRAINT ewt_history_pkey
    PRIMARY KEY (id)
) WITH (
    OIDS = FALSE
  );

CREATE INDEX ewt_history_index_skill_extension
  ON public.ewt_history
  (skill_extension);

CREATE INDEX ewt_history_index_timestamp
  ON public.ewt_history
  ("timestamp");

CREATE INDEX ewt_history_index_ucid
  ON public.ewt_history
  (ucid);

ALTER TABLE public.ewt_history
  OWNER TO smeans;  
  
  
  
  
 -------------------------------------------------------------------------
--
-- queue - contains queue for firstinline
--
-------------------------------------------------------------------------
  
DROP TABLE IF EXISTS public.queues;

CREATE TABLE public.queues (
  id               serial NOT NULL PRIMARY KEY,
  "name"           varchar NOT NULL,
  description      varchar,
  state            varchar,
  enabled          boolean DEFAULT true,
  skill            varchar NOT NULL,
  skill_extension  varchar NOT NULL,
  queue_vdn        varchar NOT NULL,
  callback_vdn     varchar NOT NULL,
  aes_connection   integer,
  "mode"           varchar,
  calendar_id      integer,
  time_zone        varchar,
  /* Keys */
  CONSTRAINT queues_index_skill_extension
    UNIQUE (skill_extension)
  /* Foreign keys */
) WITH (
    OIDS = FALSE
  );

  
ALTER TABLE public.queues
  OWNER TO smeans;   
  
  
  
 
-------------------------------------------------------------------------
--
-- queue_params - contains queue_params for firstinline
--
-------------------------------------------------------------------------
    
  
DROP TABLE IF EXISTS public.queue_params;

CREATE TABLE public.queue_params (
  id             serial NOT NULL,
  queue_id       integer NOT NULL,
  "name"         varchar NOT NULL,
  value          varchar,
  "type"         varchar DEFAULT 'String'::character varying,
  valid_values   varchar,
  default_value  varchar,
  description    varchar,
  "encrypted"    boolean DEFAULT false,
  hidden         boolean DEFAULT false,
  app_visible    boolean DEFAULT false,
  /* Keys */
  CONSTRAINT queue_params_pkey
    PRIMARY KEY (id), 
  CONSTRAINT queue_params_index
    UNIQUE (queue_id, "name"),
  /* Foreign keys */
  CONSTRAINT foreign_queue_id
    FOREIGN KEY (queue_id)
    REFERENCES public.queues(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) WITH (
    OIDS = FALSE
  );

ALTER TABLE public.queue_params
  OWNER TO smeans;
  
  

  
-------------------------------------------------------------------------
--
-- queue - contains queue for firstinline
--
-------------------------------------------------------------------------
    
  
DROP TABLE IF EXISTS public.offer_vdns;

CREATE TABLE public.offer_vdns (
  id            serial NOT NULL,
  queue_id      integer NOT NULL,
  description   varchar,
  vdn           varchar NOT NULL,
  enable_offer  boolean DEFAULT true,
  "language"    varchar DEFAULT 'english'::character varying,
  /* Keys */
 CONSTRAINT offer_vdns_index_pkey
    PRIMARY KEY (id),
 CONSTRAINT offer_vdns_index_vdn
    UNIQUE (vdn),
  /* Foreign keys */
  CONSTRAINT foreign_key_queue_id
    FOREIGN KEY (queue_id)
    REFERENCES public.queues(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) WITH (
    OIDS = FALSE
  );


ALTER TABLE public.offer_vdns
  OWNER TO smeans;  
  
  
-------------------------------------------------------------------------
--
-- monitoring_vdns - contains monitoring_vdns for firstinline
--
-------------------------------------------------------------------------  
  
  
DROP TABLE IF EXISTS public.monitoring_vdns;

CREATE TABLE public.monitoring_vdns (
  id           serial NOT NULL,
  queue_id     integer NOT NULL,
  description  varchar,
  vdn          varchar NOT NULL,
  /* Keys */
  CONSTRAINT monitoring_vdns_pkey
    PRIMARY KEY (id),
  CONSTRAINT monitoring_vdns_index_vdn
    UNIQUE (vdn),
  /* Foreign keys */
  CONSTRAINT foreign_key_queue_id
    FOREIGN KEY (queue_id)
    REFERENCES public.queues(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) WITH (
    OIDS = FALSE
  );


ALTER TABLE public.monitoring_vdns
  OWNER TO smeans;  
  

-------------------------------------------------------------------------
--
-- calendars - contains calendars for firstinline
--
-------------------------------------------------------------------------  
  
 
DROP TABLE IF EXISTS public.calendars;

CREATE TABLE public.calendars (
  id             serial NOT NULL,
  calendar_name  varchar NOT NULL,
  description    varchar,
  /* Keys */
  CONSTRAINT calendars_pkey
    PRIMARY KEY (id), 
  CONSTRAINT calendars_calendar_name_unique_constraint
    UNIQUE (calendar_name)
) WITH (
    OIDS = FALSE
  );

ALTER TABLE public.calendars
  OWNER TO smeans;  


-------------------------------------------------------------------------
--
-- calendar_dates - contains calendar_dates for firstinline
--
-------------------------------------------------------------------------  
  
  
DROP TABLE IF EXISTS public.calendar_dates;

CREATE TABLE public.calendar_dates (
  id           serial NOT NULL,
  calendar_id  integer NOT NULL,
  "date"       date NOT NULL,
  description  varchar,
  start_time   time WITHOUT TIME ZONE,
  end_time     time WITHOUT TIME ZONE,
  offer_stop_offset  interval DEFAULT '00:00:00'::interval,
  /* Keys */
  CONSTRAINT calendar_dates_pkey
    PRIMARY KEY (id), 
  CONSTRAINT calendar_dates_calendar_date_unique_constraint
    UNIQUE (calendar_id, "date"),
  /* Foreign keys */
  CONSTRAINT calendar_dates_calendar_id_foreign_key
    FOREIGN KEY (calendar_id)
    REFERENCES public.calendars(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) WITH (
    OIDS = FALSE
  );

ALTER TABLE public.calendar_dates
  OWNER TO smeans;  
  
  
  
-------------------------------------------------------------------------
--
-- queue_schedule - contains queue_schedule for firstinline
--
-------------------------------------------------------------------------    
    
  
DROP TABLE IF EXISTS public.queue_schedule;

CREATE TABLE public.queue_schedule (
  queue_id           integer NOT NULL,
  day_of_week        integer NOT NULL,
  start_time         time WITHOUT TIME ZONE,
  end_time           time WITHOUT TIME ZONE,
  offer_stop_offset  interval DEFAULT '00:00:00'::interval,
  id                 serial NOT NULL,
  /* Keys */
  CONSTRAINT queue_schedule_pkey
    PRIMARY KEY (id), 
  CONSTRAINT queue_schedule_index_dow
    UNIQUE (queue_id, day_of_week),
  /* Checks */
  CONSTRAINT check_dow
    CHECK ((day_of_week >= 0) AND (day_of_week <= 6)),
  /* Foreign keys */
  CONSTRAINT foreign_key_queue_id
    FOREIGN KEY (queue_id)
    REFERENCES public.queues(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) WITH (
    OIDS = FALSE
  );

ALTER TABLE public.queue_schedule
  OWNER TO smeans;  
  
  
  
  
-------------------------------------------------------------------------
--
-- wavs - contains wavs for firstinline
--
-------------------------------------------------------------------------    
  
DROP TABLE IF EXISTS public.wavs;

CREATE TABLE public.wavs (
  id             serial NOT NULL,
  "name"         varchar NOT NULL,
  "language"     varchar DEFAULT 'english'::character varying,
  talent         varchar DEFAULT 'unknown'::character varying,
  description    varchar,
  "text"         varchar,
  audio          bytea,
  creation_date  timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  last_update    timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  /* Keys */
  CONSTRAINT wavs_pkey
    PRIMARY KEY (id), 
  CONSTRAINT wavs_index
    UNIQUE ("name", "language", talent)
) WITH (
    OIDS = FALSE
  );

ALTER TABLE public.wavs
  OWNER TO smeans;  
  
  
  
-------------------------------------------------------------------------
--
-- announcements - contains announcements for firstinline
--
-------------------------------------------------------------------------      
  
DROP TABLE IF EXISTS public.announcements;

CREATE TABLE public.announcements (
  id            serial NOT NULL,
  ident         varchar NOT NULL,
  offer_vdn_id  integer,
  wav_id        integer,
  /* Keys */
  CONSTRAINT announcements_pkey
    PRIMARY KEY (id), 
  CONSTRAINT announcements_index_ident
    UNIQUE (ident, offer_vdn_id),
  /* Foreign keys */
  CONSTRAINT foreign_key_offer_vdn
    FOREIGN KEY (offer_vdn_id)
    REFERENCES public.offer_vdns(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) WITH (
    OIDS = FALSE
  );

ALTER TABLE public.announcements
  OWNER TO smeans;  
  
  
  
  
-------------------------------------------------------------------------
--
-- queue_stats - contains queue_stats for firstinline
--
-------------------------------------------------------------------------        
  
DROP TABLE IF EXISTS public.queue_stats;

CREATE TABLE public.queue_stats (
  id                           serial NOT NULL,
  "server"                     varchar NOT NULL,
  queue_id                     integer NOT NULL,
  ip_address                   varchar,
  state                        varchar,
  trying_callbacks				integer DEFAULT 0,
  pending_callbacks	  			integer DEFAULT 0,
  interval_offers_make			integer DEFAULT 0,
  interval_offers_accepted		integer DEFAULT 0,
  interval_offers_declined		integer DEFAULT 0,
  interval_calls_queued 		integer DEFAULT 0,
  interval_calls_delivered  	integer DEFAULT 0,
  interval_calls_abandoned  	integer DEFAULT 0,
  interval_callbacks_successful		integer DEFAULT 0,
  interval_callbacks_unsuccessful		integer DEFAULT 0,  
  agents_logged_in_max         integer DEFAULT 0,
  agents_logged_in_min         integer DEFAULT 0,
  agents_logged_in_avg         integer DEFAULT 0,
  agents_logged_in_num_values  integer DEFAULT 0,
  agents_ready_max             integer DEFAULT 0,
  agents_ready_min             integer DEFAULT 0,
  agents_ready_avg             integer DEFAULT 0,
  agents_ready_num_values      integer DEFAULT 0,
  ewt_max                      integer DEFAULT 0,
  ewt_min                      integer DEFAULT 0,
  ewt_avg                      integer DEFAULT 0,
  ewt_num_values               integer DEFAULT 0,
  wait_time_max                integer DEFAULT 0,
  wait_time_min                integer DEFAULT 0,
  wait_time_avg                integer DEFAULT 0,
  wait_time_num_values         integer DEFAULT 0,
  callback_wait_time_max       integer DEFAULT 0,
  callback_wait_time_min       integer DEFAULT 0,
  callback_wait_time_avg       integer DEFAULT 0,
  callback_wait_time_num_values integer DEFAULT 0,
  queue_size_max               integer DEFAULT 0,
  queue_size_min               integer DEFAULT 0,
  queue_size_avg               integer DEFAULT 0,
  queue_size_num_values        integer DEFAULT 0,
  interval_timestamp           timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  interval_duration            integer DEFAULT 0,
  /* Keys */
  CONSTRAINT queue_stats_pkey
    PRIMARY KEY (id)
) WITH (
    OIDS = FALSE
  );

ALTER TABLE public.queue_stats
  OWNER TO smeans;  
  
  
CREATE UNIQUE INDEX queue_stats_index_key
  ON public.queue_stats
  ("server", queue_id);
  

  
-------------------------------------------------------------------------
--
-- queue_stats_history - contains queue_stats_history for firstinline
--
-------------------------------------------------------------------------        
    
  
DROP TABLE IF EXISTS public.queue_stats_history;

CREATE TABLE public.queue_stats_history (
  id                           	bigserial NOT NULL,
  "server"                     	varchar NOT NULL,
  queue_id                     	integer,
  state                        	varchar,
  trying_callbacks				integer DEFAULT 0,
  pending_callbacks	  			integer DEFAULT 0,
  interval_offers_make			integer DEFAULT 0,
  interval_offers_accepted		integer DEFAULT 0,
  interval_offers_declined		integer DEFAULT 0,
  interval_calls_queued 		integer DEFAULT 0,
  interval_calls_delivered  	integer DEFAULT 0,
  interval_calls_abandoned  	integer DEFAULT 0,
  interval_callbacks_successful	integer DEFAULT 0,
  interval_callbacks_unsuccessful		integer DEFAULT 0,  
  agents_logged_in_max         	integer DEFAULT 0,
  agents_logged_in_min         	integer DEFAULT 0,
  agents_logged_in_avg         	integer DEFAULT 0,
  agents_logged_in_num_values  	integer DEFAULT 0,
  agents_ready_max             	integer DEFAULT 0,
  agents_ready_min             	integer DEFAULT 0,
  agents_ready_avg             	integer DEFAULT 0,
  agents_ready_num_values      	integer DEFAULT 0,
  ewt_max                      	integer DEFAULT 0,
  ewt_min                      	integer DEFAULT 0,
  ewt_avg                      	integer DEFAULT 0,
  ewt_num_values               	integer DEFAULT 0,
  wait_time_max                	integer DEFAULT 0,
  wait_time_min                	integer DEFAULT 0,
  wait_time_avg                	integer DEFAULT 0,
  wait_time_num_values         	integer DEFAULT 0,
  callback_wait_time_max        integer DEFAULT 0,
  callback_wait_time_min        integer DEFAULT 0,
  callback_wait_time_avg        integer DEFAULT 0,
  callback_wait_time_num_values integer DEFAULT 0,
  queue_size_max               	integer DEFAULT 0,
  queue_size_min               	integer DEFAULT 0,
  queue_size_avg               	integer DEFAULT 0,
  queue_size_num_values        	integer DEFAULT 0,
  interval_timestamp           	timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  interval_duration            	integer DEFAULT 0,
  /* Keys */
  CONSTRAINT queue_stats_history_pkey
    PRIMARY KEY (id)
) WITH (
    OIDS = FALSE
  );

CREATE INDEX queue_stats_history_index_timestamp
  ON public.queue_stats_history
  (interval_timestamp);

ALTER TABLE public.queue_stats_history
  OWNER TO smeans;  
  
  
  
-------------------------------------------------------------------------
--
-- fil_stats - contains fil_stats for firstinline
--
-------------------------------------------------------------------------        
      
  
  
  
DROP TABLE IF EXISTS public.fil_stats;

CREATE TABLE public.fil_stats (
  "server"            		varchar NOT NULL,
  ip_address          		varchar,
  state               		varchar,
  interval_timestamp  		timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  interval_duration   		integer DEFAULT 0,
  enabled_queues      		integer DEFAULT 0,
  offering_queues     		integer DEFAULT 0,
  trying_callbacks			integer DEFAULT 0,
  pending_callbacks	  		integer DEFAULT 0,
  interval_offers_make		integer DEFAULT 0,
  interval_offers_accepted	integer DEFAULT 0,
  interval_offers_declined	integer DEFAULT 0,
  interval_calls_queued 	integer DEFAULT 0,
  interval_calls_delivered  integer DEFAULT 0,
  interval_calls_abandoned  integer DEFAULT 0,
  interval_callbacks_successful	integer DEFAULT 0,
  interval_callbacks_unsuccessful	integer DEFAULT 0,
  db_latency_max      		integer DEFAULT 0,
  db_latency_min      		integer DEFAULT 0,
  db_latency_avg     		integer DEFAULT 0,
  db_num_values       		integer DEFAULT 0,
  /* Keys */
  CONSTRAINT fil_stats_pkey
    PRIMARY KEY ("server")
) WITH (
    OIDS = FALSE
  );

ALTER TABLE public.fil_stats
  OWNER TO smeans;  
  
  
  
-------------------------------------------------------------------------
--
-- fil_stats_history - contains fil_stats_history for firstinline
--
-------------------------------------------------------------------------        
      
  
  
DROP TABLE IF EXISTS public.fil_stats_history;

CREATE TABLE public.fil_stats_history (
  id                  		bigserial NOT NULL,
  interval_timestamp  		timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  interval_duration   		integer DEFAULT 0,
  "server"            		varchar NOT NULL,
  state               		varchar,
  enabled_queues       		integer DEFAULT 0,
  offering_queues     		integer DEFAULT 0,
  trying_callbacks			integer DEFAULT 0,
  pending_callbacks	  		integer DEFAULT 0,
  interval_offers_make		integer DEFAULT 0,
  interval_offers_accepted	integer DEFAULT 0,
  interval_offers_declined	integer DEFAULT 0,
  interval_calls_queued 	integer DEFAULT 0,
  interval_calls_delivered  integer DEFAULT 0,
  interval_calls_abandoned  integer DEFAULT 0,  
  interval_callbacks_successful	integer DEFAULT 0,
  interval_callbacks_unsuccessful	integer DEFAULT 0,
  db_latency_max      		integer DEFAULT 0,
  db_latency_min      		integer DEFAULT 0,
  db_latency_avg      		integer DEFAULT 0,
  db_num_values       		integer DEFAULT 0,
  /* Keys */
  CONSTRAINT fil_stats_history_pkey
    PRIMARY KEY (id)
) WITH (
    OIDS = FALSE
  );

CREATE INDEX fil_stats_history_index_timestamp
  ON public.fil_stats_history
  (interval_timestamp);

ALTER TABLE public.fil_stats_history
  OWNER TO smeans;  
  
  
-------------------------------------------------------------------------
--
-- callbacks - contains callbacks for firstinline
--
-------------------------------------------------------------------------        
       
	 
DROP TABLE IF EXISTS public.callbacks;

CREATE TABLE public.callbacks (
  id                        serial NOT NULL,
  queue_id                  integer,
  state            			varchar,
  "server"					varchar,
  call_back_uri				varchar NOT NULL,
  from_uri					varchar,
  offer_vdn           		varchar,
  offer_session_id          varchar,
  offer_dnis            	varchar,
  offer_ani                 varchar,
  offer_ucid                varchar,
  offer_uui                 varchar,
  offer_ewt                 integer,
  offer_time        		timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  name_audio             	bytea,
  time_entered_queue  		timestamp WITHOUT TIME ZONE,
  time_exited_queue   		timestamp WITHOUT TIME ZONE,
  wait_time           		integer DEFAULT 0,  
  attempts                	integer,
  callback_request_ids    	varchar[],
  callback_times           	timestamp WITHOUT TIME ZONE[],
  callback_durations       	interval[],
  callback_results         	varchar[],
  next_attempt_time       	timestamp WITHOUT TIME ZONE,
  earliest_attempt_time   	timestamp WITHOUT TIME ZONE,
  expiration_time         	timestamp WITHOUT TIME ZONE,
  noresource_retry_count	integer DEFAULT 0,
  application_data        	varchar,   
  last_update               timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
 
  /* Keys */
  CONSTRAINT callbacks_pkey
    PRIMARY KEY (id),
  /* Foreign keys */
  CONSTRAINT foreign_key_queue_id
    FOREIGN KEY (queue_id)
    REFERENCES public.queues(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) WITH (
    OIDS = FALSE
  );

ALTER TABLE public.callbacks
  OWNER TO smeans;  
  
  
  
  
  
  
  
  
-------------------------------------------------------------------------
--
-- queue_history - contains queue_history for firstinline
--
-------------------------------------------------------------------------          
  
DROP TABLE IF EXISTS public.queue_history;

CREATE TABLE public.queue_history (
  id                  bigserial NOT NULL,
  "server"            varchar,
  queue_id            integer NOT NULL,
  calling_number      varchar,
  called_number       varchar,
  vdn                 varchar,
  ucid                varchar,
  uui                 varchar,
  ewt                 integer DEFAULT 0,
  entry_period		  integer DEFAULT 0,
  calls_in_queue      integer DEFAULT 0,
  exit_period         integer DEFAULT 0,
  exit_max_period     integer DEFAULT 0,
  exit_min_period     integer DEFAULT 0,
  exit_avg_period     integer DEFAULT 0,
  agent_count		  integer DEFAULT 0,
  time_entered_queue  timestamp WITHOUT TIME ZONE,
  time_exited_queue   timestamp WITHOUT TIME ZONE,
  wait_time           integer DEFAULT 0,
  reason              varchar,
  call_type           varchar,
  /* Keys */
  CONSTRAINT queue_history_pkey
    PRIMARY KEY (id)
) WITH (
    OIDS = FALSE
  );

ALTER TABLE public.queue_history
  OWNER TO smeans;
  
  
CREATE INDEX queue_history_index_queue
  ON public.queue_history
  (queue_id); 
 
CREATE INDEX queue_history_index_ucid
  ON public.queue_history
  (ucid);

CREATE INDEX queue_history_index_call_time
  ON public.queue_history
  (time_entered_queue);  
  
CREATE INDEX queue_history_index_vdn
  ON public.queue_history
  (vdn);
  
-------------------------------------------------------------------------
--
-- offer_history - contains queue_history for firstinline
--
-------------------------------------------------------------------------    
 		  
  
DROP TABLE IF EXISTS public.offer_history;

CREATE TABLE public.offer_history (
  id             bigserial NOT NULL,
  queue_id       integer,
  "server"       varchar,
  call_back_uri  varchar,
  vdn            varchar,
  session_id     varchar,
  dnis           varchar,
  ani            varchar,
  ucid           varchar,
  ewt            integer,
  call_time      timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  reason         varchar,
  status         varchar,
  call_status    varchar,
  result         varchar,
  /* Keys */
  CONSTRAINT offer_history_pkey
    PRIMARY KEY (id),
  /* Foreign keys */
  CONSTRAINT foreign_key_queue_id
    FOREIGN KEY (queue_id)
    REFERENCES public.queues(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) WITH (
    OIDS = FALSE
  );

  
ALTER TABLE public.offer_history
  OWNER TO smeans;  
    
CREATE INDEX offer_history_index_queue
  ON public.offer_history
  (queue_id);
  
CREATE INDEX offer_history_index_call_time
  ON public.offer_history
  (call_time);
  
CREATE INDEX offer_history_index_vdn
  ON public.offer_history
  (vdn);
  
CREATE INDEX offer_history_index_ucid
  ON public.offer_history
  (ucid);
  


-------------------------------------------------------------------------
--
-- queue_history - contains queue_history for firstinline
--
-------------------------------------------------------------------------          
  
DROP TABLE IF EXISTS public.callback_history;

CREATE TABLE public.callback_history (
  id                  	bigserial NOT NULL,
  queue_id           	integer,
  state            	 	varchar,
  "server"				varchar,
  call_back_uri			varchar NOT NULL,
  from_uri				varchar,
  offer_vdn           	varchar,
  offer_session_id      varchar,
  offer_dnis            varchar,
  offer_ani             varchar,
  offer_ucid            varchar,
  offer_uui             varchar,
  offer_ewt             integer,
  offer_time       		timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  time_entered_queue  	timestamp WITHOUT TIME ZONE,
  time_exited_queue   	timestamp WITHOUT TIME ZONE,
  wait_time           	integer,
  callback_wait_time   	integer,
  attempts              integer,
  callback_request_ids  varchar[],
  callback_times        timestamp WITHOUT TIME ZONE[],
  callback_durations    interval[],
  callback_results      varchar[],
  earliest_attempt_time  timestamp WITHOUT TIME ZONE,
  expiration_time       timestamp WITHOUT TIME ZONE,
  callback_completion_time	timestamp WITHOUT TIME ZONE,
  callback_ucid			varchar,
  callback_status       varchar,
  callback_call_status  varchar,
  noresource_retry_count	integer DEFAULT 0,
  application_data      varchar,
  application_result	varchar,
 
  /* Keys */
  CONSTRAINT callback_history_pkey
    PRIMARY KEY (id)
) WITH (
    OIDS = FALSE
  );

ALTER TABLE public.callback_history
  OWNER TO smeans;
    
  
CREATE INDEX callback_history_index_queue
  ON public.callback_history
  (queue_id);
  
CREATE INDEX callback_history_index_completion
  ON public.callback_history
  (callback_completion_time);
    
CREATE INDEX callback_history_index_offer_ucid
  ON public.callback_history
  (offer_ucid);
  

CREATE INDEX callback_history_index_callback_ucid
  ON public.callback_history
  (callback_ucid);  
  
  
  

  
CREATE TYPE public.queue_aggregated_data AS (
  queue_id  				integer,
  name						varchar,
  mode						varchar,
  state						varchar,
  time_period				varchar,
  callers_in_queue  		integer,
  callbacks_pending  		integer,
  callbacks_trying  		integer,
  ewt  						integer,
  num_agents  				integer,
  offers_made  				integer,
  offers_accepted  			integer,
  offers_declined  			integer,
  callbacks_successful  	integer,
  callbacks_unsuccessful  	integer,
  queue_calls_received  	integer,
  queue_calls_delivered  	integer,
  queue_calls_abandoned  	integer,
  interval_timestamp		timestamp WITHOUT TIME ZONE,
  stats_age					interval	
);

ALTER TYPE public.queue_aggregated_data
  OWNER TO smeans;
  
  
  

  
-------------------------------------------------------------------------
--
-- queue_summary_stats - misc campaign stats
--
-------------------------------------------------------------------------  
DROP TABLE IF EXISTS public.queue_summary_stats; 
  
CREATE TABLE public.queue_summary_stats (
  queue_id		  	  integer,
  stat_name       	  varchar NOT NULL,
  all_value           integer DEFAULT 0,
  all_reset   		  timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  monthly_value       integer DEFAULT 0,
  monthly_reset   	  timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  weekly_value        integer DEFAULT 0,
  weekly_reset     	  timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  daily_value         integer DEFAULT 0,
  daily_reset   	  timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  last_update         timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,  
  /* Keys */
  CONSTRAINT queue_summary_stats_pkey
    PRIMARY KEY (queue_id,stat_name)
) WITH (
    OIDS = FALSE
  );

ALTER TABLE public.queue_summary_stats
  OWNER TO smeans;  
  
    
  
  
  
  
  
  