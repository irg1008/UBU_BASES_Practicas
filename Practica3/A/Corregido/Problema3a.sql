DROP TABLE IF EXISTS A, B, C, D, E, F, G CASCADE;

/**
	Práctica: 3.a
	Autor: Iván Ruiz Gázquez

	Aclaraciones: Solución de una tabla por elemento de la ISA.
	El supertipo con sus atributos y la PK, y los supertipos
	con la PK del padre y los atributos de cada uno.

	ISA: Solapada Total
	c1<-R1->c2: (0, n)<--->(1, 1)
	c3<-R2->c4: (0, n)<--->(0, 1)
	c5<-R3->c6: (1, 1)<--->(0, n)
	c7<-R4->c8: (1, 1)<--->(0, 1)
	c9<-R5->c10: (1, 1)<-=>(0, n)
*/

CREATE TABLE D (
	d1 INTEGER PRIMARY KEY,
	d2 INTEGER
);

CREATE TABLE A (
	a1 INTEGER PRIMARY KEY,
	a2 INTEGER,
	d1 INTEGER NOT NULL REFERENCES D
);

CREATE TABLE B (
	b1 INTEGER NOT NULL,
	b2 INTEGER,
	a1 INTEGER PRIMARY KEY REFERENCES A
);

CREATE TABLE C (
	c1 INTEGER,
	c2 INTEGER,
	a1 INTEGER PRIMARY KEY REFERENCES A
);

CREATE TABLE E (
	e1 INTEGER PRIMARY KEY,
	e2 INTEGER,
	a1 INTEGER NOT NULL REFERENCES C
);

ALTER TABLE A
ADD e1 INTEGER REFERENCES E;

CREATE TABLE F (
	f1 INTEGER,
	f2 INTEGER,
	a1 INTEGER REFERENCES B,
	PRIMARY KEY(a1, f1)
);

CREATE TABLE G (
	g1 INTEGER PRIMARY KEY,
	g2 INTEGER,
	a1 INTEGER UNIQUE NOT NULL REFERENCES C
);
