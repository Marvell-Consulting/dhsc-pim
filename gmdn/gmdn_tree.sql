.mode line

select gmdn_category.path, gmdn_category.categoryCode, gmdn_category.name, gmdn_category.definition,
       group_concat (gmdn_term.termName) AS gmdn_terms
from gmdn_category
     left outer join gmdn_category_term_link on gmdn_category.categoryCode = gmdn_category_term_link.categoryCode
     left outer join gmdn_term on gmdn_category_term_link.termCode = gmdn_term.termCode
group by gmdn_category.path, gmdn_category.categoryCode, gmdn_category.name, gmdn_category.definition;
