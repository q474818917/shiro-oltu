package extractor;

public class BTree implements IFloor {
	public Node mRoot;
	Node mSelected;

	class Node extends BaseNode {
		Node left;
		Node right;

		public Node(int data) {
			super();
			left = null;
			right = null;
			this.data = data;
		}
	}

	public void insert(int data) {
		mRoot = insert(mRoot, data);
	}

	public Node getSelected() {
		return mSelected;
	}

	public Node insert(Node node, int data) {

		if (node == null) {
			node = new Node(data);
			mSelected = node;
			return node;
		}

		if (node.data == data) {
			mSelected = node;
			return node;
		}

		if (node.data > data) {
			node.left = insert(node.left, data);
		} else {
			node.right = insert(node.right, data);
		}

		return node;
	}

	public void trace() {
		trace(mRoot, 0);
	}

	public void trace(Node node, int depth) {
		if (node == null)
			return;
		trace(node.left, depth + 1);
		int d = depth;
		while (d-- > 0)
			System.out.print("----");
		System.out.println(node.data);
		trace(node.right, depth + 1);
	}

	public void traceTags() {
		traceTags(this, 0);
	}

	public void traceTags(Node node, int depth) {
		if (node == null)
			return;

		traceTags(node.left, depth);

		int d = depth;
		while (d-- > 0)
			System.out.print("-");

		System.out.print((char) node.data);

		if (node.flag == true) {
			System.out.print("[E]");
		}

		System.out.println("");

		if (node.son != null) {
			traceTags((BTree) node.son, depth + 1);
		}

		traceTags(node.right, depth);
	}

	public void traceTags(BTree tree, int depth) {
		traceTags(tree.mRoot, depth);
	}

	public static void main(String[] args) {
		IFloor tree = new BTree();
		int items[] = { 2, 1, 3, 2, 4, 5, 6, 4, 3, 2, 1, 7, 9, 8, 2, 3 };
		for (int i = 0; i < items.length; i++) {
			tree.insert(items[i]);
		}
		tree.trace();
	}

	@Override
	public BaseNode search(int data) {
		// TODO Auto-generated method stub
		return search(mRoot, data);
	}

	public BaseNode search(Node node, int data) {
		if (node == null) {
			return null;
		}
		if (node.data == data)
			return node;
		if (node.data > data) {
			return search(node.left, data);
		}
		return search(node.right, data);
	}
}
