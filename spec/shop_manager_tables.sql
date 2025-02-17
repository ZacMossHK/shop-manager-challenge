-- Create the table without the foreign key first.
CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  name text,
  unit_price decimal(10,2),
  quantity int
);

-- Then the table with the foreign key first.
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_name text,
  date_ordered date,
-- The foreign key name is always {other_table_singular}_id
  item_id int,
  constraint fk_item foreign key(item_id)
    references items(id)
    on delete cascade
);
