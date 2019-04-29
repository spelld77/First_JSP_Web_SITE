package linkedList;

import java.io.IOException;

public class Linkedlist { // 노드는 어떤 속성을 가지고 있어야 되는가? 데이터 저장과 다음 노드가 누구인지에 대한 정보를 저장 필수적인다.
	private Node head; // 누가 첫 번째 노드인가?라는 정보를 담는 head라는 변수를 설정하고,
	private Node tail; // 누가 맨 끝에 있는 노드인가?라는 정보를 담는 tail라는 변수를 설정합니다.
	private int size = 0; // 몇 개의 노드가 이 리스트 안에 포함되어 있는가에 대한 정보를 담을 size를 정의합니다.

	// 객체 정의
	private class Node { 
		String userID;
		int payCheck;
		/*
							 * 객체화 된 노드, 이 클래스는 하나의 노드는 어떤 속성을 가지고 있어야 되는가? 데이터 저장과 다음 노드가 누구인지에 대한 정보를 저장하는
							 * 것이 필수적인다.
							 */
				// 각각의 노드가 저장될 data변수.
		private Node next; // 어떤 노드가 다음 노드인가 대한 정보를 저장하기 위해 next 변수를 지정하고 이에 대한 next변수 타입은 노드이다.

		public Node(String input,int payCheck) { /*
									 * 노드가 생성될 때 객체를 초기화한다. input은 즉, 노드가 처음 생성될 때 어떤 값을 가지고 있어야 되는데, input이라는 생성자의
									 * 매개변수로 전달
									 */
			this.payCheck = payCheck;
			this.userID = input;
			this.next = null; // 현재로서 누가 다음 노드인지를 모르기에 일단 null.
		}
	}// class Node ---> END
		// ---------------------------------------------------------------------------

	public void addLast(String input , int payCheck) {
		Node newNode = new Node(input,payCheck); /*
										 * 노드 생성이 먼저이므로 즉, addFirst()로 들어오는 값을 받아서 노드객체를 생성하는 것이 제일 먼저! Node라고 하는 클래스에
										 * newNode라는 이름으로 객체를 만들고, input은 인자로 전달되는 변수이고, 위 Node(private class Node )라는
										 * 클래스가 객체와 될 것이고, 그 클래스의 생성자인 생성자메소드에 new Node(input)의 값이 Node(Object input)의
										 * input 값에 들어간다. 내부적으로 newNode의 data 값은 ?? 받은 것이고, next는 null이 된다.
										 */

		if (size == 0) { // 만약에 size가 0과 같다는 것은 data가 없다는 것과 같음!
							// 참고로 노드가 맨 처음 추가 되는 상태라면, 앞쪽이든 뒷쪽이든 상관없음!
			tail = newNode; // 새로 생성된 노드가 마지막 노드에 적용. 즉, tail이 됨.
			size++; // 노드가 추가 되었기에 size를 하나 증가 시킨다.
			head = tail; // 헤드는 마지막 노드와 같다
		} else {
			tail.next = newNode; /*
									 * 가장 끝 쪽에 있는 노드가 tail이며, 가장 끝 쪽에 있는 노드가 새로운 노드를 가르키게 하면 됨. 가장 끝 쪽에 있는 노드는 어떻게 알
									 * 수 있는가? tail이라는 변수가 가리키는 노드임
									 */
			tail = newNode; // 즉, 새로 생성된 노드가 또 다시 마지막 노드 즉, tail 됨.
			size++; // 노드가 추가 되었기에 size를 하나 증가 시킨다.
		}
	}

	// --출력2-------------------------------------------------------------------------
	void retrieve() {
		Node temp = head;
		while (temp.next != null) { // head가 null이 아니라면, while문을 계속 수행.
			System.out.print(temp.userID + " -> "); // tail.data를 출력
			temp = temp.next; // 다음 노드로 이동, tail 값을 얻는다
		}
		System.out.println(temp.userID);
		/*
		 * 마지막 노드시 반복문을 빠져 나오므로, 마지막 노드를 할 당 받은 (tail)값을 출력. 다시 말해서, 마지막 노드는 next가 없는
		 * 관계로, while문을 수행하지 않기에 별도로 작성합니다.
		 */

	}

	// --size
	// 출력-------------------------------------------------------------------------
	public int size() {
		return size;
	}
	// ---------------------------------------------------------------------------

	// --get
	// 출력-------------------------------------------------------------------------
	public Object get(int k) { //유저 아이디 겟
		Node temp = head;
		for (int i = 0; i < k; i++)
			temp = temp.next;
		return temp.userID;
	}
	
	public Object getPayCheck(int k) {
		Node temp = head;
		for (int i = 0; i < k; i++)
			temp = temp.next;
		if(temp.payCheck == 0) {
			return "미결제";
		} else if(temp.payCheck == 1) {
			return "결제 완료";
		}
		return "미확인";
	}

	// ---------------------------------------------------------------------------
	public Node node(int index) {
		Node x = head;
		for (int i = 0; i < index; i++) {
			x = x.next;
		}
		return x;
	}

	public void add(int k, String input, int payCheck) {
		Node newNode = new Node(input,payCheck);
		if (size == 0) {
			tail = newNode;
			size++;
			head = tail;
		} else {
			Node temp1 = node(k - 1);
			Node temp2 = temp1.next;
			temp1.next = newNode;
			newNode.next = temp2;
			size++;
			if (newNode.next == null) {
				tail = newNode;
			}
		}
	}

	public void modify(int k, String input, int payCheck) {
		Node modNode = new Node(input,payCheck);
		if (k == 0) {
			Node temp2 = node(k + 1);
			remove(k);
			head = modNode;
			modNode.next = temp2;
			if (modNode.next == null) {
				tail = modNode;
			}
		} else {
			Node temp1 = node(k - 1);
			Node temp2 = node(k + 1);
			remove(k);
			temp1.next = modNode;
			modNode.next = temp2;
			if (modNode.next == null) {
				tail = modNode;
			}
		}
	}

	public Object delFirst() {

		Node temp = head;
		head = head.next;

		Object returnData = temp.userID;
		temp = null;
		size--;
		return returnData;
	}

	// 임의 노드 삭제
	public Object remove(int y) {
		if (y == 0) {
			return delFirst();
		}

		Node temp = node(y - 1);
		Node nodeDeleted = temp.next;
		temp.next = temp.next.next;
		Object returnData = nodeDeleted.userID;
		if (nodeDeleted == tail) {
			tail = temp;
		}
		nodeDeleted = null;
		size--;
		return returnData;
	}

	public static void pause() {
		try {
			System.in.read();
		} catch (IOException e) {
		}
	}

	// 마지막 노드 삭제
	public Object deLLast() {
		return remove(size - 1);
	}

} // LinkedList ---> END