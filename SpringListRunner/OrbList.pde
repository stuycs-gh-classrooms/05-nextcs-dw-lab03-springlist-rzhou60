/*===========================
  OrbList (ALL WORK GOES HERE)

  Class to represent a Linked List of OrbNodes.

  Instance Variables:
    OrbNode front:
      The first element of the list.
      Initially, this will be null.

  Methods to work on:
    0. addFront
    1. populate
    2. display
    3. applySprings
    4. applyGravity
    5. run
    6. removeFront
    7. getSelected
    8. removeNode

  When working on these methods, make sure to
  account for null values appropraitely. When the program
  is run, no NullPointerExceptions should occur.
  =========================*/

class OrbList {

  OrbNode front;

  /*===========================
    Contructor
    Does very little.
    You do not need to modify this method.
    =========================*/
    OrbList() {
    front = null;
  }//constructor

  /*===========================
    addFront(OrbNode o)

    Insert o to the beginning of the list.
    =========================*/
  void addFront(OrbNode o) {
    // When the list isn’t empty, the current front is the new node
    if (front != null) {
      o.next = front;
      front.previous = o;
    }
    front = o;
  }//addFront

    Insert o to the beginning of the list.
    =========================*/
  void addFront(OrbNode o) {

  }//addFront


   /*===========================
    populate(int n, boolean ordered)

    Clear the list.
    Add n randomly generated orbs to the list,
    using addFront.
    If ordered is true, the orbs should all
    have the same y coordinate and be spaced
    SPRING_LENGTH apart horizontally.
    =========================*/
  void populate(int n, boolean ordered) {
    // Clear  list
    front = null;
    if (ordered) {
      // fixed y coordinate
      float y = height / 2;
      // Each orb is SPRING_LENGTH away
      for (int i = 0; i < n; i++) {
        // x starts at SPRING_LENGTH/2 and by SPRING_LENGTH increments every time
        float x = SPRING_LENGTH / 2 + i * SPRING_LENGTH;
        // Create orb node with random size and mass 
        OrbNode node = new OrbNode(x, y, random(MIN_SIZE, MAX_SIZE), random(MIN_MASS, MAX_MASS));
        addFront(node);
      }
    } else {
      // Create n orbs at random positions
      for (int i = 0; i < n; i++) {
        float x = random(MIN_SIZE, width - MIN_SIZE);
        float y = random(MIN_SIZE, height - MIN_SIZE);
        OrbNode node = new OrbNode(x, y, random(MIN_SIZE, MAX_SIZE), random(MIN_MASS, MAX_MASS));
        addFront(node);
      }
    }
  }//populate

  /*===========================
    display()

    Display all the nodes in the list using
    the display method defined in the OrbNode class.
    =========================*/
  void display() {
    OrbNode current = front;
    while (current != null) {
      current.display();
      current = current.next;
    }
  }//display

  /*===========================
    applySprings(int springLength, float springK)

    Use the applySprings method in OrbNode on each
    element in the list.
    =========================*/
  void applySprings(int springLength, float springK) {
    OrbNode current = front;
    while (current != null) {
      current.applySprings(springLength, springK);
      current = current.next;
    }
  }//applySprings

  /*===========================
    applyGravity(Orb other, float gConstant)

    Use the getGravity and applyForce methods
    to apply gravity correctly.
    =========================*/
  void applyGravity(Orb other, float gConstant) {
    OrbNode current = front;
    while (current != null) {
      PVector gravity = current.getGravity(other, gConstant);
      current.applyForce(gravity);
      current = current.next;
    }
  }//applyGravity

  /*===========================
    run(boolean bounce)

    Call run on each node in the list.
    =========================*/
  void run(boolean bounce) {
    OrbNode current = front;
    while (current != null) {
      current.move(bounce);
      current = current.next;
    }
  }//run

  /*===========================
    removeFront()

    Remove the element at the front of the list, i.e.
    after this method is run, the former second element
    should now be the first (and so on).
    =========================*/
  void removeFront() {
    if (front != null) {
      front = front.next;
      if (front != null) {
        front.previous = null;
      }
    }
  }//removeFront

  /*===========================
    getSelected(float x, float y)

    If there is a node at (x, y), return
    a reference to that node.
    Otherwise, return null.

    See isSelected(float x, float y) in
    the Orb class.
    =========================*/
  OrbNode getSelected(int x, int y) {
    OrbNode current = front;
    while (current != null) {
      if (current.isSelected(x, y)) {
        return current;
      }
      current = current.next;
    }
    return null;
  }//getSelected

  /*===========================
    removeNode(OrbNode o)

    Removes o from the list. You can
    assume o is an OrbNode in the list.
    You cannot assume anything about the
    position of o in the list.
    =========================*/
  void removeNode(OrbNode o) {
    if (o == front) {
      removeFront();
    } else {
      if (o.previous != null) {
        o.previous.next = o.next;
      }
      if (o.next != null) {
        o.next.previous = o.previous;
      }
    }
  }//removeNode
}//OrbList

