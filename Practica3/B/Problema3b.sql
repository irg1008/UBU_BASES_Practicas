DROP TABLE IF EXISTS A, D, E, F, G, R2 CASCADE;

/**
	Práctica: 3.b
	Autor: Iván Ruiz Gázquez

	Aclaraciones: Solución por tabla única con discriminantes y checks.

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
	d1 INTEGER NOT NULL REFERENCES D,
	b1 INTEGER,
	b2 INTEGER,
	c1 INTEGER,
	c2 INTEGER,
	tipo CHAR(2) NOT NULL CHECK(tipo IN ('B', 'C', 'BC')),
		CHECK(
			(tipo='B'
			AND b1 is NOT NULL
			AND c1 is NULL
			AND c2 is NULL)
			OR
			(tipo='C'
			AND b1 is NULL
			AND b2 is NULL)
			OR
			(tipo='BC'
			AND b1 is NOT NULL)
		)
);

CREATE TABLE E (
	e1 INTEGER PRIMARY KEY,
	e2 INTEGER,
	a1 INTEGER NOT NULL REFERENCES A
);

CREATE TABLE F (
	f1 INTEGER,
	f2 INTEGER,
	a1 INTEGER REFERENCES A,
	r5_a1 INTEGER NOT NULL REFERENCES A,
	PRIMARY KEY(a1, f1)
);

CREATE TABLE G (
	g1 INTEGER PRIMARY KEY,
	g2 INTEGER,
	a1 INTEGER UNIQUE NOT NULL REFERENCES A
);

CREATE TABLE R2 (
	a1 INTEGER PRIMARY KEY REFERENCES A,
	e1 INTEGER REFERENCES E
);
