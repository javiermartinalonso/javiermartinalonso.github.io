public class DoublyLinkedList {
    private Node tail;
    private Node head;
 
    public void addLast(Integer value) {
        Node node = new Node(value);
        if (tail == null && head == null) {
            tail = node;
            head = node;
        } else {
            tail.setNextElement(node);
            node.setPreviousElement(tail);
            tail = node;
        }
    }
 
    public void addFirst(Integer value) {
        Node node = new Node(value);
        if (tail == null && head == null) {
            tail = node;
            head = node;
        } else {
            node.setNextElement(head);
            head.setPreviousElement(node);
            head = node;
        }
    }
 
    public void print() {
        for (Node i = head; i != null; i = i.getNextElement()) {
            System.out.printf("\t %s ", i.toString());
        }
        System.out.println();
    }
}