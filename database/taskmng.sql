CREATE TABLE "BinaryInput" (
	id_job int8 NOT NULL,
	"data" bytea NULL,
	CONSTRAINT "BinaryInput_pkey" PRIMARY KEY (id_job)
);

CREATE TABLE "Input" (
	id_job int8 NOT NULL,
	"data" text NULL,
	CONSTRAINT "Input_pkey" PRIMARY KEY (id_job)
);

CREATE TABLE "Job" (
	id_job bigserial NOT NULL,
	id_task int8 NOT NULL,
	state int4 NOT NULL,
	priority int4 NULL,
	info text NULL,
	time_ping timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "Job_pkey" PRIMARY KEY (id_job)
);

CREATE TABLE "Output" (
	id_job int8 NOT NULL,
	"data" bytea NULL,
	CONSTRAINT "Output_pkey" PRIMARY KEY (id_job)
);

CREATE TABLE "Result" (
	id_task int8 NOT NULL,
	"data" bytea NULL,
	CONSTRAINT "Result_pkey" PRIMARY KEY (id_task)
);

CREATE TABLE "Task" (
	id_task bigserial NOT NULL,
	state int4 NOT NULL,
	priority int4 NULL,
	info text NULL,
	time_ping timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "Task_pkey" PRIMARY KEY (id_task)
);