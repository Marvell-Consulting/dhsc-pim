CREATE TABLE gmdn_term (
       termCode string primary key,
       termName string,
       termDefinition string,
       termStatus string,
       termIsIVD string,
       createdDate string,
       modifiedDate string,
       obsoletedDate string
);

CREATE TABLE gmdn_category (
       nodeID string,
       categoryCode string,
       path string,
       name string,
       definition string
);

CREATE TABLE gmdn_category_term_link (
       categoryCode string,
       termCode string
);
