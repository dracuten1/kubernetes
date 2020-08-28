-- public."BinaryInput" definition

-- Drop table

-- DROP TABLE public."BinaryInput";

CREATE TABLE public."BinaryInput" (	id_task int8 NOT NULL,	"data" bytea NULL,	"type" int4 NOT NULL,	CONSTRAINT "BinaryInput_pkey" PRIMARY KEY (id_task));
-- public."Input" definition

-- Drop table

-- DROP TABLE public."Input";

CREATE TABLE public."Input" (id_task int8 NOT NULL,"data" text NULL,	"type" text NULL,	CONSTRAINT "Input_pkey" PRIMARY KEY (id_task));
-- public."Result" definition

-- Drop table

-- DROP TABLE public."Result";

CREATE TABLE public."Result" (	id_task int8 NOT NULL,	"data" bytea NULL,	"type" int4 NOT NULL,	CONSTRAINT "Result_pkey" PRIMARY KEY (id_task));
-- public."Task" definition

-- Drop table

-- DROP TABLE public."Task";

CREATE TABLE public."Task" (	has_input bool NULL DEFAULT false,	has_result bool NULL DEFAULT false,	id_task bigserial NOT NULL,	state int4 NOT NULL,	"type" int4 NOT NULL,	priority int4 NULL,	info text NULL,	time_ping timestamp NULL DEFAULT CURRENT_TIMESTAMP,	CONSTRAINT "Task_pkey" PRIMARY KEY (id_task));