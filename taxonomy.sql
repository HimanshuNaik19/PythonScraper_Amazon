-- 1) Tiger Taxonomy --
SELECT COUNT(*)
FROM taxonomy
WHERE species LIKE 'Panthera tigris%';
-- output - 8 --
SELECT ncbi_id
FROM taxonomy
WHERE species = 'Panthera tigris';
-- output - 0/9695 --

-- 2) Tiger Taxonomy --
--  rfam_acc ,  clan_acc ,  ncbi_id , rfamseq_acc , pmid , motif_id --
-- these are the columns that can be used to connect the tables in the given database. --

-- 3) Longest Rice DNA Sequence --
SELECT T2.species
FROM rfamseq AS T1
INNER JOIN taxonomy AS T2 ON T1.ncbi_id = T2.ncbi_id
WHERE T2.species LIKE 'Oryza%'
ORDER BY T1.length DESC
LIMIT 1;
-- #,species
-- 1,Oryza granulata

-- 4) Pagination Query
SELECT f.rfam_acc,f.rfam_id AS family_name,MAX(rs.length) AS max_length
FROM family AS f
JOIN full_region AS fr ON f.rfam_acc = fr.rfam_acc
JOIN rfamseq AS rs ON fr.rfamseq_acc = rs.rfamseq_acc
GROUP BY f.rfam_acc,family_name
HAVING max_length > 1000000
ORDER BY max_length DESC
LIMIT 15
OFFSET 120;
-- output is in the attached screenshot