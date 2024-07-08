attach database '../gmdn/gmdn.sqlite' as gmdn;

CREATE TABLE gmdn_term AS SELECT * FROM gmdn.gmdn_term;
CREATE UNIQUE INDEX gmdn_term_code ON gmdn_term(termCode);
CREATE TABLE gmdn_category AS SELECT * FROM gmdn.gmdn_category;
CREATE UNIQUE INDEX gmdn_category_nodeID ON gmdn_category(nodeID);
CREATE TABLE gmdn_category_term_link AS SELECT * FROM gmdn.gmdn_category_term_link;
CREATE INDEX gmdn_category_term_link_category ON gmdn_category_term_link(categoryCode);
CREATE INDEX gmdn_category_term_link_term ON gmdn_category_term_link(termCode);

