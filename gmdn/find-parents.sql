-- alter table gmdn_category drop column parentNodeID string;

alter table gmdn_category add column parentNodeID string;

update gmdn_category
set parentNodeID = (select pgc.nodeID from gmdn_category as pgc where pgc.path = substring(gmdn_category.path, 1, length (gmdn_category.path)-length(gmdn_category.nodeID)-1));

