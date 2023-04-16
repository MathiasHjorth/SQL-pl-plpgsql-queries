--Et partial index hvor det kun er gender='m' i indekset forbedrer
--performance lidt ekstra, i forhold til det normale indeks
CREATE INDEX idx_partial_gender_m ON name (gender) WHERE gender = 'm'