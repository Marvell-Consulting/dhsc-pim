alter table gmdn_category_term_link add column isLeafCategory integer;

-- Find all terms T in category C with parent category Cp that also has term T
create temporary table inherited_terms
as select ctl_c.termCode as termCode,
          c.nodeID as childNodeID, c.categoryCode as childCategoryCode,
          cp.nodeID as parentNodeID, cp.categoryCode as parentCategoryCode
   from gmdn_category_term_link ctl_c,
        gmdn_category_term_link ctl_cp,
        gmdn_category c,
        gmdn_category cp
   where c.parentNodeID = cp.nodeID
     and ctl_c.categoryCode = c.categoryCode
     and ctl_cp.categoryCode = cp.categoryCode
     and ctl_c.termCode = ctl_cp.termCode;

create index inherited_terms_idx on inherited_terms(parentCategoryCode,termCode);

-- For each term T in category C with parent category Cp, remove leaf status for term T from Cp
update gmdn_category_term_link
   set isLeafCategory =
         (select count(*) from inherited_terms
           where inherited_terms.parentCategoryCode = gmdn_category_term_link.categoryCode
             and inherited_terms.termCode = gmdn_category_term_link.termCode) = 0;


-- To manually test the above logic, pick a termName and shove it into this
-- query, then eyeball to see if it looks like the non-leaf categories are all
-- ones that have a leaf category somewhere beneath them:

-- select c.name, c.path, ctl.isLeafCategory
-- from gmdn_category c, gmdn_category_term_link ctl
-- where c.categoryCode = ctl.categoryCode
--   and ctl.termCode = (select termCode from gmdn_term where termName = 'Ice bag')
-- order by c.path;
