% First combined row and column model

include "alldifferent.mzn";
include "inverse.mzn";


int: n; % Number of queens
array [1..n] of var 1..n: rows; % Variables for queens on the rows
array [1..n] of var 1..n: cols; % Variables for queens on the columns

% Column attack constraints using the alldifferent constraint from both models
% Append ::domain to the end.  
% constraint alldifferent(rows)::domain_propagation;
% constraint alldifferent(cols)::domain_propagation;

% Diagonal attack constraints from both models
constraint forall( i, j in 1..n where i < j )( abs( rows[i] - rows[j] ) != abs( i - j ) );
% constraint forall( i, j in 1..n where i < j )( abs( cols[i] - cols[j] ) != abs( i - j ) );

% Channeling constraint
constraint inverse(rows, cols);

% Search for all solutions, using N = 8, 9, 10, and 12.
solve satisfy;