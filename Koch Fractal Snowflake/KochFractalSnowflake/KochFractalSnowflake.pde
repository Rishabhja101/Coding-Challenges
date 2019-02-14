ArrayList<Segment> segments;

void addAll(Segment[] arr, ArrayList<Segment> list) {
  for (Segment s : arr) {
    list.add(s);
  }
}

void setup() {
  size(3800, 2000);
  segments = new ArrayList<Segment>();
  PVector a = new PVector(1100, 100);
  PVector b = new PVector(2700, 100);
  Segment s1 = new Segment(a, b);

  float len = PVector.dist(a, b);
  float h = len * sqrt(3) / 2;
  PVector c = new PVector(1900, 100+h);
  
  Segment s2 = new Segment(b, c);
  Segment s3 = new Segment(c, a);
  segments.add(s1);
  segments.add(s2);
  segments.add(s3);

  //println(children);
}

void mousePressed() {
  ArrayList<Segment> nextGeneration = new ArrayList<Segment>();

  for (Segment s : segments) {
    Segment[] children = s.generate();
    addAll(children, nextGeneration);
  }
  segments = nextGeneration;
}


void draw() {
  background(0);
  translate(0, 400);

  stroke(255);
  for (Segment s : segments) {
    s.show();
  }
}
