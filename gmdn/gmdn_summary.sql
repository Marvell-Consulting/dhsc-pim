.mode table
.header on

select 'Top-level categories' AS section;
-- select '';

select a.name, a.definition, (select count(distinct termCode) from gmdn_category_term_link where gmdn_category_term_link.categoryCode = a.categoryCode) as terms, (select count(*) from gmdn_category as b where b.path like a.path || '%' and b.path <> a.path) as subcategories
from gmdn_category as a
where parentNodeID is null
order by name;

-- select '';
select 'Second-level categories' AS section;
-- select '';

select a.name AS parent, b.name AS name, (select count(distinct termCode) from gmdn_category_term_link where gmdn_category_term_link.categoryCode = b.categoryCode) as terms
from gmdn_category a
 left outer join gmdn_category b ON b.parentNodeID = a.nodeID
where a.parentNodeID is null
order by a.name;

select 'Longest path' AS section;

select path, name
from gmdn_category
where nodeid in ('4941','5035','10238','10339','10340','10356','10357','10358')
order by length(path) asc;

select 'Small-cardinality top-level categories';

with
 tlcs as (select a.path, a.name,
           (select count(*) from gmdn_category as b where b.path like a.path || '%' and b.path <> a.path) as subcategories
          from gmdn_category as a
          where parentNodeID is null),
 small_tlcs as (select a.path, a.name from tlcs as a where subcategories < 20),
 subcategories as (select a.name as top_level_category, b.path as path, b.name as name
                   from small_tlcs as a, gmdn_category as b
                   where b.path like a.path || '%' and b.path <> a.path)
select * from subcategories order by path;

select 'Stats' as section;

.mode line

with
  x as (select termCode, count(distinct categoryCode) as c from gmdn_category_term_link group by termCode)
select min(c) as 'Fewest categories for a term',
       max(c) as 'Most categories for a term',
       avg(c) as 'Average categories per term',
       (select count(distinct categoryCode) from gmdn_category_term_link) as 'Total categories',
       (select count(distinct termCode) from gmdn_category_term_link) as 'Total terms'
 from x;
