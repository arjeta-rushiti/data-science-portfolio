/* 
QUESTION 1: What are the target types and how many compounds have been tested against each 
			target type associated with liver diseases in humans?
*/

CREATE VIEW liver_target_compound_count AS         -- create a new view 
SELECT td.target_type, 							   -- select colums
	COUNT(DISTINCT act.molregno) AS num_compounds  -- count of distinct compounds 
FROM target_dictionary td                          -- source table
JOIN assays ass ON td.tid = ass.tid				   -- join tables
JOIN activities act ON ass.assay_id = act.assay_id 
WHERE ass.description LIKE '%liver%'			   -- filter results
GROUP BY td.target_type							   -- group results 
ORDER BY num_compounds DESC;					   -- order results descending	

/*
QUESTION 2: What is the distribution of activities for compounds targeting the top 5 most 
			frequent targets associated with liver diseases, and how does this distribution 
			vary by target type?
*/

-- Count NULL entries in activity data
SELECT COUNT(*) AS count
FROM activities
WHERE standard_value IS NULL;   	-- filter NULL entries

-- Distribution of NULL entries across target types
SELECT td.target_type, 
       COUNT(act.molregno) AS num_compounds,
       COUNT(act.standard_value) AS compounds_with_activity,
       COUNT(CASE WHEN act.standard_value IS NULL THEN 1 END) AS compounds_with_null_activity
FROM target_dictionary td
JOIN assays ass ON td.tid = ass.tid
JOIN activities act ON ass.assay_id = act.assay_id
WHERE ass.description LIKE '%liver%'
GROUP BY td.target_type
ORDER BY num_compounds DESC;

-- Subquery (selecting the top 5 target types) for the main SELECT query below
SELECT target_type                                  -- select columns	
FROM target_dictionary td                           -- source table
JOIN assays ass ON td.tid = ass.tid                 -- join tables
JOIN activities act ON ass.assay_id = act.assay_id  
WHERE ass.description LIKE '%liver%'                -- filter results
GROUP BY target_type                                -- group results 
ORDER BY COUNT(DISTINCT act.molregno) DESC          -- order count descending 
LIMIT 5;                                            -- limit: top 5 results 

-- Main SQL query for question 2
SELECT td.target_type, td.pref_name,
       COUNT(DISTINCT act.molregno) AS num_compounds,
       COALESCE(MIN(act.standard_value), 0) AS min_activity,	-- calc. minimum activity value
       COALESCE(MAX(act.standard_value), 0) AS max_activity, 	-- calc. maximum activity value
       COALESCE(AVG(act.standard_value), 0) AS avg_activity,	-- calc. average activity value
       COALESCE(STDDEV(act.standard_value), 0) AS std_activity	-- calc. standard deviation 
FROM target_dictionary td
JOIN assays ass ON td.tid = ass.tid
JOIN activities act ON ass.assay_id = act.assay_id
WHERE ass.description LIKE '%liver%'
  AND act.standard_value IS NOT NULL				-- filter NULL entries
  AND td.target_type IN (							-- filter within top 5 targets 
	  SELECT target_type							-- start of subquery
      FROM target_dictionary
      JOIN assays ON target_dictionary.tid = assays.tid
      JOIN activities ON assays.assay_id = activities.assay_id
      WHERE assays.description LIKE '%liver%'
      GROUP BY target_type
      ORDER BY COUNT(DISTINCT activities.molregno) DESC
      LIMIT 5
  )													-- end of subquery
GROUP BY td.target_type, td.pref_name
ORDER BY td.target_type ASC, avg_activity DESC;


