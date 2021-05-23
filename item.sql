

INSERT INTO `items` (name, label) VALUES
  ('meat','Meat'),
  ('meat2star','2 Star Meat'),
  ('meat3star','3 Star Meat'),
  ('meat4star','4 Star Meat'),
  ('meat5star','5 Star Meat'),
  ('leather', 'Leather'),
  ('leather2star', '2 Star Leather'),
  ('leather3star', '3 Star Leather'),
  ('leather4star', '4 Star Leather'),
  ('leather5star', '5 Star Leather')        
;


-- Weight for previous version 1.2/V1 final?
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
  ('meat','Meat', 1, 0, 1),
  ('meat2star','2 Star Meat', 1, 0, 1),
  ('meat3star','3 Star Meat', 1, 0, 1),
  ('meat4star','4 Star Meat', 1, 0, 1),
  ('meat5star','5 Star Meat', 1, 0, 1),
  ('leather', 'Leather', 1, 0, 1),
  ('leather2star', '2 StarLeather', 1, 0, 1),
  ('leather3star', '3 Star Leather', 1, 0, 1),
  ('leather4star', '4 Star Leather', 1, 0, 1),
  ('leather5star', '5 Star Leather', 1, 0, 1)
;


-- Add limit 1.1
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
  ('meat','Meat', 10, 0, 1),
  ('meat2star','2 StarMeat', 10, 0, 1),
  ('meat3star','3 Star Meat', 10, 0, 1),
  ('meat4star','4 Star Meat', 10, 0, 1),
  ('meat5star','5 Star Meat', 10, 0, 1),
  ('leather', 'Leather', 10, 0, 1),
  ('leather2star', '2 StarLeather', 10, 0, 1),
  ('leather3star', '3 Star Leather', 10, 0, 1),
  ('leather4star', '4 Star Leather', 10, 0, 1),
  ('leather5star', '5 Star Leather', 10, 0, 1)  
;


-- Linden Inv + Legacy
INSERT INTO `items` (`name`, `label`, `weight`, `can_remove`, `stackable`, `closeonuse`, `description`) VALUES
  ('meat','Meat', 799, 1, 0, 1, NULL),
  ('meat2star','2 Star Meat', 799, 1, 0, 1, NULL),
  ('meat3star','3 Star Meat', 799, 1, 0, 1, NULL),
  ('meat4star','4 Star Meat', 799, 1, 0, 1, NULL),
  ('meat5star','5 Star Meat', 799, 1, 0, 1, NULL),
  ('leather', 'Leather', 799, 1, 0, 1, NULL),
  ('leather2star', '2 StarLeather', 799, 1, 0, 1, NULL),
  ('leather3star', '3 Star Leather', 799, 1, 0, 1, NULL),
  ('leather4star', '4 Star Leather', 799, 1, 0, 1, NULL),
  ('leather5star', '5 Star Leather', 799, 1, 0, 1, NULL)
;