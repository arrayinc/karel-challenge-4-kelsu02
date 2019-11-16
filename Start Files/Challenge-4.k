/* File: Challenge-4.k
 ---------------------------
Generalize the program you wrote in Challenge 3 so that Karel
is able to climb a stair-step mountain of any height and place
a flag on its top.

Thus, in addition to climbing the mountain in that exercise,
it should be able to scale a molehill or Mount Everest. 
*/
import "turns";

function moveToWall(){
	while (frontIsClear()) {
		move();
	}
}

function leftMove() {
	turnLeft();
	move();
}

function rightMove() {
	turnRight();
	move();
}

function climbStairs() {
	while (frontIsBlocked()) {
		leftMove();
		rightMove();
	}
}

function plantFlag() {
	putBeeper();
}

function descendStairs() {
	while (frontIsClear()) {
		move();
		if (frontIsClear()) {
			rightMove();
			turnLeft();
		}
	}
}

function climbMountain() {
	climbStairs();
	plantFlag();
	descendStairs();
}

function Solve() {
	while (leftIsClear()) {
		moveToWall();
		leftMove();
		if (rightIsClear()) {
			turnRight();
			moveToWall();
			climbMountain();
		} else {
			turnAround();
		}
	}
	move();
	turnLeft();
}
