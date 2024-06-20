.mode line

select gmdn_category.path, gmdn_category.categoryCode, gmdn_category.name, gmdn_category.definition,
       (select group_concat(gmdn_term.termName, ' | ')
          from gmdn_term, gmdn_category_term_link
         where gmdn_term.termCode = gmdn_category_term_link.termCode
           and gmdn_category_term_link.isLeafCategory = 1
           and gmdn_category_term_link.categoryCode = gmdn_category.categoryCode) as gmdn_leaf_terms,
       (select group_concat(gmdn_term.termName, ' | ')
          from gmdn_term, gmdn_category_term_link
         where gmdn_term.termCode = gmdn_category_term_link.termCode
           and gmdn_category_term_link.isLeafCategory <> 1
           and gmdn_category_term_link.categoryCode = gmdn_category.categoryCode) as gmdn_nonleaf_terms
from gmdn_category
group by gmdn_category.path, gmdn_category.categoryCode, gmdn_category.name, gmdn_category.definition
order by gmdn_category.path;
