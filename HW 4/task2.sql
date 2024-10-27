-- Insert the vet event for Fluffy
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');

-- Insert the vet event for Hammy
-- Also, add Hammy to the petPet table since Hammy was not previously recorded
INSERT INTO petPet (petname, owner_, species, gender, birth, death)
VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL);

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');


-- Update: Fluffy had 5 kittens, 2 of which are male
-- Since there is no table to track offspring, this would be a note in petEvent
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy', CURDATE(), 'birth', '5 kittens (2 male)');

-- Claws broke a rib on 1997-08-03
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Claws', '1997-08-03', 'injury', 'broke rib');

-- Puffball died on 2020-09-01
UPDATE petPet
SET death = '2020-09-01'
WHERE petname = 'Puffball';

-- Harold asked to remove his dog from the database (GDPR)
DELETE FROM petEvent WHERE petname IN (SELECT petname FROM petPet WHERE owner_ = 'Harold');



DELETE FROM petPet WHERE owner_ = 'Harold';
