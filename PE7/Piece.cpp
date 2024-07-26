#include "Piece.h"


/****************************************************/
/****               *** PIECE ***                ****/

/* Contsructor : initializes <edges> of the object to the those given in the
   argument. The edges given in the argument array should be cloned first,
   and its clones should be reserved, not the edges themselves.
   Note that the ordering of the given edges will always be as follows:
   edges[0]: Left side edge, 
   edges[1]: Bottom side edge, 
   edges[2]: Right side edge, 
   edges[3]: Top side edge.
*/
Piece::Piece(Edge* edg[4]) {
    // TODO
    this->edges[0] = edg[0];
    this->edges[1] = edg[1];
    this->edges[2] = edg[2];
    this->edges[3] = edg[3];
}

/* Destructor  : It should destruct its edges too.
*/
Piece::~Piece() {
    // TODO
    delete[] edges;
}

/* Copy constructor : Apply deep copy.
*/
Piece::Piece(const Piece& piece) {
    // TODO
    this->edges[0] = piece.edges[0];
    this->edges[1] = piece.edges[1];
    this->edges[2] = piece.edges[2];
    this->edges[3] = piece.edges[3];
}

// This is already implemented for you, do NOT change it!
ostream& operator<< (ostream& os, const Piece& piece) {

	for (int i = 0; i < 4; i++)
		os << piece.edges[i]->getId() << "  \n";
	return os;
}
