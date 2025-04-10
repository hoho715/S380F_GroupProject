package hkmu.wadd.s380f_groupproject.exception;

public class LectureNotFound extends Exception {
    public LectureNotFound(long id) {
      super("Lecture " + id + " does not exist.");
    }
}
