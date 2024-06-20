alter table gmdn_category add column topLevelNodeID string;

-- Find the highest-level category above every category

update gmdn_category as c
   set topLevelNodeID =
       (select nodeID
          from gmdn_category as cp
         where c.path like '/' || cp.nodeID || '/%');

-- Debug query, to list all top-level categories and how many categories are under them (excluding themselves)
-- select nodeID, name, (select count(*) from gmdn_category where topLevelNodeID = pc.nodeID and parentNodeID is not null) as categories
--   from gmdn_category pc
--  where parentNodeID is null
--  order by nodeID;
