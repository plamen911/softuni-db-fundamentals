ALTER TABLE minions ADD town_id INT;
ALTER TABLE minions
  ADD CONSTRAINT minions_towns_id_fk
FOREIGN KEY (town_id) REFERENCES towns (id);