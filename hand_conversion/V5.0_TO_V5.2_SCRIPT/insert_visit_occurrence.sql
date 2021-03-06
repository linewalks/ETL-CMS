-- 
-- insert_visit_occurrence.sql
--
--  This is the insert for visit_occurrence generated by synpuf_etl.sql.  
--  Some values were hardcoded based on release notes and discussions with Claire & Erica. 
--


insert into cdm_synpuf_v667.dbo.visit_occurrence with (tablock) ( 
visit_end_date, 
visit_occurrence_id, 
person_id, 
visit_concept_id, 
visit_start_date, 
visit_type_concept_id, 
provider_id, 
care_site_id, 
visit_source_value, 
visit_source_concept_id, 
admitting_source_concept_id, 
admitting_source_value, 
discharge_to_concept_id, 
discharge_to_source_value, 
preceding_visit_occurrence_id, 
visit_start_datetime, 
visit_end_datetime
)
select visit_end_date, 
visit_occurrence_id, 
person_id, 
visit_concept_id, 
visit_start_date, 
visit_type_concept_id, 
provider_id, 
care_site_id, 
visit_source_value, 
visit_source_concept_id, 
0, -- admitting_source_concept_id, 
NULL, -- admitting_source_value, 
0, -- discharge_to_concept_id, 
NULL, -- discharge_to_source_value, 
lag(visit_occurrence_id)over(partition by person_id order by visit_occurrence_id), -- preceding_visit_occurrence_id, 
NULL, -- visit_start_datetime, 
NULL  -- visit_end_datetime
from cdm_synpuf_v665.dbo.visit_occurrence;
